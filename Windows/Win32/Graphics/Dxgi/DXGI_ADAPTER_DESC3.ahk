#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk

/**
 * Describes an adapter (or video card) that uses Microsoft DirectX Graphics Infrastructure (DXGI) 1.6.
 * @remarks
 * 
 * The <b>DXGI_ADAPTER_DESC3</b> structure provides a DXGI 1.6 description of an adapter.  This structure is initialized by using the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_6/nf-dxgi1_6-idxgiadapter4-getdesc3">IDXGIAdapter4::GetDesc3</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_6/ns-dxgi1_6-dxgi_adapter_desc3
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_ADAPTER_DESC3 extends Win32Struct
{
    static sizeof => 320

    static packingSize => 8

    /**
     * A string that contains the adapter description.
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 0, 127, "UTF-16")
        set => StrPut(value, this.ptr + 0, 127, "UTF-16")
    }

    /**
     * The PCI ID of the hardware vendor.
     * @type {Integer}
     */
    VendorId {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * The PCI ID of the hardware device.
     * @type {Integer}
     */
    DeviceId {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }

    /**
     * The PCI ID of the sub system.
     * @type {Integer}
     */
    SubSysId {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * The PCI ID of the revision number of the adapter.
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * The number of bytes of dedicated video memory that are not shared with the CPU.
     * @type {Pointer}
     */
    DedicatedVideoMemory {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * The number of bytes of dedicated system memory that are not shared with the CPU. This memory is allocated from available system memory at boot time.
     * @type {Pointer}
     */
    DedicatedSystemMemory {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * The number of bytes of shared system memory. This is the maximum value of system memory that may be consumed by the adapter during operation. Any incidental memory consumed by the driver as it manages and uses video memory is additional.
     * @type {Pointer}
     */
    SharedSystemMemory {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * A unique value that identifies the adapter. See <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549708(v=vs.85)">LUID</a> for a definition of the structure. <b>LUID</b> is defined in dxgi.h.
     * @type {LUID}
     */
    AdapterLuid{
        get {
            if(!this.HasProp("__AdapterLuid"))
                this.__AdapterLuid := LUID(296, this)
            return this.__AdapterLuid
        }
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_6/ne-dxgi1_6-dxgi_adapter_flag3">DXGI_ADAPTER_FLAG3</a> enumeration that describes the adapter type.  The <b>DXGI_ADAPTER_FLAG_REMOTE</b> flag is reserved.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 304, "int")
        set => NumPut("int", value, this, 304)
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_graphics_preemption_granularity">DXGI_GRAPHICS_PREEMPTION_GRANULARITY</a> enumerated type that describes the granularity level at which the GPU can be preempted from performing its current graphics rendering task.
     * @type {Integer}
     */
    GraphicsPreemptionGranularity {
        get => NumGet(this, 308, "int")
        set => NumPut("int", value, this, 308)
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_compute_preemption_granularity">DXGI_COMPUTE_PREEMPTION_GRANULARITY</a> enumerated type that describes the granularity level at which the GPU can be preempted from performing its current compute task.
     * @type {Integer}
     */
    ComputePreemptionGranularity {
        get => NumGet(this, 312, "int")
        set => NumPut("int", value, this, 312)
    }
}
