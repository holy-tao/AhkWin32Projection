#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct PFNSNMPEXTENSIONMONITOR {
    value : IntPtr

    __value {
        set {
            if (value is PFNSNMPEXTENSIONMONITOR) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pAgentMgmtData 
     * @returns {BOOL} 
     */
    Call(pAgentMgmtData) {
        pAgentMgmtDataMarshal := pAgentMgmtData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pAgentMgmtDataMarshal, pAgentMgmtData, BOOL)
        return result
    }

    /**
     * A PFNSNMPEXTENSIONMONITOR that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNSNMPEXTENSIONMONITOR {
        /**
         * Creates a PFNSNMPEXTENSIONMONITOR pointer that invokes the given AHK function when called.
         * @param {Func("ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
