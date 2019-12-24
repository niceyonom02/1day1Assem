#include <iostream>

using namespace std;

class Car {
public:
	void setCarNum(int num) {
		carNumber = num;
	}

	void acclerate(double accSpeed) {
		speed += accSpeed;
	}
private:
	int carNumber = 0;
	double speed  = 0.0;
};

int main() {
	__debugbreak();

	Car newCar;
	newCar.setCarNum(2020);
	newCar.acclerate(5.4);
}
