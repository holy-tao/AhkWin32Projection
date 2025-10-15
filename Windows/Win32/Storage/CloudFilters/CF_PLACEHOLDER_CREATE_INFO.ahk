#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\FileSystem\FILE_BASIC_INFO.ahk
#Include .\CF_FS_METADATA.ahk

/**
 * Contains placeholder information for creating new placeholder files or directories.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ns-cfapi-cf_placeholder_create_info
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
     * For example, if the sync root of the provider is C:\SyncRoot then to create a placeholder named placeholder.txt in a subdirectory SubDirectory of the sync root, call the CfCreatePlaceholders function with BaseDirectoryPath equal to C:\SyncRoot\SubDirectory and set the RelativePathName field of the CF_PLACEHOLDER_CREATE_INFO to placeholder.txt.
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
     * File system metadata to be created with the placeholder.
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
     * A user mode buffer containing file information supplied by the sync provider. This is required for files (not for directories).
     * @type {Pointer<Void>}
     */
    FileIdentity {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Length, in bytes, of the <b>FileIdentity</b>.
     * @type {Integer}
     */
    FileIdentityLength {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Flags for specifying placeholder creation behavior.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * The result of placeholder creation. On successful creation, the value is: STATUS_OK.
     * @type {HRESULT}
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
