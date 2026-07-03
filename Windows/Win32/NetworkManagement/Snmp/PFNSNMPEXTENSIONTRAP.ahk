#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\AsnObjectIdentifier.ahk" { AsnObjectIdentifier }
#Import ".\SnmpVarBindList.ahk" { SnmpVarBindList }

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct PFNSNMPEXTENSIONTRAP {
    value : IntPtr

    __value {
        set {
            if (value is PFNSNMPEXTENSIONTRAP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<AsnObjectIdentifier>} pEnterpriseOid 
     * @param {Pointer<Integer>} pGenericTrapId 
     * @param {Pointer<Integer>} pSpecificTrapId 
     * @param {Pointer<Integer>} pTimeStamp 
     * @param {Pointer<SnmpVarBindList>} pVarBindList 
     * @returns {BOOL} 
     */
    Call(pEnterpriseOid, pGenericTrapId, pSpecificTrapId, pTimeStamp, pVarBindList) {
        pGenericTrapIdMarshal := pGenericTrapId is VarRef ? "int*" : "ptr"
        pSpecificTrapIdMarshal := pSpecificTrapId is VarRef ? "int*" : "ptr"
        pTimeStampMarshal := pTimeStamp is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, AsnObjectIdentifier.Ptr, pEnterpriseOid, pGenericTrapIdMarshal, pGenericTrapId, pSpecificTrapIdMarshal, pSpecificTrapId, pTimeStampMarshal, pTimeStamp, SnmpVarBindList.Ptr, pVarBindList, BOOL)
        return result
    }

    /**
     * A PFNSNMPEXTENSIONTRAP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNSNMPEXTENSIONTRAP {
        /**
         * Creates a PFNSNMPEXTENSIONTRAP pointer that invokes the given AHK function when called.
         * @param {Func(AsnObjectIdentifier, "int*", "int*", "uint*", SnmpVarBindList) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [AsnObjectIdentifier.Ptr, "int*", "int*", "uint*", SnmpVarBindList.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
