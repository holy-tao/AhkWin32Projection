#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ICMP_HEADER.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class MLDV2_REPORT_HEADER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {ICMP_HEADER}
     */
    IcmpHeader{
        get {
            if(!this.HasProp("__IcmpHeader"))
                this.__IcmpHeader := ICMP_HEADER(0, this)
            return this.__IcmpHeader
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    RecordCount {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
