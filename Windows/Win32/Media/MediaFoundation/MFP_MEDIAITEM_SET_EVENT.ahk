#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MFP_EVENT_HEADER.ahk

/**
 * Event structure for the MFP_EVENT_TYPE_MEDIAITEM_SET event.
 * @remarks
 * 
  * To get a pointer to this structure, cast the <i>pEventHeader</i>parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a>  method.  You can use the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_mediaitem_set_event">MFP_GET_MEDIAITEM_SET_EVENT</a> macro for this purpose.
  * 
  * If one or more streams could not be connected to a media sink, the event property store contains the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfp-pkey-streamrenderingresults">MFP_PKEY_StreamRenderingResults</a> property. The value of the property is an array of <b>HRESULT</b> values, indicating which streams were connected successfully.  The event property store can be accessed through the <b>header.pPropertyStore</b> member.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfplay/ns-mfplay-mfp_mediaitem_set_event
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFP_MEDIAITEM_SET_EVENT extends Win32Struct
{
    static sizeof => 40

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
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> interface of the media item that was queued for playback.
     * @type {Pointer<IMFPMediaItem>}
     */
    pMediaItem {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
