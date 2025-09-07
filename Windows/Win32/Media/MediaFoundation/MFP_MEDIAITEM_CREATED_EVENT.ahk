#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MFP_EVENT_HEADER.ahk

/**
 * Event structure for the MFP_EVENT_TYPE_MEDIAITEM_CREATED event.
 * @remarks
 * To get a pointer to this structure, cast the <i>pEventHeader</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a>  method.  You can use the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_mediaitem_created_event">MFP_GET_MEDIAITEM_CREATED_EVENT</a> macro for this purpose.
  * 
  * Media items are created asynchronously. If multiple items are created, the operations can complete in any order, not necessarily in the same order as the method calls. You can use  the <b>dwUserData</b> member to identify the items, if you have simultaneous requests pending.
 * @see https://learn.microsoft.com/windows/win32/api/mfplay/ns-mfplay-mfp_mediaitem_created_event
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFP_MEDIAITEM_CREATED_EVENT extends Win32Struct
{
    static sizeof => 48

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
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> interface of the new media item. If creating the media item failed, this member is <b>NULL</b>.
     * @type {Pointer<IMFPMediaItem>}
     */
    pMediaItem {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Application-defined user data for the media item. This value is specified when the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromurl">CreateMediaItemFromURL</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromobject">CreateMediaItemFromObject</a>.
     * @type {Pointer}
     */
    dwUserData {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
