#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVDecVideoDXVABusEncryption extends Win32Enum {

    /**
     * Native name: eAVDecVideoDXVABusEncryption_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: eAVDecVideoDXVABusEncryption_PRIVATE
     * @type {Integer (Int32)}
     */
    static PRIVATE => 1

    /**
     * Native name: eAVDecVideoDXVABusEncryption_AES
     * @type {Integer (Int32)}
     */
    static AES => 2
}
