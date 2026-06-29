#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The FILEPATHS structure stores source and target path information. The setup functions send the FILEPATHS structure as a parameter in several of the notifications sent to callback routines. For more information, see Notifications. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The setupapi.h header defines FILEPATHS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-filepaths_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset Unicode
 * @architecture X64, Arm64
 */
export default struct FILEPATHS_W {
    #StructPack 8

    /**
     * Path to the target file.
     */
    Target : PWSTR

    /**
     * Path to the source file. This member is not used when the 
     * <b>FILEPATHS</b> structure is used with a file delete operation.
     */
    Source : PWSTR

    /**
     * If an error occurs, this member is the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>. If no error has occurred, it is  NO_ERROR.
     */
    Win32Error : UInt32

    /**
     * Additional information that depends on the notification sent with the 
     * <b>FILEPATHS</b> structure. 
     * 
     * 
     * 
     * 
     * For
     */
    Flags : UInt32

}
