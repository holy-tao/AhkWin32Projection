#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\FAX_PORT_INFOA.ahk" { FAX_PORT_INFOA }

/**
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAXENUMPORTSA {
    value : IntPtr

    __value {
        set {
            if (value is PFAXENUMPORTSA) {
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
     * @param {Pointer<Pointer<FAX_PORT_INFOA>>} PortInfo 
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
     * A PFAXENUMPORTSA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXENUMPORTSA {
        /**
         * Creates a PFAXENUMPORTSA pointer that invokes the given AHK function when called.
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
