#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class RECYCLE_INFO extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Guid}
     */
    guidCombaseProcessIdentifier {
        get {
            if(!this.HasProp("__guidCombaseProcessIdentifier"))
                this.__guidCombaseProcessIdentifier := Guid(0, this)
            return this.__guidCombaseProcessIdentifier
        }
    }

    /**
     * @type {Integer}
     */
    ProcessStartTime {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwRecycleLifetimeLimit {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwRecycleMemoryLimit {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    dwRecycleExpirationTimeout {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
