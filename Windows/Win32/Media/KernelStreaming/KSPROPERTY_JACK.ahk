#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_JACK extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_JACK_DESCRIPTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_JACK_DESCRIPTION2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_JACK_SINK_INFO => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_JACK_CONTAINERID => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_JACK_DESCRIPTION3 => 5
}
