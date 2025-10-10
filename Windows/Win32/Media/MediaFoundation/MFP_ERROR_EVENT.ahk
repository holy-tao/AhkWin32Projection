#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MFP_EVENT_HEADER.ahk

/**
 * Event structure for the MFP_EVENT_TYPE_ERROR event.
 * @remarks
 * 
  * To get a pointer to this structure, cast the <i>pEventHeader</i>parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a>  method.  You can use the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_error_event">MFP_GET_ERROR_EVENT</a> macro for this purpose.
  * 
  * This event is not used to signal the failure of an asynchronous <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> method. If an asynchronous method fails, the error is reported in the standard event listed for that method. The <b>MFP_EVENT_TYPE_ERROR</b> event is used for errors that happen outside the context of an asynchronous method call.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfplay/ns-mfplay-mfp_error_event
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFP_ERROR_EVENT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_event_header">MFP_EVENT_HEADER</a> structure that contains data common to all <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> events. The <b>hrEvent</b> member of the structure contains the error code.
     * @type {MFP_EVENT_HEADER}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := MFP_EVENT_HEADER(this.ptr + 0)
            return this.__header
        }
    }
}
