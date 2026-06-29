#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CREATEKEYEDMUTEX2 {
    #StructPack 8

    InitialValue : Int64

    hSharedHandle : UInt32

    hKeyedMutex : UInt32

    pPrivateRuntimeData : IntPtr

    PrivateRuntimeDataSize : UInt32

    Flags : IntPtr

}
