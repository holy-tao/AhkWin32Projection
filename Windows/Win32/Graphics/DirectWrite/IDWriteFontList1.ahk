#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} listIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontlist1-getfontlocality
     */
    GetFontLocality(listIndex) {
        result := ComCall(6, this, "uint", listIndex, "int")
        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @param {Pointer<IDWriteFont3>} font 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontlist1-getfont
     */
    GetFont(listIndex, font) {
        result := ComCall(7, this, "uint", listIndex, "ptr*", font, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @param {Pointer<IDWriteFontFaceReference>} fontFaceReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontlist1-getfontfacereference
     */
    GetFontFaceReference(listIndex, fontFaceReference) {
        result := ComCall(8, this, "uint", listIndex, "ptr*", fontFaceReference, "HRESULT")
        return result
    }
}
