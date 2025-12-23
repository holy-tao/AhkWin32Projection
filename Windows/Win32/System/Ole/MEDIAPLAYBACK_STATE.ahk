#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class MEDIAPLAYBACK_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MEDIAPLAYBACK_RESUME => 0

    /**
     * @type {Integer (Int32)}
     */
    static MEDIAPLAYBACK_PAUSE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MEDIAPLAYBACK_PAUSE_AND_SUSPEND => 2

    /**
     * @type {Integer (Int32)}
     */
    static MEDIAPLAYBACK_RESUME_FROM_SUSPEND => 3
}
