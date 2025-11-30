#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_MAX_PAYLOAD_SIZE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MaxPayload128Bytes => 0

    /**
     * @type {Integer (Int32)}
     */
    static MaxPayload256Bytes => 1

    /**
     * @type {Integer (Int32)}
     */
    static MaxPayload512Bytes => 2

    /**
     * @type {Integer (Int32)}
     */
    static MaxPayload1024Bytes => 3

    /**
     * @type {Integer (Int32)}
     */
    static MaxPayload2048Bytes => 4

    /**
     * @type {Integer (Int32)}
     */
    static MaxPayload4096Bytes => 5
}
