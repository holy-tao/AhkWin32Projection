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
    static sizeof => 658

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
     * @type {Array<SByte>}
     */
    achTitle{
        get {
            if(!this.HasProp("__achTitleProxyArray"))
                this.__achTitleProxyArray := Win32FixedArray(this.ptr + 4, 30, Primitive, "char")
            return this.__achTitleProxyArray
        }
    }

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the command line, including arguments.
     * @type {Array<SByte>}
     */
    achCmdLine{
        get {
            if(!this.HasProp("__achCmdLineProxyArray"))
                this.__achCmdLineProxyArray := Win32FixedArray(this.ptr + 34, 128, Primitive, "char")
            return this.__achCmdLineProxyArray
        }
    }

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the working directory.
     * @type {Array<SByte>}
     */
    achWorkDir{
        get {
            if(!this.HasProp("__achWorkDirProxyArray"))
                this.__achWorkDirProxyArray := Win32FixedArray(this.ptr + 162, 64, Primitive, "char")
            return this.__achWorkDirProxyArray
        }
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
     * @type {Array<SByte>}
     */
    achIconFile{
        get {
            if(!this.HasProp("__achIconFileProxyArray"))
                this.__achIconFileProxyArray := Win32FixedArray(this.ptr + 228, 80, Primitive, "char")
            return this.__achIconFileProxyArray
        }
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
        get => NumGet(this, 310, "uint")
        set => NumPut("uint", value, this, 310)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Flags that specify the real mode options.
     * @type {Integer}
     */
    dwRealModeFlags {
        get => NumGet(this, 314, "uint")
        set => NumPut("uint", value, this, 314)
    }

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the name of the "other" file in the directory.
     * @type {Array<SByte>}
     */
    achOtherFile{
        get {
            if(!this.HasProp("__achOtherFileProxyArray"))
                this.__achOtherFileProxyArray := Win32FixedArray(this.ptr + 318, 80, Primitive, "char")
            return this.__achOtherFileProxyArray
        }
    }

    /**
     * Type: <b>__wchar_t</b>
     * 
     * A null-terminated string that contains the name of the .pif file in the directory.
     * @type {Array<SByte>}
     */
    achPIFFile{
        get {
            if(!this.HasProp("__achPIFFileProxyArray"))
                this.__achPIFFileProxyArray := Win32FixedArray(this.ptr + 398, 260, Primitive, "char")
            return this.__achPIFFileProxyArray
        }
    }
}
