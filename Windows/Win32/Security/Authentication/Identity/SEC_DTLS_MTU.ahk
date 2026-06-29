#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores the DTLS MTU.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_dtls_mtu
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_DTLS_MTU {
    #StructPack 2

    /**
     * The path MTU for the connection.
     */
    PathMTU : UInt16

}
