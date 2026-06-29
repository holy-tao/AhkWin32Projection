#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXGI_ADAPTER_FLAG3.ahk" { DXGI_ADAPTER_FLAG3 }
#Import ".\DXGI_GRAPHICS_PREEMPTION_GRANULARITY.ahk" { DXGI_GRAPHICS_PREEMPTION_GRANULARITY }
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import ".\DXGI_COMPUTE_PREEMPTION_GRANULARITY.ahk" { DXGI_COMPUTE_PREEMPTION_GRANULARITY }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes an adapter (or video card) that uses Microsoft DirectX Graphics Infrastructure (DXGI) 1.6.
 * @remarks
 * The <b>DXGI_ADAPTER_DESC3</b> structure provides a DXGI 1.6 description of an adapter.  This structure is initialized by using the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_6/nf-dxgi1_6-idxgiadapter4-getdesc3">IDXGIAdapter4::GetDesc3</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/ns-dxgi1_6-dxgi_adapter_desc3
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_ADAPTER_DESC3 {
    #StructPack 8

    /**
     * A string that contains the adapter description.
     */
    Description : WCHAR[128]

    /**
     * The PCI ID of the hardware vendor.
     */
    VendorId : UInt32

    /**
     * The PCI ID of the hardware device.
     */
    DeviceId : UInt32

    /**
     * The PCI ID of the sub system.
     */
    SubSysId : UInt32

    /**
     * The PCI ID of the revision number of the adapter.
     */
    Revision : UInt32

    /**
     * The number of bytes of dedicated video memory that are not shared with the CPU.
     */
    DedicatedVideoMemory : IntPtr

    /**
     * The number of bytes of dedicated system memory that are not shared with the CPU. This memory is allocated from available system memory at boot time.
     */
    DedicatedSystemMemory : IntPtr

    /**
     * The number of bytes of shared system memory. This is the maximum value of system memory that may be consumed by the adapter during operation. Any incidental memory consumed by the driver as it manages and uses video memory is additional.
     */
    SharedSystemMemory : IntPtr

    /**
     * A unique value that identifies the adapter. See <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549708(v=vs.85)">LUID</a> for a definition of the structure. <b>LUID</b> is defined in dxgi.h.
     */
    AdapterLuid : LUID

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_6/ne-dxgi1_6-dxgi_adapter_flag3">DXGI_ADAPTER_FLAG3</a> enumeration that describes the adapter type.  The <b>DXGI_ADAPTER_FLAG_REMOTE</b> flag is reserved.
     */
    Flags : DXGI_ADAPTER_FLAG3

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_graphics_preemption_granularity">DXGI_GRAPHICS_PREEMPTION_GRANULARITY</a> enumerated type that describes the granularity level at which the GPU can be preempted from performing its current graphics rendering task.
     */
    GraphicsPreemptionGranularity : DXGI_GRAPHICS_PREEMPTION_GRANULARITY

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_compute_preemption_granularity">DXGI_COMPUTE_PREEMPTION_GRANULARITY</a> enumerated type that describes the granularity level at which the GPU can be preempted from performing its current compute task.
     */
    ComputePreemptionGranularity : DXGI_COMPUTE_PREEMPTION_GRANULARITY

}
