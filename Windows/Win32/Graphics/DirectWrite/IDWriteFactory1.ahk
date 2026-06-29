#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_PIXEL_GEOMETRY.ahk" { DWRITE_PIXEL_GEOMETRY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteFactory.ahk" { IDWriteFactory }
#Import ".\IDWriteRenderingParams1.ahk" { IDWriteRenderingParams1 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IDWriteFontCollection.ahk" { IDWriteFontCollection }
#Import ".\DWRITE_RENDERING_MODE.ahk" { DWRITE_RENDERING_MODE }

/**
 * The root factory interface for all DirectWrite objects. (IDWriteFactory1)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwritefactory1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFactory1 extends IDWriteFactory {
    /**
     * The interface identifier for IDWriteFactory1
     * @type {Guid}
     */
    static IID := Guid("{30572f99-dac6-41db-a16e-0486307e606a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFactory1 interfaces
    */
    struct Vtbl extends IDWriteFactory.Vtbl {
        GetEudcFontCollection       : IntPtr
        CreateCustomRenderingParams : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFactory1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a font collection representing the set of EUDC (end-user defined characters) fonts.
     * @remarks
     * Note that if no EUDC is set on the system,
     *     the returned collection will be empty, meaning it will return success
     *     but GetFontFamilyCount will be zero.
     * @param {BOOL} checkForUpdates Type: <b>BOOL</b>
     * 
     * Whether to check for updates.
     * @returns {IDWriteFontCollection} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection">IDWriteFontCollection</a>**</b>
     * 
     * The font collection to fill.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefactory1-geteudcfontcollection
     */
    GetEudcFontCollection(checkForUpdates) {
        result := ComCall(24, this, "ptr*", &_fontCollection := 0, BOOL, checkForUpdates, "HRESULT")
        return IDWriteFontCollection(_fontCollection)
    }

    /**
     * Creates a rendering parameters object with the specified properties. (IDWriteFactory1.CreateCustomRenderingParams)
     * @param {Float} gamma Type: <b>FLOAT</b>
     * 
     * The gamma level to be set for the new rendering parameters object.
     * @param {Float} enhancedContrast Type: <b>FLOAT</b>
     * 
     * The enhanced contrast level to be set for the new rendering parameters object.
     * @param {Float} enhancedContrastGrayscale Type: <b>FLOAT</b>
     * 
     * The amount of contrast enhancement to use for grayscale antialiasing, zero or greater.
     * @param {Float} clearTypeLevel Type: <b>FLOAT</b>
     * 
     * The ClearType level to be set for the new rendering parameters object.
     * @param {DWRITE_PIXEL_GEOMETRY} pixelGeometry Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_pixel_geometry">DWRITE_PIXEL_GEOMETRY</a></b>
     * 
     * Represents the internal structure of a device pixel (that is, the physical arrangement of red, green, and blue color components) that is assumed for purposes of rendering text.
     * @param {DWRITE_RENDERING_MODE} renderingMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_rendering_mode">DWRITE_RENDERING_MODE</a></b>
     * 
     * A value that represents the method (for example, ClearType natural quality) for rendering glyphs.
     * @returns {IDWriteRenderingParams1} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwriterenderingparams1">IDWriteRenderingParams1</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the newly created rendering parameters object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefactory1-createcustomrenderingparams
     */
    CreateCustomRenderingParams(gamma, enhancedContrast, enhancedContrastGrayscale, clearTypeLevel, pixelGeometry, renderingMode) {
        result := ComCall(25, this, "float", gamma, "float", enhancedContrast, "float", enhancedContrastGrayscale, "float", clearTypeLevel, DWRITE_PIXEL_GEOMETRY, pixelGeometry, DWRITE_RENDERING_MODE, renderingMode, "ptr*", &renderingParams := 0, "HRESULT")
        return IDWriteRenderingParams1(renderingParams)
    }

    Query(iid) {
        if (IDWriteFactory1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEudcFontCollection := CallbackCreate(GetMethod(implObj, "GetEudcFontCollection"), flags, 3)
        this.vtbl.CreateCustomRenderingParams := CallbackCreate(GetMethod(implObj, "CreateCustomRenderingParams"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEudcFontCollection)
        CallbackFree(this.vtbl.CreateCustomRenderingParams)
    }
}
