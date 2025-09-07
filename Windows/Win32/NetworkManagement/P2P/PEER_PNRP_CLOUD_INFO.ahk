#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a Peer Name Resolution Protocol (PNRP) cloud.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_pnrp_cloud_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_PNRP_CLOUD_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to a zero-terminated Unicode string that contains the name of the PNRP cloud. The maximum size of this name is 256 characters.
     * @type {Pointer<Ptr>}
     */
    pwzCloudName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Constant value that specifies the network scope of the PNRP cloud.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PNRP_SCOPE_ANY"></a><a id="pnrp_scope_any"></a><dl>
     * <dt><b>PNRP_SCOPE_ANY</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All IP addresses are allowed to register with the PNRP cloud.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PNRP_GLOBAL_SCOPE"></a><a id="pnrp_global_scope"></a><dl>
     * <dt><b>PNRP_GLOBAL_SCOPE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The scope is global; all valid  IP addresses are allowed to register with the PNRP cloud.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PNRP_SITE_LOCAL_SCOPE"></a><a id="pnrp_site_local_scope"></a><dl>
     * <dt><b>PNRP_SITE_LOCAL_SCOPE</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The scope is site-local; only IP addresses defined for the site are allowed to register with the PNRP cloud.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PNRP_LINK_LOCAL_SCOPE"></a><a id="pnrp_link_local_scope"></a><dl>
     * <dt><b>PNRP_LINK_LOCAL_SCOPE</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The scope is link-local; only IP addresses defined for the local area network are allowed to register with the PNRP cloud.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwScope {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The ID of a specific IP address scope defined for the PNRP cloud.
     * @type {Integer}
     */
    dwScopeId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
