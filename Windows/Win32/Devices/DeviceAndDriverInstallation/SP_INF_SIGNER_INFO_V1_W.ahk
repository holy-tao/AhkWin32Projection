#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_inf_signer_info_v1_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class SP_INF_SIGNER_INFO_V1_W extends Win32Struct
{
    static sizeof => 1564

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
        get => StrGet(this.ptr + 4, 259, "UTF-16")
        set => StrPut(value, this.ptr + 4, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    DigitalSigner {
        get => StrGet(this.ptr + 524, 259, "UTF-16")
        set => StrPut(value, this.ptr + 524, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    DigitalSignerVersion {
        get => StrGet(this.ptr + 1044, 259, "UTF-16")
        set => StrPut(value, this.ptr + 1044, 259, "UTF-16")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 1564
    }
}
