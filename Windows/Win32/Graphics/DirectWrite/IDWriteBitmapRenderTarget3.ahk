#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_GLYPH_RUN.ahk" { DWRITE_GLYPH_RUN }
#Import ".\DWRITE_MEASURING_MODE.ahk" { DWRITE_MEASURING_MODE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteBitmapRenderTarget2.ahk" { IDWriteBitmapRenderTarget2 }
#Import ".\DWRITE_GLYPH_IMAGE_FORMATS.ahk" { DWRITE_GLYPH_IMAGE_FORMATS }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import ".\DWRITE_PAINT_FEATURE_LEVEL.ahk" { DWRITE_PAINT_FEATURE_LEVEL }
#Import ".\IDWriteRenderingParams.ahk" { IDWriteRenderingParams }

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteBitmapRenderTarget3 extends IDWriteBitmapRenderTarget2 {
    /**
     * The interface identifier for IDWriteBitmapRenderTarget3
     * @type {Guid}
     */
    static IID := Guid("{aeec37db-c337-40f1-8e2a-9a41b167b238}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteBitmapRenderTarget3 interfaces
    */
    struct Vtbl extends IDWriteBitmapRenderTarget2.Vtbl {
        GetPaintFeatureLevel         : IntPtr
        DrawPaintGlyphRun            : IntPtr
        DrawGlyphRunWithColorSupport : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteBitmapRenderTarget3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {DWRITE_PAINT_FEATURE_LEVEL} 
     */
    GetPaintFeatureLevel() {
        result := ComCall(14, this, DWRITE_PAINT_FEATURE_LEVEL)
        return result
    }

    /**
     * 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {DWRITE_MEASURING_MODE} measuringMode 
     * @param {Pointer<DWRITE_GLYPH_RUN>} _glyphRun 
     * @param {DWRITE_GLYPH_IMAGE_FORMATS} glyphImageFormat 
     * @param {COLORREF} textColor 
     * @param {Integer} colorPaletteIndex 
     * @returns {RECT} 
     */
    DrawPaintGlyphRun(baselineOriginX, baselineOriginY, measuringMode, _glyphRun, glyphImageFormat, textColor, colorPaletteIndex) {
        blackBoxRect := RECT()
        result := ComCall(15, this, "float", baselineOriginX, "float", baselineOriginY, DWRITE_MEASURING_MODE, measuringMode, DWRITE_GLYPH_RUN.Ptr, _glyphRun, DWRITE_GLYPH_IMAGE_FORMATS, glyphImageFormat, COLORREF, textColor, "uint", colorPaletteIndex, RECT.Ptr, blackBoxRect, "HRESULT")
        return blackBoxRect
    }

    /**
     * 
     * @param {Float} baselineOriginX 
     * @param {Float} baselineOriginY 
     * @param {DWRITE_MEASURING_MODE} measuringMode 
     * @param {Pointer<DWRITE_GLYPH_RUN>} _glyphRun 
     * @param {IDWriteRenderingParams} renderingParams 
     * @param {COLORREF} textColor 
     * @param {Integer} colorPaletteIndex 
     * @returns {RECT} 
     */
    DrawGlyphRunWithColorSupport(baselineOriginX, baselineOriginY, measuringMode, _glyphRun, renderingParams, textColor, colorPaletteIndex) {
        blackBoxRect := RECT()
        result := ComCall(16, this, "float", baselineOriginX, "float", baselineOriginY, DWRITE_MEASURING_MODE, measuringMode, DWRITE_GLYPH_RUN.Ptr, _glyphRun, "ptr", renderingParams, COLORREF, textColor, "uint", colorPaletteIndex, RECT.Ptr, blackBoxRect, "HRESULT")
        return blackBoxRect
    }

    Query(iid) {
        if (IDWriteBitmapRenderTarget3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPaintFeatureLevel := CallbackCreate(GetMethod(implObj, "GetPaintFeatureLevel"), flags, 1)
        this.vtbl.DrawPaintGlyphRun := CallbackCreate(GetMethod(implObj, "DrawPaintGlyphRun"), flags, 9)
        this.vtbl.DrawGlyphRunWithColorSupport := CallbackCreate(GetMethod(implObj, "DrawGlyphRunWithColorSupport"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPaintFeatureLevel)
        CallbackFree(this.vtbl.DrawPaintGlyphRun)
        CallbackFree(this.vtbl.DrawGlyphRunWithColorSupport)
    }
}
