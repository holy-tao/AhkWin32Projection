#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MFP_EVENT_HEADER.ahk

/**
 * Event structure for the MFP_EVENT_TYPE_MF event.
 * @remarks
 * 
  * To get a pointer to this structure, cast the <i>pEventHeader</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a> method. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_mf_event">MFP_GET_MF_EVENT</a> macro for this purpose.
  * 
  * If <b>MFEventType</b> is <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamsinkformatchanged">MEStreamSinkFormatChanged</a>, the following property may be stored in the event property store, which can be accessed through the <b>header.pPropertyStore</b> member.
  * 
  * <table>
  * <tr>
  * <th>Property</th>
  * <th>Description</th>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd375565(v=vs.85)">MFP_PKEY_StreamIndex</a>
  * </td>
  * <td>The index of the stream whose format changed. </td>
  * </tr>
  * </table>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfplay/ns-mfplay-mfp_mf_event
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFP_MF_EVENT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_event_header">MFP_EVENT_HEADER</a> structure that contains data common to all <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> events.
     * @type {MFP_EVENT_HEADER}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := MFP_EVENT_HEADER(this.ptr + 0)
            return this.__header
        }
    }

    /**
     * Media Foundation event type. Currently, the MFPlay player object forwards the following pipeline events to the application:
     * 
     * <table>
     * <tr>
     * <th>Event</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstarted">MEBufferingStarted</a>
     * </td>
     * <td>The source has started buffering data.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mebufferingstopped">MEBufferingStopped</a>
     * </td>
     * <td>The source has stopped buffering data.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/meextendedtype">MEExtendedType</a>
     * </td>
     * <td>Custom event type.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mereconnectend">MEReconnectEnd</a>
     * </td>
     * <td>The source has completed an attempt to reconnect to the server.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mereconnectstart">MEReconnectStart</a>
     * </td>
     * <td>The source is attempting to reconnect to the server.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/merendererevent">MERendererEvent</a>
     * </td>
     * <td>Event sent by a renderer, such as the <a href="https://docs.microsoft.com/windows/desktop/medfound/enhanced-video-renderer">Enhanced Video Renderer</a> (EVR).</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamsinkformatchanged">MEStreamSinkFormatChanged</a>
     * </td>
     * <td>A stream format has changed.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    MFEventType {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface of the Media Foundation event.
     * @type {Pointer<IMFMediaEvent>}
     */
    pMFMediaEvent {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> interface of the current media item.
     * @type {Pointer<IMFPMediaItem>}
     */
    pMediaItem {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
