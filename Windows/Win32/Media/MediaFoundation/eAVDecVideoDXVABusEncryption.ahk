#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVDecVideoDXVABusEncryption extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoDXVABusEncryption_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoDXVABusEncryption_PRIVATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoDXVABusEncryption_AES => 2
}
