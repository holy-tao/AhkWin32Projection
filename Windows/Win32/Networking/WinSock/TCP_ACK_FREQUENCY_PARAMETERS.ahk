#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class TCP_ACK_FREQUENCY_PARAMETERS extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {Integer}
     */
    TcpDelayedAckFrequency {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
