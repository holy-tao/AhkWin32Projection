#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SCARD\_IO\_REQUEST structure begins a protocol control information structure.
 * @see https://learn.microsoft.com/windows/win32/SecAuthN/scard-io-request
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class SCARD_IO_REQUEST extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Protocol in use.
     * @type {Integer}
     */
    dwProtocol {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Length, in bytes, of the **SCARD\_IO\_REQUEST** structure plus any following PCI-specific information.
     * @type {Integer}
     */
    cbPciLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
