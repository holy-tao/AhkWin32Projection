#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Graphics\Gdi\HDC.ahk" { HDC }
#Import ".\IMLangCodePages.ahk" { IMLangCodePages }
#Import "..\Graphics\Gdi\HFONT.ahk" { HFONT }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct IMLangFontLink extends IMLangCodePages {
    /**
     * The interface identifier for IMLangFontLink
     * @type {Guid}
     */
    static IID := Guid("{359f3441-bd4a-11d0-b188-00aa0038c969}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLangFontLink interfaces
    */
    struct Vtbl extends IMLangCodePages.Vtbl {
        GetFontCodePages : IntPtr
        MapFont          : IntPtr
        ReleaseFont      : IntPtr
        ResetFontMapping : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLangFontLink.Vtbl()
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
     * @param {HDC} _hDC 
     * @param {Integer} dwCodePages 
     * @param {HFONT} hSrcFont 
     * @returns {HFONT} 
     */
    MapFont(_hDC, dwCodePages, hSrcFont) {
        phDestFont := HFONT.Owned()
        result := ComCall(8, this, HDC, _hDC, "uint", dwCodePages, HFONT, hSrcFont, HFONT.Ptr, phDestFont, "HRESULT")
        return phDestFont
    }

    /**
     * 
     * @param {HFONT} _hFont 
     * @returns {HRESULT} 
     */
    ReleaseFont(_hFont) {
        result := ComCall(9, this, HFONT, _hFont, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetFontMapping() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMLangFontLink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFontCodePages := CallbackCreate(GetMethod(implObj, "GetFontCodePages"), flags, 4)
        this.vtbl.MapFont := CallbackCreate(GetMethod(implObj, "MapFont"), flags, 5)
        this.vtbl.ReleaseFont := CallbackCreate(GetMethod(implObj, "ReleaseFont"), flags, 2)
        this.vtbl.ResetFontMapping := CallbackCreate(GetMethod(implObj, "ResetFontMapping"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFontCodePages)
        CallbackFree(this.vtbl.MapFont)
        CallbackFree(this.vtbl.ReleaseFont)
        CallbackFree(this.vtbl.ResetFontMapping)
    }
}
