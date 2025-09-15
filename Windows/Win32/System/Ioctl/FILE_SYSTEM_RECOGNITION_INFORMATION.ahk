#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains file system recognition information retrieved by the FSCTL_QUERY_FILE_SYSTEM_RECOGNITION control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_system_recognition_information
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_SYSTEM_RECOGNITION_INFORMATION extends Win32Struct
{
    static sizeof => 18

    static packingSize => 2

    /**
     * The file system name stored on the disk. This is a null-terminated string of 8 ASCII characters that represents the nonlocalizable human-readable name of the 
     *     file system the volume is formatted with.
     * @type {String}
     */
    FileSystem {
        get => StrGet(this.ptr + 0, 8, "UTF-16")
        set => StrPut(value, this.ptr + 0, 8, "UTF-16")
    }
}
