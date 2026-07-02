#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\FAX_PORT_INFOW.ahk" { FAX_PORT_INFOW }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct PFAXSETPORTW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXSETPORTW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FaxPortHandle 
     * @param {Pointer<FAX_PORT_INFOW>} PortInfo 
     * @returns {BOOL} 
     */
    Call(FaxPortHandle, PortInfo) {
        result := DllCall(this.value, HANDLE, FaxPortHandle, FAX_PORT_INFOW.Ptr, PortInfo, BOOL)
        return result
    }

    /**
     * A PFAXSETPORTW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXSETPORTW {
        /**
         * Creates a PFAXSETPORTW pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, FAX_PORT_INFOW) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, FAX_PORT_INFOW.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
