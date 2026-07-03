#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXDEVSTARTJOB {
    value : IntPtr

    __value {
        set {
            if (value is PFAXDEVSTARTJOB) {
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
     * @param {Pointer<HANDLE>} param2 
     * @param {HANDLE} param3 
     * @param {Pointer} param4 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4) {
        result := DllCall(this.value, UInt32, param0, UInt32, param1, HANDLE.Ptr, param2, HANDLE, param3, IntPtr, param4, BOOL)
        return result
    }

    /**
     * A PFAXDEVSTARTJOB that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXDEVSTARTJOB {
        /**
         * Creates a PFAXDEVSTARTJOB pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, HANDLE, HANDLE, IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, HANDLE.Ptr, HANDLE, IntPtr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
