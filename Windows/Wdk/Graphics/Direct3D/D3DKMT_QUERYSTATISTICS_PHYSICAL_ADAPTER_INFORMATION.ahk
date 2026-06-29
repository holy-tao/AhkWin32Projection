#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_PHYSICAL_ADAPTER_INFORMATION {
    #StructPack 8

    AdapterPerfData : IntPtr

    AdapterPerfDataCaps : IntPtr

    GpuVersion : IntPtr

}
