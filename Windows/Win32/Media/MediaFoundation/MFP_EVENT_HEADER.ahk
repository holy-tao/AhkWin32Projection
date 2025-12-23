#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that is common to every type of MFPlay event.
 * @see https://learn.microsoft.com/windows/win32/api/mfplay/ns-mfplay-mfp_event_header
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFP_EVENT_HEADER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The type of event, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ne-mfplay-mfp_event_type">MFP_EVENT_TYPE</a> enumeration.
     * @type {Integer}
     */
    eEventType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Error or success code for the operation that caused the event.
     * @type {HRESULT}
     */
    hrEvent {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> interface of the MFPlay player object that sent the event.
     * @type {IMFPMediaPlayer}
     */
    pMediaPlayer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The new state of the MFPlay player object, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ne-mfplay-mfp_mediaplayer_state">MFP_MEDIAPLAYER_STATE</a> enumeration.
     * @type {Integer}
     */
    eState {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A pointer to the <b>IPropertyStore</b> interface of  a property store object. The property store is used to hold additional event data for some event types. This member might be <b>NULL</b>.
     * @type {IPropertyStore}
     */
    pPropertyStore {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
