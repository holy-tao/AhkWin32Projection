#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a list of fonts.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefontlist
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontList extends IUnknown{
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
     * 
     * @param {Pointer<IDWriteFontCollection>} fontCollection 
     * @returns {HRESULT} 
     */
    GetFontCollection(fontCollection) {
        result := ComCall(3, this, "ptr", fontCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFontCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IDWriteFont>} font 
     * @returns {HRESULT} 
     */
    GetFont(index, font) {
        result := ComCall(5, this, "uint", index, "ptr", font, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
