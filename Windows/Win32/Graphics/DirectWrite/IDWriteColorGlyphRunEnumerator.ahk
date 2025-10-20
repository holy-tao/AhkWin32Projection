#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface allows the application to enumerate through the color glyph runs.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nn-dwrite_2-idwritecolorglyphrunenumerator
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteColorGlyphRunEnumerator extends IUnknown{
    /**
     * The interface identifier for IDWriteColorGlyphRunEnumerator
     * @type {Guid}
     */
    static IID => Guid("{d31fbe17-f157-41a2-8d24-cb779e0560e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} hasRun 
     * @returns {HRESULT} 
     */
    MoveNext(hasRun) {
        result := ComCall(3, this, "ptr", hasRun, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DWRITE_COLOR_GLYPH_RUN>} colorGlyphRun 
     * @returns {HRESULT} 
     */
    GetCurrentRun(colorGlyphRun) {
        result := ComCall(4, this, "ptr", colorGlyphRun, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
