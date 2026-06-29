#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ADS_NETADDRESS structure is an ADSI representation of the Net Address attribute syntax.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_netaddress
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_NETADDRESS {
    #StructPack 8

    /**
     * Types of communication protocols.
     */
    AddressType : UInt32

    /**
     * Address length in bytes.
     */
    AddressLength : UInt32

    /**
     * A network address.
     */
    Address : IntPtr

}
