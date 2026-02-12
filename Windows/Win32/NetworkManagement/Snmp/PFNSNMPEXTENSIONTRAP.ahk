#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class PFNSNMPEXTENSIONTRAP extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<AsnObjectIdentifier>} pEnterpriseOid 
     * @param {Pointer<Integer>} pGenericTrapId 
     * @param {Pointer<Integer>} pSpecificTrapId 
     * @param {Pointer<Integer>} pTimeStamp 
     * @param {Pointer<SnmpVarBindList>} pVarBindList 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pEnterpriseOid, pGenericTrapId, pSpecificTrapId, pTimeStamp, pVarBindList) {
        pGenericTrapIdMarshal := pGenericTrapId is VarRef ? "int*" : "ptr"
        pSpecificTrapIdMarshal := pSpecificTrapId is VarRef ? "int*" : "ptr"
        pTimeStampMarshal := pTimeStamp is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pEnterpriseOid, pGenericTrapIdMarshal, pGenericTrapId, pSpecificTrapIdMarshal, pSpecificTrapId, pTimeStampMarshal, pTimeStamp, "ptr", pVarBindList, "int")
        return result
    }
}
