#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWorkspaceRegistration.ahk" { IWorkspaceRegistration }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWorkspaceClientExt.ahk" { IWorkspaceClientExt }

/**
 * Exposes methods that add and remove references to custom clients in RemoteApp and Desktop Connection. (IWorkspaceRegistration2)
 * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nn-workspaceruntime-iworkspaceregistration2
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWorkspaceRegistration2 extends IWorkspaceRegistration {
    /**
     * The interface identifier for IWorkspaceRegistration2
     * @type {Guid}
     */
    static IID := Guid("{cf59f654-39bb-44d8-94d0-4635728957e9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWorkspaceRegistration2 interfaces
    */
    struct Vtbl extends IWorkspaceRegistration.Vtbl {
        AddResourceEx    : IntPtr
        RemoveResourceEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWorkspaceRegistration2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IWorkspaceClientExt} pUnk 
     * @param {BSTR} bstrEventLogUploadAddress 
     * @param {Guid} _correlationId 
     * @returns {Integer} 
     */
    AddResourceEx(pUnk, bstrEventLogUploadAddress, _correlationId) {
        bstrEventLogUploadAddress := bstrEventLogUploadAddress is String ? BSTR.Alloc(bstrEventLogUploadAddress).Value : bstrEventLogUploadAddress

        result := ComCall(5, this, "ptr", pUnk, BSTR, bstrEventLogUploadAddress, "uint*", &pdwCookie := 0, Guid, _correlationId, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookieConnection 
     * @param {Guid} _correlationId 
     * @returns {HRESULT} 
     */
    RemoveResourceEx(dwCookieConnection, _correlationId) {
        result := ComCall(6, this, "uint", dwCookieConnection, Guid, _correlationId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWorkspaceRegistration2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddResourceEx := CallbackCreate(GetMethod(implObj, "AddResourceEx"), flags, 5)
        this.vtbl.RemoveResourceEx := CallbackCreate(GetMethod(implObj, "RemoveResourceEx"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddResourceEx)
        CallbackFree(this.vtbl.RemoveResourceEx)
    }
}
