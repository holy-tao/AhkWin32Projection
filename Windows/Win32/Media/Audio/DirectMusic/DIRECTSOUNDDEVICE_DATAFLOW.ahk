#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class DIRECTSOUNDDEVICE_DATAFLOW extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DIRECTSOUNDDEVICE_DATAFLOW_RENDER => 0

    /**
     * @type {Integer (Int32)}
     */
    static DIRECTSOUNDDEVICE_DATAFLOW_CAPTURE => 1
}
