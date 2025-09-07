#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The LOCALGROUP_INFO_1002 structure contains a comment describing a local group.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-localgroup_info_1002
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class LOCALGROUP_INFO_1002 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a Unicode string that specifies a remark associated with the local group. This member can be a null string. The comment can have as many as MAXCOMMENTSZ characters.
     * @type {PWSTR}
     */
    lgrpi1002_comment{
        get {
            if(!this.HasProp("__lgrpi1002_comment"))
                this.__lgrpi1002_comment := PWSTR(this.ptr + 0)
            return this.__lgrpi1002_comment
        }
    }
}
