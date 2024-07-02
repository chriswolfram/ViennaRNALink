#include <stdlib.h>

#ifdef _WIN32
  #ifdef BUILDING_DLL
    #define DLL_PUBLIC __declspec(dllexport)
  #else
    #define DLL_PUBLIC __declspec(dllimport)
  #endif
#else
  #if __GNUC__ >= 4
    #define DLL_PUBLIC __attribute__ ((visibility ("default")))
  #else
    #define DLL_PUBLIC
  #endif
#endif

extern "C" {

DLL_PUBLIC void vrna_wrapper_free(void* ptr) {
	free(ptr);
}

}
