#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_UPDATEINFO_LEGACY extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Guid}
     */
    ProductID {
        get {
            if(!this.HasProp("__ProductID"))
                this.__ProductID := Guid(0, this)
            return this.__ProductID
        }
    }

    /**
     * @type {BSTR}
     */
    PackagePath {
        get {
            if(!this.HasProp("__PackagePath"))
                this.__PackagePath := BSTR(16, this)
            return this.__PackagePath
        }
    }

    /**
     * @type {Guid}
     */
    InstanceID {
        get {
            if(!this.HasProp("__InstanceID"))
                this.__InstanceID := Guid(24, this)
            return this.__InstanceID
        }
    }

    /**
     * @type {Pointer<Integer>}
     */
    pbLicense {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    cbLicense {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {BSTR}
     */
    MarketplaceAppVersion {
        get {
            if(!this.HasProp("__MarketplaceAppVersion"))
                this.__MarketplaceAppVersion := BSTR(56, this)
            return this.__MarketplaceAppVersion
        }
    }
}
