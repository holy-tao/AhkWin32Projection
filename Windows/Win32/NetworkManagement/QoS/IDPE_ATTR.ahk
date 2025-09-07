#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IDPE_ATTR structure contains identity policy element attribute information.
 * @see https://learn.microsoft.com/windows/win32/api/qospol/ns-qospol-idpe_attr
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class IDPE_ATTR extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * Length of the entire <b>IDPE_ATTR</b> structure, in bytes.
     * @type {Integer}
     */
    PeAttribLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Policy element attribute type. Must be the following type:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PE_ATTRIB_TYPE_POLICY_LOCATOR"></a><a id="pe_attrib_type_policy_locator"></a><dl>
     * <dt><b>PE_ATTRIB_TYPE_POLICY_LOCATOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Policy locator type.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    PeAttribType {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Policy element attribute subtype. Must be the following type:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POLICY_LOCATOR_SUB_TYPE_ASCII_DN"></a><a id="policy_locator_sub_type_ascii_dn"></a><dl>
     * <dt><b>POLICY_LOCATOR_SUB_TYPE_ASCII_DN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sub type is ASCII.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POLICY_LOCATOR_SUB_TYPE_UNICODE_DN"></a><a id="policy_locator_sub_type_unicode_dn"></a><dl>
     * <dt><b>POLICY_LOCATOR_SUB_TYPE_UNICODE_DN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sub type is UNICODE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POLICY_LOCATOR_SUB_TYPE_ASCII_DN_ENC"></a><a id="policy_locator_sub_type_ascii_dn_enc"></a><dl>
     * <dt><b>POLICY_LOCATOR_SUB_TYPE_ASCII_DN_ENC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sub type is encoded ASCII.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POLICY_LOCATOR_SUB_TYPE_UNICODE_DN_ENC"></a><a id="policy_locator_sub_type_unicode_dn_enc"></a><dl>
     * <dt><b>POLICY_LOCATOR_SUB_TYPE_UNICODE_DN_ENC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sub type is encoded UNICODE.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    PeAttribSubType {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * Policy element value.
     * @type {Array<Byte>}
     */
    PeAttribValue{
        get {
            if(!this.HasProp("__PeAttribValueProxyArray"))
                this.__PeAttribValueProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__PeAttribValueProxyArray
        }
    }
}
