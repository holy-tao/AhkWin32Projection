#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Opaque data structure describing driver versioning for a serialized acceleration structure.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_serialized_data_driver_matching_identifier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The opaque identifier of the driver.
     * @type {Pointer<Guid>}
     */
    DriverOpaqueGUID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The opaque driver versioning data.
     * @type {Array<Byte>}
     */
    DriverOpaqueVersioningData{
        get {
            if(!this.HasProp("__DriverOpaqueVersioningDataProxyArray"))
                this.__DriverOpaqueVersioningDataProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "char")
            return this.__DriverOpaqueVersioningDataProxyArray
        }
    }
}
