#Requires AutoHotkey v2.0.0 64-bit

/**
 * Types of provider contexts that may be stored in Base Filtering Engine (BFE).
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ne-fwpmtypes-fwpm_provider_context_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_PROVIDER_CONTEXT_TYPE{

    /**
     * Specifies keying context type.
     * @type {Integer (Int32)}
     */
    static FWPM_IPSEC_KEYING_CONTEXT => 0

    /**
     * Specifies IPsec IKE quick mode transport context type.
     * @type {Integer (Int32)}
     */
    static FWPM_IPSEC_IKE_QM_TRANSPORT_CONTEXT => 1

    /**
     * Specifies IPsec IKE quick mode tunnel context type.
     * @type {Integer (Int32)}
     */
    static FWPM_IPSEC_IKE_QM_TUNNEL_CONTEXT => 2

    /**
     * Specifies IPsec AuthIP quick mode transport context type.
     * @type {Integer (Int32)}
     */
    static FWPM_IPSEC_AUTHIP_QM_TRANSPORT_CONTEXT => 3

    /**
     * Specifies IPsec Authip quick mode tunnel context type.
     * @type {Integer (Int32)}
     */
    static FWPM_IPSEC_AUTHIP_QM_TUNNEL_CONTEXT => 4

    /**
     * Specifies IKE main mode context type.
     * @type {Integer (Int32)}
     */
    static FWPM_IPSEC_IKE_MM_CONTEXT => 5

    /**
     * Specifies AuthIP main mode context type.
     * @type {Integer (Int32)}
     */
    static FWPM_IPSEC_AUTHIP_MM_CONTEXT => 6

    /**
     * Specifies classify options context type.
     * @type {Integer (Int32)}
     */
    static FWPM_CLASSIFY_OPTIONS_CONTEXT => 7

    /**
     * Specifies general context type.
     * @type {Integer (Int32)}
     */
    static FWPM_GENERAL_CONTEXT => 8

    /**
     * Specifies IKE v2 quick mode tunnel context type.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows Server 2008 R2, Windows 7, and later.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static FWPM_IPSEC_IKEV2_QM_TUNNEL_CONTEXT => 9

    /**
     * Specifies IKE v2 main mode tunnel context type.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows Server 2008 R2, Windows 7, and later.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static FWPM_IPSEC_IKEV2_MM_CONTEXT => 10

    /**
     * Specifies IPsec DoS Protection context type.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows Server 2008 R2, Windows 7, and later.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static FWPM_IPSEC_DOSP_CONTEXT => 11

    /**
     * Specifies IKE v2 quick mode transport context type.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 8 and Windows 8.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static FWPM_IPSEC_IKEV2_QM_TRANSPORT_CONTEXT => 12

    /**
     * @type {Integer (Int32)}
     */
    static FWPM_NETWORK_CONNECTION_POLICY_CONTEXT => 13

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static FWPM_PROVIDER_CONTEXT_TYPE_MAX => 14
}
