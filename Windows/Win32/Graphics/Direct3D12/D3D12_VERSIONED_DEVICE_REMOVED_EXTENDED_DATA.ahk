#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_DEVICE_REMOVED_EXTENDED_DATA.ahk
#Include .\D3D12_DRED_PAGE_FAULT_OUTPUT.ahk
#Include .\D3D12_DEVICE_REMOVED_EXTENDED_DATA1.ahk
#Include .\D3D12_DRED_PAGE_FAULT_OUTPUT1.ahk
#Include .\D3D12_DEVICE_REMOVED_EXTENDED_DATA2.ahk
#Include .\D3D12_DRED_PAGE_FAULT_OUTPUT2.ahk
#Include .\D3D12_DEVICE_REMOVED_EXTENDED_DATA3.ahk

/**
 * Represents versioned Device Removed Extended Data (DRED) data.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_versioned_device_removed_extended_data
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_VERSIONED_DEVICE_REMOVED_EXTENDED_DATA extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A [D3D12_DRED_VERSION](ne-d3d12-d3d12_dred_version.md) value, specifying a DRED version. This value determines which inner data member (of the union) is active.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_DEVICE_REMOVED_EXTENDED_DATA}
     */
    Dred_1_0{
        get {
            if(!this.HasProp("__Dred_1_0"))
                this.__Dred_1_0 := D3D12_DEVICE_REMOVED_EXTENDED_DATA(this.ptr + 8)
            return this.__Dred_1_0
        }
    }

    /**
     * @type {D3D12_DEVICE_REMOVED_EXTENDED_DATA1}
     */
    Dred_1_1{
        get {
            if(!this.HasProp("__Dred_1_1"))
                this.__Dred_1_1 := D3D12_DEVICE_REMOVED_EXTENDED_DATA1(this.ptr + 8)
            return this.__Dred_1_1
        }
    }

    /**
     * @type {D3D12_DEVICE_REMOVED_EXTENDED_DATA2}
     */
    Dred_1_2{
        get {
            if(!this.HasProp("__Dred_1_2"))
                this.__Dred_1_2 := D3D12_DEVICE_REMOVED_EXTENDED_DATA2(this.ptr + 8)
            return this.__Dred_1_2
        }
    }

    /**
     * @type {D3D12_DEVICE_REMOVED_EXTENDED_DATA3}
     */
    Dred_1_3{
        get {
            if(!this.HasProp("__Dred_1_3"))
                this.__Dred_1_3 := D3D12_DEVICE_REMOVED_EXTENDED_DATA3(this.ptr + 8)
            return this.__Dred_1_3
        }
    }
}
