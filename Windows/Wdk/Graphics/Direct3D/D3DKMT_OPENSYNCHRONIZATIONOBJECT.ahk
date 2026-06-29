#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OPENSYNCHRONIZATIONOBJECT {
    #StructPack 8

    hSharedHandle : UInt32

    hSyncObject : UInt32

    Reserved : Int64[8]

}
