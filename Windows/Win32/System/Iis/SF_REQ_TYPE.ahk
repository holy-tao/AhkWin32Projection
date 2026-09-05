#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Iis
 */
class SF_REQ_TYPE extends Win32Enum {

    /**
     * Native name: SF_REQ_SEND_RESPONSE_HEADER
     * @type {Integer (Int32)}
     */
    static SEND_RESPONSE_HEADER => 0

    /**
     * Native name: SF_REQ_ADD_HEADERS_ON_DENIAL
     * @type {Integer (Int32)}
     */
    static ADD_HEADERS_ON_DENIAL => 1

    /**
     * Native name: SF_REQ_SET_NEXT_READ_SIZE
     * @type {Integer (Int32)}
     */
    static SET_NEXT_READ_SIZE => 2

    /**
     * Native name: SF_REQ_SET_PROXY_INFO
     * @type {Integer (Int32)}
     */
    static SET_PROXY_INFO => 3

    /**
     * Native name: SF_REQ_GET_CONNID
     * @type {Integer (Int32)}
     */
    static GET_CONNID => 4

    /**
     * Native name: SF_REQ_SET_CERTIFICATE_INFO
     * @type {Integer (Int32)}
     */
    static SET_CERTIFICATE_INFO => 5

    /**
     * Native name: SF_REQ_GET_PROPERTY
     * @type {Integer (Int32)}
     */
    static GET_PROPERTY => 6

    /**
     * Native name: SF_REQ_NORMALIZE_URL
     * @type {Integer (Int32)}
     */
    static NORMALIZE_URL => 7

    /**
     * Native name: SF_REQ_DISABLE_NOTIFICATIONS
     * @type {Integer (Int32)}
     */
    static DISABLE_NOTIFICATIONS => 8
}
