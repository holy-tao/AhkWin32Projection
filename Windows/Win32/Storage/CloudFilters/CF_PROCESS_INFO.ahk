#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about a user process.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ns-cfapi-cf_process_info
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_PROCESS_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size of the structure.
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
     * The absolute path of the main executable file including the volume name in the format of NT file path. If the platform failed to retrieve the image path, “UNKNOWN” will be returned.
     * @type {PWSTR}
     */
    ImagePath{
        get {
            if(!this.HasProp("__ImagePath"))
                this.__ImagePath := PWSTR(this.ptr + 8)
            return this.__ImagePath
        }
    }

    /**
     * Used for modern applications. The app package name.
     * @type {PWSTR}
     */
    PackageName{
        get {
            if(!this.HasProp("__PackageName"))
                this.__PackageName := PWSTR(this.ptr + 16)
            return this.__PackageName
        }
    }

    /**
     * Used for modern applications. The application ID.
     * @type {PWSTR}
     */
    ApplicationId{
        get {
            if(!this.HasProp("__ApplicationId"))
                this.__ApplicationId := PWSTR(this.ptr + 24)
            return this.__ApplicationId
        }
    }

    /**
     * <b>Note</b>  This member was added in Windows 10, version 1803.
     * 
     * Used to start the process. If the platform failed to retrieve the command line, “UNKNOWN” will be returned.
     * @type {PWSTR}
     */
    CommandLine{
        get {
            if(!this.HasProp("__CommandLine"))
                this.__CommandLine := PWSTR(this.ptr + 32)
            return this.__CommandLine
        }
    }

    /**
     * 
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
