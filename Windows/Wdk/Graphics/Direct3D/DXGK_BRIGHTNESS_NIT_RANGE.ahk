#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_BRIGHTNESS_NIT_RANGE {
    #StructPack 4

    MinimumLevelMillinit : UInt32

    MaximumLevelMillinit : UInt32

    StepSizeMillinit : UInt32

}
