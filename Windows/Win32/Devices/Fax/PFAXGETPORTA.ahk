#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\FAX_PORT_INFOA.ahk" { FAX_PORT_INFOA }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAXGETPORTA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXGETPORTA) {
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
     * @param {Pointer<Pointer<FAX_PORT_INFOA>>} PortInfo 
     * @returns {BOOL} 
     */
    Call(FaxPortHandle, PortInfo) {
        PortInfoMarshal := PortInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, FaxPortHandle, PortInfoMarshal, PortInfo, BOOL)
        return result
    }

    /**
     * A PFAXGETPORTA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXGETPORTA {
        /**
         * Creates a PFAXGETPORTA pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
