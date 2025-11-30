#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class SF_REQ_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_SEND_RESPONSE_HEADER => 0

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_ADD_HEADERS_ON_DENIAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_SET_NEXT_READ_SIZE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_SET_PROXY_INFO => 3

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_GET_CONNID => 4

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_SET_CERTIFICATE_INFO => 5

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_GET_PROPERTY => 6

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_NORMALIZE_URL => 7

    /**
     * @type {Integer (Int32)}
     */
    static SF_REQ_DISABLE_NOTIFICATIONS => 8
}
