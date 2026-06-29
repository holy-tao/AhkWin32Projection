#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_MATRIX.ahk" { DWRITE_MATRIX }
#Import ".\DWRITE_GLYPH_RUN.ahk" { DWRITE_GLYPH_RUN }
#Import ".\DWRITE_MEASURING_MODE.ahk" { DWRITE_MEASURING_MODE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_GLYPH_RUN_DESCRIPTION.ahk" { DWRITE_GLYPH_RUN_DESCRIPTION }
#Import ".\IDWriteFactory3.ahk" { IDWriteFactory3 }
#Import ".\DWRITE_GLYPH_IMAGE_FORMATS.ahk" { DWRITE_GLYPH_IMAGE_FORMATS }
#Import ".\IDWriteColorGlyphRunEnumerator1.ahk" { IDWriteColorGlyphRunEnumerator1 }
#Import "..\Direct2D\Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }

/**
 * The root factory interface for all DirectWrite objects. (IDWriteFactory4)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefactory4
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFactory4 extends IDWriteFactory3 {
    /**
     * The interface identifier for IDWriteFactory4
     * @type {Guid}
     */
    static IID := Guid("{4b0b5bd3-0797-4549-8ac5-fe915cc53856}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFactory4 interfaces
    */
    struct Vtbl extends IDWriteFactory3.Vtbl {
        TranslateColorGlyphRun : IntPtr
        ComputeGlyphOrigins    : IntPtr
        ComputeGlyphOrigins1   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFactory4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Translates a glyph run to a sequence of color glyph runs, which can be rendered to produce a color representation of the original &quot;base&quot; run.
     * @remarks
     * Calling <a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefactory2-translatecolorglyphrun">IDWriteFactory2::TranslateColorGlyphRun</a> is equivalent 
     *         to calling <b>IDWriteFactory4::TranslateColorGlyph</b> run with the following formats specified: DWRITE_GLYPH_IMAGE_FORMATS_TRUETYPE|DWRITE_GLYPH_IMAGE_FORMATS_CFF|DWRITE_GLYPH_IMAGE_FORMATS_COLR.
     * @param {D2D_POINT_2F} baselineOrigin Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * Horizontal and vertical origin of the base glyph run in pre-transform coordinates.
     * @param {Pointer<DWRITE_GLYPH_RUN>} _glyphRun Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a></b>
     * 
     * Pointer to the original "base" glyph run.
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run_description">DWRITE_GLYPH_RUN_DESCRIPTION</a></b>
     * 
     * Optional glyph run description.
     * @param {DWRITE_GLYPH_IMAGE_FORMATS} desiredGlyphImageFormats Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_glyph_image_formats">DWRITE_GLYPH_IMAGE_FORMATS</a></b>
     * 
     * Which data formats the runs should be split into.
     * @param {DWRITE_MEASURING_MODE} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * Measuring mode, needed to compute the origins of each glyph.
     * @param {Pointer<DWRITE_MATRIX>} worldAndDpiTransform Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a></b>
     * 
     * Matrix converting from the client's coordinate space to device coordinates (pixels), i.e., the world transform multiplied by any DPI scaling.
     * @param {Integer} colorPaletteIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the color palette to use.
     *           Valid indices are less than the number of palettes in the font, as returned
     *           by <a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontface2-getcolorpalettecount">IDWriteFontFace2::GetColorPaletteCount</a>.
     * @returns {IDWriteColorGlyphRunEnumerator1} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritecolorglyphrunenumerator1">IDWriteColorGlyphRunEnumerator1</a>**</b>
     * 
     * If the function succeeds, receives a pointer to an enumerator object that can be used to obtain the color glyph runs.
     *           If the base run has no color glyphs, then the output pointer is NULL and the method returns DWRITE_E_NOCOLOR.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory4-translatecolorglyphrun
     */
    TranslateColorGlyphRun(baselineOrigin, _glyphRun, glyphRunDescription, desiredGlyphImageFormats, measuringMode, worldAndDpiTransform, colorPaletteIndex) {
        result := ComCall(40, this, D2D_POINT_2F, baselineOrigin, DWRITE_GLYPH_RUN.Ptr, _glyphRun, DWRITE_GLYPH_RUN_DESCRIPTION.Ptr, glyphRunDescription, DWRITE_GLYPH_IMAGE_FORMATS, desiredGlyphImageFormats, DWRITE_MEASURING_MODE, measuringMode, DWRITE_MATRIX.Ptr, worldAndDpiTransform, "uint", colorPaletteIndex, "ptr*", &colorLayers := 0, "HRESULT")
        return IDWriteColorGlyphRunEnumerator1(colorLayers)
    }

    /**
     * Converts glyph run placements to glyph origins. (overload 1/2)
     * @remarks
     * The transform and DPI have no effect on the origin scaling. They are solely used to compute glyph advances when not supplied and align glyphs in pixel aligned measuring modes.
     * @param {Pointer<DWRITE_GLYPH_RUN>} _glyphRun Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a></b>
     * 
     * Structure containing the properties of the glyph run.
     * @param {D2D_POINT_2F} baselineOrigin Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The position of the baseline origin, in DIPs, relative to the upper-left corner of the DIB.
     * @returns {D2D_POINT_2F} Type: [out] <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * On return contains the glyph origins for the glyphrun.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory4-computeglyphorigins(dwrite_glyph_runconst_dwrite_measuring_mode_d2d1_point_2f_dwrite_matrixconst_d2d1_point_2f)
     */
    ComputeGlyphOrigins(_glyphRun, baselineOrigin) {
        glyphOrigins := D2D_POINT_2F()
        result := ComCall(41, this, DWRITE_GLYPH_RUN.Ptr, _glyphRun, D2D_POINT_2F, baselineOrigin, D2D_POINT_2F.Ptr, glyphOrigins, "HRESULT")
        return glyphOrigins
    }

    /**
     * Converts glyph run placements to glyph origins. (overload 1/2)
     * @remarks
     * The transform and DPI have no effect on the origin scaling. They are solely used to compute glyph advances when not supplied and align glyphs in pixel aligned measuring modes.
     * @param {Pointer<DWRITE_GLYPH_RUN>} _glyphRun Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a></b>
     * 
     * Structure containing the properties of the glyph run.
     * @param {DWRITE_MEASURING_MODE} measuringMode 
     * @param {D2D_POINT_2F} baselineOrigin Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The position of the baseline origin, in DIPs, relative to the upper-left corner of the DIB.
     * @param {Pointer<DWRITE_MATRIX>} worldAndDpiTransform 
     * @returns {D2D_POINT_2F} Type: [out] <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * On return contains the glyph origins for the glyphrun.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefactory4-computeglyphorigins(dwrite_glyph_runconst_dwrite_measuring_mode_d2d1_point_2f_dwrite_matrixconst_d2d1_point_2f)
     */
    ComputeGlyphOrigins1(_glyphRun, measuringMode, baselineOrigin, worldAndDpiTransform) {
        glyphOrigins := D2D_POINT_2F()
        result := ComCall(42, this, DWRITE_GLYPH_RUN.Ptr, _glyphRun, DWRITE_MEASURING_MODE, measuringMode, D2D_POINT_2F, baselineOrigin, DWRITE_MATRIX.Ptr, worldAndDpiTransform, D2D_POINT_2F.Ptr, glyphOrigins, "HRESULT")
        return glyphOrigins
    }

    Query(iid) {
        if (IDWriteFactory4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TranslateColorGlyphRun := CallbackCreate(GetMethod(implObj, "TranslateColorGlyphRun"), flags, 9)
        this.vtbl.ComputeGlyphOrigins := CallbackCreate(GetMethod(implObj, "ComputeGlyphOrigins"), flags, 4)
        this.vtbl.ComputeGlyphOrigins1 := CallbackCreate(GetMethod(implObj, "ComputeGlyphOrigins1"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TranslateColorGlyphRun)
        CallbackFree(this.vtbl.ComputeGlyphOrigins)
        CallbackFree(this.vtbl.ComputeGlyphOrigins1)
    }
}
