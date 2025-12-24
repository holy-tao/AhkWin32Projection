#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables a pull-mode source filter to support larger file sizes.
 * @remarks
 * 
 * In the pull model, the parser filter requests data from the source filter by calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iasyncreader-request">IAsyncReader::Request</a>. The input to this method is a media sample. The time stamp on the sample specifies the location to read in the stream, as a byte offset.
 * 
 * By default, the time stamp uses the following formula: Time = byte offset × 10000000. This scaling factor limits the effective file size to about 860 GB. To support larger file sizes, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamasyncreadertimestampscaling-settimestampmode">SetTimestampMode</a> with the value <b>TRUE</b>. This call sets the scaling factor to 1, so the formula becomes: Time = byte offset.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamasyncreadertimestampscaling
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMAsyncReaderTimestampScaling extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMAsyncReaderTimestampScaling
     * @type {Guid}
     */
    static IID => Guid("{cf7b26fc-9a00-485b-8147-3e789d5e8f67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTimestampMode", "SetTimestampMode"]

    /**
     * Gets the filter's time-stamping mode.
     * @returns {BOOL} Receives a Boolean value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Time stamps are in units of bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Time stamps are in units of bytes × 10000000. To get the offset in bytes, divide the sample time by 10000000.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamasyncreadertimestampscaling-gettimestampmode
     */
    GetTimestampMode() {
        result := ComCall(3, this, "int*", &pfRaw := 0, "HRESULT")
        return pfRaw
    }

    /**
     * Sets the filter's time-stamping mode.
     * @param {BOOL} fRaw Specifies the units for the source filter's time stamps.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Time stamps are in units of bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Time stamps are in units of bytes × 10000000. To get the offset in bytes, divide the sample time by 10000000.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The default value is <b>FALSE</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamasyncreadertimestampscaling-settimestampmode
     */
    SetTimestampMode(fRaw) {
        result := ComCall(4, this, "int", fRaw, "HRESULT")
        return result
    }
}
