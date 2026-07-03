#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_COLOR_GLYPH_RUN1.ahk" { DWRITE_COLOR_GLYPH_RUN1 }
#Import ".\IDWriteColorGlyphRunEnumerator.ahk" { IDWriteColorGlyphRunEnumerator }

/**
 * Enumerator for an ordered collection of color glyph runs.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritecolorglyphrunenumerator1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteColorGlyphRunEnumerator1 extends IDWriteColorGlyphRunEnumerator {
    /**
     * The interface identifier for IDWriteColorGlyphRunEnumerator1
     * @type {Guid}
     */
    static IID := Guid("{7c5f86da-c7a1-4f05-b8e1-55a179fe5a35}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteColorGlyphRunEnumerator1 interfaces
    */
    struct Vtbl extends IDWriteColorGlyphRunEnumerator.Vtbl {
        GetCurrentRun : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteColorGlyphRunEnumerator1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the current color glyph run.
     * @returns {Pointer<DWRITE_COLOR_GLYPH_RUN1>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_color_glyph_run1">DWRITE_COLOR_GLYPH_RUN1</a></b>
     * 
     * Receives a pointer to the color glyph run. The pointer remains valid until the next call to
     *           MoveNext or until the interface is released.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritecolorglyphrunenumerator1-getcurrentrun
     */
    GetCurrentRun() {
        result := ComCall(5, this, "ptr*", &colorGlyphRun := 0, "HRESULT")
        return colorGlyphRun
    }

    Query(iid) {
        if (IDWriteColorGlyphRunEnumerator1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCurrentRun := CallbackCreate(GetMethod(implObj, "GetCurrentRun"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCurrentRun)
    }
}
