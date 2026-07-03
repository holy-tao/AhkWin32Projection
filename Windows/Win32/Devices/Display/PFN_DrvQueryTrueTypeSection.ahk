#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvQueryTrueTypeSection {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvQueryTrueTypeSection) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Pointer<HANDLE>} param3 
     * @param {Pointer<Integer>} param4 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4) {
        param4Marshal := param4 is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, UInt32, param0, UInt32, param1, UInt32, param2, HANDLE.Ptr, param3, param4Marshal, param4, Int32)
        return result
    }

    /**
     * A PFN_DrvQueryTrueTypeSection that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvQueryTrueTypeSection {
        /**
         * Creates a PFN_DrvQueryTrueTypeSection pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, UInt32, HANDLE, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, UInt32, HANDLE.Ptr, "int*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
