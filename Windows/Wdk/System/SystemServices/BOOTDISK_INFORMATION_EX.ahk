#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class BOOTDISK_INFORMATION_EX extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    BootPartitionOffset {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SystemPartitionOffset {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    BootDeviceSignature {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    SystemDeviceSignature {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Guid}
     */
    BootDeviceGuid {
        get {
            if(!this.HasProp("__BootDeviceGuid"))
                this.__BootDeviceGuid := Guid(24, this)
            return this.__BootDeviceGuid
        }
    }

    /**
     * @type {Guid}
     */
    SystemDeviceGuid {
        get {
            if(!this.HasProp("__SystemDeviceGuid"))
                this.__SystemDeviceGuid := Guid(40, this)
            return this.__SystemDeviceGuid
        }
    }

    /**
     * @type {BOOLEAN}
     */
    BootDeviceIsGpt {
        get => NumGet(this, 56, "char")
        set => NumPut("char", value, this, 56)
    }

    /**
     * @type {BOOLEAN}
     */
    SystemDeviceIsGpt {
        get => NumGet(this, 57, "char")
        set => NumPut("char", value, this, 57)
    }
}
