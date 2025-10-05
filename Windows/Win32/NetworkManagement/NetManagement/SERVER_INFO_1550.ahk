#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_INFO_1550 structure specifies the percentage of free disk space remaining before an alert message is sent.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1550
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_1550 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the percentage of free disk space remaining before an alert message is sent.
     * @type {Integer}
     */
    sv1550_diskspacethreshold {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
