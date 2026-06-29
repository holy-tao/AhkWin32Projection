#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The FILEPATHS_SINGNERINFO structure stores source and target path information, and also file signature information. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The setupapi.h header defines FILEPATHS_SIGNERINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-filepaths_signerinfo_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset ANSI
 * @architecture X64, Arm64
 */
export default struct FILEPATHS_SIGNERINFO_A {
    #StructPack 8

    /**
     * Path to the target file.
     */
    Target : PSTR

    /**
     * Path to the source file. This member is not used when the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-filepaths_a">FILEPATHS</a> structure is used with a file delete operation.
     */
    Source : PSTR

    /**
     * If an error occurs, this member is the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>. If no error has occurred, it is  NO_ERROR.
     */
    Win32Error : UInt32

    /**
     * Additional information that depends on the notification sent with the 
     * <b>FILEPATHS_SIGNERINFO</b> structure. 
     * 
     * 
     * 
     * 
     * For
     */
    Flags : UInt32

    /**
     * Digital signer of the file.
     */
    DigitalSigner : PSTR

    /**
     * Version of the file.
     */
    Version : PSTR

    /**
     * Catalog file.
     */
    CatalogFile : PSTR

}
