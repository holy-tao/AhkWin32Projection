#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_ACTION.ahk" { FILE_ACTION }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes the changes found by the ReadDirectoryChangesExW function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-file_notify_extended_information
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_NOTIFY_EXTENDED_INFORMATION {
    #StructPack 8

    /**
     * The number of bytes that must be skipped to get to the next record. A value of zero indicates that this is 
     *       the last record.
     */
    NextEntryOffset : UInt32

    Action : FILE_ACTION

    /**
     * The date and time that the directory or file was created and added to the file system.
     */
    CreationTime : Int64

    /**
     * The date and time that the content of the directory or file  was last modified in the file system.
     */
    LastModificationTime : Int64

    /**
     * The date and time that the metadata or content of the directory or file  was last changed in the file system.
     */
    LastChangeTime : Int64

    /**
     * The date and time the directory or file was last accessed in the file system.
     */
    LastAccessTime : Int64

    /**
     * The allocated size of the file, in bytes.
     */
    AllocatedLength : Int64

    /**
     * The new size of the directory or file in bytes, or the old size if 
     *             the size is unchanged.
     */
    FileSize : Int64

    /**
     * The attributes of the directory or file.
     */
    FileAttributes : UInt32

    ReparsePointTag : UInt32

    /**
     * The identifier of the directory or file.
     */
    FileId : Int64

    /**
     * The identifier of the parent directory for the file.
     */
    ParentFileId : Int64

    /**
     * The size of the file name portion of the record, in bytes. This value does not include a 
     *       terminating null character.
     */
    FileNameLength : UInt32

    /**
     * A variable-length field that contains the file name relative to the directory handle. The file name is in 
     *       the Unicode character format and is not null-terminated.
     * 	     
     * 
     * If there is both a short and long name for the file, the function will return one of these names, but it is 
     *  	     unspecified which one.
     */
    FileName : WCHAR[1]

    static __New() {
        DefineProp(this.Prototype, 'EaSize', { type: UInt32, offset: 60 })
        this.DeleteProp("__New")
    }
}
