#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OPENKEYEDMUTEX {
    #StructPack 4

    hSharedHandle : UInt32

    hKeyedMutex : UInt32

}
