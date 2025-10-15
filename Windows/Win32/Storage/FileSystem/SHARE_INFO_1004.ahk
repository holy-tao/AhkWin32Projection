#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains a comment associated with the shared resource.
 * @see https://docs.microsoft.com/windows/win32/api//lmshare/ns-lmshare-share_info_1004
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SHARE_INFO_1004 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a Unicode string that contains an optional comment about the shared resource.
     * @type {PWSTR}
     */
    shi1004_remark{
        get {
            if(!this.HasProp("__shi1004_remark"))
                this.__shi1004_remark := PWSTR(this.ptr + 0)
            return this.__shi1004_remark
        }
    }
}
