#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_MULTISAMPLINGMETHOD {
    #StructPack 4

    NumSamples : UInt32

    NumQualityLevels : UInt32

}
