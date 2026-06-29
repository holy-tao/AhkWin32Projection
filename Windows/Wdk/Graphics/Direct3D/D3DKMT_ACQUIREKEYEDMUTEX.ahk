#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_ACQUIREKEYEDMUTEX {
    #StructPack 8

    hKeyedMutex : UInt32

    Key : Int64

    pTimeout : IntPtr

    FenceValue : Int64

}
