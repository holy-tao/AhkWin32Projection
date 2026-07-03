#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\AsnOctetString.ahk" { AsnOctetString }
#Import ".\SnmpVarBindList.ahk" { SnmpVarBindList }

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct PFNSNMPEXTENSIONQUERYEX {
    value : IntPtr

    __value {
        set {
            if (value is PFNSNMPEXTENSIONQUERYEX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} nRequestType 
     * @param {Integer} nTransactionId 
     * @param {Pointer<SnmpVarBindList>} pVarBindList 
     * @param {Pointer<AsnOctetString>} pContextInfo 
     * @param {Pointer<Integer>} pErrorStatus 
     * @param {Pointer<Integer>} pErrorIndex 
     * @returns {BOOL} 
     */
    Call(nRequestType, nTransactionId, pVarBindList, pContextInfo, pErrorStatus, pErrorIndex) {
        pErrorStatusMarshal := pErrorStatus is VarRef ? "int*" : "ptr"
        pErrorIndexMarshal := pErrorIndex is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, UInt32, nRequestType, UInt32, nTransactionId, SnmpVarBindList.Ptr, pVarBindList, AsnOctetString.Ptr, pContextInfo, pErrorStatusMarshal, pErrorStatus, pErrorIndexMarshal, pErrorIndex, BOOL)
        return result
    }

    /**
     * A PFNSNMPEXTENSIONQUERYEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNSNMPEXTENSIONQUERYEX {
        /**
         * Creates a PFNSNMPEXTENSIONQUERYEX pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, SnmpVarBindList, AsnOctetString, "int*", "int*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, SnmpVarBindList.Ptr, AsnOctetString.Ptr, "int*", "int*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
