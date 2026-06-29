#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SCARD\_IO\_REQUEST structure begins a protocol control information structure.
 * @see https://learn.microsoft.com/windows/win32/SecAuthN/scard-io-request
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct SCARD_IO_REQUEST {
    #StructPack 4

    /**
     * Protocol in use.
     */
    dwProtocol : UInt32

    /**
     * Length, in bytes, of the **SCARD\_IO\_REQUEST** structure plus any following PCI-specific information.
     */
    cbPciLength : UInt32

}
