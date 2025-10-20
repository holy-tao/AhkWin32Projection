#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFace4.ahk

/**
 * Contains font face type, appropriate file references, and face identification data.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontface5
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFace5 extends IDWriteFontFace4{
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
     * 
     * @returns {Integer} 
     */
    GetFontAxisValueCount() {
        result := ComCall(53, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @returns {HRESULT} 
     */
    GetFontAxisValues(fontAxisValues, fontAxisValueCount) {
        result := ComCall(54, this, "ptr", fontAxisValues, "uint", fontAxisValueCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    HasVariations() {
        result := ComCall(55, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontResource>} fontResource 
     * @returns {HRESULT} 
     */
    GetFontResource(fontResource) {
        result := ComCall(56, this, "ptr", fontResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFace>} fontFace 
     * @returns {BOOL} 
     */
    Equals(fontFace) {
        result := ComCall(57, this, "ptr", fontFace, "int")
        return result
    }
}
