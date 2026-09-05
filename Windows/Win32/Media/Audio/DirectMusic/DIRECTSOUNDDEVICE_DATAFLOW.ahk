#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
class DIRECTSOUNDDEVICE_DATAFLOW extends Win32Enum {

    /**
     * Native name: DIRECTSOUNDDEVICE_DATAFLOW_RENDER
     * @type {Integer (Int32)}
     */
    static RENDER => 0

    /**
     * Native name: DIRECTSOUNDDEVICE_DATAFLOW_CAPTURE
     * @type {Integer (Int32)}
     */
    static CAPTURE => 1
}
