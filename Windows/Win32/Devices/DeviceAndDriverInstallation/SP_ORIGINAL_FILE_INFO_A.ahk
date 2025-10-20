#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_original_file_info_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_ORIGINAL_FILE_INFO_A extends Win32Struct
{
    static sizeof => 524

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
    OriginalInfName {
        get => StrGet(this.ptr + 4, 259, "UTF-8")
        set => StrPut(value, this.ptr + 4, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    OriginalCatalogName {
        get => StrGet(this.ptr + 264, 259, "UTF-8")
        set => StrPut(value, this.ptr + 264, 259, "UTF-8")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 524
    }
}
