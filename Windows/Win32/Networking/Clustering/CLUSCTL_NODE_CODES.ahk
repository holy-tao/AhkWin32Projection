#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumerates node control codes.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-clusctl_node_codes
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSCTL_NODE_CODES{

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-unknown">CLUSCTL_NODE_UNKNOWN</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_UNKNOWN => 67108864

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-characteristics">CLUSCTL_NODE_GET_CHARACTERISTICS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_GET_CHARACTERISTICS => 67108869

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-flags">CLUSCTL_NODE_GET_FLAGS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_GET_FLAGS => 67108873

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-name">CLUSCTL_NODE_GET_NAME</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_GET_NAME => 67108905

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-id">CLUSCTL_NODE_GET_ID</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_GET_ID => 67108921

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-enum-common-properties">CLUSCTL_NODE_ENUM_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_ENUM_COMMON_PROPERTIES => 67108945

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-ro-common-properties">CLUSCTL_NODE_GET_RO_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_GET_RO_COMMON_PROPERTIES => 67108949

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-common-properties">CLUSCTL_NODE_GET_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_GET_COMMON_PROPERTIES => 67108953

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-set-common-properties">CLUSCTL_NODE_SET_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_SET_COMMON_PROPERTIES => 71303262

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-validate-common-properties">CLUSCTL_NODE_VALIDATE_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_VALIDATE_COMMON_PROPERTIES => 67108961

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-enum-private-properties">CLUSCTL_NODE_ENUM_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_ENUM_PRIVATE_PROPERTIES => 67108985

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-ro-private-properties">CLUSCTL_NODE_GET_RO_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_GET_RO_PRIVATE_PROPERTIES => 67108989

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-private-properties">CLUSCTL_NODE_GET_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_GET_PRIVATE_PROPERTIES => 67108993

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-set-private-properties">CLUSCTL_NODE_SET_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_SET_PRIVATE_PROPERTIES => 71303302

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-validate-private-properties">CLUSCTL_NODE_VALIDATE_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_VALIDATE_PRIVATE_PROPERTIES => 67109001

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-common-property-fmts">CLUSCTL_NODE_GET_COMMON_PROPERTY_FMTS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_GET_COMMON_PROPERTY_FMTS => 67108965

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-private-property-fmts">CLUSCTL_NODE_GET_PRIVATE_PROPERTY_FMTS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_GET_PRIVATE_PROPERTY_FMTS => 67109005

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-cluster-service-account-name">CLUSCTL_NODE_GET_CLUSTER_SERVICE_ACCOUNT_NAME</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_GET_CLUSTER_SERVICE_ACCOUNT_NAME => 67108929

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_GET_STUCK_NODES => 67109565

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-inject-gem-fault">CLUSCTL_NODE_INJECT_GEM_FAULT</a>.
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2012:  </b>This control code is not supported before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_INJECT_GEM_FAULT => 67109569

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-introduce-gem-repair-delay">CLUSCTL_NODE_INTRODUCE_GEM_REPAIR_DELAY</a>.
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2012:  </b>This control code is not supported before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_INTRODUCE_GEM_REPAIR_DELAY => 67109573

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-send-dummy-gem-messages">CLUSCTL_NODE_SEND_DUMMY_GEM_MESSAGES</a>.
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2012:  </b>This control code is not supported before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_SEND_DUMMY_GEM_MESSAGES => 67109577

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-block-gem-send-recv">CLUSCTL_NODE_BLOCK_GEM_SEND_RECV</a>.
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2012:  </b>This control code is not supported before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_BLOCK_GEM_SEND_RECV => 67109581

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-gemid-vector">CLUSCTL_NODE_GET_GEMID_VECTOR</a>.
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2012:  </b>This control code is not supported before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_NODE_GET_GEMID_VECTOR => 67109585
}
