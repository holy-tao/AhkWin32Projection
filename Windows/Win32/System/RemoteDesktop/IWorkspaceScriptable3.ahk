#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWorkspaceScriptable2.ahk

/**
 * Exposes methods that manage RemoteApp and Desktop Connection credentials and connections. (IWorkspaceScriptable3)
 * @see https://learn.microsoft.com/windows/win32/api//content/workspaceruntime/nn-workspaceruntime-iworkspacescriptable3
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWorkspaceScriptable3 extends IWorkspaceScriptable2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWorkspaceScriptable3
     * @type {Guid}
     */
    static IID => Guid("{531e6512-2cbf-4bd2-80a5-d90a71636a9a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartWorkspaceEx2"]

    /**
     * 
     * @param {BSTR} bstrWorkspaceId 
     * @param {BSTR} bstrWorkspaceFriendlyName 
     * @param {BSTR} bstrRedirectorName 
     * @param {BSTR} bstrUserName 
     * @param {BSTR} bstrPassword 
     * @param {BSTR} bstrAppContainer 
     * @param {BSTR} bstrWorkspaceParams 
     * @param {Integer} lTimeout 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrEventLogUploadAddress 
     * @param {Guid} correlationId_ 
     * @returns {HRESULT} 
     */
    StartWorkspaceEx2(bstrWorkspaceId, bstrWorkspaceFriendlyName, bstrRedirectorName, bstrUserName, bstrPassword, bstrAppContainer, bstrWorkspaceParams, lTimeout, lFlags, bstrEventLogUploadAddress, correlationId_) {
        if(bstrWorkspaceId is String) {
            pin := BSTR.Alloc(bstrWorkspaceId)
            bstrWorkspaceId := pin.Value
        }
        if(bstrWorkspaceFriendlyName is String) {
            pin := BSTR.Alloc(bstrWorkspaceFriendlyName)
            bstrWorkspaceFriendlyName := pin.Value
        }
        if(bstrRedirectorName is String) {
            pin := BSTR.Alloc(bstrRedirectorName)
            bstrRedirectorName := pin.Value
        }
        if(bstrUserName is String) {
            pin := BSTR.Alloc(bstrUserName)
            bstrUserName := pin.Value
        }
        if(bstrPassword is String) {
            pin := BSTR.Alloc(bstrPassword)
            bstrPassword := pin.Value
        }
        if(bstrAppContainer is String) {
            pin := BSTR.Alloc(bstrAppContainer)
            bstrAppContainer := pin.Value
        }
        if(bstrWorkspaceParams is String) {
            pin := BSTR.Alloc(bstrWorkspaceParams)
            bstrWorkspaceParams := pin.Value
        }
        if(bstrEventLogUploadAddress is String) {
            pin := BSTR.Alloc(bstrEventLogUploadAddress)
            bstrEventLogUploadAddress := pin.Value
        }

        result := ComCall(16, this, "ptr", bstrWorkspaceId, "ptr", bstrWorkspaceFriendlyName, "ptr", bstrRedirectorName, "ptr", bstrUserName, "ptr", bstrPassword, "ptr", bstrAppContainer, "ptr", bstrWorkspaceParams, "int", lTimeout, "int", lFlags, "ptr", bstrEventLogUploadAddress, "ptr", correlationId_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
