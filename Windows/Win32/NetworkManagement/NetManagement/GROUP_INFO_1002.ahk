#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The GROUP_INFO_1002 structure contains a comment to associate with a global group.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-group_info_1002
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class GROUP_INFO_1002 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode character string that contains a remark to associate with the global group. This member can be a null string. The comment can contain MAXCOMMENTSZ characters.
     * @type {PWSTR}
     */
    grpi1002_comment{
        get {
            if(!this.HasProp("__grpi1002_comment"))
                this.__grpi1002_comment := PWSTR(this.ptr + 0)
            return this.__grpi1002_comment
        }
    }
}
