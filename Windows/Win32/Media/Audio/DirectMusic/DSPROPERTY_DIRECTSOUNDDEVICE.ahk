#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
class DSPROPERTY_DIRECTSOUNDDEVICE extends Win32Enum {

    /**
     * Native name: DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_A
     * @type {Integer (Int32)}
     */
    static WAVEDEVICEMAPPING_A => 1

    /**
     * Native name: DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1
     * @type {Integer (Int32)}
     */
    static DESCRIPTION_1 => 2

    /**
     * Native name: DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_1
     * @type {Integer (Int32)}
     */
    static ENUMERATE_1 => 3

    /**
     * Native name: DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_W
     * @type {Integer (Int32)}
     */
    static WAVEDEVICEMAPPING_W => 4

    /**
     * Native name: DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_A
     * @type {Integer (Int32)}
     */
    static DESCRIPTION_A => 5

    /**
     * Native name: DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W
     * @type {Integer (Int32)}
     */
    static DESCRIPTION_W => 6

    /**
     * Native name: DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_A
     * @type {Integer (Int32)}
     */
    static ENUMERATE_A => 7

    /**
     * Native name: DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_W
     * @type {Integer (Int32)}
     */
    static ENUMERATE_W => 8
}
