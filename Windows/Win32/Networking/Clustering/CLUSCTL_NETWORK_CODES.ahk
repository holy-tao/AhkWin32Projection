#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumerates network control codes.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-clusctl_network_codes
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSCTL_NETWORK_CODES{

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-unknown">CLUSCTL_NETWORK_UNKNOWN</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_UNKNOWN => 83886080

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-characteristics">CLUSCTL_NETWORK_GET_CHARACTERISTICS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_GET_CHARACTERISTICS => 83886085

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-flags">CLUSCTL_NETWORK_GET_FLAGS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_GET_FLAGS => 83886089

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-name">CLUSCTL_NETWORK_GET_NAME</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_GET_NAME => 83886121

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-id">CLUSCTL_NETWORK_GET_ID</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_GET_ID => 83886137

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-enum-common-properties">CLUSCTL_NETWORK_ENUM_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_ENUM_COMMON_PROPERTIES => 83886161

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-ro-common-properties">CLUSCTL_NETWORK_GET_RO_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_GET_RO_COMMON_PROPERTIES => 83886165

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-common-properties">CLUSCTL_NETWORK_GET_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_GET_COMMON_PROPERTIES => 83886169

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-set-common-properties">CLUSCTL_NETWORK_SET_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_SET_COMMON_PROPERTIES => 88080478

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-validate-common-properties">CLUSCTL_NETWORK_VALIDATE_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_VALIDATE_COMMON_PROPERTIES => 83886177

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-enum-private-properties">CLUSCTL_NETWORK_ENUM_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_ENUM_PRIVATE_PROPERTIES => 83886201

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-ro-private-properties">CLUSCTL_NETWORK_GET_RO_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_GET_RO_PRIVATE_PROPERTIES => 83886205

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-private-properties">CLUSCTL_NETWORK_GET_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_GET_PRIVATE_PROPERTIES => 83886209

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-set-private-properties">CLUSCTL_NETWORK_SET_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_SET_PRIVATE_PROPERTIES => 88080518

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-validate-private-properties">CLUSCTL_NETWORK_VALIDATE_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_VALIDATE_PRIVATE_PROPERTIES => 83886217

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-common-property-fmts">CLUSCTL_NETWORK_GET_COMMON_PROPERTY_FMTS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_GET_COMMON_PROPERTY_FMTS => 83886181

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-private-property-fmts">CLUSCTL_NETWORK_GET_PRIVATE_PROPERTY_FMTS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NETWORK_GET_PRIVATE_PROPERTY_FMTS => 83886221
}
