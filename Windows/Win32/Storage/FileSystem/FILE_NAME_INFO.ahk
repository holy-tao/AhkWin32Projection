#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Receives the file name.
 * @remarks
 * If the call to `GetFileInformationByHandleEx` fails because there was not enough
 * buffer space for the full length of the <b>FileName</b> then the `FileNameLength`
 * field will contain the required length of the <b>FileName</b> in bytes.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_name_info
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_NAME_INFO {
    #StructPack 4

    /**
     * The size of the <b>FileName</b> string, in bytes.
     */
    FileNameLength : UInt32

    /**
     * The file name that is returned.
     */
    FileName : WCHAR[1]

}
