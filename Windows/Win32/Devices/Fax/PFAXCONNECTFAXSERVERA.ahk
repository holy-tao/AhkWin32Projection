#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAXCONNECTFAXSERVERA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXCONNECTFAXSERVERA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} MachineName 
     * @param {Pointer<HANDLE>} FaxHandle 
     * @returns {BOOL} 
     */
    Call(MachineName, FaxHandle) {
        MachineName := MachineName is String ? StrPtr(MachineName) : MachineName

        result := DllCall(this.value, "ptr", MachineName, HANDLE.Ptr, FaxHandle, BOOL)
        return result
    }

    /**
     * A PFAXCONNECTFAXSERVERA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXCONNECTFAXSERVERA {
        /**
         * Creates a PFAXCONNECTFAXSERVERA pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, HANDLE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, HANDLE.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
