#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFont3.ahk
#Include .\IDWriteFontFaceReference.ahk
#Include .\IDWriteFontList.ahk

/**
 * Represents a list of fonts.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontlist1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontList1 extends IDWriteFontList{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontList1
     * @type {Guid}
     */
    static IID => Guid("{da20d8ef-812a-4c43-9802-62ec4abd7ade}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontLocality", "GetFont", "GetFontFaceReference"]

    /**
     * Gets the current location of a font given its zero-based index.
     * @param {Integer} listIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the font in the font list.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_locality">DWRITE_LOCALITY</a></b>
     * 
     * Returns a <a href="/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_locality">DWRITE_LOCALITY</a>-typed value that specifies the location of the specified font.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontlist1-getfontlocality
     */
    GetFontLocality(listIndex) {
        result := ComCall(6, this, "uint", listIndex, "int")
        return result
    }

    /**
     * Gets a font given its zero-based index.
     * @param {Integer} listIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the font in the font list.
     * @returns {IDWriteFont3} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefont3">IDWriteFont3</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefont3">IDWriteFont3</a> interface for the newly created font object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontlist1-getfont
     */
    GetFont(listIndex) {
        result := ComCall(7, this, "uint", listIndex, "ptr*", &font := 0, "HRESULT")
        return IDWriteFont3(font)
    }

    /**
     * Gets a font face reference given its zero-based index.
     * @param {Integer} listIndex Type: <b>UINT32</b>
     * 
     * Zero-based index of the font in the font list.
     * @returns {IDWriteFontFaceReference} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference">IDWriteFontFaceReference</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference">IDWriteFontFaceReference</a> interface for the newly created font face reference object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontlist1-getfontfacereference
     */
    GetFontFaceReference(listIndex) {
        result := ComCall(8, this, "uint", listIndex, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference(fontFaceReference)
    }
}
