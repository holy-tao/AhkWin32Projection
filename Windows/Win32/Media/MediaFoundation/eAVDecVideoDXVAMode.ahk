#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVDecVideoDXVAMode extends Win32Enum {

    /**
     * Native name: eAVDecVideoDXVAMode_NOTPLAYING
     * @type {Integer (Int32)}
     */
    static NOTPLAYING => 0

    /**
     * Native name: eAVDecVideoDXVAMode_SW
     * @type {Integer (Int32)}
     */
    static SW => 1

    /**
     * Native name: eAVDecVideoDXVAMode_MC
     * @type {Integer (Int32)}
     */
    static MC => 2

    /**
     * Native name: eAVDecVideoDXVAMode_IDCT
     * @type {Integer (Int32)}
     */
    static IDCT => 3

    /**
     * Native name: eAVDecVideoDXVAMode_VLD
     * @type {Integer (Int32)}
     */
    static VLD => 4
}
