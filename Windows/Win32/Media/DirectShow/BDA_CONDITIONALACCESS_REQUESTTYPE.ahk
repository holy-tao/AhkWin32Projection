#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_CONDITIONALACCESS_REQUESTTYPE extends Win32Enum {

    /**
     * Native name: CONDITIONALACCESS_ACCESS_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static ACCESS_UNSPECIFIED => 0

    /**
     * Native name: CONDITIONALACCESS_ACCESS_NOT_POSSIBLE
     * @type {Integer (Int32)}
     */
    static ACCESS_NOT_POSSIBLE => 1

    /**
     * Native name: CONDITIONALACCESS_ACCESS_POSSIBLE
     * @type {Integer (Int32)}
     */
    static ACCESS_POSSIBLE => 2

    /**
     * Native name: CONDITIONALACCESS_ACCESS_POSSIBLE_NO_STREAMING_DISRUPTION
     * @type {Integer (Int32)}
     */
    static ACCESS_POSSIBLE_NO_STREAMING_DISRUPTION => 3
}
