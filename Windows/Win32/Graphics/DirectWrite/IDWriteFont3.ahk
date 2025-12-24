#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFace3.ahk
#Include .\IDWriteFontFaceReference.ahk
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
     * Creates a font face object for the font.
     * @returns {IDWriteFontFace3} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontface3">IDWriteFontFace3</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontface3">IDWriteFontFace3</a> interface for the newly created font face object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefont3-createfontface
     */
    CreateFontFace() {
        result := ComCall(19, this, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace3(fontFace)
    }

    /**
     * Compares two instances of font references for equality.
     * @param {IDWriteFont} font Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont">IDWriteFont</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont">IDWriteFont</a> interface for the other font instance to compare to this font instance.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns whether the two instances of font references are equal. Returns <b>TRUE</b> if the two instances are equal; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefont3-equals
     */
    Equals(font) {
        result := ComCall(20, this, "ptr", font, "int")
        return result
    }

    /**
     * Gets a font face reference that identifies this font.
     * @returns {IDWriteFontFaceReference} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference">IDWriteFontFaceReference</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference">IDWriteFontFaceReference</a> interface for the newly created font face reference object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefont3-getfontfacereference
     */
    GetFontFaceReference() {
        result := ComCall(21, this, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference(fontFaceReference)
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
     * Gets the current locality of the font.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_locality">DWRITE_LOCALITY</a></b>
     * 
     * Returns the current locality of the font.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefont3-getlocality
     */
    GetLocality() {
        result := ComCall(23, this, "int")
        return result
    }
}
