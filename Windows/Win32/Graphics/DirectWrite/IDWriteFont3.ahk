#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFont2.ahk

/**
 * Represents a font in a font collection.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefont3
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFont3 extends IDWriteFont2{
    /**
     * The interface identifier for IDWriteFont3
     * @type {Guid}
     */
    static IID => Guid("{29748ed6-8c9c-4a6a-be0b-d912e8538944}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * 
     * @param {Pointer<IDWriteFontFace3>} fontFace 
     * @returns {HRESULT} 
     */
    CreateFontFace(fontFace) {
        result := ComCall(19, this, "ptr", fontFace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFont>} font 
     * @returns {BOOL} 
     */
    Equals(font) {
        result := ComCall(20, this, "ptr", font, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFaceReference>} fontFaceReference 
     * @returns {HRESULT} 
     */
    GetFontFaceReference(fontFaceReference) {
        result := ComCall(21, this, "ptr", fontFaceReference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} unicodeValue 
     * @returns {BOOL} 
     */
    HasCharacter(unicodeValue) {
        result := ComCall(22, this, "uint", unicodeValue, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLocality() {
        result := ComCall(23, this, "int")
        return result
    }
}
