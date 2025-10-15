#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class FILEPATHS_SIGNERINFO_W extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    Target{
        get {
            if(!this.HasProp("__Target"))
                this.__Target := PWSTR(this.ptr + 0)
            return this.__Target
        }
    }

    /**
     * @type {PWSTR}
     */
    Source{
        get {
            if(!this.HasProp("__Source"))
                this.__Source := PWSTR(this.ptr + 8)
            return this.__Source
        }
    }

    /**
     * @type {Integer}
     */
    Win32Error {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {PWSTR}
     */
    DigitalSigner{
        get {
            if(!this.HasProp("__DigitalSigner"))
                this.__DigitalSigner := PWSTR(this.ptr + 24)
            return this.__DigitalSigner
        }
    }

    /**
     * @type {PWSTR}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := PWSTR(this.ptr + 32)
            return this.__Version
        }
    }

    /**
     * @type {PWSTR}
     */
    CatalogFile{
        get {
            if(!this.HasProp("__CatalogFile"))
                this.__CatalogFile := PWSTR(this.ptr + 40)
            return this.__CatalogFile
        }
    }
}
