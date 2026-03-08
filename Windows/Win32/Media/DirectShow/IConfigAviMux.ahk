#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IConfigAviMux interface configures the AVI Mux filter.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iconfigavimux
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IConfigAviMux extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConfigAviMux
     * @type {Guid}
     */
    static IID => Guid("{5acd6aa0-f482-11ce-8b67-00aa00a3f1a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMasterStream", "GetMasterStream", "SetOutputCompatibilityIndex", "GetOutputCompatibilityIndex"]

    /**
     * The SetMasterStream method specifies a stream that will be used to synchronize the other streams in the file.
     * @remarks
     * If you are capturing audio and video from two different sources, use this method to synchronize the streams. Streams coming from separate capture sources may be captured at slightly different rates. If you specify a master stream, the AVI Mux adjusts the playback rates for the other streams, to compensate for any drift that might occur.
     * 
     * It is recommended to use the audio stream as the master stream, because minor adjustments to the video playback rate are less noticeable than changes to the audio playback rate. Also, modifying the audio playback rate will cause the audio to be resampled by the audio driver.
     * 
     * This method works by adjusting the <i>dwScale</i> and <i>dwRate</i> values in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/avifmt/ns-avifmt-avistreamheader">AVISTREAMHEADER</a> structure.
     * @param {Integer} iStream Specifies the index of the stream, or –1 to indicate no master stream. The AVI Mux writes one stream for each connected input pin. Stream numbers are indexed from zero.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iconfigavimux-setmasterstream
     */
    SetMasterStream(iStream) {
        result := ComCall(3, this, "int", iStream, "HRESULT")
        return result
    }

    /**
     * The GetMasterStream method queries which stream will be used to synchronize the other streams in the file.
     * @returns {Integer} Receives the index of the master stream, or -1 if no master stream was set.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iconfigavimux-getmasterstream
     */
    GetMasterStream() {
        result := ComCall(4, this, "int*", &pStream := 0, "HRESULT")
        return pStream
    }

    /**
     * The SetOutputCompatibilityIndex method sets the AVI index format.
     * @remarks
     * The AVI Mux filter always creates an AVI 2.0 index ('indx' format). If the value given in <i>fOldIndex</i> is <b>TRUE</b>, the AVI Mux also creates an AVI 1.0 index ('idx1' format), for backward compatibility with Video for Windows.
     * 
     * The AVI 2.0 index format allows for larger files, incremental growth of files, and minimized disk seeks.
     * @param {BOOL} fOldIndex 
     * @returns {HRESULT} Returns S_OK if successful, or an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iconfigavimux-setoutputcompatibilityindex
     */
    SetOutputCompatibilityIndex(fOldIndex) {
        result := ComCall(5, this, "int", fOldIndex, "HRESULT")
        return result
    }

    /**
     * The GetOutputCompatibilityIndex method retrieves the setting for the AVI index format.
     * @remarks
     * The AVI Mux filter always creates an AVI 2.0 index ('indx' format). If the value returned in <i>pfOldIndex</i> is <b>TRUE</b>, the AVI Mux also creates an AVI 1.0 index ('idx1' format), for backward compatibility with Video for Windows.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iconfigavimux-getoutputcompatibilityindex
     */
    GetOutputCompatibilityIndex() {
        result := ComCall(6, this, "int*", &pfOldIndex := 0, "HRESULT")
        return pfOldIndex
    }
}
