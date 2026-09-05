#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
class DISC_RECORDER_STATE_FLAGS extends Win32Enum {

    /**
     * Native name: RECORDER_BURNING
     * @type {Integer (UInt32)}
     */
    static BURNING => 2

    /**
     * Native name: RECORDER_DOING_NOTHING
     * @type {Integer (UInt32)}
     */
    static DOING_NOTHING => 0

    /**
     * Native name: RECORDER_OPENED
     * @type {Integer (UInt32)}
     */
    static OPENED => 1
}
