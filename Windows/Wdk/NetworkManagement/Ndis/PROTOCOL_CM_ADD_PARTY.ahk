#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class PROTOCOL_CM_ADD_PARTY extends IUnknown {

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
     * @param {Pointer<Void>} CallMgrVcContext 
     * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
     * @param {Pointer<Void>} NdisPartyHandle 
     * @param {Pointer<Pointer<Void>>} CallMgrPartyContext 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(CallMgrVcContext, CallParameters, NdisPartyHandle, CallMgrPartyContext) {
        CallMgrVcContextMarshal := CallMgrVcContext is VarRef ? "ptr" : "ptr"
        NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr" : "ptr"
        CallMgrPartyContextMarshal := CallMgrPartyContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, CallMgrVcContextMarshal, CallMgrVcContext, "ptr", CallParameters, NdisPartyHandleMarshal, NdisPartyHandle, CallMgrPartyContextMarshal, CallMgrPartyContext, "int")
        return result
    }
}
