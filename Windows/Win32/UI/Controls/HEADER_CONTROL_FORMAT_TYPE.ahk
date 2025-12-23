#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class HEADER_CONTROL_FORMAT_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static HDFT_ISSTRING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HDFT_ISNUMBER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HDFT_ISDATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HDFT_HASNOVALUE => 32768
}
