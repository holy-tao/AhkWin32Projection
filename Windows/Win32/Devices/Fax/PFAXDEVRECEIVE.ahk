#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_RECEIVE.ahk" { FAX_RECEIVE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXDEVRECEIVE {
    value : IntPtr

    __value {
        set {
            if (value is PFAXDEVRECEIVE) {
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
     * @param {Integer} param1 
     * @param {Pointer<FAX_RECEIVE>} param2 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2) {
        result := DllCall(this.value, HANDLE, param0, UInt32, param1, FAX_RECEIVE.Ptr, param2, BOOL)
        return result
    }

    /**
     * A PFAXDEVRECEIVE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXDEVRECEIVE {
        /**
         * Creates a PFAXDEVRECEIVE pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, FAX_RECEIVE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, FAX_RECEIVE.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
