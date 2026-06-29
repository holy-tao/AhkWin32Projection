#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_COLOR_COEFF_DYNAMIC_RANGES {
    #StructPack 4

    FirstChannel : UInt32

    SecondChannel : UInt32

    ThirdChannel : UInt32

    FourthChannel : UInt32

}
