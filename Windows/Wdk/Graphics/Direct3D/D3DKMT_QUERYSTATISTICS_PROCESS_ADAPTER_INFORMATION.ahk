#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_CLIENTHINT.ahk" { D3DKMT_CLIENTHINT }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_PROCESS_ADAPTER_INFORMATION {
    #StructPack 8

    NbSegments : UInt32

    NodeCount : UInt32

    VidPnSourceCount : UInt32

    VirtualMemoryUsage : UInt32

    DmaBuffer : IntPtr

    CommitmentData : IntPtr

    _Policy : IntPtr

    ProcessInterferenceCounters : IntPtr

    ClientHint : D3DKMT_CLIENTHINT

}
