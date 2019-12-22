#include <iostream>

using namespace std;

void __fastcall funcA(int* const constPtr, int toChange) {
	*constPtr = toChange;
}

void __stdcall funcB(int* const constPtr, int toChange) {
	*constPtr = toChange;
}

int main() {
	__debugbreak();
	int a = 5;
	int* ptr = &a;
	int& ref = a;

	printf("%p", ptr);
	printf("%p", &ref);

	funcA(ptr, 45);
	funcB(ptr, 64);
}
