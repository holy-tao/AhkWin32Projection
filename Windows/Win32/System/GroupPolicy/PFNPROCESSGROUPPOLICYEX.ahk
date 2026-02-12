#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The ProcessGroupPolicyEx function is an application-defined callback function used when applying policy.
 * @remarks
 * For more information, see 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/Policy/implementing-a-group-policy-client-side-extension">Implementing a Group Policy Client-side Extension</a>.
 * 
 * The system calls this function in the context of the 
 * <a href="https://docs.microsoft.com/windows/desktop/Services/localsystem-account">LocalSystem account</a>, which has extensive privileges on the local computer. To use network resources, you must impersonate the user or computer by using the token provided in the <i>hToken</i> parameter.
 * 
 * To register this callback function, create a subkey under the following registry key:
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>Winlogon</b>&#92;<b>GPExtensions</b>&#92;<b>ClientExtensionGuid</b>
 * 
 * 
 * 
 * The subkey should be a <b>GUID</b>, so that it is unique. It should contain the following values.
 * 
 * 
 * 
 * You should update the status message only if you are applying policy synchronously. This allows you to provide feedback and diagnostics during a lengthy policy application. To use the status message callback function, you must verify that <i>pStatusCallback</i> is not <b>NULL</b>. Then load your message string resource. When you call the status function, you must indicate whether the string is verbose. If the string is verbose, the callback function will verify that the computer is in verbose mode and display the message. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/nc-userenv-pfnstatusmessagecallback">StatusMessageCallback</a>.
 * 
 * <div class="alert"><b>Warning</b>  Do not call the <i>pStatusCallback</i> function from a background thread or you may overwrite another thread's status message.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/userenv/nc-userenv-pfnprocessgrouppolicyex
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class PFNPROCESSGROUPPOLICYEX extends IUnknown {

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
     * @param {Integer} dwFlags 
     * @param {HANDLE} hToken 
     * @param {HKEY} hKeyRoot 
     * @param {Pointer<GROUP_POLICY_OBJECTA>} pDeletedGPOList 
     * @param {Pointer<GROUP_POLICY_OBJECTA>} pChangedGPOList 
     * @param {Pointer} pHandle 
     * @param {Pointer<BOOL>} pbAbort 
     * @param {Pointer<PFNSTATUSMESSAGECALLBACK>} pStatusCallback 
     * @param {IWbemServices} pWbemServices 
     * @param {Pointer<HRESULT>} pRsopStatus 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwFlags, hToken, hKeyRoot, pDeletedGPOList, pChangedGPOList, pHandle, pbAbort, pStatusCallback, pWbemServices, pRsopStatus) {
        hToken := hToken is Win32Handle ? NumGet(hToken, "ptr") : hToken
        hKeyRoot := hKeyRoot is Win32Handle ? NumGet(hKeyRoot, "ptr") : hKeyRoot

        pbAbortMarshal := pbAbort is VarRef ? "int*" : "ptr"
        pRsopStatusMarshal := pRsopStatus is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", dwFlags, "ptr", hToken, "ptr", hKeyRoot, "ptr", pDeletedGPOList, "ptr", pChangedGPOList, "ptr", pHandle, pbAbortMarshal, pbAbort, "ptr", pStatusCallback, "ptr", pWbemServices, pRsopStatusMarshal, pRsopStatus, "uint")
        return result
    }
}
