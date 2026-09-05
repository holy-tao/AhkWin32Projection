#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a timed text cue event.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_cue_event
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_TIMED_TEXT_CUE_EVENT extends Win32Enum {

    /**
     * The cue has become active.
     * Native name: MF_TIMED_TEXT_CUE_EVENT_ACTIVE
     * @type {Integer (Int32)}
     */
    static ACTIVE => 0

    /**
     * The cue has become inactive.
     * Native name: MF_TIMED_TEXT_CUE_EVENT_INACTIVE
     * @type {Integer (Int32)}
     */
    static INACTIVE => 1

    /**
     * All cues have been deactivated.
     * Native name: MF_TIMED_TEXT_CUE_EVENT_CLEAR
     * @type {Integer (Int32)}
     */
    static CLEAR => 2
}
