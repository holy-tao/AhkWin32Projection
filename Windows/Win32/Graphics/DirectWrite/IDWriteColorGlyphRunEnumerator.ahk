#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DWRITE_COLOR_GLYPH_RUN.ahk" { DWRITE_COLOR_GLYPH_RUN }

/**
 * This interface allows the application to enumerate through the color glyph runs.
 * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritecolorglyphrunenumerator
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteColorGlyphRunEnumerator extends IUnknown {
    /**
     * The interface identifier for IDWriteColorGlyphRunEnumerator
     * @type {Guid}
     */
    static IID := Guid("{d31fbe17-f157-41a2-8d24-cb779e0560e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteColorGlyphRunEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MoveNext      : IntPtr
        GetCurrentRun : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteColorGlyphRunEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Move to the next glyph run in the enumerator.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritecolorglyphrunenumerator-movenext
     */
    MoveNext() {
        result := ComCall(3, this, BOOL.Ptr, &hasRun := 0, "HRESULT")
        return hasRun
    }

    /**
     * Returns the current glyph run of the enumerator.
     * @returns {Pointer<DWRITE_COLOR_GLYPH_RUN>} Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ns-dwrite_2-dwrite_color_glyph_run">DWRITE_COLOR_GLYPH_RUN</a>**</b>
     * 
     * A pointer to the current glyph run.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritecolorglyphrunenumerator-getcurrentrun
     */
    GetCurrentRun() {
        result := ComCall(4, this, "ptr*", &colorGlyphRun := 0, "HRESULT")
        return colorGlyphRun
    }

    Query(iid) {
        if (IDWriteColorGlyphRunEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MoveNext := CallbackCreate(GetMethod(implObj, "MoveNext"), flags, 2)
        this.vtbl.GetCurrentRun := CallbackCreate(GetMethod(implObj, "GetCurrentRun"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MoveNext)
        CallbackFree(this.vtbl.GetCurrentRun)
    }
}
