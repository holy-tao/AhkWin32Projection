#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the level of support for HLSL 6.0 wave operations.
 * @remarks
 * 
  * A "lane" is  single thread of execution. The shader models before version 6.0 expose only one of these at the language level, leaving expansion to parallel SIMD processing entirely up to the implementation. 
  * 
  *  
  * 
  * A "wave" is  set of lanes (threads) executed simultaneously in the processor. No explicit barriers are required to guarantee that they execute in parallel. Similar concepts include "warp" and "wavefront". 
  * 
  * 
  * This structure is used with the D3D12_FEATURE_D3D12_OPTIONS1 member of  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_feature_data_d3d12_options1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS1 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * True if the driver supports HLSL 6.0 wave operations.
     * @type {BOOL}
     */
    WaveOps {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the baseline number of lanes in the SIMD wave that this implementation can support. This term is sometimes known as "wavefront size" or "warp width". Currently apps should rely only on this minimum value for sizing workloads.
     * @type {Integer}
     */
    WaveLaneCountMin {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the maximum number of lanes in the SIMD wave that this implementation can support. This capability is reserved for future expansion, and is not expected to be used by current applications.
     * @type {Integer}
     */
    WaveLaneCountMax {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the total number of SIMD lanes on the hardware.
     * @type {Integer}
     */
    TotalLaneCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Indicates transitions are possible  in and out of the CBV, and indirect argument states, on compute command lists. If <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-checkfeaturesupport">CheckFeatureSupport</a> succeeds this value will always be true.
     * @type {BOOL}
     */
    ExpandedComputeResourceStates {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Indicates that 64bit integer operations are supported.
     * @type {BOOL}
     */
    Int64ShaderOps {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
