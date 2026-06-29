#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IHomePageSetting extends IUnknown {
    /**
     * The interface identifier for IHomePageSetting
     * @type {Guid}
     */
    static IID := Guid("{fdfc244f-18fa-4ff2-b08e-1d618f3ffbe4}")

    /**
     * The class identifier for HomePageSetting
     * @type {Guid}
     */
    static CLSID := Guid("{374cede0-873a-4c4f-bc86-bcc8cf5116a3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHomePageSetting interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetHomePage                 : IntPtr
        IsHomePage                  : IntPtr
        SetHomePageToBrowserDefault : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHomePageSetting.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HWND} _hwnd 
     * @param {PWSTR} homePageUri 
     * @param {PWSTR} brandingMessage 
     * @returns {HRESULT} 
     */
    SetHomePage(_hwnd, homePageUri, brandingMessage) {
        homePageUri := homePageUri is String ? StrPtr(homePageUri) : homePageUri
        brandingMessage := brandingMessage is String ? StrPtr(brandingMessage) : brandingMessage

        result := ComCall(3, this, HWND, _hwnd, "ptr", homePageUri, "ptr", brandingMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @returns {BOOL} 
     */
    IsHomePage(uri) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(4, this, "ptr", uri, BOOL.Ptr, &isDefault := 0, "HRESULT")
        return isDefault
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetHomePageToBrowserDefault() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHomePageSetting.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetHomePage := CallbackCreate(GetMethod(implObj, "SetHomePage"), flags, 4)
        this.vtbl.IsHomePage := CallbackCreate(GetMethod(implObj, "IsHomePage"), flags, 3)
        this.vtbl.SetHomePageToBrowserDefault := CallbackCreate(GetMethod(implObj, "SetHomePageToBrowserDefault"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetHomePage)
        CallbackFree(this.vtbl.IsHomePage)
        CallbackFree(this.vtbl.SetHomePageToBrowserDefault)
    }
}
