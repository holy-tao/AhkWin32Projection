#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class RECORDING_TYPE extends Win32Enum {

    /**
     * Native name: RECORDING_TYPE_CONTENT
     * @type {Integer (Int32)}
     */
    static CONTENT => 0

    /**
     * Native name: RECORDING_TYPE_REFERENCE
     * @type {Integer (Int32)}
     */
    static REFERENCE => 1
}
