#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_FREEGPUVIRTUALADDRESS {
    #StructPack 8

    hAdapter : UInt32

    BaseAddress : Int64

    Size : Int64

}
