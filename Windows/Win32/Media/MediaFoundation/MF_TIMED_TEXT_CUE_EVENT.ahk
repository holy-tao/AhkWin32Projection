#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a timed text cue event.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_cue_event
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TIMED_TEXT_CUE_EVENT extends Win32Enum{

    /**
     * The cue has become active.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_CUE_EVENT_ACTIVE => 0

    /**
     * The cue has become inactive.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_CUE_EVENT_INACTIVE => 1

    /**
     * All cues have been deactivated.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_CUE_EVENT_CLEAR => 2
}
