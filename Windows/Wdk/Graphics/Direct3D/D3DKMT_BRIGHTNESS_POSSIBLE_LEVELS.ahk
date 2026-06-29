#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_BRIGHTNESS_POSSIBLE_LEVELS {
    #StructPack 1

    LevelCount : Int8

    BrightnessLevels : Int8[256]

}
