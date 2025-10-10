#Requires AutoHotkey v2.0.0 64-bit

/**
 * The FWP_CLASSIFY_OPTION_TYPE enumerated type is used by callouts and shims during run-time classification.FWP_CLASSIFY_OPTION_TYPE specifies timeout options for unicast, multicast, and loose source mapping states and enables blocking or permission of state creation on outbound multicast and broadcast traffic.
 * @see https://docs.microsoft.com/windows/win32/api//fwptypes/ne-fwptypes-fwp_classify_option_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_CLASSIFY_OPTION_TYPE{

    /**
     * Specifies the multicast conditions on outbound traffic. See [FWPM_CLASSIFY_OPTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_classify_option0) for possible values.
     * @type {Integer (Int32)}
     */
    static FWP_CLASSIFY_OPTION_MULTICAST_STATE => 0

    /**
     * Specifies the source mapping conditions for callout filters. See [FWPM_CLASSIFY_OPTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_classify_option0) for possible values.
 * 
 *  Loose source mapping allows unicast responses from a remote peer to match only the port number, instead of the entire source address.
     * @type {Integer (Int32)}
     */
    static FWP_CLASSIFY_OPTION_LOOSE_SOURCE_MAPPING => 1

    /**
     * Specifies the unicast state lifetime, in seconds.
     * @type {Integer (Int32)}
     */
    static FWP_CLASSIFY_OPTION_UNICAST_LIFETIME => 2

    /**
     * Specifies the multicast/broadcast state lifetime, in seconds.
     * @type {Integer (Int32)}
     */
    static FWP_CLASSIFY_OPTION_MCAST_BCAST_LIFETIME => 3

    /**
     * Specifies that the callout can set secure socket settings on the endpoint.    Such flags are only allowed to increase the overall security level. The possible values are defined in the <i>Mstcpip.h</i> header file.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>SOCKET_SETTINGS_GUARANTEE_ENCRYPTION 0x00000001 </td>
 * <td>Indicates that guaranteed encryption of traffic is required.  This flag should be set if the default policy prefers methods of protection that do not use encryption. If this flag is set and encryption is not possible for any reason, no packets will be sent and a connection will not be established.</td>
 * </tr>
 * <tr>
 * <td>SOCKET_SETTINGS_ALLOW_INSECURE 0x00000002 </td>
 * <td>Indicates that clear text connections are allowed.  If this flag is set, some or all of the sent packets will be sent in clear text, especially if security with the peer could not be negotiated.<div class="alert"><b>Note</b>  If this flag is not set, it is guaranteed that packets will never be sent in clear text, even if security negotiation fails.</div>
 * <div> </div>
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * <div class="alert"><b>Note</b>  Available only in Windows 7,  Windows Server 2008 R2, and later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static FWP_CLASSIFY_OPTION_SECURE_SOCKET_SECURITY_FLAGS => 4

    /**
     * Allows the callout to specify the specific main mode (MM) policy used for the connection.   
 * 
 * <div class="alert"><b>Note</b>  Available only in Windows 7,  Windows Server 2008 R2, and later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static FWP_CLASSIFY_OPTION_SECURE_SOCKET_AUTHIP_MM_POLICY_KEY => 5

    /**
     * Allows the callout to specify the specific quick mode (QM) policy used for the connection.   
 * 
 * <div class="alert"><b>Note</b>  Available only in Windows 7,  Windows Server 2008 R2, and later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static FWP_CLASSIFY_OPTION_SECURE_SOCKET_AUTHIP_QM_POLICY_KEY => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static FWP_CLASSIFY_OPTION_LOCAL_ONLY_MAPPING => 7

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static FWP_CLASSIFY_OPTION_MAX => 8
}
