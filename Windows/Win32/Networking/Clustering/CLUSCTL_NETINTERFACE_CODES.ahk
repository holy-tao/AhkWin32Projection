#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumerates Network Interface control codes.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-clusctl_netinterface_codes
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSCTL_NETINTERFACE_CODES{

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-unknown">CLUSCTL_NETINTERFACE_UNKNOWN</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_UNKNOWN => 100663296

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-characteristics">CLUSCTL_NETINTERFACE_GET_CHARACTERISTICS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_GET_CHARACTERISTICS => 100663301

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-flags">CLUSCTL_NETINTERFACE_GET_FLAGS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_GET_FLAGS => 100663305

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-name">CLUSCTL_NETINTERFACE_GET_NAME</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_GET_NAME => 100663337

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-id">CLUSCTL_NETINTERFACE_GET_ID</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_GET_ID => 100663353

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-node">CLUSCTL_NETINTERFACE_GET_NODE</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_GET_NODE => 100663345

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-network">CLUSCTL_NETINTERFACE_GET_NETWORK</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_GET_NETWORK => 100663349

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-enum-common-properties">CLUSCTL_NETINTERFACE_ENUM_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_ENUM_COMMON_PROPERTIES => 100663377

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-ro-common-properties">CLUSCTL_NETINTERFACE_GET_RO_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_GET_RO_COMMON_PROPERTIES => 100663381

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-common-properties">CLUSCTL_NETINTERFACE_GET_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_GET_COMMON_PROPERTIES => 100663385

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-set-common-properties">CLUSCTL_NETINTERFACE_SET_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_SET_COMMON_PROPERTIES => 104857694

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-validate-common-properties">CLUSCTL_NETINTERFACE_VALIDATE_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_VALIDATE_COMMON_PROPERTIES => 100663393

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-enum-private-properties">CLUSCTL_NETINTERFACE_ENUM_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_ENUM_PRIVATE_PROPERTIES => 100663417

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-ro-private-properties">CLUSCTL_NETINTERFACE_GET_RO_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_GET_RO_PRIVATE_PROPERTIES => 100663421

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-private-properties">CLUSCTL_NETINTERFACE_GET_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_GET_PRIVATE_PROPERTIES => 100663425

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-set-private-properties">CLUSCTL_NETINTERFACE_SET_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_SET_PRIVATE_PROPERTIES => 104857734

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-validate-private-properties">CLUSCTL_NETINTERFACE_VALIDATE_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_VALIDATE_PRIVATE_PROPERTIES => 100663433

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-common-property-fmts">CLUSCTL_NETINTERFACE_GET_COMMON_PROPERTY_FMTS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_GET_COMMON_PROPERTY_FMTS => 100663397

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-private-property-fmts">CLUSCTL_NETINTERFACE_GET_PRIVATE_PROPERTY_FMTS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETINTERFACE_GET_PRIVATE_PROPERTY_FMTS => 100663437
}
