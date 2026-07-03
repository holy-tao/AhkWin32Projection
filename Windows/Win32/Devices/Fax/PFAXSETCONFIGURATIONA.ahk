#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_CONFIGURATIONA.ahk" { FAX_CONFIGURATIONA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAXSETCONFIGURATIONA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXSETCONFIGURATIONA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FaxHandle 
     * @param {Pointer<FAX_CONFIGURATIONA>} FaxConfig 
     * @returns {BOOL} 
     */
    Call(FaxHandle, FaxConfig) {
        result := DllCall(this.value, HANDLE, FaxHandle, FAX_CONFIGURATIONA.Ptr, FaxConfig, BOOL)
        return result
    }

    /**
     * A PFAXSETCONFIGURATIONA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXSETCONFIGURATIONA {
        /**
         * Creates a PFAXSETCONFIGURATIONA pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, FAX_CONFIGURATIONA) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, FAX_CONFIGURATIONA.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
