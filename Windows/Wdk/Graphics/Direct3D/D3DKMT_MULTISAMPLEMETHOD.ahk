#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MULTISAMPLEMETHOD {
    #StructPack 4

    NumSamples : UInt32

    NumQualityLevels : UInt32

    Reserved : UInt32

}
