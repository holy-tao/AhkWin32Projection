#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IOMMU_DEVICE_CREATION_CONFIGURATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {LIST_ENTRY}
     */
    NextConfiguration{
        get {
            if(!this.HasProp("__NextConfiguration"))
                this.__NextConfiguration := LIST_ENTRY(0, this)
            return this.__NextConfiguration
        }
    }

    /**
     * @type {Integer}
     */
    ConfigType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Pointer<IOMMU_DEVICE_CREATION_CONFIGURATION_ACPI>}
     */
    Acpi {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    DeviceId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
