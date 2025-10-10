#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DATABLOCK_HEADER.ahk

/**
 * Holds an extra data block used by IShellLinkDataList. It holds the console's code page.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-nt_fe_console_props
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class NT_FE_CONSOLE_PROPS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-datablock_header">DATABLOCK_HEADER</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-datablock_header">DATABLOCK_HEADER</a> structure with the <b>NT_FE_CONSOLE_PROPS</b> structure's size and signature. The signature for an <b>NT_FE_CONSOLE_PROPS</b> structure is NT_FE_CONSOLE_PROPS_SIG.
     * @type {DATABLOCK_HEADER}
     */
    dbh{
        get {
            if(!this.HasProp("__dbh"))
                this.__dbh := DATABLOCK_HEADER(this.ptr + 0)
            return this.__dbh
        }
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The console's code page.
     * @type {Integer}
     */
    uCodePage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
