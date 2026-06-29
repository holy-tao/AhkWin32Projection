#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SCATTERBLTS {
    #StructPack 8

    NumBlts : UInt32

    Blts : IntPtr[12]

}
