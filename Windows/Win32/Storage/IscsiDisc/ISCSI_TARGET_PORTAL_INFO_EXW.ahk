#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ISCSI_LOGIN_OPTIONS.ahk

/**
 * The ISCSI_TARGET_PORTAL_INFO_EX structure contains information about login credentials to a target portal.
 * @remarks
 * 
  * > [!NOTE]
  * > The iscsidsc.h header defines ISCSI_TARGET_PORTAL_INFO_EX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iscsidsc/ns-iscsidsc-iscsi_target_portal_info_exw
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 * @charset Unicode
 */
class ISCSI_TARGET_PORTAL_INFO_EXW extends Win32Struct
{
    static sizeof => 1616

    static packingSize => 8

    /**
     * A string that represents the name of the Host-Bus Adapter (HBA) initiator.
     * @type {String}
     */
    InitiatorName {
        get => StrGet(this.ptr + 0, 255, "UTF-16")
        set => StrPut(value, this.ptr + 0, 255, "UTF-16")
    }

    /**
     * A <b>ULONG</b>  value that represents the port number on the HBA associated with the portal.
     * @type {Integer}
     */
    InitiatorPortNumber {
        get => NumGet(this, 512, "uint")
        set => NumPut("uint", value, this, 512)
    }

    /**
     * A string that represents the symbolic name associated with the portal.
     * @type {String}
     */
    SymbolicName {
        get => StrGet(this.ptr + 516, 255, "UTF-16")
        set => StrPut(value, this.ptr + 516, 255, "UTF-16")
    }

    /**
     * A string that represents the IP address or DNS name associated with the portal.
     * @type {String}
     */
    Address {
        get => StrGet(this.ptr + 1028, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1028, 255, "UTF-16")
    }

    /**
     * A <b>USHORT</b> value that represents the socket number.
     * @type {Integer}
     */
    Socket {
        get => NumGet(this, 1540, "ushort")
        set => NumPut("ushort", value, this, 1540)
    }

    /**
     * A pointer to an <b>ISCSI_SECURITY_FLAGS</b> structure that contains a bitmap that defines the security charactaristics of a login connection.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED"></a><a id="iscsi_security_flag_tunnel_mode_preferred"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection in IPsec tunnel mode. Caller should set this flag or the <b>ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED</b> flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED"></a><a id="iscsi_security_flag_transport_mode_preferred"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection in IPsec transport mode. Caller should set this flag or the <b>ISCSI_SECURITY_FLAG_TUNNEL_MODE_PREFERRED</b> flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_PFS_ENABLED"></a><a id="iscsi_security_flag_pfs_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_PFS_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with Perfect Forward Secrecy (PFS) mode enabled; otherwise, the initiator should make the connection with PFS mode disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED"></a><a id="iscsi_security_flag_aggressive_mode_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with aggressive mode enabled. Caller should set this flag or the <b>ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED</b> flag, but not both. 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  The Microsoft software initiator driver does not support aggressive mode.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED"></a><a id="iscsi_security_flag_main_mode_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with main mode enabled. Caller should set this flag or the <b>ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED</b> flag, but not both.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED"></a><a id="iscsi_security_flag_ike_ipsec_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the initiator should make the connection with the IKE/IPsec protocol enabled; otherwise, the IKE/IPsec protocol is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_VALID"></a><a id="iscsi_security_flag_valid"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_VALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When set to 1, the other mask values are valid; otherwise, the iSCSI initiator service will use bitmap values that were previously defined for the target portal, or if none are available, the initiator service uses the default values defined in the registry. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    SecurityFlags {
        get => NumGet(this, 1544, "uint")
        set => NumPut("uint", value, this, 1544)
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_login_options">ISCSI_LOGIN_OPTIONS</a> structure that defines the login data.
     * @type {ISCSI_LOGIN_OPTIONS}
     */
    LoginOptions{
        get {
            if(!this.HasProp("__LoginOptions"))
                this.__LoginOptions := ISCSI_LOGIN_OPTIONS(1552, this)
            return this.__LoginOptions
        }
    }
}
