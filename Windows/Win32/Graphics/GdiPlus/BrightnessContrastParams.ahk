#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct BrightnessContrastParams {
    #StructPack 4

    brightnessLevel : Int32

    contrastLevel : Int32

}
