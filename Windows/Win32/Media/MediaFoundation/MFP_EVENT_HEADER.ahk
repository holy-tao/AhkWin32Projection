#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMFPMediaPlayer.ahk" { IMFPMediaPlayer }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MFP_EVENT_TYPE.ahk" { MFP_EVENT_TYPE }
#Import ".\MFP_MEDIAPLAYER_STATE.ahk" { MFP_MEDIAPLAYER_STATE }

/**
 * Contains information that is common to every type of MFPlay event.
 * @see https://learn.microsoft.com/windows/win32/api/mfplay/ns-mfplay-mfp_event_header
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFP_EVENT_HEADER {
    #StructPack 8

    /**
     * The type of event, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ne-mfplay-mfp_event_type">MFP_EVENT_TYPE</a> enumeration.
     */
    eEventType : MFP_EVENT_TYPE

    /**
     * Error or success code for the operation that caused the event.
     */
    hrEvent : HRESULT

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> interface of the MFPlay player object that sent the event.
     */
    pMediaPlayer : IMFPMediaPlayer

    /**
     * The new state of the MFPlay player object, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ne-mfplay-mfp_mediaplayer_state">MFP_MEDIAPLAYER_STATE</a> enumeration.
     */
    eState : MFP_MEDIAPLAYER_STATE

    /**
     * A pointer to the <b>IPropertyStore</b> interface of  a property store object. The property store is used to hold additional event data for some event types. This member might be <b>NULL</b>.
     */
    pPropertyStore : IPropertyStore

}
