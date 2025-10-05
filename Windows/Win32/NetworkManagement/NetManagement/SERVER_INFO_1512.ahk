#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1512 structure contains the maximum size of nonpaged memory that the specified server can allocate at a particular time.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1512
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1512 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the maximum size of nonpaged memory that the server can allocate at any one time. Adjust this member if you want to administer memory quota control.
     * @type {Integer}
     */
    sv1512_maxnonpagedmemoryusage {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
