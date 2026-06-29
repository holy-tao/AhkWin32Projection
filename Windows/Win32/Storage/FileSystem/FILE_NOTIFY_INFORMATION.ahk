#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_ACTION.ahk" { FILE_ACTION }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes the changes found by the ReadDirectoryChangesW function.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-file_notify_information
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_NOTIFY_INFORMATION {
    #StructPack 4

    /**
     * The number of bytes that must be skipped to get to the next record. A value of zero indicates that this is 
     *       the last record.
     */
    NextEntryOffset : UInt32

    Action : FILE_ACTION

    /**
     * The size of the file name portion of the record, in bytes. Note that this value does not include the 
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

}
