#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IXFeed.ahk" { IXFeed }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IXFeed2 extends IXFeed {
    /**
     * The interface identifier for IXFeed2
     * @type {Guid}
     */
    static IID := Guid("{ce528e77-3716-4eb7-956d-f5e37502e12a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXFeed2 interfaces
    */
    struct Vtbl extends IXFeed.Vtbl {
        GetItemByEffectiveId : IntPtr
        LastItemDownloadTime : IntPtr
        Username             : IntPtr
        Password             : IntPtr
        SetCredentials       : IntPtr
        ClearCredentials     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXFeed2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} uiEffectiveId 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetItemByEffectiveId(uiEffectiveId, riid) {
        result := ComCall(47, this, "uint", uiEffectiveId, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastItemDownloadTime() {
        pstLastItemDownloadTime := SYSTEMTIME()
        result := ComCall(48, this, SYSTEMTIME.Ptr, pstLastItemDownloadTime, "HRESULT")
        return pstLastItemDownloadTime
    }

    /**
     * Learn about the Username element. This element captures the user name to be sent in the EAP-Identity response.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/eaphost/eaptlsuserpropertiesv1schema-username-element
     */
    Username() {
        result := ComCall(49, this, PWSTR.Ptr, &ppszUsername := 0, "HRESULT")
        return ppszUsername
    }

    /**
     * Learn about the Password (EapType) element. This element identifies the password of the user or machine being authenticated.
     * @remarks
     * If the **Password (EapType)** element is not present, the password hash is obtained from winlogon. This element is optional.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/eaphost/mschapv2userpropertiesv1schema-password-eaptype-element
     */
    Password() {
        result := ComCall(50, this, PWSTR.Ptr, &ppszPassword := 0, "HRESULT")
        return ppszPassword
    }

    /**
     * 
     * @param {PWSTR} pszUsername 
     * @param {PWSTR} pszPassword 
     * @returns {HRESULT} 
     */
    SetCredentials(pszUsername, pszPassword) {
        pszUsername := pszUsername is String ? StrPtr(pszUsername) : pszUsername
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := ComCall(51, this, "ptr", pszUsername, "ptr", pszPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearCredentials() {
        result := ComCall(52, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXFeed2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetItemByEffectiveId := CallbackCreate(GetMethod(implObj, "GetItemByEffectiveId"), flags, 4)
        this.vtbl.LastItemDownloadTime := CallbackCreate(GetMethod(implObj, "LastItemDownloadTime"), flags, 2)
        this.vtbl.Username := CallbackCreate(GetMethod(implObj, "Username"), flags, 2)
        this.vtbl.Password := CallbackCreate(GetMethod(implObj, "Password"), flags, 2)
        this.vtbl.SetCredentials := CallbackCreate(GetMethod(implObj, "SetCredentials"), flags, 3)
        this.vtbl.ClearCredentials := CallbackCreate(GetMethod(implObj, "ClearCredentials"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetItemByEffectiveId)
        CallbackFree(this.vtbl.LastItemDownloadTime)
        CallbackFree(this.vtbl.Username)
        CallbackFree(this.vtbl.Password)
        CallbackFree(this.vtbl.SetCredentials)
        CallbackFree(this.vtbl.ClearCredentials)
    }
}
