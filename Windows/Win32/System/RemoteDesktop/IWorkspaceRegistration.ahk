#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that add and remove references to custom clients in RemoteApp and Desktop Connection.
 * @see https://docs.microsoft.com/windows/win32/api//workspaceruntime/nn-workspaceruntime-iworkspaceregistration
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWorkspaceRegistration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWorkspaceRegistration
     * @type {Guid}
     */
    static IID => Guid("{b922bbb8-4c55-4fea-8496-beb0b44285e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddResource", "RemoveResource"]

    /**
     * 
     * @param {IWorkspaceClientExt} pUnk 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspaceregistration-addresource
     */
    AddResource(pUnk, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pUnk, pdwCookieMarshal, pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookieConnection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nf-workspaceruntime-iworkspaceregistration-removeresource
     */
    RemoveResource(dwCookieConnection) {
        result := ComCall(4, this, "uint", dwCookieConnection, "HRESULT")
        return result
    }
}
