#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * This structure contains information from a .pif file. It is used by PifMgr_GetProperties.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-propprg
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
class PROPPRG extends Win32Struct {
    static sizeof => 660

    static packingSize => 4

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
        get => StrGet(this.ptr + 4, 29, "UTF-8")
        set => StrPut(value, this.ptr + 4, 29, "UTF-8")
    }

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the command line, including arguments.
     * @type {String}
     */
    achCmdLine {
        get => StrGet(this.ptr + 34, 127, "UTF-8")
        set => StrPut(value, this.ptr + 34, 127, "UTF-8")
    }

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the working directory.
     * @type {String}
     */
    achWorkDir {
        get => StrGet(this.ptr + 162, 63, "UTF-8")
        set => StrPut(value, this.ptr + 162, 63, "UTF-8")
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The key code of the .pif file's hotkey.
     * @type {Integer}
     */
    wHotKey {
        get => NumGet(this, 226, "ushort")
        set => NumPut("ushort", value, this, 226)
    }

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the name of the file that contains the icon.
     * @type {String}
     */
    achIconFile {
        get => StrGet(this.ptr + 228, 79, "UTF-8")
        set => StrPut(value, this.ptr + 228, 79, "UTF-8")
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The index of the icon in the file specified by <b>achIconFile</b>.
     * @type {Integer}
     */
    wIconIndex {
        get => NumGet(this, 308, "ushort")
        set => NumPut("ushort", value, this, 308)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    dwEnhModeFlags {
        get => NumGet(this, 312, "uint")
        set => NumPut("uint", value, this, 312)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Flags that specify the real mode options.
     * @type {Integer}
     */
    dwRealModeFlags {
        get => NumGet(this, 316, "uint")
        set => NumPut("uint", value, this, 316)
    }

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the name of the "other" file in the directory.
     * @type {String}
     */
    achOtherFile {
        get => StrGet(this.ptr + 320, 79, "UTF-8")
        set => StrPut(value, this.ptr + 320, 79, "UTF-8")
    }

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the name of the .pif file in the directory.
     * @type {String}
     */
    achPIFFile {
        get => StrGet(this.ptr + 400, 259, "UTF-8")
        set => StrPut(value, this.ptr + 400, 259, "UTF-8")
    }
}
