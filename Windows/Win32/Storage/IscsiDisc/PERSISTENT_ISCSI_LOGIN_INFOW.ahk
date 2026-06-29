#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ISCSI_AUTH_TYPES.ahk" { ISCSI_AUTH_TYPES }
#Import ".\ISCSI_TARGET_PORTALW.ahk" { ISCSI_TARGET_PORTALW }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\ISCSI_TARGET_MAPPINGW.ahk" { ISCSI_TARGET_MAPPINGW }
#Import ".\ISCSI_LOGIN_OPTIONS.ahk" { ISCSI_LOGIN_OPTIONS }
#Import ".\ISCSI_DIGEST_TYPES.ahk" { ISCSI_DIGEST_TYPES }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * PERSISTENT_ISCSI_LOGIN_INFO structure contains information that describes a login session established by the Microsoft iSCSI initiator service after the machine boots up. (Unicode)
 * @remarks
 * The <b>PERSISTENT_ISCSI_LOGIN_INFO</b> structure is used in conjunction with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-reportiscsipersistentloginsa">ReportIScsiPersistentLogins</a> function to retrieve the list of targets for which the Microsoft Discovery Service (iscsiexe.exe) automatically opens a login session after the machine boots up.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The iscsidsc.h header defines PERSISTENT_ISCSI_LOGIN_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-persistent_iscsi_login_infow
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @charset Unicode
 */
export default struct PERSISTENT_ISCSI_LOGIN_INFOW {
    #StructPack 8

    /**
     * A string representing the name of the target the initiator will login to.
     */
    TargetName : WCHAR[224]

    /**
     * If set <b>TRUE</b>, the login session is for informational purposes only and will not result in the enumeration of the specified target on the local computer. For an informational login session, the LUNs on the target are not reported to the Plug and Play Manager and the device drivers for the target are not loaded.
     * 
     * A management application can still access targets not enumerated by the system via the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-sendscsiinquiry">SendScsiInquiry</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-sendscsireportluns">SendScsiReportLuns</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-sendscsireadcapacity">SendScsiReadCapcity</a> functions.
     * 
     * If set <b>FALSE</b>, the LUNs on the target are reported to the Plug and Play manager for enumeration.
     */
    IsInformationalSession : BOOLEAN

    /**
     * A string representing the name of the initiator used to login to the target.
     */
    InitiatorInstance : WCHAR[256]

    /**
     * The port number of the Host-Bus Adapter (HBA) through which the session login is established. A value of <b>ISCSI_ANY_INITIATOR_PORT</b> indicates that a port on the initiator is not currently specified.
     */
    InitiatorPortNumber : UInt32

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portala">ISCSI_TARGET_PORTAL</a> structure that describes the portal used by the Microsoft iSCSI initiator service to log on to the target.
     */
    TargetPortal : ISCSI_TARGET_PORTALW

    /**
     * A bitmap that defines the security characteristics of a login connection. 
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
     * The Host Bus Adapter (HBA) initiator should establish the TCP/IP connection to the target portal using IPsec tunnel mode. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED"></a><a id="iscsi_security_flag_transport_mode_preferred"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_TRANSPORT_MODE_PREFERRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HBA initiator should establish the TCP/IP connection to the target portal using IPsec transport mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_PFS_ENABLED"></a><a id="iscsi_security_flag_pfs_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_PFS_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HBA initiator should establish the TCP/IP connection to the target portal with Perfect Forward Secrecy (PFS) mode enabled if IPsec is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED"></a><a id="iscsi_security_flag_aggressive_mode_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_AGGRESSIVE_MODE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HBA initiator should establish the TCP/IP connection to the target portal with aggressive mode enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED"></a><a id="iscsi_security_flag_main_mode_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_MAIN_MODE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HBA initiator should establish the TCP/IP connection to the target portal with main mode enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED"></a><a id="iscsi_security_flag_ike_ipsec_enabled"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_IKE_IPSEC_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HBA initiator should establish the TCP/IP connection to the target portal using IKE/IPsec protocol. If not set then IPsec is not required to login to the target.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISCSI_SECURITY_FLAG_VALID"></a><a id="iscsi_security_flag_valid"></a><dl>
     * <dt><b>ISCSI_SECURITY_FLAG_VALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The other mask values are valid; otherwise, security flags are not specified.
     * 
     * </td>
     * </tr>
     * </table>
     */
    SecurityFlags : Int64

    /**
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_mappinga">ISCSI_TARGET_MAPPING</a> structure that contains information about a target, its logical units, HBAs, and buses through which it is reached.
     */
    Mappings : ISCSI_TARGET_MAPPINGW.Ptr

    /**
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_login_options">ISCSI_LOGIN_OPTIONS</a> structure that contains the persistent login characteristics.
     */
    LoginOptions : ISCSI_LOGIN_OPTIONS

}
