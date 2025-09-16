#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FILEPATHS structure stores source and target path information. The setup functions send the FILEPATHS structure as a parameter in several of the notifications sent to callback routines. For more information, see Notifications. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The setupapi.h header defines FILEPATHS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-filepaths_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class FILEPATHS_W extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Path to the target file.
     * @type {Pointer<PWSTR>}
     */
    Target {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Path to the source file. This member is not used when the 
     * <b>FILEPATHS</b> structure is used with a file delete operation.
     * @type {Pointer<PWSTR>}
     */
    Source {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * If an error occurs, this member is the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>. If no error has occurred, it is  NO_ERROR.
     * @type {Integer}
     */
    Win32Error {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Additional information that depends on the notification sent with the 
     * <b>FILEPATHS</b> structure. 
     * 
     * 
     * 
     * 
     * For
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
