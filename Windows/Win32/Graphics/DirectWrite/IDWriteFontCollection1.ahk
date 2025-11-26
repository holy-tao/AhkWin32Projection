#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontSet.ahk
#Include .\IDWriteFontFamily1.ahk
#Include .\IDWriteFontCollection.ahk

/**
 * An object that encapsulates a set of fonts, such as the set of fonts installed on the system, or the set of fonts in a particular directory.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontcollection1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontCollection1 extends IDWriteFontCollection{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontCollection1
     * @type {Guid}
     */
    static IID => Guid("{53585141-d9f8-4095-8321-d73cf6bd116c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontSet", "GetFontFamily"]

    /**
     * Gets the underlying font set used by this collection.
     * @returns {IDWriteFontSet} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset">IDWriteFontSet</a>**</b>
     * 
     * Returns the font set used by the collection.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontcollection1-getfontset
     */
    GetFontSet() {
        result := ComCall(7, this, "ptr*", &fontSet := 0, "HRESULT")
        return IDWriteFontSet(fontSet)
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IDWriteFontFamily1} 
     */
    GetFontFamily(index) {
        result := ComCall(8, this, "uint", index, "ptr*", &fontFamily := 0, "HRESULT")
        return IDWriteFontFamily1(fontFamily)
    }
}
