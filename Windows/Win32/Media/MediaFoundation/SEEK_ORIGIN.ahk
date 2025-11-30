#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class SEEK_ORIGIN extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static _msoBegin => 0

    /**
     * @type {Integer (Int32)}
     */
    static _msoCurrent => 1
}
