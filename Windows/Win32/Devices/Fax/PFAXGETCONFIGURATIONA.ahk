#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_CONFIGURATIONA.ahk" { FAX_CONFIGURATIONA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAXGETCONFIGURATIONA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXGETCONFIGURATIONA) {
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
     * @param {Pointer<Pointer<FAX_CONFIGURATIONA>>} FaxConfig 
     * @returns {BOOL} 
     */
    Call(FaxHandle, FaxConfig) {
        FaxConfigMarshal := FaxConfig is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, FaxHandle, FaxConfigMarshal, FaxConfig, BOOL)
        return result
    }

    /**
     * A PFAXGETCONFIGURATIONA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXGETCONFIGURATIONA {
        /**
         * Creates a PFAXGETCONFIGURATIONA pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
