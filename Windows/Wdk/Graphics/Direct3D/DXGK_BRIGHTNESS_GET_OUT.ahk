#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_BRIGHTNESS_GET_OUT {
    #StructPack 4

    CurrentBrightnessMillinits : UInt32

    TargetBrightnessMillinits : UInt32

}
