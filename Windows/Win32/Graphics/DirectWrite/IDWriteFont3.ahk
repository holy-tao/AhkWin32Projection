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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFontFace", "Equals", "GetFontFaceReference", "HasCharacter", "GetLocality"]

    /**
     * 
     * @param {Pointer<IDWriteFontFace3>} fontFace 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefont3-createfontface
     */
    CreateFontFace(fontFace) {
        result := ComCall(19, this, "ptr*", fontFace, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDWriteFont} font 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefont3-equals
     */
    Equals(font) {
        result := ComCall(20, this, "ptr", font, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFaceReference>} fontFaceReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefont3-getfontfacereference
     */
    GetFontFaceReference(fontFaceReference) {
        result := ComCall(21, this, "ptr*", fontFaceReference, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefont3-getlocality
     */
    GetLocality() {
        result := ComCall(23, this, "int")
        return result
    }
}
