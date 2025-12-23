#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class DISC_RECORDER_STATE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static RECORDER_BURNING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RECORDER_DOING_NOTHING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RECORDER_OPENED => 1
}
