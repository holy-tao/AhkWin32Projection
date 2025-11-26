#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFont.ahk

/**
 * Represents a physical font in a font collection.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nn-dwrite_1-idwritefont1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFont1 extends IDWriteFont{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFont1
     * @type {Guid}
     */
    static IID => Guid("{acd16696-8c14-4f5d-877e-fe3fc1d32738}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMetrics", "GetPanose", "GetUnicodeRanges", "IsMonospacedFont"]

    /**
     * Obtains design units and common metrics for the font face. These metrics are applicable to all the glyphs within a font face and are used by applications for layout calculations.
     * @param {Pointer<DWRITE_FONT_METRICS1>} fontMetrics Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_font_metrics1">DWRITE_FONT_METRICS1</a>*</b>
     * 
     *  A filled  <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_font_metrics1">DWRITE_FONT_METRICS1</a> structure that has font metrics for the current font face. The metrics returned by this method are in font design units.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefont1-getmetrics
     */
    GetMetrics(fontMetrics) {
        ComCall(14, this, "ptr", fontMetrics)
    }

    /**
     * Gets the PANOSE values from the font and is used for font selection and matching.
     * @remarks
     * 
     * If the font has no PANOSE values,
     *     they are set to 'any' (0) and <a href="https://docs.microsoft.com/windows/win32/DirectWrite/direct-write-portal">DirectWrite</a> doesn't simulate those values.
     * 
     * 
     * @param {Pointer<DWRITE_PANOSE>} panose Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_panose">DWRITE_PANOSE</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_panose">DWRITE_PANOSE</a> structure to fill in.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefont1-getpanose
     */
    GetPanose(panose) {
        ComCall(15, this, "ptr", panose)
    }

    /**
     * Retrieves the list of character ranges supported by a font.
     * @param {Integer} maxRangeCount Type: <b>UINT32</b>
     * 
     * The maximum number of character ranges passed
     *     in from the client.
     * @param {Pointer<DWRITE_UNICODE_RANGE>} unicodeRanges Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_unicode_range">DWRITE_UNICODE_RANGE</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_unicode_range">DWRITE_UNICODE_RANGE</a> structures that are filled with the character ranges.
     * @param {Pointer<Integer>} actualRangeCount Type: <b>UINT32*</b>
     * 
     * A pointer to the actual number of character ranges,
     *     regardless of the maximum count.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method executed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_NOT_SUFFICIENT_BUFFER</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small.  The <i>actualRangeCount</i> was more than the <i>maxRangeCount</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefont1-getunicoderanges
     */
    GetUnicodeRanges(maxRangeCount, unicodeRanges, actualRangeCount) {
        actualRangeCountMarshal := actualRangeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "uint", maxRangeCount, "ptr", unicodeRanges, actualRangeCountMarshal, actualRangeCount, "HRESULT")
        return result
    }

    /**
     * Determines if the font is monospaced, that is, the characters are the same fixed-pitch width (non-proportional).
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns true if the font is monospaced, else it returns false.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_1/nf-dwrite_1-idwritefont1-ismonospacedfont
     */
    IsMonospacedFont() {
        result := ComCall(17, this, "int")
        return result
    }
}
