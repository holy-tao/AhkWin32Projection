#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT.ahk
#Include .\D3D12_DRED_PAGE_FAULT_OUTPUT.ahk

/**
 * Represents Device Removed Extended Data (DRED) version 1.1 data.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_device_removed_extended_data1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DEVICE_REMOVED_EXTENDED_DATA1 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * An [HRESULT](/windows/desktop/com/structure-of-com-error-codes) containing the reason the device was removed (matches the return value of [GetDeviceRemovedReason](/windows/desktop/api/d3d12/nf-d3d12-id3d12device-getdeviceremovedreason)). Also see [COM Error Codes (UI, Audio, DirectX, Codec)](/windows/desktop/com/com-error-codes-10).
     * @type {Integer}
     */
    DeviceRemovedReason {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A [D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT](ns-d3d12-d3d12_auto_breadcrumb_node.md) value that contains the auto-breadcrumb state prior to device removal.
     * @type {D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT}
     */
    AutoBreadcrumbsOutput{
        get {
            if(!this.HasProp("__AutoBreadcrumbsOutput"))
                this.__AutoBreadcrumbsOutput := D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT(this.ptr + 8)
            return this.__AutoBreadcrumbsOutput
        }
    }

    /**
     * A [D3D12_DRED_PAGE_FAULT_OUTPUT](ns-d3d12-d3d12_auto_breadcrumb_node.md) value that contains page fault data if device removal was the result of a GPU page fault.
     * @type {D3D12_DRED_PAGE_FAULT_OUTPUT}
     */
    PageFaultOutput{
        get {
            if(!this.HasProp("__PageFaultOutput"))
                this.__PageFaultOutput := D3D12_DRED_PAGE_FAULT_OUTPUT(this.ptr + 16)
            return this.__PageFaultOutput
        }
    }
}
