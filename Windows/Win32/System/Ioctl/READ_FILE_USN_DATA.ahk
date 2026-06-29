#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the versions of the update sequence number (USN) change journal supported by the application.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-read_file_usn_data
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct READ_FILE_USN_DATA {
    #StructPack 2

    /**
     * The lowest version of the USN change journal accepted by the application. If the input buffer is not 
     *       specified this defaults to 2.
     */
    MinMajorVersion : UInt16

    /**
     * The highest version of the USN change journal accepted by the application. If the input buffer is not 
     *       specified this defaults to 2. To support 128-bit file identifiers used by ReFS this must be 3 or higher.
     */
    MaxMajorVersion : UInt16

}
