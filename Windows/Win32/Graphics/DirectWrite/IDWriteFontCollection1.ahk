#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontFamily1.ahk" { IDWriteFontFamily1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteFontSet.ahk" { IDWriteFontSet }
#Import ".\IDWriteFontCollection.ahk" { IDWriteFontCollection }

/**
 * An object that encapsulates a set of fonts, such as the set of fonts installed on the system, or the set of fonts in a particular directory. (IDWriteFontCollection1)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontcollection1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontCollection1 extends IDWriteFontCollection {
    /**
     * The interface identifier for IDWriteFontCollection1
     * @type {Guid}
     */
    static IID := Guid("{53585141-d9f8-4095-8321-d73cf6bd116c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontCollection1 interfaces
    */
    struct Vtbl extends IDWriteFontCollection.Vtbl {
        GetFontSet    : IntPtr
        GetFontFamily : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontCollection1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the underlying font set used by this collection.
     * @returns {IDWriteFontSet} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset">IDWriteFontSet</a>**</b>
     * 
     * Returns the font set used by the collection.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontcollection1-getfontset
     */
    GetFontSet() {
        result := ComCall(7, this, "ptr*", &fontSet := 0, "HRESULT")
        return IDWriteFontSet(fontSet)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IDWriteFontFamily1} 
     */
    GetFontFamily(index) {
        result := ComCall(8, this, "uint", index, "ptr*", &_fontFamily := 0, "HRESULT")
        return IDWriteFontFamily1(_fontFamily)
    }

    Query(iid) {
        if (IDWriteFontCollection1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFontSet := CallbackCreate(GetMethod(implObj, "GetFontSet"), flags, 2)
        this.vtbl.GetFontFamily := CallbackCreate(GetMethod(implObj, "GetFontFamily"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFontSet)
        CallbackFree(this.vtbl.GetFontFamily)
    }
}
