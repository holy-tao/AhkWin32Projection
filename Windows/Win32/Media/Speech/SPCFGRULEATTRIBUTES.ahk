#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPCFGRULEATTRIBUTES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPRAF_TopLevel => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPRAF_Active => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPRAF_Export => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPRAF_Import => 8

    /**
     * @type {Integer (Int32)}
     */
    static SPRAF_Interpreter => 16

    /**
     * @type {Integer (Int32)}
     */
    static SPRAF_Dynamic => 32

    /**
     * @type {Integer (Int32)}
     */
    static SPRAF_Root => 64

    /**
     * @type {Integer (Int32)}
     */
    static SPRAF_AutoPause => 65536

    /**
     * @type {Integer (Int32)}
     */
    static SPRAF_UserDelimited => 131072
}
