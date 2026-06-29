#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AsnObjectIdentifier structure represents object identifiers. This structure is used by multiple SNMP functions. This structure is not used by the WinSNMP API functions.
 * @see https://learn.microsoft.com/windows/win32/api/snmp/ns-snmp-asnobjectidentifier
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @architecture X64, Arm64
 */
export default struct AsnObjectIdentifier {
    #StructPack 8

    /**
     * Specifies the number of integers in the object identifier.
     */
    idLength : UInt32

    /**
     * Pointer to an array of integers that represents the object identifier.
     */
    ids : IntPtr

}
