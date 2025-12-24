#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMParse interface sets and retrieves the parse time for an MPEG-2 stream.
 * @see https://docs.microsoft.com/windows/win32/api//amparse/nn-amparse-iamparse
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMParse extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMParse
     * @type {Guid}
     */
    static IID => Guid("{c47a3420-005c-11d2-9038-00a0c9697298}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParseTime", "SetParseTime", "Flush"]

    /**
     * The GetParseTime method retrieves the current stream parse time. For MPEG-2, this corresponds to the system clock time computed for the current stream position.
     * @returns {Integer} Pointer to the current parse time.
     * @see https://docs.microsoft.com/windows/win32/api//amparse/nf-amparse-iamparse-getparsetime
     */
    GetParseTime() {
        result := ComCall(3, this, "int64*", &prtCurrent := 0, "HRESULT")
        return prtCurrent
    }

    /**
     * The SetParseTime method sets the current stream parse time. For MPEG-2, this corresponds to the system clock time computed for the current stream position.
     * @param {Integer} rtCurrent Current stream parse time.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parse time is not available, because the input pin is not connected
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//amparse/nf-amparse-iamparse-setparsetime
     */
    SetParseTime(rtCurrent) {
        result := ComCall(4, this, "int64", rtCurrent, "HRESULT")
        return result
    }

    /**
     * The Flush method clears the current file data to allow for a more rapid switch to a new file.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//amparse/nf-amparse-iamparse-flush
     */
    Flush() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
