#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_INSTALLINFO extends Win32Struct
{
    static sizeof => 64

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
                this.__PackagePath := BSTR(this.ptr + 8)
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
     * @type {Pointer<Byte>}
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
     * @type {BOOL}
     */
    IsUninstallDisabled{
        get {
            if(!this.HasProp("__IsUninstallDisabled"))
                this.__IsUninstallDisabled := BOOL(this.ptr + 36)
            return this.__IsUninstallDisabled
        }
    }

    /**
     * @type {Integer}
     */
    DeploymentOptions {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<Guid>}
     */
    OfferID {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {BSTR}
     */
    MarketplaceAppVersion{
        get {
            if(!this.HasProp("__MarketplaceAppVersion"))
                this.__MarketplaceAppVersion := BSTR(this.ptr + 56)
            return this.__MarketplaceAppVersion
        }
    }
}
