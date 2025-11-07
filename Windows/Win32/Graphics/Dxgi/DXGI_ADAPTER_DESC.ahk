#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk

/**
 * Describes an adapter (or video card) by using DXGI 1.0.
 * @remarks
 * 
 * The <b>DXGI_ADAPTER_DESC</b> structure provides a description of an adapter.  This structure is initialized by using the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter-getdesc">IDXGIAdapter::GetDesc</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/ns-dxgi-dxgi_adapter_desc
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_ADAPTER_DESC extends Win32Struct
{
    static sizeof => 304

    static packingSize => 8

    /**
     * Type: <b>WCHAR[128]</b>
     * 
     * A string that contains the adapter description. On <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9 graphics hardware, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter-getdesc">GetDesc</a> returns “Software Adapter” for the description string.
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 0, 127, "UTF-16")
        set => StrPut(value, this.ptr + 0, 127, "UTF-16")
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The PCI ID of the hardware vendor. On <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9 graphics hardware, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter-getdesc">GetDesc</a> returns zeros for the PCI ID of the hardware vendor.
     * @type {Integer}
     */
    VendorId {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The PCI ID of the hardware device. On <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9 graphics hardware, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter-getdesc">GetDesc</a> returns zeros for the PCI ID of the hardware device.
     * @type {Integer}
     */
    DeviceId {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The PCI ID of the sub system. On <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9 graphics hardware, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter-getdesc">GetDesc</a> returns zeros for the PCI ID of the sub system.
     * @type {Integer}
     */
    SubSysId {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The PCI ID of the revision number of the adapter. On <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 9 graphics hardware, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter-getdesc">GetDesc</a> returns zeros for the PCI ID of the revision number of the adapter.
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The number of bytes of dedicated video memory that are not shared with the CPU.
     * @type {Pointer}
     */
    DedicatedVideoMemory {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The number of bytes of dedicated system memory that are not shared with the CPU. This memory is allocated from available system memory at boot time.
     * @type {Pointer}
     */
    DedicatedSystemMemory {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The number of bytes of shared system memory. This is the maximum value of system memory that may be consumed by the adapter during operation. Any incidental memory consumed by the driver as it manages and uses video memory is additional.
     * @type {Pointer}
     */
    SharedSystemMemory {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549708(v=vs.85)">LUID</a></b>
     * 
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
}
