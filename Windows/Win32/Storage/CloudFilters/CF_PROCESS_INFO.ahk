#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about a user process.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_process_info
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_PROCESS_INFO {
    #StructPack 8

    /**
     * The size of the **CF_PROCESS_INFO** structure.
     */
    StructSize : UInt32

    /**
     * The 32 bit ID of the user process.
     */
    ProcessId : UInt32

    /**
     * The absolute path of the main executable file including the volume name in the format of NT file path. If the platform failed to retrieve the image path, `UNKNOWN` will be returned.
     */
    ImagePath : PWSTR

    /**
     * Used for modern applications. The app package name.
     */
    PackageName : PWSTR

    /**
     * Used for modern applications. The application ID.
     */
    ApplicationId : PWSTR

    /**
     * >[!NOTE]
     * >This member was added in Windows 10, version 1803.
     * 
     * The string that is used to start the process. If the platform failed to retrieve the command line, `UNKNOWN` will be returned.
     */
    CommandLine : PWSTR

    /**
     * >[!NOTE]
     * >This member was added in Windows 10, version 1803.
     * 
     * The 32bit ID of the session wherein the user process that triggers the callback resides.
     */
    SessionId : UInt32

}
