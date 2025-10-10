#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1018 structure contains information about how much the announce rate can vary for the specified server.
 * @see https://docs.microsoft.com/windows/win32/api//lmserver/ns-lmserver-server_info_1018
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1018 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the delta value for the announce rate, in milliseconds. This value specifies how much the announce rate can vary from the period of time specified in the sv<i>X</i>_announce member. 
     * 
     * 
     * 
     * 
     * The delta value allows randomly varied announce rates. For example, if the sv<i>X</i>_announce member has the value 10 and the sv<i>X</i>_anndelta member has the value 1, the announce rate can vary from 9.999 seconds to 10.001 seconds. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_info_102">SERVER_INFO_102</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_info_1017">SERVER_INFO_1017</a>.
     * @type {Integer}
     */
    sv1018_anndelta {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
