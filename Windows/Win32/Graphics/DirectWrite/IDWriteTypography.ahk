#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a font typography setting.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritetypography
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTypography extends IUnknown{
    /**
     * The interface identifier for IDWriteTypography
     * @type {Guid}
     */
    static IID => Guid("{55f1112b-1dc2-4b3c-9541-f46894ed85b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {DWRITE_FONT_FEATURE} fontFeature 
     * @returns {HRESULT} 
     */
    AddFontFeature(fontFeature) {
        result := ComCall(3, this, "ptr", fontFeature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFontFeatureCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} fontFeatureIndex 
     * @param {Pointer<DWRITE_FONT_FEATURE>} fontFeature 
     * @returns {HRESULT} 
     */
    GetFontFeature(fontFeatureIndex, fontFeature) {
        result := ComCall(5, this, "uint", fontFeatureIndex, "ptr", fontFeature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
