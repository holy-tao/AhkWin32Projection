#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DWRITE_FONT_FEATURE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a font typography setting.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritetypography
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteTypography extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddFontFeature", "GetFontFeatureCount", "GetFontFeature"]

    /**
     * 
     * @param {DWRITE_FONT_FEATURE} fontFeature 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetypography-addfontfeature
     */
    AddFontFeature(fontFeature) {
        result := ComCall(3, this, "ptr", fontFeature, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetypography-getfontfeaturecount
     */
    GetFontFeatureCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} fontFeatureIndex 
     * @returns {DWRITE_FONT_FEATURE} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetypography-getfontfeature
     */
    GetFontFeature(fontFeatureIndex) {
        fontFeature := DWRITE_FONT_FEATURE()
        result := ComCall(5, this, "uint", fontFeatureIndex, "ptr", fontFeature, "HRESULT")
        return fontFeature
    }
}
