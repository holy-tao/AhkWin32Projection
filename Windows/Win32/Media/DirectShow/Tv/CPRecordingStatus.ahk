#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class CPRecordingStatus extends Win32Enum {

    /**
     * Native name: RECORDING_STOPPED
     * @type {Integer (Int32)}
     */
    static STOPPED => 0

    /**
     * Native name: RECORDING_STARTED
     * @type {Integer (Int32)}
     */
    static STARTED => 1
}
