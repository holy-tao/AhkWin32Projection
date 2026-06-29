#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct BRIGHTNESS_NIT_RANGE {
    #StructPack 4

    MinLevelInMillinit : UInt32

    MaxLevelInMillinit : UInt32

    StepSizeInMillinit : UInt32

}
