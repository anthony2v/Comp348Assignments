// Auto Showroom Inventory Catalogue
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAKER 1
#define MODEL 2
#define TRIM 3
#define MILEAGE 4
#define YEAR 5
#define TYPE 6
#define DRIVETRAIN 7
#define TRANSMISSION 8
#define STOCKNUMBER 9
#define STATUS 10
#define FUELECONOMY 11
#define SETOFFEATURES 12

typedef struct {
	int key;
	struct maker_node *next;
	struct model_node *below;
	char data[];
} maker_node;

typedef struct {
	int key;
	struct model_node *next;
	struct info_node *below;
	char data[15];
} model_node;

typedef struct {
	int key;
	struct info_node *next;
	char data[15];
} info_node;

maker_node *head = NULL;

void insert(int key, char feature[100]) {
	switch(key){
        case MAKER:
            struct maker_node mn;
            mn.key = featureNumber;
            strcpy(mn.data, word);
            break;
        case MODEL:
            struct model_node *next;
            
        case TRIM:
            struct info_node *in;
            in.key = featureNumber;
            break;
        case MILEAGE:
            struct info_node *in;
            in.key = featureNumber;
            break;
        case YEAR:
            struct info_node *in;
            in.key = featureNumber;
            break;
        case TYPE:
            struct info_node *in;
            in.key = featureNumber;
            break;
        case DRIVETRAIN:
            struct info_node *in;
            in.key = featureNumber;
            break;
        case TRANSMISSION:
            struct info_node *in;
            in.key = featureNumber;
            break;
        case STOCKNUMBER:
            struct info_node *in;
            in.key = featureNumber;
            break;
        case STATUS:
            struct info_node *in;
            in.key = featureNumber;
            break;
        case FUELECONOMY:
            struct info_node *in;
            in.key = featureNumber;
            break;
        case SETOFFEATURES:
            struct info_node *in;
            in.key = featureNumber;
            break;
        default:
    }
}

int main() {
	file = fopen("car_catalogue.txt", "r");
	struct maker_node *head = NULL;
	struct maker_node *new;
	head = malloc(sizeof(maker_node));
	if (head == NULL) {
		printf("ERROR: Out of memory.\n");
		return 1;
	}
	int i, chars, featureNumber, end1;
	chars = 0;
	featureNumber = 1;
	end1 = 1;
	char c, p;
	p = '';
	char word[100];
	for(i = 0; end1; i++) {
		c = fgetc(file);
		switch(c) {
			case '\{':
			    if (p == '\{') {
			        c = fgetc(file);
			        while(c != '\}') {
			            word[i++] = c;
			        }
			        insert(SETOFFEATURES, &word);
			    }
			    else
				    p = c;
				break;
			case ',':
			    if (chars > 0) {
			        
			    }
				chars = 0;
				break;
			case '\}':
				break;
			case '\n':
				i = 0;
				break;
			default:
				word[i] = c;
				break;
		}
		printf("Enter 0 to exit: ");
		scanf("%d", &end1);
	}
	return 0;
}	