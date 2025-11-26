#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMediaSeeking interface contains methods for seeking to a position within a stream, and for setting the playback rate.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imediaseeking
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaSeeking extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaSeeking
     * @type {Guid}
     */
    static IID => Guid("{36b73880-c2c8-11cf-8b46-00805f6cef60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilities", "CheckCapabilities", "IsFormatSupported", "QueryPreferredFormat", "GetTimeFormat", "IsUsingTimeFormat", "SetTimeFormat", "GetDuration", "GetStopPosition", "GetCurrentPosition", "ConvertTimeFormat", "SetPositions", "GetPositions", "GetAvailable", "SetRate", "GetRate", "GetPreroll"]

    /**
     * The GetCapabilities method retrieves all the seeking capabilities of the stream.
     * @returns {Integer} Pointer to a variable that receives a bitwise combination of <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-am_seeking_seeking_capabilities">AM_SEEKING_SEEKING_CAPABILITIES</a> flags.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-getcapabilities
     */
    GetCapabilities() {
        result := ComCall(3, this, "uint*", &pCapabilities := 0, "HRESULT")
        return pCapabilities
    }

    /**
     * The CheckCapabilities method queries whether a stream has specified seeking capabilities.
     * @param {Pointer<Integer>} pCapabilities On input, a pointer to a variable that contains a bitwise <b>OR</b> of one or more <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-am_seeking_seeking_capabilities">AM_SEEKING_SEEKING_CAPABILITIES</a> attributes. When the method returns, the value indicates which of those attributes are available.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some but not all of the capabilities in <i>pCapabilities</i> are present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All capabilities in <i>pCapabilities</i> are present.
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
     * No capabilities in <i>pCapabilities</i> are present.
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
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-checkcapabilities
     */
    CheckCapabilities(pCapabilities) {
        pCapabilitiesMarshal := pCapabilities is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pCapabilitiesMarshal, pCapabilities, "HRESULT")
        return result
    }

    /**
     * The IsFormatSupported method determines whether a specified time format is supported for seek operations.
     * @param {Pointer<Guid>} pFormat Pointer to a GUID that specifies the time format. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-format-guids">Time Format GUIDs</a>.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The format is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The format is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
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
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-isformatsupported
     */
    IsFormatSupported(pFormat) {
        result := ComCall(5, this, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * The QueryPreferredFormat method retrieves the preferred time format for seeking.
     * @returns {Guid} Pointer to a variable that receives a GUID specifying the time format. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-format-guids">Time Format GUIDs</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-querypreferredformat
     */
    QueryPreferredFormat() {
        pFormat := Guid()
        result := ComCall(6, this, "ptr", pFormat, "HRESULT")
        return pFormat
    }

    /**
     * The GetTimeFormat method retrieves the time format that is currently being used for seek operations.
     * @returns {Guid} Pointer to a variable that receives a GUID specifying the time format. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-format-guids">Time Format GUIDs</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-gettimeformat
     */
    GetTimeFormat() {
        pFormat := Guid()
        result := ComCall(7, this, "ptr", pFormat, "HRESULT")
        return pFormat
    }

    /**
     * The IsUsingTimeFormat method determines whether seek operations are currently using a specified time format.
     * @param {Pointer<Guid>} pFormat Pointer to a GUID that specifies the time format. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-format-guids">Time Format GUIDs</a>.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified format is not the current format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified format is the current format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
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
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-isusingtimeformat
     */
    IsUsingTimeFormat(pFormat) {
        result := ComCall(8, this, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * The SetTimeFormat method sets the time format for subsequent seek operations.
     * @param {Pointer<Guid>} pFormat Pointer to a GUID that specifies the time format. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-format-guids">Time Format GUIDs</a>.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method is not supported.
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
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Filter graph is not stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-settimeformat
     */
    SetTimeFormat(pFormat) {
        result := ComCall(9, this, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * The GetDuration method gets the duration of the stream.
     * @returns {Integer} Receives the duration, in units of the current time format.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-getduration
     */
    GetDuration() {
        result := ComCall(10, this, "int64*", &pDuration := 0, "HRESULT")
        return pDuration
    }

    /**
     * The GetStopPosition method retrieves the time at which the playback will stop, relative to the duration of the stream.
     * @returns {Integer} Pointer to a variable that receives the stop time, in units of the current time format.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-getstopposition
     */
    GetStopPosition() {
        result := ComCall(11, this, "int64*", &pStop := 0, "HRESULT")
        return pStop
    }

    /**
     * The GetCurrentPosition method retrieves the current position, relative to the total duration of the stream.
     * @returns {Integer} Pointer to a variable that receives the current position, in units of the current time format.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-getcurrentposition
     */
    GetCurrentPosition() {
        result := ComCall(12, this, "int64*", &pCurrent := 0, "HRESULT")
        return pCurrent
    }

    /**
     * The ConvertTimeFormat method converts from one time format to another.
     * @param {Pointer<Guid>} pTargetFormat Pointer to a GUID that specifies the target format. If <b>NULL</b>, the current format is used. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-format-guids">Time Format GUIDs</a>.
     * @param {Integer} Source Time value to be converted.
     * @param {Pointer<Guid>} pSourceFormat Pointer to a GUID that specifies the format to convert. If <b>NULL</b>, the current format is used. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-format-guids">Time Format GUIDs</a>.
     * @returns {Integer} Pointer to a variable that receives the converted time.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-converttimeformat
     */
    ConvertTimeFormat(pTargetFormat, Source, pSourceFormat) {
        result := ComCall(13, this, "int64*", &pTarget := 0, "ptr", pTargetFormat, "int64", Source, "ptr", pSourceFormat, "HRESULT")
        return pTarget
    }

    /**
     * The SetPositions method sets the current position and the stop position.
     * @param {Pointer<Integer>} pCurrent [in,out] Pointer to a variable that specifies the current position, in units of the current time format.
     * @param {Integer} dwCurrentFlags Bitwise combination of flags. See Remarks.
     * @param {Pointer<Integer>} pStop [in,out] Pointer to a variable that specifies the stop time, in units of the current time format.
     * @param {Integer} dwStopFlags Bitwise combination of flags. See Remarks.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No position change. (Both flags specify no seeking.)
     * 
     * </td>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method is not supported.
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
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-setpositions
     */
    SetPositions(pCurrent, dwCurrentFlags, pStop, dwStopFlags) {
        pCurrentMarshal := pCurrent is VarRef ? "int64*" : "ptr"
        pStopMarshal := pStop is VarRef ? "int64*" : "ptr"

        result := ComCall(14, this, pCurrentMarshal, pCurrent, "uint", dwCurrentFlags, pStopMarshal, pStop, "uint", dwStopFlags, "HRESULT")
        return result
    }

    /**
     * The GetPositions method retrieves the current position and the stop position, relative to the total duration of the stream.
     * @param {Pointer<Integer>} pCurrent Pointer to a variable that receives the current position, in units of the current time format.
     * @param {Pointer<Integer>} pStop Pointer to a variable that receives the stop position, in units of the current time format.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method is not supported.
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
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-getpositions
     */
    GetPositions(pCurrent, pStop) {
        pCurrentMarshal := pCurrent is VarRef ? "int64*" : "ptr"
        pStopMarshal := pStop is VarRef ? "int64*" : "ptr"

        result := ComCall(15, this, pCurrentMarshal, pCurrent, pStopMarshal, pStop, "HRESULT")
        return result
    }

    /**
     * The GetAvailable method retrieves the range of times in which seeking is efficient.
     * @param {Pointer<Integer>} pEarliest Pointer to a variable that receives the earliest time for efficient seeking.
     * @param {Pointer<Integer>} pLatest Pointer to a variable that receives the latest time for efficient seeking.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method is not supported.
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
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-getavailable
     */
    GetAvailable(pEarliest, pLatest) {
        pEarliestMarshal := pEarliest is VarRef ? "int64*" : "ptr"
        pLatestMarshal := pLatest is VarRef ? "int64*" : "ptr"

        result := ComCall(16, this, pEarliestMarshal, pEarliest, pLatestMarshal, pLatest, "HRESULT")
        return result
    }

    /**
     * The SetRate method sets the playback rate.
     * @param {Float} dRate Playback rate. Must not be zero.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified rate was zero or a negative value. (See Remarks.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
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
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_UNSUPPORTED_AUDIO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Audio device or filter does not support this rate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-setrate
     */
    SetRate(dRate) {
        result := ComCall(17, this, "double", dRate, "HRESULT")
        return result
    }

    /**
     * The GetRate method retrieves the playback rate.
     * @returns {Float} Pointer to a variable that receives the playback rate.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-getrate
     */
    GetRate() {
        result := ComCall(18, this, "double*", &pdRate := 0, "HRESULT")
        return pdRate
    }

    /**
     * The GetPreroll method retrieves the amount of data that will be queued before the start position.
     * @returns {Integer} Pointer to a variable that receives the preroll time, in units of the current time format.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaseeking-getpreroll
     */
    GetPreroll() {
        result := ComCall(19, this, "int64*", &pllPreroll := 0, "HRESULT")
        return pllPreroll
    }
}
