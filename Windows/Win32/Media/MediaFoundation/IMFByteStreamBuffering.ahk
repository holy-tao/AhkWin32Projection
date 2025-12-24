#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls how a byte stream buffers data from a network.
 * @remarks
 * 
 * If a byte stream implements this interface, a media source can use it to control how the byte stream buffers data. This interface is designed for byte streams that read data from a network.
 *       
 * 
 * A byte stream that implements this interface should also implement the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaeventgenerator">IMFMediaEventGenerator</a> interface. When the byte stream starts buffering, it sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstarted">MEBufferingStarted</a> event. When it stops buffering, it sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstopped">MEBufferingStopped</a> event.
 *       
 * 
 * The byte stream must send a matching <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstopped">MEBufferingStopped</a> event for every <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstarted">MEBufferingStarted</a> event. The byte stream must not send MEBufferingStarted events unless the media source has enabled buffering by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreambuffering-enablebuffering">EnableBuffering</a> with the value <b>TRUE</b>.
 *       
 * 
 * After the byte stream sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstarted">MEBufferingStarted</a> event, it should send <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstopped">MEBufferingStopped</a> if any of the following occur:
 *       
 * 
 * <ul>
 * <li>The byte stream finishes buffering data.
 *           </li>
 * <li>The byte stream reaches the end of the stream.
 *           </li>
 * <li>The media source calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreambuffering-enablebuffering">EnableBuffering</a> with the value <b>FALSE</b>.
 *           </li>
 * <li>The media source calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreambuffering-stopbuffering">StopBuffering</a>.
 *           </li>
 * </ul>
 * The byte stream should not send any more buffering events after it reaches the end of the file.
 *       
 * 
 * If buffering is disabled, the byte stream does not send any buffering events. Internally, however, it might still buffer data while it waits for I/O requests to complete. Therefore, <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> methods might take an indefinite length of time to complete.
 *       
 * 
 * If the byte stream is buffering data internally and the media source calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreambuffering-enablebuffering">EnableBuffering</a> with the value <b>TRUE</b>, the byte stream can send <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstarted">MEBufferingStarted</a> immediately.
 *       
 * 
 * After the presentation has started, the media source should forward and <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstarted">MEBufferingStarted</a> and <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstopped">MEBufferingStopped</a> events that it receives while started. The Media Session will pause the presentation clock while buffering is progress and restart the presentation clock when buffering completes. The media source should only forward these events while the presentation is playing. The purpose of sending these events to the Media Session is to pause the presentation time while the source buffers data.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfbytestreambuffering
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFByteStreamBuffering extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFByteStreamBuffering
     * @type {Guid}
     */
    static IID => Guid("{6d66d782-1d4f-4db7-8c63-cb8c77f1ef5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBufferingParams", "EnableBuffering", "StopBuffering"]

    /**
     * Sets the buffering parameters.
     * @param {Pointer<MFBYTESTREAM_BUFFERING_PARAMS>} pParams Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mfbytestream_buffering_params">MFBYTESTREAM_BUFFERING_PARAMS</a> structure that contains the buffering parameters. The byte stream uses this information to calculate how much data to buffer from the network.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfbytestreambuffering-setbufferingparams
     */
    SetBufferingParams(pParams) {
        result := ComCall(3, this, "ptr", pParams, "HRESULT")
        return result
    }

    /**
     * Enables or disables buffering.
     * @param {BOOL} fEnable Specifies whether the byte stream buffers data. If <b>TRUE</b>, buffering is enabled. If <b>FALSE</b>, buffering is disabled.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfbytestreambuffering-enablebuffering
     */
    EnableBuffering(fEnable) {
        result := ComCall(4, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * Stops any buffering that is in progress.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The byte stream successfully stopped buffering.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No buffering was in progress.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfbytestreambuffering-stopbuffering
     */
    StopBuffering() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
