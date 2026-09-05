#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_WAVE extends Win32Enum {

    /**
     * Native name: KSPROPERTY_WAVE_COMPATIBLE_CAPABILITIES
     * @type {Integer (Int32)}
     */
    static COMPATIBLE_CAPABILITIES => 0

    /**
     * Native name: KSPROPERTY_WAVE_INPUT_CAPABILITIES
     * @type {Integer (Int32)}
     */
    static INPUT_CAPABILITIES => 1

    /**
     * Native name: KSPROPERTY_WAVE_OUTPUT_CAPABILITIES
     * @type {Integer (Int32)}
     */
    static OUTPUT_CAPABILITIES => 2

    /**
     * Native name: KSPROPERTY_WAVE_BUFFER
     * @type {Integer (Int32)}
     */
    static BUFFER => 3

    /**
     * Native name: KSPROPERTY_WAVE_FREQUENCY
     * @type {Integer (Int32)}
     */
    static FREQUENCY => 4

    /**
     * Native name: KSPROPERTY_WAVE_VOLUME
     * @type {Integer (Int32)}
     */
    static VOLUME => 5

    /**
     * Native name: KSPROPERTY_WAVE_PAN
     * @type {Integer (Int32)}
     */
    static PAN => 6
}
