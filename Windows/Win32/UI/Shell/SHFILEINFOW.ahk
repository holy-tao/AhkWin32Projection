#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about a file object. (Unicode)
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetfileinfoa">SHGetFileInfo</a> function.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The shellapi.h header defines SHFILEINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shfileinfow
 * @namespace Windows.Win32.UI.Shell
 * @charset Unicode
 * @architecture X64, Arm64
 */
export default struct SHFILEINFOW {
    #StructPack 8

    /**
     * Type: <b>HICON</b>
     * 
     * A handle to the icon that represents the file. You are responsible for destroying this handle with <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-destroyicon">DestroyIcon</a> when you no longer need it.
     */
    hIcon : HICON

    /**
     * Type: <b>int</b>
     * 
     * The index of the icon image within the system image list.
     */
    iIcon : Int32

    /**
     * Type: <b>DWORD</b>
     * 
     * An array of values that indicates the attributes of the file object. For information about these values, see the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getattributesof">IShellFolder::GetAttributesOf</a> method.
     */
    dwAttributes : UInt32

    /**
     * Type: <b>TCHAR[MAX_PATH]</b>
     * 
     * A string that contains the name of the file as it appears in the Windows Shell, or the path and file name of the file that contains the icon representing the file.
     */
    szDisplayName : WCHAR[260]

    /**
     * Type: <b>TCHAR[80]</b>
     * 
     * A string that describes the type of file.
     */
    szTypeName : WCHAR[80]

}
