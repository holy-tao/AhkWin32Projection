#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\UNICODERANGE.ahk" { UNICODERANGE }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Graphics\Gdi\HDC.ahk" { HDC }
#Import ".\IMLangCodePages.ahk" { IMLangCodePages }
#Import ".\SCRIPTFONTINFO.ahk" { SCRIPTFONTINFO }
#Import "..\Graphics\Gdi\HFONT.ahk" { HFONT }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct IMLangFontLink2 extends IMLangCodePages {
    /**
     * The interface identifier for IMLangFontLink2
     * @type {Guid}
     */
    static IID := Guid("{dccfc162-2b38-11d2-b7ec-00c04f8f5d9a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLangFontLink2 interfaces
    */
    struct Vtbl extends IMLangCodePages.Vtbl {
        GetFontCodePages     : IntPtr
        ReleaseFont          : IntPtr
        ResetFontMapping     : IntPtr
        MapFont              : IntPtr
        GetFontUnicodeRanges : IntPtr
        GetScriptFontInfo    : IntPtr
        CodePageToScriptID   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLangFontLink2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HDC} _hDC 
     * @param {HFONT} _hFont 
     * @returns {Integer} 
     */
    GetFontCodePages(_hDC, _hFont) {
        result := ComCall(7, this, HDC, _hDC, HFONT, _hFont, "uint*", &pdwCodePages := 0, "HRESULT")
        return pdwCodePages
    }

    /**
     * 
     * @param {HFONT} _hFont 
     * @returns {HRESULT} 
     */
    ReleaseFont(_hFont) {
        result := ComCall(8, this, HFONT, _hFont, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetFontMapping() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HDC} _hDC 
     * @param {Integer} dwCodePages 
     * @param {Integer} chSrc 
     * @returns {HFONT} 
     */
    MapFont(_hDC, dwCodePages, chSrc) {
        pFont := HFONT.Owned()
        result := ComCall(10, this, HDC, _hDC, "uint", dwCodePages, "char", chSrc, HFONT.Ptr, pFont, "HRESULT")
        return pFont
    }

    /**
     * The GetFontUnicodeRanges function returns information about which Unicode characters are supported by a font. The information is returned as a GLYPHSET structure.
     * @param {HDC} _hDC 
     * @param {Pointer<Integer>} puiRanges 
     * @returns {UNICODERANGE} 
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getfontunicoderanges
     */
    GetFontUnicodeRanges(_hDC, puiRanges) {
        puiRangesMarshal := puiRanges is VarRef ? "uint*" : "ptr"

        pUranges := UNICODERANGE()
        result := ComCall(11, this, HDC, _hDC, puiRangesMarshal, puiRanges, UNICODERANGE.Ptr, pUranges, "HRESULT")
        return pUranges
    }

    /**
     * 
     * @param {Integer} _sid 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} puiFonts 
     * @returns {SCRIPTFONTINFO} 
     */
    GetScriptFontInfo(_sid, dwFlags, puiFonts) {
        puiFontsMarshal := puiFonts is VarRef ? "uint*" : "ptr"

        pScriptFont := SCRIPTFONTINFO()
        result := ComCall(12, this, "char", _sid, "uint", dwFlags, puiFontsMarshal, puiFonts, SCRIPTFONTINFO.Ptr, pScriptFont, "HRESULT")
        return pScriptFont
    }

    /**
     * 
     * @param {Integer} uiCodePage 
     * @returns {Integer} 
     */
    CodePageToScriptID(uiCodePage) {
        result := ComCall(13, this, "uint", uiCodePage, "char*", &_pSid := 0, "HRESULT")
        return _pSid
    }

    Query(iid) {
        if (IMLangFontLink2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFontCodePages := CallbackCreate(GetMethod(implObj, "GetFontCodePages"), flags, 4)
        this.vtbl.ReleaseFont := CallbackCreate(GetMethod(implObj, "ReleaseFont"), flags, 2)
        this.vtbl.ResetFontMapping := CallbackCreate(GetMethod(implObj, "ResetFontMapping"), flags, 1)
        this.vtbl.MapFont := CallbackCreate(GetMethod(implObj, "MapFont"), flags, 5)
        this.vtbl.GetFontUnicodeRanges := CallbackCreate(GetMethod(implObj, "GetFontUnicodeRanges"), flags, 4)
        this.vtbl.GetScriptFontInfo := CallbackCreate(GetMethod(implObj, "GetScriptFontInfo"), flags, 5)
        this.vtbl.CodePageToScriptID := CallbackCreate(GetMethod(implObj, "CodePageToScriptID"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFontCodePages)
        CallbackFree(this.vtbl.ReleaseFont)
        CallbackFree(this.vtbl.ResetFontMapping)
        CallbackFree(this.vtbl.MapFont)
        CallbackFree(this.vtbl.GetFontUnicodeRanges)
        CallbackFree(this.vtbl.GetScriptFontInfo)
        CallbackFree(this.vtbl.CodePageToScriptID)
    }
}
