#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_GLYPH_RUN.ahk" { DWRITE_GLYPH_RUN }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct2D\Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }
#Import ".\IDWriteColorGlyphRunEnumerator1.ahk" { IDWriteColorGlyphRunEnumerator1 }
#Import ".\DWRITE_PAINT_FEATURE_LEVEL.ahk" { DWRITE_PAINT_FEATURE_LEVEL }
#Import ".\DWRITE_GLYPH_RUN_DESCRIPTION.ahk" { DWRITE_GLYPH_RUN_DESCRIPTION }
#Import ".\DWRITE_MEASURING_MODE.ahk" { DWRITE_MEASURING_MODE }
#Import ".\IDWriteFactory7.ahk" { IDWriteFactory7 }
#Import ".\DWRITE_GLYPH_IMAGE_FORMATS.ahk" { DWRITE_GLYPH_IMAGE_FORMATS }
#Import ".\DWRITE_MATRIX.ahk" { DWRITE_MATRIX }

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFactory8 extends IDWriteFactory7 {
    /**
     * The interface identifier for IDWriteFactory8
     * @type {Guid}
     */
    static IID := Guid("{ee0a7fb5-def4-4c23-a454-c9c7dc878398}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFactory8 interfaces
    */
    struct Vtbl extends IDWriteFactory7.Vtbl {
        TranslateColorGlyphRun : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFactory8.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {D2D_POINT_2F} baselineOrigin 
     * @param {Pointer<DWRITE_GLYPH_RUN>} _glyphRun 
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription 
     * @param {DWRITE_GLYPH_IMAGE_FORMATS} desiredGlyphImageFormats 
     * @param {DWRITE_PAINT_FEATURE_LEVEL} paintFeatureLevel 
     * @param {DWRITE_MEASURING_MODE} measuringMode 
     * @param {Pointer<DWRITE_MATRIX>} worldAndDpiTransform 
     * @param {Integer} colorPaletteIndex 
     * @returns {IDWriteColorGlyphRunEnumerator1} 
     */
    TranslateColorGlyphRun(baselineOrigin, _glyphRun, glyphRunDescription, desiredGlyphImageFormats, paintFeatureLevel, measuringMode, worldAndDpiTransform, colorPaletteIndex) {
        result := ComCall(57, this, D2D_POINT_2F, baselineOrigin, DWRITE_GLYPH_RUN.Ptr, _glyphRun, DWRITE_GLYPH_RUN_DESCRIPTION.Ptr, glyphRunDescription, DWRITE_GLYPH_IMAGE_FORMATS, desiredGlyphImageFormats, DWRITE_PAINT_FEATURE_LEVEL, paintFeatureLevel, DWRITE_MEASURING_MODE, measuringMode, DWRITE_MATRIX.Ptr, worldAndDpiTransform, "uint", colorPaletteIndex, "ptr*", &colorEnumerator := 0, "HRESULT")
        return IDWriteColorGlyphRunEnumerator1(colorEnumerator)
    }

    Query(iid) {
        if (IDWriteFactory8.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TranslateColorGlyphRun := CallbackCreate(GetMethod(implObj, "TranslateColorGlyphRun"), flags, 10)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TranslateColorGlyphRun)
    }
}
