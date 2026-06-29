#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteFont.ahk" { IDWriteFont }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDWriteFontCollection.ahk" { IDWriteFontCollection }

/**
 * Represents a list of fonts. (IDWriteFontList)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontlist
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontList extends IUnknown {
    /**
     * The interface identifier for IDWriteFontList
     * @type {Guid}
     */
    static IID := Guid("{1a0d8438-1d97-4ec1-aef9-a2fb86ed6acb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFontCollection : IntPtr
        GetFontCount      : IntPtr
        GetFont           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the font collection that contains the fonts in the font list.
     * @returns {IDWriteFontCollection} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection">IDWriteFontCollection</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the current <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection">IDWriteFontCollection</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontlist-getfontcollection
     */
    GetFontCollection() {
        result := ComCall(3, this, "ptr*", &_fontCollection := 0, "HRESULT")
        return IDWriteFontCollection(_fontCollection)
    }

    /**
     * Gets the number of fonts in the font list.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The number of fonts in the font list.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontlist-getfontcount
     */
    GetFontCount() {
        result := ComCall(4, this, UInt32)
        return result
    }

    /**
     * Gets a font given its zero-based index. (IDWriteFontList.GetFont)
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * Zero-based index of the font in the font list.
     * @returns {IDWriteFont} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont">IDWriteFont</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the newly created <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont">IDWriteFont</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontlist-getfont
     */
    GetFont(index) {
        result := ComCall(5, this, "uint", index, "ptr*", &_font := 0, "HRESULT")
        return IDWriteFont(_font)
    }

    Query(iid) {
        if (IDWriteFontList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFontCollection := CallbackCreate(GetMethod(implObj, "GetFontCollection"), flags, 2)
        this.vtbl.GetFontCount := CallbackCreate(GetMethod(implObj, "GetFontCount"), flags, 1)
        this.vtbl.GetFont := CallbackCreate(GetMethod(implObj, "GetFont"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFontCollection)
        CallbackFree(this.vtbl.GetFontCount)
        CallbackFree(this.vtbl.GetFont)
    }
}
