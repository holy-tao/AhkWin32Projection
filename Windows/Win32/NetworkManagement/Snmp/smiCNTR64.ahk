#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WinSNMP smiCNTR64 structure contains a 64-bit unsigned integer value. The structure represents a 64-bit counter.
 * @see https://learn.microsoft.com/windows/win32/api/winsnmp/ns-winsnmp-smicntr64
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct smiCNTR64 {
    #StructPack 4

    /**
     * Specifies the high-order 32 bits of the counter.
     */
    hipart : UInt32

    /**
     * Specifies the low-order 32 bits of the counter.
     */
    lopart : UInt32

}
