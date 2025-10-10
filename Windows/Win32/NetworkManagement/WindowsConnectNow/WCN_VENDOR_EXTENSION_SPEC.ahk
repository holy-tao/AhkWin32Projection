#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * WCN_VENDOR_EXTENSION_SPEC structure contains data that defines a vendor extension.
 * @see https://docs.microsoft.com/windows/win32/api//wcndevice/ns-wcndevice-wcn_vendor_extension_spec
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 * @version v4.0.30319
 */
class WCN_VENDOR_EXTENSION_SPEC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Set this value to the SMI Enterprise ID Number of the vendor that defines the vendor extension. For example, the Microsoft ID is '311' (WCN_MICROSOFT_VENDOR_ID).
     * @type {Integer}
     */
    VendorId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The subtype, as defined by the first two bytes of the vendor extension. If the vendor has  not provided the two-byte subtype prefix, use WCN_NO_SUBTYPE.
     * @type {Integer}
     */
    SubType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Distinguishes between multiple vendor extensions with the same VendorID and SubType. The index begins at zero.
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Applications must specify one of the following flag values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_FLAG_DISCOVERY_VE"></a><a id="wcn_flag_discovery_ve"></a><dl>
     * <dt><b>WCN_FLAG_DISCOVERY_VE</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The vendor extension was not available  before the session started. The vendor extension is not secure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_FLAG_AUTHENTICATED_VE"></a><a id="wcn_flag_authenticated_ve"></a><dl>
     * <dt><b>WCN_FLAG_AUTHENTICATED_VE</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The vendor extension is authentic. Only devices that pass authentication can read or write authenticated vendor extensions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WCN_FLAG_ENCRYPTED_VE"></a><a id="wcn_flag_encrypted_ve"></a><dl>
     * <dt><b>WCN_FLAG_ENCRYPTED_VE</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The vendor extension is authentic and encrypted. In addition to the guarantee of authenticated vendor extensions, vendor extensions are encrypted before transmission.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
