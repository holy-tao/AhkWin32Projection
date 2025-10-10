#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WinSNMP smiCNTR64 structure contains a 64-bit unsigned integer value. The structure represents a 64-bit counter.
 * @see https://docs.microsoft.com/windows/win32/api//winsnmp/ns-winsnmp-smicntr64
 * @namespace Windows.Win32.NetworkManagement.Snmp
 * @version v4.0.30319
 */
class smiCNTR64 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the high-order 32 bits of the counter.
     * @type {Integer}
     */
    hipart {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the low-order 32 bits of the counter.
     * @type {Integer}
     */
    lopart {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
