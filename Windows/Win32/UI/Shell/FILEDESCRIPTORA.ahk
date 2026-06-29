#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Describes the properties of a file that is being copied by means of the clipboard during a Microsoft ActiveX drag-and-drop operation. (ANSI)
 * @remarks
 * If the <a href="https://docs.microsoft.com/windows/desktop/shell/clipboard">CFSTR_FILECONTENTS</a> format that corresponds to this structure contains the file as a global memory object, <b>nFileSizeHigh</b> and <b>nFileSizeLow</b> specify the size of the associated memory block. If they are set, they can also be used if a user-interface needs to be displayed. For example, if a file is about to be overwritten, you would typically use information from this structure to display a dialog box containing the size, data, and name of the file.
 * 
 * To create a zero-length file, set the <b>FD_FILESIZE</b> flag in the <b>dwFlags</b>, and set <b>nFileSizeHigh</b> and <b>nFileSizeLow</b> to zero. The <a href="https://docs.microsoft.com/windows/desktop/shell/clipboard">CFSTR_FILECONTENTS</a> format should represent the file as either a stream or global memory object (<a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-tymed">TYMED_ISTREAM</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-tymed">TYMED_HGLOBAL</a>).
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The shlobj_core.h header defines FILEDESCRIPTOR as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-filedescriptora
 * @namespace Windows.Win32.UI.Shell
 * @charset ANSI
 */
export default struct FILEDESCRIPTORA {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     */
    dwFlags : UInt32

    /**
     * Type: <b>CLSID</b>
     * 
     * The file type identifier.
     */
    clsid : Guid

    /**
     * Type: <b>SIZEL</b>
     * 
     * The width and height of the file icon.
     */
    sizel : SIZE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a></b>
     * 
     * The screen coordinates of the file object.
     */
    pointl : POINTL

    /**
     * Type: <b>DWORD</b>
     * 
     * File attribute flags. This will be a combination of the FILE_ATTRIBUTE_ values described in <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfileattributesa">GetFileAttributes</a>.
     */
    dwFileAttributes : UInt32

    /**
     * Type: <b>FILETIME</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time of file creation.
     */
    ftCreationTime : FILETIME

    /**
     * Type: <b>FILETIME</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time that the file was last accessed.
     */
    ftLastAccessTime : FILETIME

    /**
     * Type: <b>FILETIME</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time of the last write operation.
     */
    ftLastWriteTime : FILETIME

    /**
     * Type: <b>DWORD</b>
     * 
     * The high-order <b>DWORD</b> of the file size, in bytes.
     */
    nFileSizeHigh : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The low-order <b>DWORD</b> of the file size, in bytes.
     */
    nFileSizeLow : UInt32

    /**
     * Type: <b>TCHAR[MAX_PATH]</b>
     * 
     * The null-terminated string that contains the name of the file.
     */
    cFileName : CHAR[260]

}
