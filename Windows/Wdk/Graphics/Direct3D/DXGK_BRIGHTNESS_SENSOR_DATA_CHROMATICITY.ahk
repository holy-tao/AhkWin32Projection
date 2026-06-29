#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_BRIGHTNESS_SENSOR_DATA_CHROMATICITY {
    #StructPack 4

    ChromaticityX : Float32

    ChromaticityY : Float32

}
