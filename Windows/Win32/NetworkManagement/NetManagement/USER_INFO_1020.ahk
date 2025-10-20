#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USER_INFO_1020 structure contains the times during which a user can log on to the network. This information level is valid only when you call the NetUserSetInfo function.
 * @see https://docs.microsoft.com/windows/win32/api//lmaccess/ns-lmaccess-user_info_1020
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USER_INFO_1020 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies a <b>DWORD</b> value that indicates the number of equal-length time units into which the week is divided. This value is required to compute the length of the bit string in the <b>usri1020_logon_hours</b> member. 
     * 
     * 
     * 
     * 
     * This value must be UNITS_PER_WEEK for LAN Manager 2.0. Calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netuseradd">NetUserAdd</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmaccess/nf-lmaccess-netusersetinfo">NetUserSetInfo</a> functions ignore this member.
     * @type {Integer}
     */
    usri1020_units_per_week {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a 21-byte (168 bits) bit string that specifies the times during which the user can log on. The user is specified in the <i>username</i> parameter to the 
     * <b>NetUserSetInfo</b> function. 
     * 
     * 
     * 
     * 
     * Each bit in the string represents a unique hour in the week, in Greenwich Mean Time (GMT). The first bit (bit 0, word 0) is Sunday, 0:00 to 0:59; the second bit (bit 1, word 0) is Sunday, 1:00 to 1:59; and so on. Note that bit 0 in word 0 represents Sunday from 0:00 to 0:59 only if you are in the GMT time zone. In all other cases you must adjust the bits according to your time zone offset (for example, GMT minus 8 hours for Pacific Standard Time).
     * @type {Pointer<Integer>}
     */
    usri1020_logon_hours {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
