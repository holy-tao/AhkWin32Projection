#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the input structure used by the [SIO_TIMESTAMPING](/windows/win32/winsock/winsock-ioctls#sio_timestamping) IOCTL to configure timestamp reception for a datagram socket.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-timestamping_config
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class TIMESTAMPING_CONFIG extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * Enable/disable timestamp reception for rx/tx direction.
     * 
     * Use the values **TIMESTAMPING_FLAG_RX** (0x1) and **TIMESTAMPING_FLAG_TX** (0x2) (both defined in `mstcpip.h`). Specify a value to enable timestamp reception for that direction; and omit a value to disable timestamp reception for that direction.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[USHORT](/windows/win32/winprog/windows-data-types)**
     * 
     * Determines how many tx timestamps may be buffered. When the count of tx timestamps that have been buffered reaches a value equal to *TxTimestampsBuffered*, and a new tx timestamp has been generated, the new timestamp will be discarded.
     * @type {Integer}
     */
    TxTimestampsBuffered {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}
