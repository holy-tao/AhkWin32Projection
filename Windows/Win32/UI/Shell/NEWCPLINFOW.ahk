#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains resource information and an application-defined value for a dialog box supported by a Control Panel application.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/cpl/nc-cpl-applet_proc">CPlApplet</a> function of the Control Panel application returns this information to the Control Panel in response to a <a href="https://docs.microsoft.com/windows/desktop/shell/glossary">CPL_NEWINQUIRE</a> message.
  * 
  * > [!NOTE]
  * > The cpl.h header defines NEWCPLINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cpl/ns-cpl-newcplinfow
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset Unicode
 */
class NEWCPLINFOW extends Win32Struct
{
    static sizeof => 480

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The length of the structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * This member is ignored.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * This member is ignored.
     * @type {Integer}
     */
    dwHelpContext {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>LONG_PTR</b>
     * 
     * A pointer to data defined by the application. When the Control Panel sends the <a href="https://docs.microsoft.com/windows/desktop/shell/fa-associationarray">CPL_DBLCLK</a> and <a href="https://docs.microsoft.com/windows/desktop/shell/library-functions-bumper">CPL_STOP</a> messages, it passes this value back to your application.
     * @type {Pointer}
     */
    lData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>HICON</b>
     * 
     * The identifier of the icon that represents the dialog box. This icon is intended to be displayed by the application that controls the Control Panel application.
     * @type {Pointer<Void>}
     */
    hIcon {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>TCHAR[32]</b>
     * 
     * A null-terminated string that contains the dialog box name. The name is intended to be displayed below the icon.
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 32, 31, "UTF-16")
        set => StrPut(value, this.ptr + 32, 31, "UTF-16")
    }

    /**
     * Type: <b>TCHAR[64]</b>
     * 
     * A null-terminated string containing the dialog box description. The description is intended to be displayed when the icon for the dialog box is selected.
     * @type {String}
     */
    szInfo {
        get => StrGet(this.ptr + 96, 63, "UTF-16")
        set => StrPut(value, this.ptr + 96, 63, "UTF-16")
    }

    /**
     * Type: <b>TCHAR[128]</b>
     * 
     * This member is ignored.
     * @type {String}
     */
    szHelpFile {
        get => StrGet(this.ptr + 224, 127, "UTF-16")
        set => StrPut(value, this.ptr + 224, 127, "UTF-16")
    }
}
