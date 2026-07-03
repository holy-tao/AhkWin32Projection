#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_PORT_INFOW.ahk" { FAX_PORT_INFOW }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct PFAXGETPORTW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXGETPORTW) {
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
     * @param {Pointer<Pointer<FAX_PORT_INFOW>>} PortInfo 
     * @returns {BOOL} 
     */
    Call(FaxPortHandle, PortInfo) {
        PortInfoMarshal := PortInfo is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, HANDLE, FaxPortHandle, PortInfoMarshal, PortInfo, BOOL)
        return result
    }

    /**
     * A PFAXGETPORTW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXGETPORTW {
        /**
         * Creates a PFAXGETPORTW pointer that invokes the given AHK function when called.
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
