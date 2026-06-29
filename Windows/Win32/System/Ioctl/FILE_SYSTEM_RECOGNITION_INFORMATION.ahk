#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains file system recognition information retrieved by the FSCTL_QUERY_FILE_SYSTEM_RECOGNITION control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_system_recognition_information
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_SYSTEM_RECOGNITION_INFORMATION {
    #StructPack 2

    /**
     * The file system name stored on the disk. This is a null-terminated string of 8 ASCII characters that represents the nonlocalizable human-readable name of the 
     *     file system the volume is formatted with.
     */
    FileSystem : CHAR[9]

}
