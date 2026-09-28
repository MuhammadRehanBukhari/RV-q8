#include <systemc>
using namespace sc_core;

SC_MODULE(Hello) {
    SC_CTOR(Hello) {
        SC_THREAD(run);
    }

    void run() {
        std::cout << sc_time_stamp() << ": hello from SystemC" << std::endl;
        wait(10, SC_NS);
        std::cout << sc_time_stamp() << ": 10 ns later" << std::endl;
    }
};

int sc_main(int argc, char* argv[]) {
    Hello h("hello");
    sc_start();
    return 0;
}