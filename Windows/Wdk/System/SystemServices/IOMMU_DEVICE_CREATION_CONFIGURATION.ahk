#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IOMMU_DEVICE_CREATION_CONFIGURATION_TYPE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IOMMU_DEVICE_CREATION_CONFIGURATION extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    NextConfiguration {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {IOMMU_DEVICE_CREATION_CONFIGURATION_TYPE}
     */
    ConfigType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    Acpi {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    DeviceId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
