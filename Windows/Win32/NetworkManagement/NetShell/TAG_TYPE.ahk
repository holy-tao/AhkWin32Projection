#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies tags used for the PreprocessCommand function.
 * @see https://learn.microsoft.com/windows/win32/api/netsh/ns-netsh-tag_type
 * @namespace Windows.Win32.NetworkManagement.NetShell
 * @version v4.0.30319
 */
class TAG_TYPE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A tag string, in UNICODE.
     * @type {Pointer<Ptr>}
     */
    pwszTag {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies whether the tag is required.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_REQ_ZERO"></a><a id="ns_req_zero"></a><dl>
     * <dt><b>NS_REQ_ZERO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Tag is optional.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_REQ_PRESENT"></a><a id="ns_req_present"></a><dl>
     * <dt><b>NS_REQ_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Tag must be present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_REQ_ALLOW_MULTIPLE"></a><a id="ns_req_allow_multiple"></a><dl>
     * <dt><b>NS_REQ_ALLOW_MULTIPLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Multiple copies of the tag is allowed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NS_REQ_ONE_OR_MORE"></a><a id="ns_req_one_or_more"></a><dl>
     * <dt><b>NS_REQ_ONE_OR_MORE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Multiple copies of the tag is allowed. Tag must be present.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwRequired {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * This value specifies whether the tag is present. <b>TRUE</b> indicates the tag is present.
     * @type {Integer}
     */
    bPresent {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
