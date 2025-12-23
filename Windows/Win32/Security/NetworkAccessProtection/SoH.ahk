#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the Statement of Health (SoH) data.
 * @remarks
 * SoH packets are collections of attributes, stored as type-length-value objects (TLVs). The attribute type is specified by <a href="https://docs.microsoft.com/windows/desktop/NAP/sohattributetype-enum">SoHAttributeType</a>, and the attribute value is specified by <a href="https://docs.microsoft.com/windows/desktop/NAP/sohattributevalue-union">SoHAttributeValue</a>. The TLVs are ordered
 * such that certain TLVs (such as the <b>sohAttributeTypeSystemHealthId</b> TLV or the 
 * <b>sohAttributeTypeHealthClass</b> TLV) separate groups or 
 * sub-groups of TLVs.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/NAP/sohattributetype-enum">sohAttributeTypeSystemHealthId</a> TLV must be the first TLV in both <b>SoHRequest</b> and <b>SoHResponse</b> packets.
 * A <b>SoHResponse</b> packet can have at most one <b>sohAttributeTypeIpv4FixupServers</b> or <b>sohAttributeTypeIpv6FixupServers</b> TLV.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-soh
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class SoH extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of attributes contained in the SoH as a number between 0 (zero) and <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-type-constants">maxSoHAttributeCount</a>.
     * @type {Integer}
     */
    count {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-sohattribute">SoHAttribute</a> structures that contain the collection of attributes defined by this SoH.
     * @type {Pointer<SoHAttribute>}
     */
    attributes {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
