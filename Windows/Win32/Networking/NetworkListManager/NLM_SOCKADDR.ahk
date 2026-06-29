#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * NLM_SOCKADDR structure contains the IPv4/IPv6 destination address.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ns-netlistmgr-nlm_sockaddr
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct NLM_SOCKADDR {
    #StructPack 1

    /**
     * An IPv4/IPv6 destination address.
     */
    data : Int8[128]

}
