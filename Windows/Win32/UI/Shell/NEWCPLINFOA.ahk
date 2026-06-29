#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains resource information and an application-defined value for a dialog box supported by a Control Panel application. (NEWCPLINFOA)
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/cpl/nc-cpl-applet_proc">CPlApplet</a> function of the Control Panel application returns this information to the Control Panel in response to a <a href="https://docs.microsoft.com/windows/desktop/shell/glossary">CPL_NEWINQUIRE</a> message.
 * 
 * > [!NOTE]
 * > The cpl.h header defines NEWCPLINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/cpl/ns-cpl-newcplinfoa
 * @namespace Windows.Win32.UI.Shell
 * @charset ANSI
 */
export default struct NEWCPLINFOA {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The length of the structure, in bytes.
     */
    dwSize : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * This member is ignored.
     */
    dwFlags : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * This member is ignored.
     */
    dwHelpContext : UInt32

    /**
     * Type: <b>LONG_PTR</b>
     * 
     * A pointer to data defined by the application. When the Control Panel sends the <a href="https://docs.microsoft.com/windows/desktop/shell/fa-associationarray">CPL_DBLCLK</a> and <a href="https://docs.microsoft.com/windows/desktop/shell/library-functions-bumper">CPL_STOP</a> messages, it passes this value back to your application.
     */
    lData : IntPtr

    /**
     * Type: <b>HICON</b>
     * 
     * The identifier of the icon that represents the dialog box. This icon is intended to be displayed by the application that controls the Control Panel application.
     */
    hIcon : HICON

    /**
     * Type: <b>TCHAR[32]</b>
     * 
     * A null-terminated string that contains the dialog box name. The name is intended to be displayed below the icon.
     */
    szName : CHAR[32]

    /**
     * Type: <b>TCHAR[64]</b>
     * 
     * A null-terminated string containing the dialog box description. The description is intended to be displayed when the icon for the dialog box is selected.
     */
    szInfo : CHAR[64]

    /**
     * Type: <b>TCHAR[128]</b>
     * 
     * This member is ignored.
     */
    szHelpFile : CHAR[128]

}
