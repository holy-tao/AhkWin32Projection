#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class COLORSPACE_TRANSFORM_STAGE_CONTROL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ColorSpaceTransformStageControl_No_Change => 0

    /**
     * @type {Integer (Int32)}
     */
    static ColorSpaceTransformStageControl_Enable => 1

    /**
     * @type {Integer (Int32)}
     */
    static ColorSpaceTransformStageControl_Bypass => 2
}
