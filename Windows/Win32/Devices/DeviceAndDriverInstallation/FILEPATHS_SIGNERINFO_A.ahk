#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class FILEPATHS_SIGNERINFO_A extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    Target{
        get {
            if(!this.HasProp("__Target"))
                this.__Target := PSTR(this.ptr + 0)
            return this.__Target
        }
    }

    /**
     * @type {PSTR}
     */
    Source{
        get {
            if(!this.HasProp("__Source"))
                this.__Source := PSTR(this.ptr + 8)
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
     * @type {PSTR}
     */
    DigitalSigner{
        get {
            if(!this.HasProp("__DigitalSigner"))
                this.__DigitalSigner := PSTR(this.ptr + 24)
            return this.__DigitalSigner
        }
    }

    /**
     * @type {PSTR}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := PSTR(this.ptr + 32)
            return this.__Version
        }
    }

    /**
     * @type {PSTR}
     */
    CatalogFile{
        get {
            if(!this.HasProp("__CatalogFile"))
                this.__CatalogFile := PSTR(this.ptr + 40)
            return this.__CatalogFile
        }
    }
}
