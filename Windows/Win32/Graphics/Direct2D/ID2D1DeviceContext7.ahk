#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\DirectWrite\DWRITE_GLYPH_RUN.ahk" { DWRITE_GLYPH_RUN }
#Import "..\DirectWrite\DWRITE_MEASURING_MODE.ahk" { DWRITE_MEASURING_MODE }
#Import "..\DirectWrite\DWRITE_GLYPH_RUN_DESCRIPTION.ahk" { DWRITE_GLYPH_RUN_DESCRIPTION }
#Import ".\D2D1_COLOR_BITMAP_GLYPH_SNAP_OPTION.ahk" { D2D1_COLOR_BITMAP_GLYPH_SNAP_OPTION }
#Import ".\ID2D1SvgGlyphStyle.ahk" { ID2D1SvgGlyphStyle }
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }
#Import "..\DirectWrite\DWRITE_PAINT_FEATURE_LEVEL.ahk" { DWRITE_PAINT_FEATURE_LEVEL }
#Import ".\ID2D1Brush.ahk" { ID2D1Brush }
#Import ".\ID2D1DeviceContext6.ahk" { ID2D1DeviceContext6 }

/**
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1DeviceContext7 extends ID2D1DeviceContext6 {
    /**
     * The interface identifier for ID2D1DeviceContext7
     * @type {Guid}
     */
    static IID := Guid("{ec891cf7-9b69-4851-9def-4e0915771e62}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1DeviceContext7 interfaces
    */
    struct Vtbl extends ID2D1DeviceContext6.Vtbl {
        GetPaintFeatureLevel         : IntPtr
        DrawPaintGlyphRun            : IntPtr
        DrawGlyphRunWithColorSupport : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1DeviceContext7.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {DWRITE_PAINT_FEATURE_LEVEL} 
     */
    GetPaintFeatureLevel() {
        result := ComCall(120, this, DWRITE_PAINT_FEATURE_LEVEL)
        return result
    }

    /**
     * 
     * @param {D2D_POINT_2F} baselineOrigin 
     * @param {Pointer<DWRITE_GLYPH_RUN>} _glyphRun 
     * @param {ID2D1Brush} defaultFillBrush 
     * @param {Integer} colorPaletteIndex 
     * @param {DWRITE_MEASURING_MODE} measuringMode 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawPaintGlyphRun(baselineOrigin, _glyphRun, defaultFillBrush, colorPaletteIndex, measuringMode) {
        ComCall(121, this, D2D_POINT_2F, baselineOrigin, DWRITE_GLYPH_RUN.Ptr, _glyphRun, "ptr", defaultFillBrush, "uint", colorPaletteIndex, DWRITE_MEASURING_MODE, measuringMode)
    }

    /**
     * 
     * @param {D2D_POINT_2F} baselineOrigin 
     * @param {Pointer<DWRITE_GLYPH_RUN>} _glyphRun 
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription 
     * @param {ID2D1Brush} foregroundBrush 
     * @param {ID2D1SvgGlyphStyle} svgGlyphStyle 
     * @param {Integer} colorPaletteIndex 
     * @param {DWRITE_MEASURING_MODE} measuringMode 
     * @param {D2D1_COLOR_BITMAP_GLYPH_SNAP_OPTION} bitmapSnapOption 
     * @returns {String} Nothing - always returns an empty string
     */
    DrawGlyphRunWithColorSupport(baselineOrigin, _glyphRun, glyphRunDescription, foregroundBrush, svgGlyphStyle, colorPaletteIndex, measuringMode, bitmapSnapOption) {
        ComCall(122, this, D2D_POINT_2F, baselineOrigin, DWRITE_GLYPH_RUN.Ptr, _glyphRun, DWRITE_GLYPH_RUN_DESCRIPTION.Ptr, glyphRunDescription, "ptr", foregroundBrush, "ptr", svgGlyphStyle, "uint", colorPaletteIndex, DWRITE_MEASURING_MODE, measuringMode, D2D1_COLOR_BITMAP_GLYPH_SNAP_OPTION, bitmapSnapOption)
    }

    Query(iid) {
        if (ID2D1DeviceContext7.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPaintFeatureLevel := CallbackCreate(GetMethod(implObj, "GetPaintFeatureLevel"), flags, 1)
        this.vtbl.DrawPaintGlyphRun := CallbackCreate(GetMethod(implObj, "DrawPaintGlyphRun"), flags, 6)
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
