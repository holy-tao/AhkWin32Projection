#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_GRID_FIT_MODE.ahk" { DWRITE_GRID_FIT_MODE }
#Import ".\IDWriteRenderingParams.ahk" { IDWriteRenderingParams }
#Import ".\IDWriteFontFace1.ahk" { IDWriteFontFace1 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DWRITE_COLOR_F.ahk" { DWRITE_COLOR_F }
#Import ".\DWRITE_OUTLINE_THRESHOLD.ahk" { DWRITE_OUTLINE_THRESHOLD }
#Import ".\DWRITE_MEASURING_MODE.ahk" { DWRITE_MEASURING_MODE }
#Import ".\DWRITE_RENDERING_MODE.ahk" { DWRITE_RENDERING_MODE }
#Import ".\DWRITE_MATRIX.ahk" { DWRITE_MATRIX }

/**
 * Contains font face type, appropriate file references, and face identification data. (IDWriteFontFace2)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nn-dwrite_2-idwritefontface2
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontFace2 extends IDWriteFontFace1 {
    /**
     * The interface identifier for IDWriteFontFace2
     * @type {Guid}
     */
    static IID := Guid("{d8b768ff-64bc-4e66-982b-ec8e87f693f7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontFace2 interfaces
    */
    struct Vtbl extends IDWriteFontFace1.Vtbl {
        IsColorFont                 : IntPtr
        GetColorPaletteCount        : IntPtr
        GetPaletteEntryCount        : IntPtr
        GetPaletteEntries           : IntPtr
        GetRecommendedRenderingMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontFace2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Allows you to determine if a color rendering path is potentially necessary.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if a color rendering path is potentially necessary.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontface2-iscolorfont
     */
    IsColorFont() {
        result := ComCall(30, this, BOOL)
        return result
    }

    /**
     * Gets the number of color palettes defined by the font.
     * @returns {Integer} The return value is zero if the font has no color information. Color fonts are required to define at least one palette, with palette index zero reserved as the default palette.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontface2-getcolorpalettecount
     */
    GetColorPaletteCount() {
        result := ComCall(31, this, UInt32)
        return result
    }

    /**
     * Get the number of entries in each color palette.
     * @returns {Integer} The number of entries in each color palette. All color palettes
     *     in a font have the same number of palette entries. The return value is 
     *     zero if the font has no color information.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontface2-getpaletteentrycount
     */
    GetPaletteEntryCount() {
        result := ComCall(32, this, UInt32)
        return result
    }

    /**
     * Gets color values from the font's color palette.
     * @param {Integer} colorPaletteIndex Zero-based index of the color palette. If the font does not have a palette with the specified index, the method returns <b>DWRITE_E_NOCOLOR</b>.
     * @param {Integer} firstEntryIndex Zero-based index of the first palette entry to read.
     * @param {Integer} entryCount Number of palette entries to read.
     * @returns {DWRITE_COLOR_F} Array that receives the color values.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontface2-getpaletteentries
     */
    GetPaletteEntries(colorPaletteIndex, firstEntryIndex, entryCount) {
        paletteEntries := DWRITE_COLOR_F()
        result := ComCall(33, this, "uint", colorPaletteIndex, "uint", firstEntryIndex, "uint", entryCount, DWRITE_COLOR_F.Ptr, paletteEntries, "HRESULT")
        return paletteEntries
    }

    /**
     * Determines the recommended text rendering and grid-fit mode to be used based on the font, size, world transform, and measuring mode. (IDWriteFontFace2.GetRecommendedRenderingMode)
     * @param {Float} fontEmSize Type: <b>FLOAT</b>
     * 
     * Logical font size in DIPs.
     * @param {Float} dpiX Type: <b>FLOAT</b>
     * 
     * Number of pixels per logical inch in the horizontal direction.
     * @param {Float} dpiY Type: <b>FLOAT</b>
     * 
     * Number of pixels per logical inch in the vertical direction.
     * @param {Pointer<DWRITE_MATRIX>} transform Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a> structure that describes the world transform.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * Specifies whether the font is sideways. <b>TRUE</b> if the font is sideways; otherwise, <b>FALSE</b>.
     * @param {DWRITE_OUTLINE_THRESHOLD} outlineThreshold Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_outline_threshold">DWRITE_OUTLINE_THRESHOLD</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_outline_threshold">DWRITE_OUTLINE_THRESHOLD</a>-typed value that specifies the quality of the graphics system's outline rendering, affects the size threshold above which outline rendering is used.
     * @param {DWRITE_MEASURING_MODE} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a>-typed value that specifies  the method used to measure during text layout. For proper glyph spacing, this method returns a rendering mode that is compatible with the specified measuring mode.
     * @param {IDWriteRenderingParams} renderingParams Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a> interface for the rendering parameters object. This parameter is necessary in case the rendering parameters object overrides the rendering mode.
     * @param {Pointer<DWRITE_RENDERING_MODE>} renderingMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_rendering_mode">DWRITE_RENDERING_MODE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_rendering_mode">DWRITE_RENDERING_MODE</a>-typed value for the recommended rendering mode.
     * @param {Pointer<DWRITE_GRID_FIT_MODE>} gridFitMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a>-typed value for the recommended grid-fit mode.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontface2-getrecommendedrenderingmode
     */
    GetRecommendedRenderingMode(fontEmSize, dpiX, dpiY, transform, isSideways, outlineThreshold, measuringMode, renderingParams, renderingMode, gridFitMode) {
        renderingModeMarshal := renderingMode is VarRef ? "int*" : "ptr"
        gridFitModeMarshal := gridFitMode is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, "float", fontEmSize, "float", dpiX, "float", dpiY, DWRITE_MATRIX.Ptr, transform, BOOL, isSideways, DWRITE_OUTLINE_THRESHOLD, outlineThreshold, DWRITE_MEASURING_MODE, measuringMode, "ptr", renderingParams, renderingModeMarshal, renderingMode, gridFitModeMarshal, gridFitMode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteFontFace2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsColorFont := CallbackCreate(GetMethod(implObj, "IsColorFont"), flags, 1)
        this.vtbl.GetColorPaletteCount := CallbackCreate(GetMethod(implObj, "GetColorPaletteCount"), flags, 1)
        this.vtbl.GetPaletteEntryCount := CallbackCreate(GetMethod(implObj, "GetPaletteEntryCount"), flags, 1)
        this.vtbl.GetPaletteEntries := CallbackCreate(GetMethod(implObj, "GetPaletteEntries"), flags, 5)
        this.vtbl.GetRecommendedRenderingMode := CallbackCreate(GetMethod(implObj, "GetRecommendedRenderingMode"), flags, 11)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsColorFont)
        CallbackFree(this.vtbl.GetColorPaletteCount)
        CallbackFree(this.vtbl.GetPaletteEntryCount)
        CallbackFree(this.vtbl.GetPaletteEntries)
        CallbackFree(this.vtbl.GetRecommendedRenderingMode)
    }
}
