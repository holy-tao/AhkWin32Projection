#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents text rendering settings such as ClearType level, enhanced contrast, and gamma correction for glyph rasterization and filtering.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwriterenderingparams
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteRenderingParams extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteRenderingParams
     * @type {Guid}
     */
    static IID => Guid("{2f0da53a-2add-47cd-82ee-d9ec34688e75}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGamma", "GetEnhancedContrast", "GetClearTypeLevel", "GetPixelGeometry", "GetRenderingMode"]

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriterenderingparams-getgamma
     */
    GetGamma() {
        result := ComCall(3, this, "float")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriterenderingparams-getenhancedcontrast
     */
    GetEnhancedContrast() {
        result := ComCall(4, this, "float")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriterenderingparams-getcleartypelevel
     */
    GetClearTypeLevel() {
        result := ComCall(5, this, "float")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriterenderingparams-getpixelgeometry
     */
    GetPixelGeometry() {
        result := ComCall(6, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwriterenderingparams-getrenderingmode
     */
    GetRenderingMode() {
        result := ComCall(7, this, "int")
        return result
    }
}
