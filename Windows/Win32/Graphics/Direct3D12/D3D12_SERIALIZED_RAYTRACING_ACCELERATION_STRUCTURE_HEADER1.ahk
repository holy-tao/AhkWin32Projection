#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_SERIALIZED_RAYTRACING_ACCELERATION_STRUCTURE_HEADER_POSTAMBLE_TYPE.ahk
#Include .\D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_SERIALIZED_RAYTRACING_ACCELERATION_STRUCTURE_HEADER1 extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER}
     */
    DriverMatchingIdentifier {
        get {
            if(!this.HasProp("__DriverMatchingIdentifier"))
                this.__DriverMatchingIdentifier := D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER(0, this)
            return this.__DriverMatchingIdentifier
        }
    }

    /**
     * @type {Integer}
     */
    SerializedSizeInBytesIncludingHeader {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    DeserializedSizeInBytes {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    NumBottomLevelAccelerationStructurePointersAfterHeader {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    NumBlocks {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {D3D12_SERIALIZED_RAYTRACING_ACCELERATION_STRUCTURE_HEADER_POSTAMBLE_TYPE}
     */
    HeaderPostambleType {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }
}
