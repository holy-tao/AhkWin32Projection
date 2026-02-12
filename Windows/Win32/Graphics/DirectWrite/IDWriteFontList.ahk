#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontCollection.ahk
#Include .\IDWriteFont.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a list of fonts. (IDWriteFontList)
 * @see https://learn.microsoft.com/windows/win32/api//content/dwrite/nn-dwrite-idwritefontlist
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontList
     * @type {Guid}
     */
    static IID => Guid("{1a0d8438-1d97-4ec1-aef9-a2fb86ed6acb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontCollection", "GetFontCount", "GetFont"]

    /**
     * Gets the font collection that contains the fonts in the font list.
     * @returns {Pointer<IDWriteFontCollection>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite/nf-dwrite-idwritefontlist-getfontcollection
     */
    GetFontCollection() {
        result := ComCall(3, this, "ptr*", &fontCollection_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fontCollection_
    }

    /**
     * Gets the number of fonts in the font list.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The number of fonts in the font list.
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite/nf-dwrite-idwritefontlist-getfontcount
     */
    GetFontCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * Gets a font given its zero-based index. (IDWriteFontList.GetFont)
     * @param {Integer} index Type: <b>UINT32</b>
     * 
     * Zero-based index of the font in the font list.
     * @returns {Pointer<IDWriteFont>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/dwrite/nf-dwrite-idwritefontlist-getfont
     */
    GetFont(index) {
        result := ComCall(5, this, "uint", index, "ptr*", &font_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return font_
    }
}
