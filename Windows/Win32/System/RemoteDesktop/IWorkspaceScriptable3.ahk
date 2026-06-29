#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWorkspaceScriptable2.ahk" { IWorkspaceScriptable2 }

/**
 * Exposes methods that manage RemoteApp and Desktop Connection credentials and connections. (IWorkspaceScriptable3)
 * @see https://learn.microsoft.com/windows/win32/api/workspaceruntime/nn-workspaceruntime-iworkspacescriptable3
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWorkspaceScriptable3 extends IWorkspaceScriptable2 {
    /**
     * The interface identifier for IWorkspaceScriptable3
     * @type {Guid}
     */
    static IID := Guid("{531e6512-2cbf-4bd2-80a5-d90a71636a9a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWorkspaceScriptable3 interfaces
    */
    struct Vtbl extends IWorkspaceScriptable2.Vtbl {
        StartWorkspaceEx2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWorkspaceScriptable3.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {Guid} _correlationId 
     * @returns {HRESULT} 
     */
    StartWorkspaceEx2(bstrWorkspaceId, bstrWorkspaceFriendlyName, bstrRedirectorName, bstrUserName, bstrPassword, bstrAppContainer, bstrWorkspaceParams, lTimeout, lFlags, bstrEventLogUploadAddress, _correlationId) {
        bstrWorkspaceId := bstrWorkspaceId is String ? BSTR.Alloc(bstrWorkspaceId).Value : bstrWorkspaceId
        bstrWorkspaceFriendlyName := bstrWorkspaceFriendlyName is String ? BSTR.Alloc(bstrWorkspaceFriendlyName).Value : bstrWorkspaceFriendlyName
        bstrRedirectorName := bstrRedirectorName is String ? BSTR.Alloc(bstrRedirectorName).Value : bstrRedirectorName
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword
        bstrAppContainer := bstrAppContainer is String ? BSTR.Alloc(bstrAppContainer).Value : bstrAppContainer
        bstrWorkspaceParams := bstrWorkspaceParams is String ? BSTR.Alloc(bstrWorkspaceParams).Value : bstrWorkspaceParams
        bstrEventLogUploadAddress := bstrEventLogUploadAddress is String ? BSTR.Alloc(bstrEventLogUploadAddress).Value : bstrEventLogUploadAddress

        result := ComCall(16, this, BSTR, bstrWorkspaceId, BSTR, bstrWorkspaceFriendlyName, BSTR, bstrRedirectorName, BSTR, bstrUserName, BSTR, bstrPassword, BSTR, bstrAppContainer, BSTR, bstrWorkspaceParams, "int", lTimeout, "int", lFlags, BSTR, bstrEventLogUploadAddress, Guid, _correlationId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWorkspaceScriptable3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartWorkspaceEx2 := CallbackCreate(GetMethod(implObj, "StartWorkspaceEx2"), flags, 12)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartWorkspaceEx2)
    }
}
