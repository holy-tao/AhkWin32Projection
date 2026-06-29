#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteFontFace6.ahk" { IDWriteFontFace6 }
#Import ".\IDWritePaintReader.ahk" { IDWritePaintReader }
#Import ".\DWRITE_GLYPH_IMAGE_FORMATS.ahk" { DWRITE_GLYPH_IMAGE_FORMATS }
#Import ".\DWRITE_PAINT_FEATURE_LEVEL.ahk" { DWRITE_PAINT_FEATURE_LEVEL }

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontFace7 extends IDWriteFontFace6 {
    /**
     * The interface identifier for IDWriteFontFace7
     * @type {Guid}
     */
    static IID := Guid("{3945b85b-bc95-40f7-b72c-8b73bfc7e13b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontFace7 interfaces
    */
    struct Vtbl extends IDWriteFontFace6.Vtbl {
        GetPaintFeatureLevel : IntPtr
        CreatePaintReader    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontFace7.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {DWRITE_GLYPH_IMAGE_FORMATS} glyphImageFormat 
     * @returns {DWRITE_PAINT_FEATURE_LEVEL} 
     */
    GetPaintFeatureLevel(glyphImageFormat) {
        result := ComCall(60, this, DWRITE_GLYPH_IMAGE_FORMATS, glyphImageFormat, DWRITE_PAINT_FEATURE_LEVEL)
        return result
    }

    /**
     * 
     * @param {DWRITE_GLYPH_IMAGE_FORMATS} glyphImageFormat 
     * @param {DWRITE_PAINT_FEATURE_LEVEL} paintFeatureLevel 
     * @returns {IDWritePaintReader} 
     */
    CreatePaintReader(glyphImageFormat, paintFeatureLevel) {
        result := ComCall(61, this, DWRITE_GLYPH_IMAGE_FORMATS, glyphImageFormat, DWRITE_PAINT_FEATURE_LEVEL, paintFeatureLevel, "ptr*", &paintReader := 0, "HRESULT")
        return IDWritePaintReader(paintReader)
    }

    Query(iid) {
        if (IDWriteFontFace7.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPaintFeatureLevel := CallbackCreate(GetMethod(implObj, "GetPaintFeatureLevel"), flags, 2)
        this.vtbl.CreatePaintReader := CallbackCreate(GetMethod(implObj, "CreatePaintReader"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPaintFeatureLevel)
        CallbackFree(this.vtbl.CreatePaintReader)
    }
}
