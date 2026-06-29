#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Specifies tags used for the PreprocessCommand function.
 * @see https://learn.microsoft.com/windows/win32/api/netsh/ns-netsh-tag_type
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct TAG_TYPE {
    #StructPack 8

    /**
     * A tag string, in UNICODE.
     */
    pwszTag : PWSTR

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
     */
    dwRequired : UInt32

    /**
     * This value specifies whether the tag is present. <b>TRUE</b> indicates the tag is present.
     */
    bPresent : BOOL

}
