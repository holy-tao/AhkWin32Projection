#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_EMULATOR_MEMORY_ACCESS_INFO.ahk" { WHV_EMULATOR_MEMORY_ACCESS_INFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_EMULATOR_MEMORY_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WHV_EMULATOR_MEMORY_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<WHV_EMULATOR_MEMORY_ACCESS_INFO>} MemoryAccess 
     * @returns {HRESULT} 
     */
    Call(_Context, MemoryAccess) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, WHV_EMULATOR_MEMORY_ACCESS_INFO.Ptr, MemoryAccess, "HRESULT")
        return result
    }

    /**
     * A WHV_EMULATOR_MEMORY_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WHV_EMULATOR_MEMORY_CALLBACK {
        /**
         * Creates a WHV_EMULATOR_MEMORY_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", WHV_EMULATOR_MEMORY_ACCESS_INFO) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", WHV_EMULATOR_MEMORY_ACCESS_INFO.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
