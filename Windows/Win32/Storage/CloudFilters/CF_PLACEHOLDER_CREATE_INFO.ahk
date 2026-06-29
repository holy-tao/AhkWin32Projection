#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CF_FS_METADATA.ahk" { CF_FS_METADATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\FileSystem\FILE_BASIC_INFO.ahk" { FILE_BASIC_INFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CF_PLACEHOLDER_CREATE_FLAGS.ahk" { CF_PLACEHOLDER_CREATE_FLAGS }

/**
 * Contains placeholder information for creating new placeholder files or directories.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_placeholder_create_info
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_PLACEHOLDER_CREATE_INFO {
    #StructPack 8

    /**
     * The name of the child placeholder file or directory to be created. It should consist only of the file or directory name.
     * 
     * For example, if the sync root of the provider is C:\SyncRoot then to create a placeholder named placeholder.txt in a subdirectory of the sync root, call the [CfCreatePlaceholders](nf-cfapi-cfcreateplaceholders.md) function with *BaseDirectoryPath* equal to `C:\SyncRoot\SubDirectory` and set the *RelativePathName* field of the **CF_PLACEHOLDER_CREATE_INFO** to `placeholder.txt`.
     */
    RelativeFileName : PWSTR

    /**
     * File system metadata to be created with the placeholder, including all timestamps, file attributes and file size (optional for directories).
     */
    FsMetadata : CF_FS_METADATA

    /**
     * A user mode buffer containing file information supplied by the sync provider. The *FileIdentity* blob should not exceed **CF_PLACEHOLDER_MAX_FILE_IDENTITY_LENGTH** (defined to 4KB) in size. *FileIdentity* gets passed back to the sync provider in all callbacks. This is required for files (not for directories).
     */
    FileIdentity : IntPtr

    /**
     * Length, in bytes, of the *FileIdentity*.
     */
    FileIdentityLength : UInt32

    /**
     * Flags for specifying placeholder creation behavior. See [CF_PLACEHOLDER_CREATE_FLAGS](ne-cfapi-cf_placeholder_create_flags.md) for more information.
     */
    Flags : CF_PLACEHOLDER_CREATE_FLAGS

    /**
     * The result of placeholder creation. On successful creation, the value is **STATUS_OK**.
     */
    Result : HRESULT

    /**
     * The final USN value after create actions are performed.
     */
    CreateUsn : Int64

}
