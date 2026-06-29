#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Represents a file name.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-find_by_sid_output
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FIND_BY_SID_OUTPUT {
    #StructPack 4

    /**
     * Number of bytes that must be skipped to get to the next record. A value of zero indicates that this is the last record.
     */
    NextEntryOffset : UInt32

    /**
     * Index of the file.
     */
    FileIndex : UInt32

    /**
     * The size of the file name, in bytes. This size does not include the NULL character.
     */
    FileNameLength : UInt32

    /**
     * A null-terminated string that specifies the file name.
     */
    FileName : WCHAR[1]

}
