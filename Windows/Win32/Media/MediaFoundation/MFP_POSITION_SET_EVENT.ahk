#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFPMediaPlayer.ahk" { IMFPMediaPlayer }
#Import ".\IMFPMediaItem.ahk" { IMFPMediaItem }
#Import ".\MFP_EVENT_TYPE.ahk" { MFP_EVENT_TYPE }
#Import ".\MFP_EVENT_HEADER.ahk" { MFP_EVENT_HEADER }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import ".\MFP_MEDIAPLAYER_STATE.ahk" { MFP_MEDIAPLAYER_STATE }

/**
 * Event structure for the MFP_EVENT_TYPE_POSITION_SET event.
 * @remarks
 * To get a pointer to this structure, cast the <i>pEventHeader</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a>  method.  You can use the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_position_set_event">MFP_GET_POSITION_SET_EVENT</a> macro for this purpose.
 * @see https://learn.microsoft.com/windows/win32/api/mfplay/ns-mfplay-mfp_position_set_event
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFP_POSITION_SET_EVENT {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_event_header">MFP_EVENT_HEADER</a> structure that contains data common to all <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> events.
     */
    header : MFP_EVENT_HEADER

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> interface of the current media item.
     */
    pMediaItem : IMFPMediaItem

}
