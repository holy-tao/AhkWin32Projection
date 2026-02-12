#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class PFNSNMPEXTENSIONQUERY extends IUnknown {

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
     * @param {Integer} bPduType 
     * @param {Pointer<SnmpVarBindList>} pVarBindList 
     * @param {Pointer<Integer>} pErrorStatus 
     * @param {Pointer<Integer>} pErrorIndex 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(bPduType, pVarBindList, pErrorStatus, pErrorIndex) {
        pErrorStatusMarshal := pErrorStatus is VarRef ? "int*" : "ptr"
        pErrorIndexMarshal := pErrorIndex is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "char", bPduType, "ptr", pVarBindList, pErrorStatusMarshal, pErrorStatus, pErrorIndexMarshal, pErrorIndex, "int")
        return result
    }
}
