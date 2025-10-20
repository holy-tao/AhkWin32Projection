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
     * 
     * @param {Pointer<DWRITE_FONT_METRICS1>} fontMetrics 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefont1-getmetrics
     */
    GetMetrics(fontMetrics) {
        ComCall(14, this, "ptr", fontMetrics)
    }

    /**
     * 
     * @param {Pointer<DWRITE_PANOSE>} panose 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefont1-getpanose
     */
    GetPanose(panose) {
        ComCall(15, this, "ptr", panose)
    }

    /**
     * Returns the ranges of Unicode points that the recognizer supports.
     * @param {Integer} maxRangeCount 
     * @param {Pointer<DWRITE_UNICODE_RANGE>} unicodeRanges 
     * @param {Pointer<Integer>} actualRangeCount 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_E_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pcr</i> buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-getunicoderanges
     */
    GetUnicodeRanges(maxRangeCount, unicodeRanges, actualRangeCount) {
        result := ComCall(16, this, "uint", maxRangeCount, "ptr", unicodeRanges, "uint*", actualRangeCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwritefont1-ismonospacedfont
     */
    IsMonospacedFont() {
        result := ComCall(17, this, "int")
        return result
    }
}
