#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WINBIO_REGISTERED_FORMAT.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
class WINBIO_CAPTURE_PARAMETERS extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {Integer}
     */
    PayloadSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Purpose {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {WINBIO_REGISTERED_FORMAT}
     */
    Format {
        get {
            if(!this.HasProp("__Format"))
                this.__Format := WINBIO_REGISTERED_FORMAT(6, this)
            return this.__Format
        }
    }

    /**
     * @type {Guid}
     */
    VendorFormat {
        get {
            if(!this.HasProp("__VendorFormat"))
                this.__VendorFormat := Guid(12, this)
            return this.__VendorFormat
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }
}
