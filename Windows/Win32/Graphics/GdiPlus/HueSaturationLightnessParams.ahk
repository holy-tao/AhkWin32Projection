#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct HueSaturationLightnessParams {
    #StructPack 4

    hueLevel : Int32

    saturationLevel : Int32

    lightnessLevel : Int32

}
