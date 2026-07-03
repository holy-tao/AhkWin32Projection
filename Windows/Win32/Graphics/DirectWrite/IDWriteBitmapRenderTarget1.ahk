#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_TEXT_ANTIALIAS_MODE.ahk" { DWRITE_TEXT_ANTIALIAS_MODE }
#Import ".\IDWriteBitmapRenderTarget.ahk" { IDWriteBitmapRenderTarget }

/**
 * Encapsulates a 32-bit device independent bitmap and device context, which you can use for rendering glyphs.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwritebitmaprendertarget1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteBitmapRenderTarget1 extends IDWriteBitmapRenderTarget {
    /**
     * The interface identifier for IDWriteBitmapRenderTarget1
     * @type {Guid}
     */
    static IID := Guid("{791e8298-3ef3-4230-9880-c9bdecc42064}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteBitmapRenderTarget1 interfaces
    */
    struct Vtbl extends IDWriteBitmapRenderTarget.Vtbl {
        GetTextAntialiasMode : IntPtr
        SetTextAntialiasMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteBitmapRenderTarget1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the current text antialiasing mode of the bitmap render target.
     * @returns {DWRITE_TEXT_ANTIALIAS_MODE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_text_antialias_mode">DWRITE_TEXT_ANTIALIAS_MODE</a></b>
     * 
     * Returns a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_text_antialias_mode">DWRITE_TEXT_ANTIALIAS_MODE</a>-typed value that specifies the antialiasing mode.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritebitmaprendertarget1-gettextantialiasmode
     */
    GetTextAntialiasMode() {
        result := ComCall(11, this, DWRITE_TEXT_ANTIALIAS_MODE)
        return result
    }

    /**
     * Sets the current text antialiasing mode of the bitmap render target.
     * @remarks
     * The antialiasing mode of a newly-created bitmap render target defaults to 
     *      <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_text_antialias_mode">DWRITE_TEXT_ANTIALIAS_MODE_CLEARTYPE</a>. An app can change the antialiasing
     *      mode by calling <b>SetTextAntialiasMode</b>. For example, an app might specify
     *     <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_text_antialias_mode">DWRITE_TEXT_ANTIALIAS_MODE_GRAYSCALE</a> for grayscale antialiasing when it renders text onto a transparent bitmap.
     * @param {DWRITE_TEXT_ANTIALIAS_MODE} antialiasMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_text_antialias_mode">DWRITE_TEXT_ANTIALIAS_MODE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_text_antialias_mode">DWRITE_TEXT_ANTIALIAS_MODE</a>-typed value that specifies the antialiasing mode.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or E_INVALIDARG if the argument is not valid.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritebitmaprendertarget1-settextantialiasmode
     */
    SetTextAntialiasMode(antialiasMode) {
        result := ComCall(12, this, DWRITE_TEXT_ANTIALIAS_MODE, antialiasMode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteBitmapRenderTarget1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTextAntialiasMode := CallbackCreate(GetMethod(implObj, "GetTextAntialiasMode"), flags, 1)
        this.vtbl.SetTextAntialiasMode := CallbackCreate(GetMethod(implObj, "SetTextAntialiasMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTextAntialiasMode)
        CallbackFree(this.vtbl.SetTextAntialiasMode)
    }
}
