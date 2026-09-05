#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_JACK extends Win32Enum {

    /**
     * Native name: KSPROPERTY_JACK_DESCRIPTION
     * @type {Integer (Int32)}
     */
    static DESCRIPTION => 1

    /**
     * Native name: KSPROPERTY_JACK_DESCRIPTION2
     * @type {Integer (Int32)}
     */
    static DESCRIPTION2 => 2

    /**
     * Native name: KSPROPERTY_JACK_SINK_INFO
     * @type {Integer (Int32)}
     */
    static SINK_INFO => 3

    /**
     * Native name: KSPROPERTY_JACK_CONTAINERID
     * @type {Integer (Int32)}
     */
    static CONTAINERID => 4

    /**
     * Native name: KSPROPERTY_JACK_DESCRIPTION3
     * @type {Integer (Int32)}
     */
    static DESCRIPTION3 => 5
}
