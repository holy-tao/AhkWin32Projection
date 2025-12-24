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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MoveNext", "GetCurrentRun"]

    /**
     * Move to the next glyph run in the enumerator.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Returns <b>TRUE</b> if there is a next glyph run.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritecolorglyphrunenumerator-movenext
     */
    MoveNext() {
        result := ComCall(3, this, "int*", &hasRun := 0, "HRESULT")
        return hasRun
    }

    /**
     * Returns the current glyph run of the enumerator.
     * @returns {Pointer<DWRITE_COLOR_GLYPH_RUN>} Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ns-dwrite_2-dwrite_color_glyph_run">DWRITE_COLOR_GLYPH_RUN</a>**</b>
     * 
     * A pointer to the current glyph run.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nf-dwrite_2-idwritecolorglyphrunenumerator-getcurrentrun
     */
    GetCurrentRun() {
        result := ComCall(4, this, "ptr*", &colorGlyphRun := 0, "HRESULT")
        return colorGlyphRun
    }
}
