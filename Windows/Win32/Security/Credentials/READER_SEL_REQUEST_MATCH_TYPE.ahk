#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class READER_SEL_REQUEST_MATCH_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RSR_MATCH_TYPE_READER_AND_CONTAINER => 1

    /**
     * @type {Integer (Int32)}
     */
    static RSR_MATCH_TYPE_SERIAL_NUMBER => 2

    /**
     * @type {Integer (Int32)}
     */
    static RSR_MATCH_TYPE_ALL_CARDS => 3
}
