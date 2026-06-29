#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the input structure used by the [SIO_TIMESTAMPING](/windows/win32/winsock/winsock-ioctls#sio_timestamping) IOCTL to configure timestamp reception for a datagram socket.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-timestamping_config
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct TIMESTAMPING_CONFIG {
    #StructPack 4

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * Enable/disable timestamp reception for rx/tx direction.
     * 
     * Use the values **TIMESTAMPING_FLAG_RX** (0x1) and **TIMESTAMPING_FLAG_TX** (0x2) (both defined in `mstcpip.h`). Specify a value to enable timestamp reception for that direction; and omit a value to disable timestamp reception for that direction.
     */
    Flags : UInt32

    /**
     * Type: **[USHORT](/windows/win32/winprog/windows-data-types)**
     * 
     * Determines how many tx timestamps may be buffered. When the count of tx timestamps that have been buffered reaches a value equal to *TxTimestampsBuffered*, and a new tx timestamp has been generated, the new timestamp will be discarded.
     */
    TxTimestampsBuffered : UInt16

}
