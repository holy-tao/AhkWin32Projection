#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DATABLOCK_HEADER.ahk

/**
 * Holds an extra data block used by IShellLinkDataList. It holds the link's Windows Installer ID.
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllinkdatalist-getflags">IShellLinkDataList::GetFlags</a> returns the flag SLDF_HAS_DARWINID for links that have a darwin signature.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-exp_darwin_link
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class EXP_DARWIN_LINK extends Win32Struct
{
    static sizeof => 788

    static packingSize => 1

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-datablock_header">DATABLOCK_HEADER</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-datablock_header">DATABLOCK_HEADER</a> structure stating the size and signature of the <b>EXP_DARWIN_LINK</b> structure. The following is the only recognized signature value.
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
     * Type: <b>__wchar_t[MAX_PATH]</b>
     * 
     * The link's ID in the form of an ANSI string.
     * @type {Array<SByte>}
     */
    szDarwinID{
        get {
            if(!this.HasProp("__szDarwinIDProxyArray"))
                this.__szDarwinIDProxyArray := Win32FixedArray(this.ptr + 8, 260, Primitive, "char")
            return this.__szDarwinIDProxyArray
        }
    }

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * The link's ID in the form of an Unicode string.
     * @type {String}
     */
    szwDarwinID {
        get => StrGet(this.ptr + 268, 259, "UTF-16")
        set => StrPut(value, this.ptr + 268, 259, "UTF-16")
    }
}
