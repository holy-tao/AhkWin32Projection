#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_RENDERING_MODE.ahk" { DWRITE_RENDERING_MODE }
#Import ".\DWRITE_PIXEL_GEOMETRY.ahk" { DWRITE_PIXEL_GEOMETRY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents text rendering settings such as ClearType level, enhanced contrast, and gamma correction for glyph rasterization and filtering.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteRenderingParams extends IUnknown {
    /**
     * The interface identifier for IDWriteRenderingParams
     * @type {Guid}
     */
    static IID := Guid("{2f0da53a-2add-47cd-82ee-d9ec34688e75}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteRenderingParams interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetGamma            : IntPtr
        GetEnhancedContrast : IntPtr
        GetClearTypeLevel   : IntPtr
        GetPixelGeometry    : IntPtr
        GetRenderingMode    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteRenderingParams.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the gamma value used for gamma correction. Valid values must be greater than zero and cannot exceed 256.
     * @remarks
     * The gamma value is used for gamma correction, which compensates for the non-linear luminosity response of most monitors.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * Returns the gamma value used for gamma correction. Valid values must be
     *      greater than zero and cannot exceed 256.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriterenderingparams-getgamma
     */
    GetGamma() {
        result := ComCall(3, this, Float32)
        return result
    }

    /**
     * Gets the enhanced contrast property of the rendering parameters object. Valid values are greater than or equal to zero.
     * @remarks
     * Enhanced contrast is the amount to increase the darkness of text, and typically ranges from 0 to 1. Zero means no contrast enhancement.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * Returns the amount of contrast enhancement. Valid values are greater than
     *      or equal to zero.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriterenderingparams-getenhancedcontrast
     */
    GetEnhancedContrast() {
        result := ComCall(4, this, Float32)
        return result
    }

    /**
     * Gets the ClearType level of the rendering parameters object.
     * @remarks
     * The ClearType level represents the amount of ClearType – that is, the degree to which the red, green, and blue subpixels of each pixel are treated differently. Valid values range from zero (meaning no ClearType, which is equivalent to grayscale anti-aliasing) to one (meaning full ClearType)
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * The ClearType level of the rendering parameters object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriterenderingparams-getcleartypelevel
     */
    GetClearTypeLevel() {
        result := ComCall(5, this, Float32)
        return result
    }

    /**
     * Gets the pixel geometry of the rendering parameters object.
     * @returns {DWRITE_PIXEL_GEOMETRY} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_pixel_geometry">DWRITE_PIXEL_GEOMETRY</a></b>
     * 
     *  A value that indicates the type of  pixel geometry used in the rendering parameters object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriterenderingparams-getpixelgeometry
     */
    GetPixelGeometry() {
        result := ComCall(6, this, DWRITE_PIXEL_GEOMETRY)
        return result
    }

    /**
     * Gets the rendering mode of the rendering parameters object.
     * @remarks
     * By default, the rendering mode is initialized to DWRITE_RENDERING_MODE_DEFAULT, which means the rendering mode is determined automatically based on the font and size. To determine the recommended rendering mode to use for a given font and size and rendering parameters object, use the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontface-getrecommendedrenderingmode">IDWriteFontFace::GetRecommendedRenderingMode</a> method.
     * @returns {DWRITE_RENDERING_MODE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_rendering_mode">DWRITE_RENDERING_MODE</a></b>
     * 
     * A value that indicates the rendering mode of the rendering parameters object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriterenderingparams-getrenderingmode
     */
    GetRenderingMode() {
        result := ComCall(7, this, DWRITE_RENDERING_MODE)
        return result
    }

    Query(iid) {
        if (IDWriteRenderingParams.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGamma := CallbackCreate(GetMethod(implObj, "GetGamma"), flags, 1)
        this.vtbl.GetEnhancedContrast := CallbackCreate(GetMethod(implObj, "GetEnhancedContrast"), flags, 1)
        this.vtbl.GetClearTypeLevel := CallbackCreate(GetMethod(implObj, "GetClearTypeLevel"), flags, 1)
        this.vtbl.GetPixelGeometry := CallbackCreate(GetMethod(implObj, "GetPixelGeometry"), flags, 1)
        this.vtbl.GetRenderingMode := CallbackCreate(GetMethod(implObj, "GetRenderingMode"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGamma)
        CallbackFree(this.vtbl.GetEnhancedContrast)
        CallbackFree(this.vtbl.GetClearTypeLevel)
        CallbackFree(this.vtbl.GetPixelGeometry)
        CallbackFree(this.vtbl.GetRenderingMode)
    }
}
