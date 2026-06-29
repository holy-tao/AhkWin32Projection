#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_GPUCLOCKDATA {
    #StructPack 8

    GpuFrequency : Int64

    GpuClockCounter : Int64

    CpuClockCounter : Int64

    Flags : IntPtr

}
