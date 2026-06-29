#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IDPE_ATTR structure contains identity policy element attribute information.
 * @see https://learn.microsoft.com/windows/win32/api/qospol/ns-qospol-idpe_attr
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct IDPE_ATTR {
    #StructPack 2

    /**
     * Length of the entire <b>IDPE_ATTR</b> structure, in bytes.
     */
    PeAttribLength : UInt16

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
     */
    PeAttribType : Int8

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
     */
    PeAttribSubType : Int8

    /**
     * Policy element value.
     */
    PeAttribValue : Int8[4]

}
