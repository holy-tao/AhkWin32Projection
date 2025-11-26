#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteRenderingParams.ahk

/**
 * Represents text rendering settings for glyph rasterization and filtering.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nn-dwrite_1-idwriterenderingparams1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteRenderingParams1 extends IDWriteRenderingParams{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteRenderingParams1
     * @type {Guid}
     */
    static IID => Guid("{94413cf4-a6fc-4248-8b50-6674348fcad3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGrayscaleEnhancedContrast"]

    /**
     * Gets the amount of contrast enhancement to use for grayscale antialiasing.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * The contrast enhancement value. Valid values are greater than or equal to zero.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwriterenderingparams1-getgrayscaleenhancedcontrast
     */
    GetGrayscaleEnhancedContrast() {
        result := ComCall(8, this, "float")
        return result
    }
}
