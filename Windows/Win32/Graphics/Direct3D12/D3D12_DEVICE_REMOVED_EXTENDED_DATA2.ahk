#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_DRED_PAGE_FAULT_OUTPUT1.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DEVICE_REMOVED_EXTENDED_DATA2 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    DeviceRemovedReason {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT1>}
     */
    AutoBreadcrumbsOutput {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {D3D12_DRED_PAGE_FAULT_OUTPUT1}
     */
    PageFaultOutput{
        get {
            if(!this.HasProp("__PageFaultOutput"))
                this.__PageFaultOutput := D3D12_DRED_PAGE_FAULT_OUTPUT1(this.ptr + 16)
            return this.__PageFaultOutput
        }
    }
}
