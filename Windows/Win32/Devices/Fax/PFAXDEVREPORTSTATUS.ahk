#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_DEV_STATUS.ahk" { FAX_DEV_STATUS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXDEVREPORTSTATUS {
    value : IntPtr

    __value {
        set {
            if (value is PFAXDEVREPORTSTATUS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} param0 
     * @param {Pointer<FAX_DEV_STATUS>} param1 
     * @param {Integer} param2 
     * @param {Pointer<Integer>} param3 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3) {
        param3Marshal := param3 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, param0, FAX_DEV_STATUS.Ptr, param1, UInt32, param2, param3Marshal, param3, BOOL)
        return result
    }

    /**
     * A PFAXDEVREPORTSTATUS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXDEVREPORTSTATUS {
        /**
         * Creates a PFAXDEVREPORTSTATUS pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, FAX_DEV_STATUS, UInt32, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, FAX_DEV_STATUS.Ptr, UInt32, "uint*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
