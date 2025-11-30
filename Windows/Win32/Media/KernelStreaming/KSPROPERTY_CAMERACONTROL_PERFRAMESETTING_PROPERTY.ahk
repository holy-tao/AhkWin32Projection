#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_CAMERACONTROL_PERFRAMESETTING_PROPERTY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_PERFRAMESETTING_CAPABILITY => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_PERFRAMESETTING_SET => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_PERFRAMESETTING_CLEAR => 2
}
