#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_EXPRESS_MAX_PAYLOAD_SIZE extends Win32Enum {

    /**
     * Native name: MaxPayload128Bytes
     * @type {Integer (Int32)}
     */
    static Payload128Bytes => 0

    /**
     * Native name: MaxPayload256Bytes
     * @type {Integer (Int32)}
     */
    static Payload256Bytes => 1

    /**
     * Native name: MaxPayload512Bytes
     * @type {Integer (Int32)}
     */
    static Payload512Bytes => 2

    /**
     * Native name: MaxPayload1024Bytes
     * @type {Integer (Int32)}
     */
    static Payload1024Bytes => 3

    /**
     * Native name: MaxPayload2048Bytes
     * @type {Integer (Int32)}
     */
    static Payload2048Bytes => 4

    /**
     * Native name: MaxPayload4096Bytes
     * @type {Integer (Int32)}
     */
    static Payload4096Bytes => 5
}
