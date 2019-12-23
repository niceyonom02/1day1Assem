#include <iostream>
#include <Windows.h>

using namespace std;
	
int main() {
	__debugbreak();
	DWORD dword = 0x12345678;
	BYTE* dwToByte = (BYTE*)&dword;

	for (int i = 0; i < 4; i++) {
		printf(" byte in %d order: %x ||||", i, *(dwToByte + i));
	}
}
