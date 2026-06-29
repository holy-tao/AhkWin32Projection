#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFeed.ahk" { IFeed }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IFeed2 extends IFeed {
    /**
     * The interface identifier for IFeed2
     * @type {Guid}
     */
    static IID := Guid("{33f2ea09-1398-4ab9-b6a4-f94b49d0a42e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFeed2 interfaces
    */
    struct Vtbl extends IFeed.Vtbl {
        GetItemByEffectiveId     : IntPtr
        get_LastItemDownloadTime : IntPtr
        get_Username             : IntPtr
        get_Password             : IntPtr
        SetCredentials           : IntPtr
        ClearCredentials         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFeed2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Float} 
     */
    LastItemDownloadTime {
        get => this.get_LastItemDownloadTime()
    }

    /**
     * @type {BSTR} 
     */
    Username {
        get => this.get_Username()
    }

    /**
     * @type {BSTR} 
     */
    Password {
        get => this.get_Password()
    }

    /**
     * 
     * @param {Integer} itemEffectiveId 
     * @returns {IDispatch} 
     */
    GetItemByEffectiveId(itemEffectiveId) {
        result := ComCall(51, this, "int", itemEffectiveId, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastItemDownloadTime() {
        result := ComCall(52, this, "double*", &lastItemDownloadTime := 0, "HRESULT")
        return lastItemDownloadTime
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Username() {
        username := BSTR.Owned()
        result := ComCall(53, this, BSTR.Ptr, username, "HRESULT")
        return username
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Password() {
        password := BSTR.Owned()
        result := ComCall(54, this, BSTR.Ptr, password, "HRESULT")
        return password
    }

    /**
     * 
     * @param {BSTR} username 
     * @param {BSTR} password 
     * @returns {HRESULT} 
     */
    SetCredentials(username, password) {
        username := username is String ? BSTR.Alloc(username).Value : username
        password := password is String ? BSTR.Alloc(password).Value : password

        result := ComCall(55, this, BSTR, username, BSTR, password, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearCredentials() {
        result := ComCall(56, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFeed2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetItemByEffectiveId := CallbackCreate(GetMethod(implObj, "GetItemByEffectiveId"), flags, 3)
        this.vtbl.get_LastItemDownloadTime := CallbackCreate(GetMethod(implObj, "get_LastItemDownloadTime"), flags, 2)
        this.vtbl.get_Username := CallbackCreate(GetMethod(implObj, "get_Username"), flags, 2)
        this.vtbl.get_Password := CallbackCreate(GetMethod(implObj, "get_Password"), flags, 2)
        this.vtbl.SetCredentials := CallbackCreate(GetMethod(implObj, "SetCredentials"), flags, 3)
        this.vtbl.ClearCredentials := CallbackCreate(GetMethod(implObj, "ClearCredentials"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetItemByEffectiveId)
        CallbackFree(this.vtbl.get_LastItemDownloadTime)
        CallbackFree(this.vtbl.get_Username)
        CallbackFree(this.vtbl.get_Password)
        CallbackFree(this.vtbl.SetCredentials)
        CallbackFree(this.vtbl.ClearCredentials)
    }
}
