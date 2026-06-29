#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\EXpsFontOptions.ahk" { EXpsFontOptions }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPartBase.ahk" { IPartBase }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPartFont extends IPartBase {
    /**
     * The interface identifier for IPartFont
     * @type {Guid}
     */
    static IID := Guid("{e07fe0ab-1124-43d0-a865-e8ffb6a3ea82}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPartFont interfaces
    */
    struct Vtbl extends IPartBase.Vtbl {
        GetFontProperties : IntPtr
        SetFontContent    : IntPtr
        SetFontOptions    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPartFont.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pContentType 
     * @param {Pointer<EXpsFontOptions>} pFontOptions 
     * @returns {HRESULT} 
     */
    GetFontProperties(pContentType, pFontOptions) {
        pFontOptionsMarshal := pFontOptions is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, BSTR.Ptr, pContentType, pFontOptionsMarshal, pFontOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pContentType 
     * @returns {HRESULT} 
     */
    SetFontContent(pContentType) {
        pContentType := pContentType is String ? StrPtr(pContentType) : pContentType

        result := ComCall(8, this, "ptr", pContentType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {EXpsFontOptions} options 
     * @returns {HRESULT} 
     */
    SetFontOptions(options) {
        result := ComCall(9, this, EXpsFontOptions, options, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPartFont.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFontProperties := CallbackCreate(GetMethod(implObj, "GetFontProperties"), flags, 3)
        this.vtbl.SetFontContent := CallbackCreate(GetMethod(implObj, "SetFontContent"), flags, 2)
        this.vtbl.SetFontOptions := CallbackCreate(GetMethod(implObj, "SetFontOptions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFontProperties)
        CallbackFree(this.vtbl.SetFontContent)
        CallbackFree(this.vtbl.SetFontOptions)
    }
}
