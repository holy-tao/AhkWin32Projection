#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DWRITE_FONT_AXIS_VALUE.ahk
#Include .\IDWriteFontResource.ahk
#Include .\IDWriteFontFace4.ahk

/**
 * Contains font face type, appropriate file references, and face identification data.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontface5
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFace5 extends IDWriteFontFace4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFace5
     * @type {Guid}
     */
    static IID => Guid("{98eff3a5-b667-479a-b145-e2fa5b9fdc29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 53

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontAxisValueCount", "GetFontAxisValues", "HasVariations", "GetFontResource", "Equals"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface5-getfontaxisvaluecount
     */
    GetFontAxisValueCount() {
        result := ComCall(53, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} fontAxisValueCount 
     * @returns {DWRITE_FONT_AXIS_VALUE} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface5-getfontaxisvalues
     */
    GetFontAxisValues(fontAxisValueCount) {
        fontAxisValues := DWRITE_FONT_AXIS_VALUE()
        result := ComCall(54, this, "ptr", fontAxisValues, "uint", fontAxisValueCount, "HRESULT")
        return fontAxisValues
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface5-hasvariations
     */
    HasVariations() {
        result := ComCall(55, this, "int")
        return result
    }

    /**
     * 
     * @returns {IDWriteFontResource} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface5-getfontresource
     */
    GetFontResource() {
        result := ComCall(56, this, "ptr*", &fontResource := 0, "HRESULT")
        return IDWriteFontResource(fontResource)
    }

    /**
     * 
     * @param {IDWriteFontFace} fontFace 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontface5-equals
     */
    Equals(fontFace) {
        result := ComCall(57, this, "ptr", fontFace, "int")
        return result
    }
}
