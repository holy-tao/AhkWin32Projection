#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Security\PSID.ahk
#Include ..\..\Security\SECURITY_CAPABILITIES.ahk
#Include ..\..\Security\SID_AND_ATTRIBUTES.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class SECURITY_CONTAINMENT_CONFIGURATION extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This bitfield backs the following members:
     * - UseDefaultIntegrityLevel
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    UseDefaultIntegrityLevel {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {HANDLE}
     */
    ExistingTokenHandle {
        get {
            if(!this.HasProp("__ExistingTokenHandle"))
                this.__ExistingTokenHandle := HANDLE(8, this)
            return this.__ExistingTokenHandle
        }
    }

    /**
     * @type {SECURITY_CAPABILITIES}
     */
    SecurityCapabilities {
        get {
            if(!this.HasProp("__SecurityCapabilities"))
                this.__SecurityCapabilities := SECURITY_CAPABILITIES(16, this)
            return this.__SecurityCapabilities
        }
    }

    /**
     * @type {Integer}
     */
    AppContainerIntegrityLevel {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
