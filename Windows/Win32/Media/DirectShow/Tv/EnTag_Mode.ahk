#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class EnTag_Mode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EnTag_Remove => 0

    /**
     * @type {Integer (Int32)}
     */
    static EnTag_Once => 1

    /**
     * @type {Integer (Int32)}
     */
    static EnTag_Repeat => 2
}
