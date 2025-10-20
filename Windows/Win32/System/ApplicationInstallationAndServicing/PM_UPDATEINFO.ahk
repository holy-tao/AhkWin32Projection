#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_UPDATEINFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    ProductID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {BSTR}
     */
    PackagePath{
        get {
            if(!this.HasProp("__PackagePath"))
                this.__PackagePath := BSTR(8, this)
            return this.__PackagePath
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    InstanceID {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pbLicense {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    cbLicense {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {BSTR}
     */
    MarketplaceAppVersion{
        get {
            if(!this.HasProp("__MarketplaceAppVersion"))
                this.__MarketplaceAppVersion := BSTR(40, this)
            return this.__MarketplaceAppVersion
        }
    }

    /**
     * @type {Integer}
     */
    DeploymentOptions {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
