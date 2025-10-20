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
     * 
     * @param {Pointer<IDWriteFontSet>} fontSet 
     * @returns {HRESULT} 
     */
    GetFontSet(fontSet) {
        result := ComCall(7, this, "ptr", fontSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IDWriteFontFamily1>} fontFamily 
     * @returns {HRESULT} 
     */
    GetFontFamily(index, fontFamily) {
        result := ComCall(8, this, "uint", index, "ptr", fontFamily, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
