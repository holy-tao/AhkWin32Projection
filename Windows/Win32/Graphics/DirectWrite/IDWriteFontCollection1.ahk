#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IDWriteFontSet>} fontSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontcollection1-getfontset
     */
    GetFontSet(fontSet) {
        result := ComCall(7, this, "ptr*", fontSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IDWriteFontFamily1>} fontFamily 
     * @returns {HRESULT} 
     */
    GetFontFamily(index, fontFamily) {
        result := ComCall(8, this, "uint", index, "ptr*", fontFamily, "HRESULT")
        return result
    }
}
