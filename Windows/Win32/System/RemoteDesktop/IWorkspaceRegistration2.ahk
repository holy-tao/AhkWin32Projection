#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWorkspaceRegistration.ahk

/**
 * Exposes methods that add and remove references to custom clients in RemoteApp and Desktop Connection. (IWorkspaceRegistration2)
 * @see https://learn.microsoft.com/windows/win32/api//content/workspaceruntime/nn-workspaceruntime-iworkspaceregistration2
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
     * @param {Guid} correlationId_ 
     * @returns {Integer} 
     */
    AddResourceEx(pUnk, bstrEventLogUploadAddress, correlationId_) {
        if(bstrEventLogUploadAddress is String) {
            pin := BSTR.Alloc(bstrEventLogUploadAddress)
            bstrEventLogUploadAddress := pin.Value
        }

        result := ComCall(5, this, "ptr", pUnk, "ptr", bstrEventLogUploadAddress, "uint*", &pdwCookie := 0, "ptr", correlationId_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookieConnection 
     * @param {Guid} correlationId_ 
     * @returns {HRESULT} 
     */
    RemoveResourceEx(dwCookieConnection, correlationId_) {
        result := ComCall(6, this, "uint", dwCookieConnection, "ptr", correlationId_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
