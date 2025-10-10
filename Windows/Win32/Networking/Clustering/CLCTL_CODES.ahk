#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumerates the possible operations that a control code will perform.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-clctl_codes
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLCTL_CODES{

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-unknown">CLUSCTL_CLUSTER_UNKNOWN</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-unknown">CLUSCTL_GROUP_UNKNOWN</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-unknown">CLUSCTL_NETINTERFACE_UNKNOWN</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-unknown">CLUSCTL_NETWORK_UNKNOWN</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-unknown">CLUSCTL_NODE_UNKNOWN</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-unknown">CLUSCTL_RESOURCE_TYPE_UNKNOWN</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-unknown">CLUSCTL_RESOURCE_UNKNOWN</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_UNKNOWN => 0

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-characteristics">CLUSCTL_GROUP_GET_CHARACTERISTICS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-characteristics">CLUSCTL_NETINTERFACE_GET_CHARACTERISTICS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-characteristics">CLUSCTL_NETWORK_GET_CHARACTERISTICS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-characteristics">CLUSCTL_NODE_GET_CHARACTERISTICS</a>,
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-characteristics">CLUSCTL_RESOURCE_GET_CHARACTERISTICS</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-characteristics">CLUSCTL_RESOURCE_TYPE_GET_CHARACTERISTICS</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_CHARACTERISTICS => 5

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-flags">CLUSCTL_GROUP_GET_FLAGS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-flags">CLUSCTL_NETINTERFACE_GET_FLAGS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-flags">CLUSCTL_NETWORK_GET_FLAGS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-flags">CLUSCTL_NODE_GET_FLAGS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-flags">CLUSCTL_RESOURCE_GET_FLAGS</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-flags">CLUSCTL_RESOURCE_TYPE_GET_FLAGS</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_FLAGS => 9

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-class-info">CLUSCTL_RESOURCE_GET_CLASS_INFO</a> 
 *        and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-class-info">CLUSCTL_RESOURCE_TYPE_GET_CLASS_INFO</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_CLASS_INFO => 13

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-required-dependencies">CLUSCTL_RESOURCE_GET_REQUIRED_DEPENDENCIES</a> and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-required-dependencies">CLUSCTL_RESOURCE_TYPE_GET_REQUIRED_DEPENDENCIES</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_REQUIRED_DEPENDENCIES => 17

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-arb-timeout">CLUSCTL_RESOURCE_TYPE_GET_ARB_TIMEOUT</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_ARB_TIMEOUT => 21

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-failure-info">CLUSCTL_RESOURCE_GET_FAILURE_INFO</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_FAILURE_INFO => 25

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-name">CLUSCTL_GROUP_GET_NAME</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-name">CLUSCTL_NETINTERFACE_GET_NAME</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-name">CLUSCTL_NETWORK_GET_NAME</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-name">CLUSCTL_NODE_GET_NAME</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-name">CLUSCTL_RESOURCE_GET_NAME</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_NAME => 41

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-resource-type">CLUSCTL_RESOURCE_GET_RESOURCE_TYPE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_RESOURCE_TYPE => 45

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-node">CLUSCTL_NETINTERFACE_GET_NODE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_NODE => 49

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-network">CLUSCTL_NETINTERFACE_GET_NETWORK</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_NETWORK => 53

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-id">CLUSCTL_GROUP_GET_ID</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-id">CLUSCTL_NETINTERFACE_GET_ID</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-id">CLUSCTL_NETWORK_GET_ID</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-id">CLUSCTL_NODE_GET_ID</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-id">CLUSCTL_RESOURCE_GET_ID</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_ID => 57

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-fqdn">CLUSCTL_CLUSTER_GET_FQDN</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_FQDN => 61

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-cluster-service-account-name">CLUSCTL_NODE_GET_CLUSTER_SERVICE_ACCOUNT_NAME</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_CLUSTER_SERVICE_ACCOUNT_NAME => 65

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-check-voter-evict">CLUSCTL_CLUSTER_CHECK_VOTER_EVICT</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_CHECK_VOTER_EVICT => 69

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-check-voter-down">CLUSCTL_CLUSTER_CHECK_VOTER_DOWN</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_CHECK_VOTER_DOWN => 73

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-shutdown">CLUSCTL_CLUSTER_SHUTDOWN</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_SHUTDOWN => 77

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-enum-common-properties">CLUSCTL_CLUSTER_ENUM_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-enum-common-properties">CLUSCTL_GROUP_ENUM_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-enum-common-properties">CLUSCTL_NETINTERFACE_ENUM_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-enum-common-properties">CLUSCTL_NETWORK_ENUM_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-enum-common-properties">CLUSCTL_NODE_ENUM_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-enum-common-properties">CLUSCTL_RESOURCE_ENUM_COMMON_PROPERTIES</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-enum-common-properties">CLUSCTL_RESOURCE_TYPE_ENUM_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_ENUM_COMMON_PROPERTIES => 81

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-ro-common-properties">CLUSCTL_CLUSTER_GET_RO_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-get-ro-common-properties">CLUSCTL_COLLECTION_GET_RO_COMMON_PROPERTIES</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-ro-common-properties">CLUSCTL_GROUP_GET_RO_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-ro-common-properties">CLUSCTL_NETINTERFACE_GET_RO_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-ro-common-properties">CLUSCTL_NETWORK_GET_RO_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-ro-common-properties">CLUSCTL_NODE_GET_RO_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-ro-common-properties">CLUSCTL_RESOURCE_GET_RO_COMMON_PROPERTIES</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-ro-common-properties">CLUSCTL_RESOURCE_TYPE_GET_RO_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_RO_COMMON_PROPERTIES => 85

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-common-properties">CLUSCTL_CLUSTER_GET_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-get-common-properties">CLUSCTL_COLLECTION_GET_COMMON_PROPERTIES</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-common-properties">CLUSCTL_GROUP_GET_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-common-properties">CLUSCTL_NETINTERFACE_GET_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-common-properties">CLUSCTL_NETWORK_GET_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-common-properties">CLUSCTL_NODE_GET_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-common-properties">CLUSCTL_RESOURCE_GET_COMMON_PROPERTIES</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-common-properties">CLUSCTL_RESOURCE_TYPE_GET_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_COMMON_PROPERTIES => 89

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-set-common-properties">CLUSCTL_CLUSTER_SET_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-set-common-properties">CLUSCTL_COLLECTION_SET_COMMON_PROPERTIES</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-set-common-properties">CLUSCTL_GROUP_SET_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-set-common-properties">CLUSCTL_NETINTERFACE_SET_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-set-common-properties">CLUSCTL_NETWORK_SET_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-set-common-properties">CLUSCTL_NODE_SET_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-common-properties">CLUSCTL_RESOURCE_SET_COMMON_PROPERTIES</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-set-common-properties">CLUSCTL_RESOURCE_TYPE_SET_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_COMMON_PROPERTIES => 4194398

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-validate-common-properties">CLUSCTL_CLUSTER_VALIDATE_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-validate-common-properties">CLUSCTL_GROUP_VALIDATE_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-validate-common-properties">CLUSCTL_NETINTERFACE_VALIDATE_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-validate-common-properties">CLUSCTL_NETWORK_VALIDATE_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-validate-common-properties">CLUSCTL_NODE_VALIDATE_COMMON_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-validate-common-properties">CLUSCTL_RESOURCE_TYPE_VALIDATE_COMMON_PROPERTIES</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-validate-common-properties">CLUSCTL_RESOURCE_VALIDATE_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_VALIDATE_COMMON_PROPERTIES => 97

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-common-property-fmts">CLUSCTL_CLUSTER_GET_COMMON_PROPERTY_FMTS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-common-property-fmts">CLUSCTL_GROUP_GET_COMMON_PROPERTY_FMTS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-common-property-fmts">CLUSCTL_NETINTERFACE_GET_COMMON_PROPERTY_FMTS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-common-property-fmts">CLUSCTL_NETWORK_GET_COMMON_PROPERTY_FMTS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-common-property-fmts">CLUSCTL_NODE_GET_COMMON_PROPERTY_FMTS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-common-property-fmts">CLUSCTL_RESOURCE_GET_COMMON_PROPERTY_FMTS</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-common-property-fmts">CLUSCTL_RESOURCE_TYPE_GET_COMMON_PROPERTY_FMTS</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_COMMON_PROPERTY_FMTS => 101

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-common-resource-property-fmts">CLUSCTL_RESOURCE_TYPE_GET_COMMON_RESOURCE_PROPERTY_FMTS</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_COMMON_RESOURCE_PROPERTY_FMTS => 105

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_CHECK_VOTER_EVICT_WITNESS => 109

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_CHECK_VOTER_DOWN_WITNESS => 113

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-enum-private-properties">CLUSCTL_CLUSTER_ENUM_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-enum-private-properties">CLUSCTL_GROUP_ENUM_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-enum-private-properties">CLUSCTL_NETINTERFACE_ENUM_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-enum-private-properties">CLUSCTL_NETWORK_ENUM_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-enum-private-properties">CLUSCTL_NODE_ENUM_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-enum-private-properties">CLUSCTL_RESOURCE_ENUM_PRIVATE_PROPERTIES</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-enum-private-properties">CLUSCTL_RESOURCE_TYPE_ENUM_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_ENUM_PRIVATE_PROPERTIES => 121

    /**
     * see 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-ro-private-properties">CLUSCTL_CLUSTER_GET_RO_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-ro-private-properties">CLUSCTL_GROUP_GET_RO_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-ro-private-properties">CLUSCTL_NETINTERFACE_GET_RO_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-ro-private-properties">CLUSCTL_NETWORK_GET_RO_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-ro-private-properties">CLUSCTL_NODE_GET_RO_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-ro-private-properties">CLUSCTL_RESOURCE_GET_RO_PRIVATE_PROPERTIES</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-ro-private-properties">CLUSCTL_RESOURCE_TYPE_GET_RO_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_RO_PRIVATE_PROPERTIES => 125

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-private-properties">CLUSCTL_CLUSTER_GET_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-private-properties">CLUSCTL_GROUP_GET_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-private-properties">CLUSCTL_NETINTERFACE_GET_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-private-properties">CLUSCTL_NETWORK_GET_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-private-properties">CLUSCTL_NODE_GET_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-private-properties">CLUSCTL_RESOURCE_GET_PRIVATE_PROPERTIES</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-private-properties">CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_PRIVATE_PROPERTIES => 129

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-set-private-properties">CLUSCTL_CLUSTER_SET_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-set-private-properties">CLUSCTL_GROUP_SET_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-set-private-properties">CLUSCTL_NETINTERFACE_SET_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-set-private-properties">CLUSCTL_NETWORK_SET_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-set-private-properties">CLUSCTL_NODE_SET_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-private-properties">CLUSCTL_RESOURCE_SET_PRIVATE_PROPERTIES</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-set-private-properties">CLUSCTL_RESOURCE_TYPE_SET_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_PRIVATE_PROPERTIES => 4194438

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-validate-private-properties">CLUSCTL_CLUSTER_VALIDATE_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-validate-private-properties">CLUSCTL_GROUP_VALIDATE_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-validate-private-properties">CLUSCTL_NETINTERFACE_VALIDATE_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-validate-private-properties">CLUSCTL_NETWORK_VALIDATE_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-validate-private-properties">CLUSCTL_NODE_VALIDATE_PRIVATE_PROPERTIES</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-validate-private-properties">CLUSCTL_RESOURCE_TYPE_VALIDATE_PRIVATE_PROPERTIES</a>, 
 *        and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-validate-private-properties">CLUSCTL_RESOURCE_VALIDATE_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_VALIDATE_PRIVATE_PROPERTIES => 137

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-private-property-fmts">CLUSCTL_CLUSTER_GET_PRIVATE_PROPERTY_FMTS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-private-property-fmts">CLUSCTL_GROUP_GET_PRIVATE_PROPERTY_FMTS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-private-property-fmts">CLUSCTL_NETINTERFACE_GET_PRIVATE_PROPERTY_FMTS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-private-property-fmts">CLUSCTL_NETWORK_GET_PRIVATE_PROPERTY_FMTS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-private-property-fmts">CLUSCTL_NODE_GET_PRIVATE_PROPERTY_FMTS</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-private-property-fmts">CLUSCTL_RESOURCE_GET_PRIVATE_PROPERTY_FMTS</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-private-property-fmts">CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_PROPERTY_FMTS</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_PRIVATE_PROPERTY_FMTS => 141

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-private-resource-property-fmts">CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_RESOURCE_PROPERTY_FMTS</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_PRIVATE_RESOURCE_PROPERTY_FMTS => 145

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-registry-checkpoint">CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_ADD_REGISTRY_CHECKPOINT => 4194466

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-delete-registry-checkpoint">CLUSCTL_RESOURCE_DELETE_REGISTRY_CHECKPOINT</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_DELETE_REGISTRY_CHECKPOINT => 4194470

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-registry-checkpoints">CLUSCTL_RESOURCE_GET_REGISTRY_CHECKPOINTS</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_REGISTRY_CHECKPOINTS => 169

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-crypto-checkpoint">CLUSCTL_RESOURCE_ADD_CRYPTO_CHECKPOINT</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_ADD_CRYPTO_CHECKPOINT => 4194478

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-delete-crypto-checkpoint">CLUSCTL_RESOURCE_DELETE_CRYPTO_CHECKPOINT</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_DELETE_CRYPTO_CHECKPOINT => 4194482

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-crypto-checkpoints">CLUSCTL_RESOURCE_GET_CRYPTO_CHECKPOINTS</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_CRYPTO_CHECKPOINTS => 181

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-upgrade-dll">CLUSCTL_RESOURCE_UPGRADE_DLL</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_RESOURCE_UPGRADE_DLL => 4194490

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-registry-checkpoint-64bit">CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT_64BIT</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_ADD_REGISTRY_CHECKPOINT_64BIT => 4194494

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-registry-checkpoint-32bit">CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT_32BIT</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_ADD_REGISTRY_CHECKPOINT_32BIT => 4194498

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-loadbal-process-list">CLUSCTL_RESOURCE_GET_LOADBAL_PROCESS_LIST</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_LOADBAL_PROCESS_LIST => 201

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-set-account-access">CLUSCTL_CLUSTER_SET_ACCOUNT_ACCESS</a>
 * 
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_ACCOUNT_ACCESS => 4194546

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-network-name">CLUSCTL_RESOURCE_GET_NETWORK_NAME</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_NETWORK_NAME => 361

    /**
     * See the following topics:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-get-virtual-server-token">CLUSCTL_RESOURCE_NETNAME_GET_VIRTUAL_SERVER_TOKEN</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-rlua-get-virtual-server-token">CLUSCTL_RESOURCE_RLUA_GET_VIRTUAL_SERVER_TOKEN</a>
 * </li>
 * </ul>
 * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2012 R2.
 * 
 * 
 * 
 * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-get-virtual-server-token">CLUSCTL_RESOURCE_NETNAME_GET_VIRTUAL_SERVER_TOKEN</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_GET_VIRTUAL_SERVER_TOKEN => 365

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-register-dns-records">CLUSCTL_RESOURCE_NETNAME_REGISTER_DNS_RECORDS</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_REGISTER_DNS_RECORDS => 370

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-dns-name">CLUSCTL_RESOURCE_GET_DNS_NAME</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_DNS_NAME => 373

    /**
     * See the following topics:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-set-pwd-info">CLUSCTL_RESOURCE_NETNAME_SET_PWD_INFO</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-rlua-set-pwd-info">CLUSCTL_RESOURCE_RLUA_SET_PWD_INFO</a>
 * </li>
 * </ul>
 * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available until Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_SET_PWD_INFO => 378

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-delete-co">CLUSCTL_RESOURCE_NETNAME_DELETE_CO</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_DELETE_CO => 382

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-validate-vco">CLUSCTL_RESOURCE_NETNAME_VALIDATE_VCO</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_VALIDATE_VCO => 385

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-reset-vco">CLUSCTL_RESOURCE_NETNAME_RESET_VCO</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_RESET_VCO => 389

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-repair-vco">CLUSCTL_RESOURCE_NETNAME_REPAIR_VCO</a>
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_REPAIR_VCO => 397

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-disk-info">CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_DISK_INFO => 401

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-get-available-disks">CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_AVAILABLE_DISKS => 405

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-is-path-valid">CLUSCTL_RESOURCE_STORAGE_IS_PATH_VALID</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_IS_PATH_VALID => 409

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-sync-clusdisk-db">CLUSCTL_RESOURCE_TYPE_STORAGE_SYNC_CLUSDISK_DB</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_SYNC_CLUSDISK_DB => 4194718

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-disk-number-info">CLUSCTL_RESOURCE_STORAGE_GET_DISK_NUMBER_INFO</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_DISK_NUMBER_INFO => 417

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-query-delete">CLUSCTL_GROUP_QUERY_DELETE</a>, 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-query-delete">CLUSCTL_RESOURCE_QUERY_DELETE</a>, and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-query-delete">CLUSCTL_RESOURCE_TYPE_QUERY_DELETE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_QUERY_DELETE => 441

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-ipaddress-renew-lease">CLUSCTL_RESOURCE_IPADDRESS_RENEW_LEASE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_IPADDRESS_RENEW_LEASE => 4194750

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-ipaddress-release-lease">CLUSCTL_RESOURCE_IPADDRESS_RELEASE_LEASE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_IPADDRESS_RELEASE_LEASE => 4194754

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-query-maintenance-mode">CLUSCTL_RESOURCE_QUERY_MAINTENANCE_MODE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_QUERY_MAINTENANCE_MODE => 481

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-maintenance-mode">CLUSCTL_RESOURCE_SET_MAINTENANCE_MODE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_MAINTENANCE_MODE => 4194790

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-set-driveletter">CLUSCTL_RESOURCE_STORAGE_SET_DRIVELETTER</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_SET_DRIVELETTER => 4194794

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-get-driveletters">CLUSCTL_RESOURCE_TYPE_STORAGE_GET_DRIVELETTERS</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_DRIVELETTERS => 493

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-disk-info-ex">CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO_EX</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_DISK_INFO_EX => 497

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-get-available-disks-ex">CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_AVAILABLE_DISKS_EX => 501

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-disk-info-ex2">CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO_EX2</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_DISK_INFO_EX2 => 505

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_CLUSPORT_DISK_COUNT => 509

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-remap-driveletter">CLUSCTL_RESOURCE_TYPE_STORAGE_REMAP_DRIVELETTER</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_REMAP_DRIVELETTER => 513

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-get-diskid">CLUSCTL_RESOURCE_TYPE_STORAGE_GET_DISKID</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_DISKID => 517

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-is-clusterable">CLUSCTL_RESOURCE_TYPE_STORAGE_IS_CLUSTERABLE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_IS_CLUSTERABLE => 521

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-remove-vm-ownership">CLUSCTL_RESOURCE_TYPE_STORAGE_REMOVE_VM_OWNERSHIP</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_REMOVE_VM_OWNERSHIP => 4194830

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-mountpoints">CLUSCTL_RESOURCE_STORAGE_GET_MOUNTPOINTS</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_MOUNTPOINTS => 529

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-dirty">CLUSCTL_RESOURCE_STORAGE_GET_DIRTY</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_DIRTY => 537

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-shared-volume-info">CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_INFO</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_SHARED_VOLUME_INFO => 549

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-is-csv-file">CLUSCTL_RESOURCE_TYPE_STORAGE_IS_CSV_FILE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_IS_CSV_FILE => 553

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-get-resourceid">CLUSCTL_RESOURCE_TYPE_STORAGE_GET_RESOURCEID</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_RESOURCEID => 557

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-gen-app-validate-path">CLUSCTL_RESOURCE_TYPE_GEN_APP_VALIDATE_PATH</a> and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-gen-script-validate-path">CLUSCTL_RESOURCE_TYPE_GEN_SCRIPT_VALIDATE_PATH</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_VALIDATE_PATH => 561

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-netname-validate-netname">CLUSCTL_RESOURCE_TYPE_NETNAME_VALIDATE_NETNAME</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_VALIDATE_NETNAME => 565

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-gen-app-validate-directory">CLUSCTL_RESOURCE_TYPE_GEN_APP_VALIDATE_DIRECTORY</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_VALIDATE_DIRECTORY => 569

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static CLCTL_BATCH_BLOCK_KEY => 574

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static CLCTL_BATCH_UNBLOCK_KEY => 577

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fileserver-share-add">CLUSCTL_RESOURCE_FILESERVER_SHARE_ADD</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_FILESERVER_SHARE_ADD => 4194886

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fileserver-share-del">CLUSCTL_RESOURCE_FILESERVER_SHARE_DEL</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_FILESERVER_SHARE_DEL => 4194890

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fileserver-share-modify">CLUSCTL_RESOURCE_FILESERVER_SHARE_MODIFY</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_FILESERVER_SHARE_MODIFY => 4194894

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fileserver-share-report">CLUSCTL_RESOURCE_FILESERVER_SHARE_REPORT</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_FILESERVER_SHARE_REPORT => 593

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-netname-get-ou-for-vco">CLUSCTL_RESOURCE_TYPE_NETNAME_GET_OU_FOR_VCO</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_GET_OU_FOR_VCO => 4194926

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-enable-shared-volume-directio">CLUSCTL_RESOURCE_ENABLE_SHARED_VOLUME_DIRECTIO</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_ENABLE_SHARED_VOLUME_DIRECTIO => 4194954

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-disable-shared-volume-directio">CLUSCTL_RESOURCE_DISABLE_SHARED_VOLUME_DIRECTIO</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_DISABLE_SHARED_VOLUME_DIRECTIO => 4194958

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-shared-volume-id">CLUSCTL_CLUSTER_GET_SHARED_VOLUME_ID</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_SHARED_VOLUME_ID => 657

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-csv-maintenance-mode">CLUSCTL_RESOURCE_SET_CSV_MAINTENANCE_MODE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_CSV_MAINTENANCE_MODE => 4194966

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-shared-volume-backup-mode">CLUSCTL_RESOURCE_SET_SHARED_VOLUME_BACKUP_MODE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_SHARED_VOLUME_BACKUP_MODE => 4194970

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-shared-volume-partition-names">CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_PARTITION_NAMES</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_SHARED_VOLUME_PARTITION_NAMES => 669

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-shared-volume-states">CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_STATES</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_SHARED_VOLUME_STATES => 4194978

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-is-shared-volume">CLUSCTL_RESOURCE_STORAGE_IS_SHARED_VOLUME</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_IS_SHARED_VOLUME => 677

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-clusdb-timestamp">CLUSCTL_CLUSTER_GET_CLUSDB_TIMESTAMP</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_CLUSDB_TIMESTAMP => 681

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-rw-modify-noop">CLUSCTL_RESOURCE_RW_MODIFY_NOOP</a>
     * @type {Integer (Int32)}
     */
    static CLCTL_RW_MODIFY_NOOP => 4194990

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-is-quorum-blocked">CLUSCTL_RESOURCE_IS_QUORUM_BLOCKED</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_IS_QUORUM_BLOCKED => 689

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-pool-get-drive-info">CLUSCTL_RESOURCE_POOL_GET_DRIVE_INFO</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_POOL_GET_DRIVE_INFO => 693

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-gum-lock-owner">CLUSCTL_CLUSTER_GET_GUM_LOCK_OWNER</a>.
 * 
 * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_GUM_LOCK_OWNER => 697

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-stuck-nodes">CLUSCTL_NODE_GET_STUCK_NODES</a>.
 * 
 * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_STUCK_NODES => 701

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-inject-gem-fault">CLUSCTL_NODE_INJECT_GEM_FAULT</a>.
 * 
 * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLCTL_INJECT_GEM_FAULT => 705

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-introduce-gem-repair-delay">CLUSCTL_NODE_INTRODUCE_GEM_REPAIR_DELAY</a>.
 * 
 * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLCTL_INTRODUCE_GEM_REPAIR_DELAY => 709

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-send-dummy-gem-messages">CLUSCTL_NODE_SEND_DUMMY_GEM_MESSAGES</a>.
 * 
 * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLCTL_SEND_DUMMY_GEM_MESSAGES => 713

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-block-gem-send-recv">CLUSCTL_NODE_BLOCK_GEM_SEND_RECV</a>.
 * 
 * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLCTL_BLOCK_GEM_SEND_RECV => 717

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-gemid-vector">CLUSCTL_NODE_GET_GEMID_VECTOR</a>.
 * 
 * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_GEMID_VECTOR => 721

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-crypto-checkpoint-ex">CLUSCTL_RESOURCE_ADD_CRYPTO_CHECKPOINT_EX</a>.
 * 
 * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLCTL_ADD_CRYPTO_CHECKPOINT_EX => 4195030

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-last-move-time">CLUSCTL_GROUP_GET_LAST_MOVE_TIME</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_GROUP_GET_LAST_MOVE_TIME => 729

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-set-storage-configuration">CLUSCTL_CLUSTER_SET_STORAGE_CONFIGURATION</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_STORAGE_CONFIGURATION => 4195042

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-storage-configuration">CLUSCTL_CLUSTER_GET_STORAGE_CONFIGURATION</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_STORAGE_CONFIGURATION => 741

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-storage-config-attributes">CLUSCTL_CLUSTER_GET_STORAGE_CONFIG_ATTRIBUTES</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_STORAGE_CONFIG_ATTRIBUTES => 745

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-remove-node">CLUSCTL_CLUSTER_REMOVE_NODE</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_REMOVE_NODE => 4195054

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLCTL_IS_FEATURE_INSTALLED => 753

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLCTL_IS_S2D_FEATURE_SUPPORTED => 757

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_PHYSICAL_DISK_INFO => 761

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_CLUSBFLT_PATHS => 765

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_CLUSBFLT_PATHINFO => 769

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-clear-node-connection-info">CLUSCTL_CLUSTER_CLEAR_NODE_CONNECTION_INFO</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_CLEAR_NODE_CONNECTION_INFO => 4195078

    /**
     * See <a href="https://msdn.microsoft.com/C08360F8-4930-4BEA-B831-CD380EBCFF7D">CLUSCTL_CLUSTER_SET_DNS_DOMAIN</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_DNS_DOMAIN => 4195082

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CTCTL_GET_ROUTESTATUS_BASIC => 781

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CTCTL_GET_ROUTESTATUS_EXTENDED => 785

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CTCTL_GET_FAULT_DOMAIN_STATE => 789

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_SET_PWD_INFOEX => 794

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_NODE_NETWORK_CONNECTIVITY => 797

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-get-available-disks-ex2-int">CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_INT</a>.
 * 
 * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_AVAILABLE_DISKS_EX2_INT => 8161

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cloud-witness-resource-type-validate-credentials">CLUSCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS => 8417

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cloud-witness-resource-update-token">CLUSCTL_CLOUD_WITNESS_RESOURCE_UPDATE_TOKEN</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_CLOUD_WITNESS_RESOURCE_UPDATE_TOKEN => 4202726

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-prepare-upgrade">CLUSCTL_RESOURCE_PREPARE_UPGRADE</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-prepare-upgrade">CLUSCTL_RESOURCE_TYPE_PREPARE_UPGRADE</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_RESOURCE_PREPARE_UPGRADE => 4202730

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-upgrade-completed">CLUSCTL_RESOURCE_UPGRADE_COMPLETED</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-upgrade-completed">CLUSCTL_RESOURCE_TYPE_UPGRADE_COMPLETED</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_RESOURCE_UPGRADE_COMPLETED => 4202734

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cloud-witness-resource-type-validate-credentials-with-key">CLUSCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS_WITH_KEY</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS_WITH_KEY => 8433

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cloud-witness-resource-update-key">CLUSCTL_CLOUD_WITNESS_RESOURCE_UPDATE_KEY</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_CLOUD_WITNESS_RESOURCE_UPDATE_KEY => 4202742

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_ADD_REPLICATION_GROUP => 8514

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-log-info">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_LOG_INFO</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_LOG_INFO => 8517

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-eligible-logdisks">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_LOGDISKS</a>
 * 
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_ELIGIBLE_LOGDISKS => 8521

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-eligible-target-datadisks">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_TARGET_DATADISKS</a>
 * 
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_ELIGIBLE_TARGET_DATADISKS => 8525

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-eligible-source-datadisks">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_SOURCE_DATADISKS</a>
 * 
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_ELIGIBLE_SOURCE_DATADISKS => 8529

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-replicated-disks">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICATED_DISKS</a>
 * 
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_REPLICATED_DISKS => 8533

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-replica-volumes">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICA_VOLUMES</a>
 * 
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_REPLICA_VOLUMES => 8537

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-log-volume">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_LOG_VOLUME</a>
 * 
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_LOG_VOLUME => 8541

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-resource-group">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_RESOURCE_GROUP</a>
 * 
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_RESOURCE_GROUP => 8545

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-replicated-partition-info">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICATED_PARTITION_INFO</a>
 * 
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_REPLICATED_PARTITION_INFO => 8549

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-state-change-time">CLUSCTL_RESOURCE_GET_STATE_CHANGE_TIME</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_STATE_CHANGE_TIME => 11613

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-set-cluster-das-mode-enabled">CLUSCTL_CLUSTER_SET_CLUSTER_S2D_ENABLED</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_CLUSTER_S2D_ENABLED => 4205922

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-set-cluster-s2d-cache-metadata-reserve-bytes">CLUSCTL_CLUSTER_SET_CLUSTER_S2D_CACHE_METADATA_RESERVE_BYTES</a>
 * 
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_CLUSTER_S2D_CACHE_METADATA_RESERVE_BYTES => 4205934

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-get-groups">CLUSCTL_GROUPSET_GET_GROUPS</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_GROUPSET_GET_GROUPS => 11633

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-get-provider-groups">CLUSCTL_GROUPSET_GET_PROVIDER_GROUPS</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_GROUPSET_GET_PROVIDER_GROUPS => 11637

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-get-provider-collections">CLUSCTL_GROUPSET_GET_PROVIDER_GROUPSETS</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_GROUPSET_GET_PROVIDER_GROUPSETS => 11641

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-provider-groups">CLUSCTL_GROUP_GET_PROVIDER_GROUPS</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_GROUP_GET_PROVIDER_GROUPS => 11645

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-provider-collections">CLUSCTL_GROUP_GET_PROVIDER_GROUPSETS</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_GROUP_GET_PROVIDER_GROUPSETS => 11649

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLCTL_GROUP_SET_CCF_FROM_MASTER => 4205958

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_INFRASTRUCTURE_SOFS_BUFFER => 11657

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_INFRASTRUCTURE_SOFS_BUFFER => 4205966

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLCTL_NOTIFY_INFRASTRUCTURE_SOFS_CHANGED => 4205970

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLCTL_SCALEOUT_COMMAND => 4205974

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLCTL_SCALEOUT_CONTROL => 4205978

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLCTL_SCALEOUT_GET_CLUSTERS => 4205981

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLCTL_RELOAD_AUTOLOGGER_CONFIG => 11730

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_RENAME_SHARED_VOLUME => 11734

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_RENAME_SHARED_VOLUME_GUID => 11738

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_ENUM_AFFINITY_RULE_NAMES => 11741

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_NODES_IN_FD => 11745

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_FORCE_DB_FLUSH => 4206054

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-delete">CLUSCTL_RESOURCE_DELETE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_DELETE => 5242886

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-install-node">CLUSCTL_RESOURCE_INSTALL_NODE</a> and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-install-node">CLUSCTL_RESOURCE_TYPE_INSTALL_NODE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_INSTALL_NODE => 5242890

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-evict-node">CLUSCTL_RESOURCE_EVICT_NODE</a> and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-evict-node">CLUSCTL_RESOURCE_TYPE_EVICT_NODE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_EVICT_NODE => 5242894

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-dependency">CLUSCTL_RESOURCE_ADD_DEPENDENCY</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_ADD_DEPENDENCY => 5242898

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-remove-dependency">CLUSCTL_RESOURCE_REMOVE_DEPENDENCY</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_REMOVE_DEPENDENCY => 5242902

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-owner">CLUSCTL_RESOURCE_ADD_OWNER</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_ADD_OWNER => 5242906

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-remove-owner">CLUSCTL_RESOURCE_REMOVE_OWNER</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_REMOVE_OWNER => 5242910

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-name">CLUSCTL_RESOURCE_SET_NAME</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_NAME => 5242918

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-cluster-name-changed">CLUSCTL_RESOURCE_CLUSTER_NAME_CHANGED</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_CLUSTER_NAME_CHANGED => 5242922

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-cluster-version-changed">CLUSCTL_RESOURCE_CLUSTER_VERSION_CHANGED</a> and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-cluster-version-changed">CLUSCTL_RESOURCE_TYPE_CLUSTER_VERSION_CHANGED</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_CLUSTER_VERSION_CHANGED => 5242926

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-fixup-on-upgrade">CLUSCTL_RESOURCE_TYPE_FIXUP_ON_UPGRADE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_FIXUP_ON_UPGRADE => 5242930

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-starting-phase1">CLUSCTL_RESOURCE_TYPE_STARTING_PHASE1</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STARTING_PHASE1 => 5242934

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-starting-phase2">CLUSCTL_RESOURCE_TYPE_STARTING_PHASE2</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STARTING_PHASE2 => 5242938

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-hold-io">CLUSCTL_RESOURCE_TYPE_HOLD_IO</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_HOLD_IO => 5242942

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-resume-io">CLUSCTL_RESOURCE_TYPE_RESUME_IO</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_RESUME_IO => 5242946

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-force-quorum">CLUSCTL_RESOURCE_FORCE_QUORUM</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_FORCE_QUORUM => 5242950

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-initialize">CLUSCTL_RESOURCE_INITIALIZE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_INITIALIZE => 5242954

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-state-change-reason">CLUSCTL_RESOURCE_STATE_CHANGE_REASON</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_STATE_CHANGE_REASON => 5242958

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-provider-state-change">CLUSCTL_RESOURCE_PROVIDER_STATE_CHANGE</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_PROVIDER_STATE_CHANGE => 5242962

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-leaving-group">CLUSCTL_RESOURCE_LEAVING_GROUP</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_LEAVING_GROUP => 5242966

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-joining-group">CLUSCTL_RESOURCE_JOINING_GROUP</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_JOINING_GROUP => 5242970

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fswitness-get-epoch-info">CLUSCTL_RESOURCE_FSWITNESS_GET_EPOCH_INFO</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_FSWITNESS_GET_EPOCH_INFO => 1048669

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fswitness-set-epoch-info">CLUSCTL_RESOURCE_FSWITNESS_SET_EPOCH_INFO</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_FSWITNESS_SET_EPOCH_INFO => 5242978

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fswitness-release-lock">CLUSCTL_RESOURCE_FSWITNESS_RELEASE_LOCK</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_FSWITNESS_RELEASE_LOCK => 5242982

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-creds-notifycam">CLUSCTL_RESOURCE_NETNAME_CREDS_NOTIFYCAM</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_CREDS_NOTIFYCAM => 5242986

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-notify-quorum-status">CLUSCTL_RESOURCE_NOTIFY_QUORUM_STATUS</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_NOTIFY_QUORUM_STATUS => 5243006

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLCTL_NOTIFY_MONITOR_SHUTTING_DOWN => 1048705

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_UNDELETE => 5243014

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-operation-context">CLUSCTL_RESOURCE_GET_OPERATION_CONTEXT</a>.
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_OPERATION_CONTEXT => 1057001

    /**
     * See 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-notify-owner-change">CLUSCTL_RESOURCE_NOTIFY_OWNER_CHANGE</a>.
 * 
 * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLCTL_NOTIFY_OWNER_CHANGE => 5251362

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-validate-change-group">CLUSCTL_RESOURCE_VALIDATE_CHANGE_GROUP</a>.
 * 
 * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLCTL_VALIDATE_CHANGE_GROUP => 1057061

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_CHECK_DRAIN_VETO => 1057069

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_NOTIFY_DRAIN_COMPLETE => 1057073
}
