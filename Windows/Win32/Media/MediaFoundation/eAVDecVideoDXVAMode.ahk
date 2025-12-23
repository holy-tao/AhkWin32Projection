#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVDecVideoDXVAMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoDXVAMode_NOTPLAYING => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoDXVAMode_SW => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoDXVAMode_MC => 2

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoDXVAMode_IDCT => 3

    /**
     * @type {Integer (Int32)}
     */
    static eAVDecVideoDXVAMode_VLD => 4
}
