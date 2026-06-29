#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes the level of support for HLSL 6.0 wave operations.
 * @remarks
 * A "lane" is  single thread of execution. The shader models before version 6.0 expose only one of these at the language level, leaving expansion to parallel SIMD processing entirely up to the implementation. 
 * 
 *  
 * 
 * A "wave" is  set of lanes (threads) executed simultaneously in the processor. No explicit barriers are required to guarantee that they execute in parallel. Similar concepts include "warp" and "wavefront". 
 * 
 * 
 * This structure is used with the D3D12_FEATURE_D3D12_OPTIONS1 member of  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options1
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_D3D12_OPTIONS1 {
    #StructPack 4

    /**
     * True if the driver supports HLSL 6.0 wave operations.
     */
    WaveOps : BOOL

    /**
     * Specifies the baseline number of lanes in the SIMD wave that this implementation can support. This term is sometimes known as "wavefront size" or "warp width". Currently apps should rely only on this minimum value for sizing workloads.
     */
    WaveLaneCountMin : UInt32

    /**
     * Specifies the maximum number of lanes in the SIMD wave that this implementation can support. This capability is reserved for future expansion, and is not expected to be used by current applications.
     */
    WaveLaneCountMax : UInt32

    /**
     * Specifies the total number of SIMD lanes on the hardware.
     */
    TotalLaneCount : UInt32

    /**
     * Indicates transitions are possible  in and out of the CBV, and indirect argument states, on compute command lists. If <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-checkfeaturesupport">CheckFeatureSupport</a> succeeds this value will always be true.
     */
    ExpandedComputeResourceStates : BOOL

    /**
     * Indicates that 64bit integer operations are supported.
     */
    Int64ShaderOps : BOOL

}
