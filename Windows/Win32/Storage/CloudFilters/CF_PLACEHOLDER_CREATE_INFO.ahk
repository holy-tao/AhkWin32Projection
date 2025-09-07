#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\FileSystem\FILE_BASIC_INFO.ahk
#Include .\CF_FS_METADATA.ahk

/**
 * Contains placeholder information for creating new placeholder files or directories.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_placeholder_create_info
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_PLACEHOLDER_CREATE_INFO extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The name of the child placeholder file or directory to be created. It should consist only of the file or directory name.
     * 
     * For example, if the sync root of the provider is C:\SyncRoot then to create a placeholder named placeholder.txt in a subdirectory of the sync root, call the [CfCreatePlaceholders](nf-cfapi-cfcreateplaceholders.md) function with *BaseDirectoryPath* equal to `C:\SyncRoot\SubDirectory` and set the *RelativePathName* field of the **CF_PLACEHOLDER_CREATE_INFO** to `placeholder.txt`.
     * @type {PWSTR}
     */
    RelativeFileName{
        get {
            if(!this.HasProp("__RelativeFileName"))
                this.__RelativeFileName := PWSTR(this.ptr + 0)
            return this.__RelativeFileName
        }
    }

    /**
     * File system metadata to be created with the placeholder, including all timestamps, file attributes and file size (optional for directories).
     * @type {CF_FS_METADATA}
     */
    FsMetadata{
        get {
            if(!this.HasProp("__FsMetadata"))
                this.__FsMetadata := CF_FS_METADATA(this.ptr + 8)
            return this.__FsMetadata
        }
    }

    /**
     * A user mode buffer containing file information supplied by the sync provider. The *FileIdentity* blob should not exceed **CF_PLACEHOLDER_MAX_FILE_IDENTITY_LENGTH** (defined to 4KB) in size. *FileIdentity* gets passed back to the sync provider in all callbacks. This is required for files (not for directories).
     * @type {Pointer<Void>}
     */
    FileIdentity {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Length, in bytes, of the *FileIdentity*.
     * @type {Integer}
     */
    FileIdentityLength {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Flags for specifying placeholder creation behavior. See [CF_PLACEHOLDER_CREATE_FLAGS](ne-cfapi-cf_placeholder_create_flags.md) for more information.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * The result of placeholder creation. On successful creation, the value is **STATUS_OK**.
     * @type {Integer}
     */
    Result {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * The final USN value after create actions are performed.
     * @type {Integer}
     */
    CreateUsn {
        get => NumGet(this, 80, "int64")
        set => NumPut("int64", value, this, 80)
    }
}
