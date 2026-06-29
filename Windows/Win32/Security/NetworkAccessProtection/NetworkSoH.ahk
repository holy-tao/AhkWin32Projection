#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the wire SoH protocol.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-networksoh
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
export default struct NetworkSoH {
    #StructPack 8

    /**
     * The size, in bytes, of the data blob in the range <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-type-constants">minNetworkSoHSize</a> to <b>maxNetworkSoHSize</b>.
     */
    size : UInt16

    /**
     * A pointer to a data blob that contains the <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-soh">SoH</a> structure in network byte order.
     */
    data : IntPtr

}
