#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_NATIVEFENCEMAPPING {
    #StructPack 8

    CurrentValueCpuVa : IntPtr

    CurrentValueGpuVa : Int64

    MonitoredValueGpuVa : Int64

}
