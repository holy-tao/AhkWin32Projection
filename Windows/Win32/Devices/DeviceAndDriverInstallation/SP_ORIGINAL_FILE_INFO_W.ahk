#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The SP_ORIGINAL_FILE_INFO structure receives the original INF file name and catalog file information returned by SetupQueryInfOriginalFileInformation. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The setupapi.h header defines SP_ORIGINAL_FILE_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_original_file_info_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset Unicode
 * @architecture X64, Arm64
 */
export default struct SP_ORIGINAL_FILE_INFO_W {
    #StructPack 4

    /**
     * Size of this structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Original file name of the INF file stored in array of size MAX_PATH.
     */
    OriginalInfName : WCHAR[260]

    /**
     * Catalog name of the INF file stored in array of size MAX_PATH.
     */
    OriginalCatalogName : WCHAR[260]

}
