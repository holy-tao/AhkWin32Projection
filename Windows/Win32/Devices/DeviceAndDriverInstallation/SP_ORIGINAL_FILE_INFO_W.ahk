#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SP_ORIGINAL_FILE_INFO structure receives the original INF file name and catalog file information returned by SetupQueryInfOriginalFileInformation. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The setupapi.h header defines SP_ORIGINAL_FILE_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_original_file_info_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class SP_ORIGINAL_FILE_INFO_W extends Win32Struct
{
    static sizeof => 1044

    static packingSize => 4

    /**
     * Size of this structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Original file name of the INF file stored in array of size MAX_PATH.
     * @type {String}
     */
    OriginalInfName {
        get => StrGet(this.ptr + 4, 259, "UTF-16")
        set => StrPut(value, this.ptr + 4, 259, "UTF-16")
    }

    /**
     * Catalog name of the INF file stored in array of size MAX_PATH.
     * @type {String}
     */
    OriginalCatalogName {
        get => StrGet(this.ptr + 524, 259, "UTF-16")
        set => StrPut(value, this.ptr + 524, 259, "UTF-16")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 1044
    }
}
