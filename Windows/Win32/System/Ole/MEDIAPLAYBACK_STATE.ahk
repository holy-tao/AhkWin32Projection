#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class MEDIAPLAYBACK_STATE extends Win32Enum {

    /**
     * Native name: MEDIAPLAYBACK_RESUME
     * @type {Integer (Int32)}
     */
    static RESUME => 0

    /**
     * Native name: MEDIAPLAYBACK_PAUSE
     * @type {Integer (Int32)}
     */
    static PAUSE => 1

    /**
     * Native name: MEDIAPLAYBACK_PAUSE_AND_SUSPEND
     * @type {Integer (Int32)}
     */
    static PAUSE_AND_SUSPEND => 2

    /**
     * Native name: MEDIAPLAYBACK_RESUME_FROM_SUSPEND
     * @type {Integer (Int32)}
     */
    static RESUME_FROM_SUSPEND => 3
}
