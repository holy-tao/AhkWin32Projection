#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OUTPUTDUPL_SNAPSHOT {
    #StructPack 8

    Size : UInt32

    SessionProcessCount : UInt32

    SessionActiveConnectionsCount : UInt32

    NumVidPnSources : UInt32

    NumOutputDuplContexts : UInt32

    Padding : UInt32

    OutputDuplDebugInfos : IntPtr[1]

}
