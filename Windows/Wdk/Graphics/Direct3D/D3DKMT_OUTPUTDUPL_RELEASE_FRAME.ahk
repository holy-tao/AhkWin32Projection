#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OUTPUTDUPL_RELEASE_FRAME {
    #StructPack 4

    hAdapter : UInt32

    VidPnSourceId : UInt32

    NextKeyMutexIdx : UInt32

}
