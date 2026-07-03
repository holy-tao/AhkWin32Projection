#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_PORT_INFOW.ahk" { FAX_PORT_INFOW }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct PFAXENUMPORTSW {
    value : IntPtr

    __value {
        set {
            if (value is PFAXENUMPORTSW) {
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
     * @param {Pointer<Pointer<FAX_PORT_INFOW>>} PortInfo 
     * @param {Pointer<Integer>} PortsReturned 
     * @returns {BOOL} 
     */
    Call(FaxHandle, PortInfo, PortsReturned) {
        PortInfoMarshal := PortInfo is VarRef ? "ptr*" : "ptr"
        PortsReturnedMarshal := PortsReturned is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, FaxHandle, PortInfoMarshal, PortInfo, PortsReturnedMarshal, PortsReturned, BOOL)
        return result
    }

    /**
     * A PFAXENUMPORTSW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXENUMPORTSW {
        /**
         * Creates a PFAXENUMPORTSW pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, "ptr*", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, "ptr*", "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
