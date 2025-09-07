#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SP_ORIGINAL_FILE_INFO structure receives the original INF file name and catalog file information returned by SetupQueryInfOriginalFileInformation. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The setupapi.h header defines SP_ORIGINAL_FILE_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_original_file_info_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_ORIGINAL_FILE_INFO_A extends Win32Struct
{
    static sizeof => 524

    static packingSize => 1

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
        get => StrGet(this.ptr + 4, 259, "UTF-8")
        set => StrPut(value, this.ptr + 4, 259, "UTF-8")
    }

    /**
     * Catalog name of the INF file stored in array of size MAX_PATH.
     * @type {String}
     */
    OriginalCatalogName {
        get => StrGet(this.ptr + 264, 259, "UTF-8")
        set => StrPut(value, this.ptr + 264, 259, "UTF-8")
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 524
    }
}
