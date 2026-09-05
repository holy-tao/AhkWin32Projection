#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_HRTF3D extends Win32Enum {

    /**
     * Native name: KSPROPERTY_HRTF3D_PARAMS
     * @type {Integer (Int32)}
     */
    static PARAMS => 0

    /**
     * Native name: KSPROPERTY_HRTF3D_INITIALIZE
     * @type {Integer (Int32)}
     */
    static INITIALIZE => 1

    /**
     * Native name: KSPROPERTY_HRTF3D_FILTER_FORMAT
     * @type {Integer (Int32)}
     */
    static FILTER_FORMAT => 2
}
