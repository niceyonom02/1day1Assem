#include <iostream>

using namespace std;

void selectionSort(int* firstElement, size_t size) {
	int min(0);
	int temp(0);

	for (int i = 0; i < size - 1; i++) {
		min = i;

		for (int k = i + 1; k < size; k++) {
			if (*(firstElement + min) > *(firstElement + k)) {
				min = k;
			}
		}

		if (i != min) {
			temp = *(firstElement + i);
			*(firstElement + i) = *(firstElement + min);
			*(firstElement + min) = temp;
		}
	}
}

int main()
{
	__debugbreak();

	int array[5]{ 3, 2, 7, 6, 15 };

	selectionSort(array, 5);
	cout << "after sort: " << endl;

	for (int i = 0; i < 5; i++) {
		cout << array[i];
	}
	
}
