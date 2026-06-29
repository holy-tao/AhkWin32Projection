#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CREATEKEYEDMUTEX {
    #StructPack 8

    InitialValue : Int64

    hSharedHandle : UInt32

    hKeyedMutex : UInt32

}
