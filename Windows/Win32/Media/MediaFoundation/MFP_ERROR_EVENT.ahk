#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMFPMediaPlayer.ahk" { IMFPMediaPlayer }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import ".\MFP_EVENT_HEADER.ahk" { MFP_EVENT_HEADER }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MFP_EVENT_TYPE.ahk" { MFP_EVENT_TYPE }
#Import ".\MFP_MEDIAPLAYER_STATE.ahk" { MFP_MEDIAPLAYER_STATE }

/**
 * Event structure for the MFP_EVENT_TYPE_ERROR event.
 * @remarks
 * To get a pointer to this structure, cast the <i>pEventHeader</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a>  method.  You can use the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_error_event">MFP_GET_ERROR_EVENT</a> macro for this purpose.
 * 
 * This event is not used to signal the failure of an asynchronous <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> method. If an asynchronous method fails, the error is reported in the standard event listed for that method. The <b>MFP_EVENT_TYPE_ERROR</b> event is used for errors that happen outside the context of an asynchronous method call.
 * @see https://learn.microsoft.com/windows/win32/api/mfplay/ns-mfplay-mfp_error_event
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFP_ERROR_EVENT {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_event_header">MFP_EVENT_HEADER</a> structure that contains data common to all <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> events. The <b>hrEvent</b> member of the structure contains the error code.
     */
    header : MFP_EVENT_HEADER

}
