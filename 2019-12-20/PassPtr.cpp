#include <iostream>

int dereference(int* ptr) {
	int deref = *ptr;

	return deref + 1;
}

int main() {
	__debugbreak();

	int a = 2;
	int* intPtr = &a;

	int b = dereference(intPtr);
	printf("%d", b);

	intPtr = nullptr;
	return 0;
}
