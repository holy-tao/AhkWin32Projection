#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class DIRECTSOUNDDEVICE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DIRECTSOUNDDEVICE_TYPE_EMULATED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DIRECTSOUNDDEVICE_TYPE_VXD => 1

    /**
     * @type {Integer (Int32)}
     */
    static DIRECTSOUNDDEVICE_TYPE_WDM => 2
}
