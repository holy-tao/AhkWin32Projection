#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFamily.ahk

/**
 * Represents a family of related fonts.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontfamily1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFamily1 extends IDWriteFontFamily{
    /**
     * The interface identifier for IDWriteFontFamily1
     * @type {Guid}
     */
    static IID => Guid("{da20d8ef-812a-4c43-9802-62ec4abd7adf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Integer} listIndex 
     * @returns {Integer} 
     */
    GetFontLocality(listIndex) {
        result := ComCall(9, this, "uint", listIndex, "int")
        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @param {Pointer<IDWriteFont3>} font 
     * @returns {HRESULT} 
     */
    GetFont(listIndex, font) {
        result := ComCall(10, this, "uint", listIndex, "ptr", font, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @param {Pointer<IDWriteFontFaceReference>} fontFaceReference 
     * @returns {HRESULT} 
     */
    GetFontFaceReference(listIndex, fontFaceReference) {
        result := ComCall(11, this, "uint", listIndex, "ptr", fontFaceReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
