#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IMFPMediaItem.ahk
#Include .\MFP_EVENT_TYPE.ahk
#Include .\IMFPMediaPlayer.ahk
#Include .\MFP_EVENT_HEADER.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include .\MFP_MEDIAPLAYER_STATE.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * Event structure for the MFP_EVENT_TYPE_PAUSE event.
 * @remarks
 * To get a pointer to this structure, cast the <i>pEventHeader</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a>  method.  You can use the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_pause_event">MFP_GET_PAUSE_EVENT</a> macro for this purpose.
 * @see https://learn.microsoft.com/windows/win32/api/mfplay/ns-mfplay-mfp_pause_event
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFP_PAUSE_EVENT extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_event_header">MFP_EVENT_HEADER</a> structure that contains data common to all <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> events.
     * @type {MFP_EVENT_HEADER}
     */
    header {
        get {
            if(!this.HasProp("__header"))
                this.__header := MFP_EVENT_HEADER(0, this)
            return this.__header
        }
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> interface of the current media item.
     * @type {IMFPMediaItem}
     */
    pMediaItem {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
