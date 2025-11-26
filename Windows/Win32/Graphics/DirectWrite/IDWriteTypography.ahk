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
     * Adds an OpenType font feature.
     * @param {DWRITE_FONT_FEATURE} fontFeature Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_font_feature">DWRITE_FONT_FEATURE</a></b>
     * 
     * A structure that contains the OpenType name identifier and the execution parameter for the font feature being added.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetypography-addfontfeature
     */
    AddFontFeature(fontFeature) {
        result := ComCall(3, this, "ptr", fontFeature, "HRESULT")
        return result
    }

    /**
     * Gets the number of OpenType font features for the current font.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The number of font features for the current text format.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetypography-getfontfeaturecount
     */
    GetFontFeatureCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * Gets the font feature at the specified index.
     * @param {Integer} fontFeatureIndex Type: <b>UINT32</b>
     * 
     * The zero-based index of the font feature to retrieve.
     * @returns {DWRITE_FONT_FEATURE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_font_feature">DWRITE_FONT_FEATURE</a>*</b>
     * 
     * When this method returns, contains the font feature which is at the specified index.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritetypography-getfontfeature
     */
    GetFontFeature(fontFeatureIndex) {
        fontFeature := DWRITE_FONT_FEATURE()
        result := ComCall(5, this, "uint", fontFeatureIndex, "ptr", fontFeature, "HRESULT")
        return fontFeature
    }
}
