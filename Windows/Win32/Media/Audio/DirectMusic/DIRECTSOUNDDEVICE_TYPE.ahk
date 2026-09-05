#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
class DIRECTSOUNDDEVICE_TYPE extends Win32Enum {

    /**
     * Native name: DIRECTSOUNDDEVICE_TYPE_EMULATED
     * @type {Integer (Int32)}
     */
    static EMULATED => 0

    /**
     * Native name: DIRECTSOUNDDEVICE_TYPE_VXD
     * @type {Integer (Int32)}
     */
    static VXD => 1

    /**
     * Native name: DIRECTSOUNDDEVICE_TYPE_WDM
     * @type {Integer (Int32)}
     */
    static WDM => 2
}
