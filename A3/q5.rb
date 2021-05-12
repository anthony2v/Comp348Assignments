# Auto Showroom Inventory Catalogue
class ShowroomInventory
    @@car_list = []
    @@inventory_file
    def convertListings2Catalogue(fileName)
            @@inventory_file = fileName
            data = []
            File.open(fileName).each { |line|
                    data.concat(line.split(','))
                    @@car_list.push(createCarHash(data))
            }
    end
    def searchInventory(featureAndName)
            key = featureAndName.keys[0]
            value = featureAndName.values[0]
            @@car_list.each { |car|
                    if car.values_at(key)[0] == value then
                            puts car
                    end
            }
    end
    def createCarHash(features)
            i = 1
            feature_list = {}
            features.each { |item|
                    if item.dump.match(/\\r\\n/) then
                            temp = item.dump.tr("\\r\\\\n", "")
                            item = temp.undump
                    end
                    if i > 1 then
                            i -= 1
                    elsif item.match(/[\d+\.]*\d+L\/\d+km/) then
                            feature_list["fuel_economy"] = item.strip
                    elsif item.match(/\A\d+km/) then
                            feature_list["mileage"] = item.strip
                    elsif item.match(/Sedan|Coupe|Hatchback|Station|SUV/i) then
                            feature_list["type"] = item.strip.capitalize
                    elsif item.match(/Auto|Manual|Steptronic/i) then
                            feature_list["transmission"] = item.strip.capitalize
                    elsif item.match(/[F|R|A]WD/) then
                            feature_list["drivetrain"] = item.strip
                    elsif item.match(/Used|New/i) then
                            feature_list["status"] = item.strip.capitalize
                    elsif item.match(/Honda|Toyota|Mercedes|BMW|Lexus/i) then
                            feature_list["car_maker"] = item.strip
                    elsif item.match(/\d{4}\z/) then
                            feature_list["year"] = item.strip
                    elsif item.match(/\A[A-Z]{2}\s*\z/) then
                            feature_list["trim"] = item.strip
                    elsif item.match(/\A\{/) then
                            feature_list["set_of_features"] = item
                            index = features.find_index(item)
                            until features[index].match(/.\}/)
                                    feature_list["set_of_features"].concat(",")
                                    next_feature = features[index + i]
                                    if next_feature.dump.match(/\\r\\n/) then
                                            temp = next_feature.dump.tr("\\r\\\\n", "")
                                            next_feature = temp.undump
                                    end
                                    feature_list["set_of_features"].concat(next_feature)
                                    i += 1
                            end
                    elsif item.match(/[[:alpha:]]*\d+[[:alpha:]]*/) then
                            feature_list["stock_number"] = item.strip
                    else
                            feature_list["model"] = item.strip
                    end
            }
            return feature_list
    end
    def add2Inventory(line)
            newCar = createCarHash(line.split(","))
            File.write(@@inventory_file, "\n", File.size(@@inventory_file), mode: 'a')
            i = 0
            newCar.each { |feature|
                    File.write(@@inventory_file, feature[1], File.size(@@inventory_file), mode: 'a')
                    i += 1
                    if i != newCar.size then
                            File.write(@@inventory_file, ',', File.size(@@inventory_file), mode: 'a')
                    end
            }
            @@car_list.push(newCar)
    end
	def saveCatalogue2File
		hondas = []
		toyotas = []
		mercedes = []
		bmws = []
		lexus = []
		maker = ""
		@@car_list.each { |car|
			case car.values_at("car_maker")[0]
				when "Lexus"
					lexus.push(car)
				when "Honda"
					hondas.push(car)
				when "Toyota"
					toyotas.push(car)
				when "BMW"
					bmws.push(car)
				when "Mercedes"
					mercedes.push(car)
				else
					puts "Invalid car maker!"
			end
		}
		car_catalogue = File.new("car_catalogue.txt", "a")
		until bmws.empty? do
			write2CatalogueFile(car_catalogue, bmws.pop)
		end
		until hondas.empty? do
			write2CatalogueFile(car_catalogue, hondas.pop)
		end
		until lexus.empty? do
			write2CatalogueFile(car_catalogue, lexus.pop)
		end
		until mercedes.empty? do
			write2CatalogueFile(car_catalogue, mercedes.pop)
		end
		until toyotas.empty? do
			write2CatalogueFile(car_catalogue, toyotas.pop)
		end
	end
	def write2CatalogueFile(catalogue_file, car)
		File.write(catalogue_file, car.values_at("car_maker")[0] + ',', File.size(catalogue_file), mode: 'a')
		File.write(catalogue_file, car.values_at("model")[0] + ',', File.size(catalogue_file), mode: 'a')
		File.write(catalogue_file, car.values_at("trim")[0] + ',', File.size(catalogue_file), mode: 'a')
		File.write(catalogue_file, car.values_at("mileage")[0] + ',', File.size(catalogue_file), mode: 'a')
		File.write(catalogue_file, car.values_at("year")[0] + ',', File.size(catalogue_file), mode: 'a')
		File.write(catalogue_file, car.values_at("type")[0] + ',', File.size(catalogue_file), mode: 'a')
		File.write(catalogue_file, car.values_at("drivetrain")[0] + ',', File.size(catalogue_file), mode: 'a')
		File.write(catalogue_file, car.values_at("transmission")[0] + ',', File.size(catalogue_file), mode: 'a')
		File.write(catalogue_file, car.values_at("stock_number")[0] + ',', File.size(catalogue_file), mode: 'a')
		File.write(catalogue_file, car.values_at("status")[0] + ',', File.size(catalogue_file), mode: 'a')
		File.write(catalogue_file, car.values_at("fuel_economy")[0] + ',', File.size(catalogue_file), mode: 'a')
		File.write(catalogue_file, car.values_at("set_of_features")[0] + "\n", File.size(catalogue_file), mode: 'a')
	end
end

test = ShowroomInventory.new()
test.convertListings2Catalogue("car_list.txt")
test.searchInventory({"car_maker" => "Mercedes"})
test.add2Inventory("20051km,Hatchback,Auto,587R4A,AWD,New,6L/200km,Lexus,WRX,LE,{Bluetooth, AC, Heated Seats},2011")
test.searchInventory({"car_maker" => "Lexus"})
test.saveCatalogue2File