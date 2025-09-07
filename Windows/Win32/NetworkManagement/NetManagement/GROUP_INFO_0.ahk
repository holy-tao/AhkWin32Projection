#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The GROUP_INFO_0 structure contains the name of a global group in the security database, which is the security accounts manager (SAM) database or, in the case of domain controllers, the Active Directory.
 * @remarks
 * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-group_info_0
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class GROUP_INFO_0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode character string that specifies the name of the global group. For more information, see the following Remarks section. 
     * 
     * 
     * 
     * 
     * When you call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netgroupsetinfo">NetGroupSetInfo</a> function this member specifies the new name of the global group.
     * @type {PWSTR}
     */
    grpi0_name{
        get {
            if(!this.HasProp("__grpi0_name"))
                this.__grpi0_name := PWSTR(this.ptr + 0)
            return this.__grpi0_name
        }
    }
}
