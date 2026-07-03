#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WHV_REGISTER_NAME.ahk" { WHV_REGISTER_NAME }
#Import ".\WHV_REGISTER_VALUE.ahk" { WHV_REGISTER_VALUE }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK) {
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
     * @param {Pointer<WHV_REGISTER_NAME>} RegisterNames 
     * @param {Integer} RegisterCount 
     * @param {Pointer<WHV_REGISTER_VALUE>} RegisterValues 
     * @returns {HRESULT} 
     */
    Call(_Context, RegisterNames, RegisterCount, RegisterValues) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        RegisterNamesMarshal := RegisterNames is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, RegisterNamesMarshal, RegisterNames, UInt32, RegisterCount, WHV_REGISTER_VALUE.Ptr, RegisterValues, "HRESULT")
        return result
    }

    /**
     * A WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK {
        /**
         * Creates a WHV_EMULATOR_SET_VIRTUAL_PROCESSOR_REGISTERS_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "int*", UInt32, WHV_REGISTER_VALUE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "int*", UInt32, WHV_REGISTER_VALUE.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
