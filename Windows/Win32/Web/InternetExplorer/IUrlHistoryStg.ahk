#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumSTATURL.ahk" { IEnumSTATURL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\STATURL.ahk" { STATURL }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IUrlHistoryStg extends IUnknown {
    /**
     * The interface identifier for IUrlHistoryStg
     * @type {Guid}
     */
    static IID := Guid("{3c374a41-bae4-11cf-bf7d-00aa006946ee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUrlHistoryStg interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddUrl       : IntPtr
        DeleteUrl    : IntPtr
        QueryUrl     : IntPtr
        BindToObject : IntPtr
        EnumUrls     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUrlHistoryStg.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pocsUrl 
     * @param {PWSTR} pocsTitle 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    AddUrl(pocsUrl, pocsTitle, dwFlags) {
        pocsUrl := pocsUrl is String ? StrPtr(pocsUrl) : pocsUrl
        pocsTitle := pocsTitle is String ? StrPtr(pocsTitle) : pocsTitle

        result := ComCall(3, this, "ptr", pocsUrl, "ptr", pocsTitle, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pocsUrl 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    DeleteUrl(pocsUrl, dwFlags) {
        pocsUrl := pocsUrl is String ? StrPtr(pocsUrl) : pocsUrl

        result := ComCall(4, this, "ptr", pocsUrl, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pocsUrl 
     * @param {Integer} dwFlags 
     * @param {Pointer<STATURL>} lpSTATURL 
     * @returns {HRESULT} 
     */
    QueryUrl(pocsUrl, dwFlags, lpSTATURL) {
        pocsUrl := pocsUrl is String ? StrPtr(pocsUrl) : pocsUrl

        result := ComCall(5, this, "ptr", pocsUrl, "uint", dwFlags, STATURL.Ptr, lpSTATURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pocsUrl 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    BindToObject(pocsUrl, riid) {
        pocsUrl := pocsUrl is String ? StrPtr(pocsUrl) : pocsUrl

        result := ComCall(6, this, "ptr", pocsUrl, Guid.Ptr, riid, "ptr*", &ppvOut := 0, "HRESULT")
        return ppvOut
    }

    /**
     * 
     * @returns {IEnumSTATURL} 
     */
    EnumUrls() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSTATURL(ppEnum)
    }

    Query(iid) {
        if (IUrlHistoryStg.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddUrl := CallbackCreate(GetMethod(implObj, "AddUrl"), flags, 4)
        this.vtbl.DeleteUrl := CallbackCreate(GetMethod(implObj, "DeleteUrl"), flags, 3)
        this.vtbl.QueryUrl := CallbackCreate(GetMethod(implObj, "QueryUrl"), flags, 4)
        this.vtbl.BindToObject := CallbackCreate(GetMethod(implObj, "BindToObject"), flags, 4)
        this.vtbl.EnumUrls := CallbackCreate(GetMethod(implObj, "EnumUrls"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddUrl)
        CallbackFree(this.vtbl.DeleteUrl)
        CallbackFree(this.vtbl.QueryUrl)
        CallbackFree(this.vtbl.BindToObject)
        CallbackFree(this.vtbl.EnumUrls)
    }
}
