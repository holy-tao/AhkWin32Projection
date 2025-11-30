#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorNativeLinkType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static nltNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static nltAnsi => 2

    /**
     * @type {Integer (Int32)}
     */
    static nltUnicode => 3

    /**
     * @type {Integer (Int32)}
     */
    static nltAuto => 4

    /**
     * @type {Integer (Int32)}
     */
    static nltOle => 5

    /**
     * @type {Integer (Int32)}
     */
    static nltMaxValue => 7
}
