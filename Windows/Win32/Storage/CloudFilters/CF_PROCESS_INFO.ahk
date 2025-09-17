#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a user process.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_process_info
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_PROCESS_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size of the **CF_PROCESS_INFO** structure.
     * @type {Integer}
     */
    StructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The 32 bit ID of the user process.
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The absolute path of the main executable file including the volume name in the format of NT file path. If the platform failed to retrieve the image path, `UNKNOWN` will be returned.
     * @type {Pointer<Char>}
     */
    ImagePath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Used for modern applications. The app package name.
     * @type {Pointer<Char>}
     */
    PackageName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Used for modern applications. The application ID.
     * @type {Pointer<Char>}
     */
    ApplicationId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * >[!NOTE]
     * >This member was added in Windows 10, version 1803.
     * 
     * The string that is used to start the process. If the platform failed to retrieve the command line, `UNKNOWN` will be returned.
     * @type {Pointer<Char>}
     */
    CommandLine {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * >[!NOTE]
     * >This member was added in Windows 10, version 1803.
     * 
     * The 32bit ID of the session wherein the user process that triggers the callback resides.
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
