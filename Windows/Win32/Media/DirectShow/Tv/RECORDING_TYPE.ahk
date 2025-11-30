#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class RECORDING_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RECORDING_TYPE_CONTENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static RECORDING_TYPE_REFERENCE => 1
}
