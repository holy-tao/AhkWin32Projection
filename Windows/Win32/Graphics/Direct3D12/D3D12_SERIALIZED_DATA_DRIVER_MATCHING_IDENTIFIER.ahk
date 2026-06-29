#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Opaque data structure describing driver versioning for a serialized acceleration structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_serialized_data_driver_matching_identifier
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * The opaque identifier of the driver.
     * @type {Guid}
     */
    DriverOpaqueGUID {
        get {
            if(!this.HasProp("__DriverOpaqueGUID"))
                this.__DriverOpaqueGUID := Guid(0, this)
            return this.__DriverOpaqueGUID
        }
    }

    /**
     * The opaque driver versioning data.
     * @type {Array<Integer>}
     */
    DriverOpaqueVersioningData {
        get {
            if(!this.HasProp("__DriverOpaqueVersioningDataProxyArray"))
                this.__DriverOpaqueVersioningDataProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__DriverOpaqueVersioningDataProxyArray
        }
    }
}
