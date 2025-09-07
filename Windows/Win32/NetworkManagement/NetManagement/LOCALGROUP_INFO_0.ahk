#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The LOCALGROUP_INFO_0 structure contains a local group name.
 * @remarks
 * When you call the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netlocalgroupadd">NetLocalGroupAdd</a> function, this member specifies the name of a new local group. When you call the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netlocalgroupsetinfo">NetLocalGroupSetInfo</a> function, this member specifies the new name of an existing local group.
  * 
  * User account names are limited to 20 characters and group names are limited to 256 characters. In addition, account names cannot be terminated by a period and they cannot include commas or any of the following printable characters: ", /, \, [, ], :, |, &lt;, &gt;, +, =, ;, ?, *. Names also cannot include characters in the range 1-31, which are nonprintable.
 * @see https://learn.microsoft.com/windows/win32/api/lmaccess/ns-lmaccess-localgroup_info_0
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class LOCALGROUP_INFO_0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a Unicode string that specifies a local group name. For more information, see the following Remarks section.
     * @type {PWSTR}
     */
    lgrpi0_name{
        get {
            if(!this.HasProp("__lgrpi0_name"))
                this.__lgrpi0_name := PWSTR(this.ptr + 0)
            return this.__lgrpi0_name
        }
    }
}
