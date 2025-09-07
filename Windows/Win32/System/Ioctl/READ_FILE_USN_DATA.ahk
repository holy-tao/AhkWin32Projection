#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the versions of the update sequence number (USN) change journal supported by the application.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-read_file_usn_data
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class READ_FILE_USN_DATA extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * The lowest version of the USN change journal accepted by the application. If the input buffer is not 
     *       specified this defaults to 2.
     * @type {Integer}
     */
    MinMajorVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The highest version of the USN change journal accepted by the application. If the input buffer is not 
     *       specified this defaults to 2. To support 128-bit file identifiers used by ReFS this must be 3 or higher.
     * @type {Integer}
     */
    MaxMajorVersion {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
