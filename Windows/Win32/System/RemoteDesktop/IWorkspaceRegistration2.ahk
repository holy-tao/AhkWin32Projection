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
     * 
     * @param {Pointer<IWorkspaceClientExt>} pUnk 
     * @param {BSTR} bstrEventLogUploadAddress 
     * @param {Pointer<UInt32>} pdwCookie 
     * @param {Pointer<Guid>} correlationId 
     * @returns {HRESULT} 
     */
    AddResourceEx(pUnk, bstrEventLogUploadAddress, pdwCookie, correlationId) {
        bstrEventLogUploadAddress := bstrEventLogUploadAddress is String ? BSTR.Alloc(bstrEventLogUploadAddress).Value : bstrEventLogUploadAddress

        result := ComCall(5, this, "ptr", pUnk, "ptr", bstrEventLogUploadAddress, "uint*", pdwCookie, "ptr", correlationId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookieConnection 
     * @param {Pointer<Guid>} correlationId 
     * @returns {HRESULT} 
     */
    RemoveResourceEx(dwCookieConnection, correlationId) {
        result := ComCall(6, this, "uint", dwCookieConnection, "ptr", correlationId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
