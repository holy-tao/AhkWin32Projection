#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteColorGlyphRunEnumerator.ahk

/**
 * Enumerator for an ordered collection of color glyph runs.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritecolorglyphrunenumerator1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteColorGlyphRunEnumerator1 extends IDWriteColorGlyphRunEnumerator{
    /**
     * The interface identifier for IDWriteColorGlyphRunEnumerator1
     * @type {Guid}
     */
    static IID => Guid("{7c5f86da-c7a1-4f05-b8e1-55a179fe5a35}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<DWRITE_COLOR_GLYPH_RUN1>} colorGlyphRun 
     * @returns {HRESULT} 
     */
    GetCurrentRun(colorGlyphRun) {
        result := ComCall(5, this, "ptr", colorGlyphRun, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
