#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * This structure contains information from a .pif file. It is used by PifMgr_GetProperties.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-propprg
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PROPPRG extends Win32Struct
{
    static sizeof => 1300

    static packingSize => 1

    /**
     * Type: <b>WORD</b>
     * 
     * Flags that describe how the program will run.
     * @type {Integer}
     */
    flPrg {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * Flags that specify the initial conditions for the application.
     * @type {Integer}
     */
    flPrgInit {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the title.
     * @type {String}
     */
    achTitle {
        get => StrGet(this.ptr + 4, 29, "UTF-16")
        set => StrPut(value, this.ptr + 4, 29, "UTF-16")
    }

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the command line, including arguments.
     * @type {String}
     */
    achCmdLine {
        get => StrGet(this.ptr + 64, 127, "UTF-16")
        set => StrPut(value, this.ptr + 64, 127, "UTF-16")
    }

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the working directory.
     * @type {String}
     */
    achWorkDir {
        get => StrGet(this.ptr + 320, 63, "UTF-16")
        set => StrPut(value, this.ptr + 320, 63, "UTF-16")
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The key code of the .pif file's hotkey.
     * @type {Integer}
     */
    wHotKey {
        get => NumGet(this, 448, "ushort")
        set => NumPut("ushort", value, this, 448)
    }

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the name of the file that contains the icon.
     * @type {String}
     */
    achIconFile {
        get => StrGet(this.ptr + 450, 79, "UTF-16")
        set => StrPut(value, this.ptr + 450, 79, "UTF-16")
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The index of the icon in the file specified by <b>achIconFile</b>.
     * @type {Integer}
     */
    wIconIndex {
        get => NumGet(this, 610, "ushort")
        set => NumPut("ushort", value, this, 610)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    dwEnhModeFlags {
        get => NumGet(this, 612, "uint")
        set => NumPut("uint", value, this, 612)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Flags that specify the real mode options.
     * @type {Integer}
     */
    dwRealModeFlags {
        get => NumGet(this, 616, "uint")
        set => NumPut("uint", value, this, 616)
    }

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the name of the "other" file in the directory.
     * @type {String}
     */
    achOtherFile {
        get => StrGet(this.ptr + 620, 79, "UTF-16")
        set => StrPut(value, this.ptr + 620, 79, "UTF-16")
    }

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the name of the .pif file in the directory.
     * @type {String}
     */
    achPIFFile {
        get => StrGet(this.ptr + 780, 259, "UTF-16")
        set => StrPut(value, this.ptr + 780, 259, "UTF-16")
    }
}
