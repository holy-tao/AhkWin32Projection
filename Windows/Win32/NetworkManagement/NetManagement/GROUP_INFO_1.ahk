#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The GROUP_INFO_1 structure contains a global group name and a comment to associate with the group.
 * @remarks
 * 
  * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-group_info_1
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class GROUP_INFO_1 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode character string that specifies the name of the global group. For more information, see the following Remarks section. 
     * 
     * 
     * 
     * 
     * When you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupsetinfo">NetGroupSetInfo</a> function this member is ignored.
     * @type {PWSTR}
     */
    grpi1_name{
        get {
            if(!this.HasProp("__grpi1_name"))
                this.__grpi1_name := PWSTR(this.ptr + 0)
            return this.__grpi1_name
        }
    }

    /**
     * Pointer to a null-terminated Unicode character string that specifies a remark associated with the global group. This member can be a null string. The comment can contain MAXCOMMENTSZ characters.
     * @type {PWSTR}
     */
    grpi1_comment{
        get {
            if(!this.HasProp("__grpi1_comment"))
                this.__grpi1_comment := PWSTR(this.ptr + 8)
            return this.__grpi1_comment
        }
    }
}
