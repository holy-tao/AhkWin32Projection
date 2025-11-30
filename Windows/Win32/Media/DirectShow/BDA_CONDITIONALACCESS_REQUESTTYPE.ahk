#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_CONDITIONALACCESS_REQUESTTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_ACCESS_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_ACCESS_NOT_POSSIBLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_ACCESS_POSSIBLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_ACCESS_POSSIBLE_NO_STREAMING_DISRUPTION => 3
}
