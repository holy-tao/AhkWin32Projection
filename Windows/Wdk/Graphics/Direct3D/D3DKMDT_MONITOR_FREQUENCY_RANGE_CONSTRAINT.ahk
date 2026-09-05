#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_MONITOR_FREQUENCY_RANGE_CONSTRAINT extends Win32Enum {

    /**
     * Native name: D3DKMDT_MFRC_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static MFRC_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_MFRC_ACTIVESIZE
     * @type {Integer (Int32)}
     */
    static MFRC_ACTIVESIZE => 1

    /**
     * Native name: D3DKMDT_MFRC_MAXPIXELRATE
     * @type {Integer (Int32)}
     */
    static MFRC_MAXPIXELRATE => 2
}
