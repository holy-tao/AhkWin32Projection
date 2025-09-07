#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ISCSI_TARGET_PORTALA.ahk
#Include .\ISCSI_LOGIN_OPTIONS.ahk

/**
 * PERSISTENT_ISCSI_LOGIN_INFO structure contains information that describes a login session established by the Microsoft iSCSI initiator service after the machine boots up. (ANSI)
 * @remarks
 * The <b>PERSISTENT_ISCSI_LOGIN_INFO</b> structure is used in conjunction with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-reportiscsipersistentloginsa">ReportIScsiPersistentLogins</a> function to retrieve the list of targets for which the Microsoft Discovery Service (iscsiexe.exe) automatically opens a login session after the machine boots up.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The iscsidsc.h header defines PERSISTENT_ISCSI_LOGIN_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-persistent_iscsi_login_infoa
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 * @charset ANSI
 */
class PERSISTENT_ISCSI_LOGIN_INFOA extends Win32Struct
{
    static sizeof => 1088

    static packingSize => 8

    /**
     * A string representing the name of the target the initiator will login to.
     * @type {String}
     */
    TargetName {
        get => StrGet(this.ptr + 0, 223, "UTF-8")
        set => StrPut(value, this.ptr + 0, 223, "UTF-8")
    }

    /**
     * If set <b>TRUE</b>, the login session is for informational purposes only and will not result in the enumeration of the specified target on the local computer. For an informational login session, the LUNs on the target are not reported to the Plug and Play Manager and the device drivers for the target are not loaded.
     * 
     * A management application can still access targets not enumerated by the system via the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-sendscsiinquiry">SendScsiInquiry</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-sendscsireportluns">SendScsiReportLuns</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/nf-iscsidsc-sendscsireadcapacity">SendScsiReadCapcity</a> functions.
     * 
     * If set <b>FALSE</b>, the LUNs on the target are reported to the Plug and Play manager for enumeration.
     * @type {Integer}
     */
    IsInformationalSession {
        get => NumGet(this, 224, "char")
        set => NumPut("char", value, this, 224)
    }

    /**
     * A string representing the name of the initiator used to login to the target.
     * @type {String}
     */
    InitiatorInstance {
        get => StrGet(this.ptr + 225, 255, "UTF-8")
        set => StrPut(value, this.ptr + 225, 255, "UTF-8")
    }

    /**
     * The port number of the Host-Bus Adapter (HBA) through which the session login is established. A value of <b>ISCSI_ANY_INITIATOR_PORT</b> indicates that a port on the initiator is not currently specified.
     * @type {Integer}
     */
    InitiatorPortNumber {
        get => NumGet(this, 484, "uint")
        set => NumPut("uint", value, this, 484)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_portala">ISCSI_TARGET_PORTAL</a> structure that describes the portal used by the Microsoft iSCSI initiator service to log on to the target.
     * @type {ISCSI_TARGET_PORTALA}
     */
    TargetPortal{
        get {
            if(!this.HasProp("__TargetPortal"))
                this.__TargetPortal := ISCSI_TARGET_PORTALA(this.ptr + 488)
            return this.__TargetPortal
        }
    }

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
     * @type {Integer}
     */
    SecurityFlags {
        get => NumGet(this, 1008, "uint")
        set => NumPut("uint", value, this, 1008)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_target_mappinga">ISCSI_TARGET_MAPPING</a> structure that contains information about a target, its logical units, HBAs, and buses through which it is reached.
     * @type {Pointer<ISCSI_TARGET_MAPPINGA>}
     */
    Mappings {
        get => NumGet(this, 1016, "ptr")
        set => NumPut("ptr", value, this, 1016)
    }

    /**
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_login_options">ISCSI_LOGIN_OPTIONS</a> structure that contains the persistent login characteristics.
     * @type {ISCSI_LOGIN_OPTIONS}
     */
    LoginOptions{
        get {
            if(!this.HasProp("__LoginOptions"))
                this.__LoginOptions := ISCSI_LOGIN_OPTIONS(this.ptr + 1024)
            return this.__LoginOptions
        }
    }
}
