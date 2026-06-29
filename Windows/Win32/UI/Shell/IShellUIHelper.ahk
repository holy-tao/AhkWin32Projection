#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellUIHelper extends IDispatch {
    /**
     * The interface identifier for IShellUIHelper
     * @type {Guid}
     */
    static IID := Guid("{729fe2f8-1ea8-11d1-8f85-00c04fc2fbe1}")

    /**
     * The class identifier for ShellUIHelper
     * @type {Guid}
     */
    static CLSID := Guid("{64ab4bb7-111e-11d1-8f79-00c04fc2fbe1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellUIHelper interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        ResetFirstBootMode    : IntPtr
        ResetSafeMode         : IntPtr
        RefreshOfflineDesktop : IntPtr
        AddFavorite           : IntPtr
        AddChannel            : IntPtr
        AddDesktopComponent   : IntPtr
        IsSubscribed          : IntPtr
        NavigateAndFind       : IntPtr
        ImportExportFavorites : IntPtr
        AutoCompleteSaveForm  : IntPtr
        AutoScan              : IntPtr
        AutoCompleteAttach    : IntPtr
        ShowBrowserUI         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellUIHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetFirstBootMode() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetSafeMode() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RefreshOfflineDesktop() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} URL 
     * @param {Pointer<VARIANT>} Title 
     * @returns {HRESULT} 
     */
    AddFavorite(URL, Title) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL

        result := ComCall(10, this, BSTR, URL, VARIANT.Ptr, Title, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} URL 
     * @returns {HRESULT} 
     */
    AddChannel(URL) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL

        result := ComCall(11, this, BSTR, URL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} URL 
     * @param {BSTR} Type 
     * @param {Pointer<VARIANT>} Left 
     * @param {Pointer<VARIANT>} Top 
     * @param {Pointer<VARIANT>} Width 
     * @param {Pointer<VARIANT>} Height 
     * @returns {HRESULT} 
     */
    AddDesktopComponent(URL, Type, Left, Top, Width, Height) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL
        Type := Type is String ? BSTR.Alloc(Type).Value : Type

        result := ComCall(12, this, BSTR, URL, BSTR, Type, VARIANT.Ptr, Left, VARIANT.Ptr, Top, VARIANT.Ptr, Width, VARIANT.Ptr, Height, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} URL 
     * @returns {VARIANT_BOOL} 
     */
    IsSubscribed(URL) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL

        result := ComCall(13, this, BSTR, URL, VARIANT_BOOL.Ptr, &pBool := 0, "HRESULT")
        return pBool
    }

    /**
     * 
     * @param {BSTR} URL 
     * @param {BSTR} strQuery 
     * @param {Pointer<VARIANT>} varTargetFrame 
     * @returns {HRESULT} 
     */
    NavigateAndFind(URL, strQuery, varTargetFrame) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL
        strQuery := strQuery is String ? BSTR.Alloc(strQuery).Value : strQuery

        result := ComCall(14, this, BSTR, URL, BSTR, strQuery, VARIANT.Ptr, varTargetFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fImport 
     * @param {BSTR} strImpExpPath 
     * @returns {HRESULT} 
     */
    ImportExportFavorites(fImport, strImpExpPath) {
        strImpExpPath := strImpExpPath is String ? BSTR.Alloc(strImpExpPath).Value : strImpExpPath

        result := ComCall(15, this, VARIANT_BOOL, fImport, BSTR, strImpExpPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Form 
     * @returns {HRESULT} 
     */
    AutoCompleteSaveForm(Form) {
        result := ComCall(16, this, VARIANT.Ptr, Form, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strSearch 
     * @param {BSTR} strFailureUrl 
     * @param {Pointer<VARIANT>} pvarTargetFrame 
     * @returns {HRESULT} 
     */
    AutoScan(strSearch, strFailureUrl, pvarTargetFrame) {
        strSearch := strSearch is String ? BSTR.Alloc(strSearch).Value : strSearch
        strFailureUrl := strFailureUrl is String ? BSTR.Alloc(strFailureUrl).Value : strFailureUrl

        result := ComCall(17, this, BSTR, strSearch, BSTR, strFailureUrl, VARIANT.Ptr, pvarTargetFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Reserved 
     * @returns {HRESULT} 
     */
    AutoCompleteAttach(Reserved) {
        result := ComCall(18, this, VARIANT.Ptr, Reserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<VARIANT>} pvarIn 
     * @returns {VARIANT} 
     */
    ShowBrowserUI(bstrName, pvarIn) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pvarOut := VARIANT()
        result := ComCall(19, this, BSTR, bstrName, VARIANT.Ptr, pvarIn, VARIANT.Ptr, pvarOut, "HRESULT")
        return pvarOut
    }

    Query(iid) {
        if (IShellUIHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ResetFirstBootMode := CallbackCreate(GetMethod(implObj, "ResetFirstBootMode"), flags, 1)
        this.vtbl.ResetSafeMode := CallbackCreate(GetMethod(implObj, "ResetSafeMode"), flags, 1)
        this.vtbl.RefreshOfflineDesktop := CallbackCreate(GetMethod(implObj, "RefreshOfflineDesktop"), flags, 1)
        this.vtbl.AddFavorite := CallbackCreate(GetMethod(implObj, "AddFavorite"), flags, 3)
        this.vtbl.AddChannel := CallbackCreate(GetMethod(implObj, "AddChannel"), flags, 2)
        this.vtbl.AddDesktopComponent := CallbackCreate(GetMethod(implObj, "AddDesktopComponent"), flags, 7)
        this.vtbl.IsSubscribed := CallbackCreate(GetMethod(implObj, "IsSubscribed"), flags, 3)
        this.vtbl.NavigateAndFind := CallbackCreate(GetMethod(implObj, "NavigateAndFind"), flags, 4)
        this.vtbl.ImportExportFavorites := CallbackCreate(GetMethod(implObj, "ImportExportFavorites"), flags, 3)
        this.vtbl.AutoCompleteSaveForm := CallbackCreate(GetMethod(implObj, "AutoCompleteSaveForm"), flags, 2)
        this.vtbl.AutoScan := CallbackCreate(GetMethod(implObj, "AutoScan"), flags, 4)
        this.vtbl.AutoCompleteAttach := CallbackCreate(GetMethod(implObj, "AutoCompleteAttach"), flags, 2)
        this.vtbl.ShowBrowserUI := CallbackCreate(GetMethod(implObj, "ShowBrowserUI"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ResetFirstBootMode)
        CallbackFree(this.vtbl.ResetSafeMode)
        CallbackFree(this.vtbl.RefreshOfflineDesktop)
        CallbackFree(this.vtbl.AddFavorite)
        CallbackFree(this.vtbl.AddChannel)
        CallbackFree(this.vtbl.AddDesktopComponent)
        CallbackFree(this.vtbl.IsSubscribed)
        CallbackFree(this.vtbl.NavigateAndFind)
        CallbackFree(this.vtbl.ImportExportFavorites)
        CallbackFree(this.vtbl.AutoCompleteSaveForm)
        CallbackFree(this.vtbl.AutoScan)
        CallbackFree(this.vtbl.AutoCompleteAttach)
        CallbackFree(this.vtbl.ShowBrowserUI)
    }
}
