#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_HRTF3D extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_HRTF3D_PARAMS => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_HRTF3D_INITIALIZE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_HRTF3D_FILTER_FORMAT => 2
}
