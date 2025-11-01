#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWorkspaceRegistration.ahk

/**
 * Exposes methods that add and remove references to custom clients in RemoteApp and Desktop Connection.
 * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nn-workspaceruntime-iworkspaceregistration2
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWorkspaceRegistration2 extends IWorkspaceRegistration{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWorkspaceRegistration2
     * @type {Guid}
     */
    static IID => Guid("{cf59f654-39bb-44d8-94d0-4635728957e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddResourceEx", "RemoveResourceEx"]

    /**
     * 
     * @param {IWorkspaceClientExt} pUnk 
     * @param {BSTR} bstrEventLogUploadAddress 
     * @param {Pointer<Integer>} pdwCookie 
     * @param {Guid} correlationId 
     * @returns {HRESULT} 
     */
    AddResourceEx(pUnk, bstrEventLogUploadAddress, pdwCookie, correlationId) {
        bstrEventLogUploadAddress := bstrEventLogUploadAddress is String ? BSTR.Alloc(bstrEventLogUploadAddress).Value : bstrEventLogUploadAddress

        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pUnk, "ptr", bstrEventLogUploadAddress, pdwCookieMarshal, pdwCookie, "ptr", correlationId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookieConnection 
     * @param {Guid} correlationId 
     * @returns {HRESULT} 
     */
    RemoveResourceEx(dwCookieConnection, correlationId) {
        result := ComCall(6, this, "uint", dwCookieConnection, "ptr", correlationId, "HRESULT")
        return result
    }
}
