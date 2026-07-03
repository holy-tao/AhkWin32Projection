#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SnmpVarBindList.ahk" { SnmpVarBindList }

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct PFNSNMPEXTENSIONQUERY {
    value : IntPtr

    __value {
        set {
            if (value is PFNSNMPEXTENSIONQUERY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} bPduType 
     * @param {Pointer<SnmpVarBindList>} pVarBindList 
     * @param {Pointer<Integer>} pErrorStatus 
     * @param {Pointer<Integer>} pErrorIndex 
     * @returns {BOOL} 
     */
    Call(bPduType, pVarBindList, pErrorStatus, pErrorIndex) {
        pErrorStatusMarshal := pErrorStatus is VarRef ? "int*" : "ptr"
        pErrorIndexMarshal := pErrorIndex is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, Int8, bPduType, SnmpVarBindList.Ptr, pVarBindList, pErrorStatusMarshal, pErrorStatus, pErrorIndexMarshal, pErrorIndex, BOOL)
        return result
    }

    /**
     * A PFNSNMPEXTENSIONQUERY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNSNMPEXTENSIONQUERY {
        /**
         * Creates a PFNSNMPEXTENSIONQUERY pointer that invokes the given AHK function when called.
         * @param {Func(Int8, SnmpVarBindList, "int*", "int*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int8, SnmpVarBindList.Ptr, "int*", "int*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
