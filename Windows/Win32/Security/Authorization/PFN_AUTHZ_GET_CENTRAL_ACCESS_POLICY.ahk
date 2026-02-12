#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class PFN_AUTHZ_GET_CENTRAL_ACCESS_POLICY extends IUnknown {

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
     * @param {AUTHZ_CLIENT_CONTEXT_HANDLE} hAuthzClientContext 
     * @param {PSID} capid 
     * @param {Pointer<Void>} pArgs 
     * @param {Pointer<BOOL>} pCentralAccessPolicyApplicable 
     * @param {Pointer<Pointer<Void>>} ppCentralAccessPolicy 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hAuthzClientContext, capid, pArgs, pCentralAccessPolicyApplicable, ppCentralAccessPolicy) {
        hAuthzClientContext := hAuthzClientContext is Win32Handle ? NumGet(hAuthzClientContext, "ptr") : hAuthzClientContext

        pArgsMarshal := pArgs is VarRef ? "ptr" : "ptr"
        pCentralAccessPolicyApplicableMarshal := pCentralAccessPolicyApplicable is VarRef ? "int*" : "ptr"
        ppCentralAccessPolicyMarshal := ppCentralAccessPolicy is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hAuthzClientContext, "ptr", capid, pArgsMarshal, pArgs, pCentralAccessPolicyApplicableMarshal, pCentralAccessPolicyApplicable, ppCentralAccessPolicyMarshal, ppCentralAccessPolicy, "int")
        return result
    }
}
