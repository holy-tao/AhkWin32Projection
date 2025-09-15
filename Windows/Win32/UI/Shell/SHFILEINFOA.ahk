#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a file object. (ANSI)
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetfileinfoa">SHGetFileInfo</a> function.
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The shellapi.h header defines SHFILEINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shfileinfoa
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset ANSI
 */
class SHFILEINFOA extends Win32Struct
{
    static sizeof => 360

    static packingSize => 8

    /**
     * Type: <b>HICON</b>
     * 
     * A handle to the icon that represents the file. You are responsible for destroying this handle with <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-destroyicon">DestroyIcon</a> when you no longer need it.
     * @type {Pointer<HICON>}
     */
    hIcon {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The index of the icon image within the system image list.
     * @type {Integer}
     */
    iIcon {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * An array of values that indicates the attributes of the file object. For information about these values, see the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getattributesof">IShellFolder::GetAttributesOf</a> method.
     * @type {Integer}
     */
    dwAttributes {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>TCHAR[MAX_PATH]</b>
     * 
     * A string that contains the name of the file as it appears in the Windows Shell, or the path and file name of the file that contains the icon representing the file.
     * @type {String}
     */
    szDisplayName {
        get => StrGet(this.ptr + 16, 259, "UTF-8")
        set => StrPut(value, this.ptr + 16, 259, "UTF-8")
    }

    /**
     * Type: <b>TCHAR[80]</b>
     * 
     * A string that describes the type of file.
     * @type {String}
     */
    szTypeName {
        get => StrGet(this.ptr + 276, 79, "UTF-8")
        set => StrPut(value, this.ptr + 276, 79, "UTF-8")
    }
}
