#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\..\Foundation\POINTL.ahk
#Include ..\..\Foundation\FILETIME.ahk

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
 * @version v4.0.30319
 * @charset ANSI
 */
class FILEDESCRIPTORA extends Win32Struct
{
    static sizeof => 336

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>CLSID</b>
     * 
     * The file type identifier.
     * @type {Pointer<Guid>}
     */
    clsid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>SIZEL</b>
     * 
     * The width and height of the file icon.
     * @type {SIZE}
     */
    sizel{
        get {
            if(!this.HasProp("__sizel"))
                this.__sizel := SIZE(this.ptr + 16)
            return this.__sizel
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a></b>
     * 
     * The screen coordinates of the file object.
     * @type {POINTL}
     */
    pointl{
        get {
            if(!this.HasProp("__pointl"))
                this.__pointl := POINTL(this.ptr + 24)
            return this.__pointl
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * File attribute flags. This will be a combination of the FILE_ATTRIBUTE_ values described in <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfileattributesa">GetFileAttributes</a>.
     * @type {Integer}
     */
    dwFileAttributes {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>FILETIME</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time of file creation.
     * @type {FILETIME}
     */
    ftCreationTime{
        get {
            if(!this.HasProp("__ftCreationTime"))
                this.__ftCreationTime := FILETIME(this.ptr + 40)
            return this.__ftCreationTime
        }
    }

    /**
     * Type: <b>FILETIME</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time that the file was last accessed.
     * @type {FILETIME}
     */
    ftLastAccessTime{
        get {
            if(!this.HasProp("__ftLastAccessTime"))
                this.__ftLastAccessTime := FILETIME(this.ptr + 48)
            return this.__ftLastAccessTime
        }
    }

    /**
     * Type: <b>FILETIME</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time of the last write operation.
     * @type {FILETIME}
     */
    ftLastWriteTime{
        get {
            if(!this.HasProp("__ftLastWriteTime"))
                this.__ftLastWriteTime := FILETIME(this.ptr + 56)
            return this.__ftLastWriteTime
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The high-order <b>DWORD</b> of the file size, in bytes.
     * @type {Integer}
     */
    nFileSizeHigh {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The low-order <b>DWORD</b> of the file size, in bytes.
     * @type {Integer}
     */
    nFileSizeLow {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Type: <b>TCHAR[MAX_PATH]</b>
     * 
     * The null-terminated string that contains the name of the file.
     * @type {String}
     */
    cFileName {
        get => StrGet(this.ptr + 72, 259, "UTF-8")
        set => StrPut(value, this.ptr + 72, 259, "UTF-8")
    }
}
