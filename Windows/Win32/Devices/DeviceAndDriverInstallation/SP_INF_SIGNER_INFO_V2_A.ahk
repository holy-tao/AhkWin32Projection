#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_INF_SIGNER_INFO_V2_A extends Win32Struct
{
    static sizeof => 788

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    CatalogFile {
        get => StrGet(this.ptr + 4, 259, "UTF-8")
        set => StrPut(value, this.ptr + 4, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    DigitalSigner {
        get => StrGet(this.ptr + 264, 259, "UTF-8")
        set => StrPut(value, this.ptr + 264, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    DigitalSignerVersion {
        get => StrGet(this.ptr + 524, 259, "UTF-8")
        set => StrPut(value, this.ptr + 524, 259, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    SignerScore {
        get => NumGet(this, 784, "uint")
        set => NumPut("uint", value, this, 784)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 788
    }
}
