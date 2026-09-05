#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSCTL_CLUSTER_CODES enumeration (msclus.h) enumerates cluster control codes used by the ClusterControl function.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-clusctl_cluster_codes
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSCTL_CLUSTER_CODES extends Win32Enum {

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-unknown">CLUSCTL_CLUSTER_UNKNOWN</a>.
     * Native name: CLUSCTL_CLUSTER_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 117440512

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-fqdn">CLUSCTL_CLUSTER_GET_FQDN</a>.
     * Native name: CLUSCTL_CLUSTER_GET_FQDN
     * @type {Integer (Int32)}
     */
    static GET_FQDN => 117440573

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-set-storage-configuration">CLUSCTL_CLUSTER_SET_STORAGE_CONFIGURATION</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * Native name: CLUSCTL_CLUSTER_SET_STORAGE_CONFIGURATION
     * @type {Integer (Int32)}
     */
    static SET_STORAGE_CONFIGURATION => 121635554

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-storage-configuration">CLUSCTL_CLUSTER_GET_STORAGE_CONFIGURATION</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * Native name: CLUSCTL_CLUSTER_GET_STORAGE_CONFIGURATION
     * @type {Integer (Int32)}
     */
    static GET_STORAGE_CONFIGURATION => 117441253

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-storage-config-attributes">CLUSCTL_CLUSTER_GET_STORAGE_CONFIG_ATTRIBUTES</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * Native name: CLUSCTL_CLUSTER_GET_STORAGE_CONFIG_ATTRIBUTES
     * @type {Integer (Int32)}
     */
    static GET_STORAGE_CONFIG_ATTRIBUTES => 117441257

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-enum-common-properties">CLUSCTL_CLUSTER_ENUM_COMMON_PROPERTIES</a>.
     * Native name: CLUSCTL_CLUSTER_ENUM_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static ENUM_COMMON_PROPERTIES => 117440593

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-ro-common-properties">CLUSCTL_CLUSTER_GET_RO_COMMON_PROPERTIES</a>.
     * Native name: CLUSCTL_CLUSTER_GET_RO_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_RO_COMMON_PROPERTIES => 117440597

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-common-properties">CLUSCTL_CLUSTER_GET_COMMON_PROPERTIES</a>.
     * Native name: CLUSCTL_CLUSTER_GET_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_COMMON_PROPERTIES => 117440601

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-set-common-properties">CLUSCTL_CLUSTER_SET_COMMON_PROPERTIES</a>.
     * Native name: CLUSCTL_CLUSTER_SET_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static SET_COMMON_PROPERTIES => 121634910

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-validate-common-properties">CLUSCTL_CLUSTER_VALIDATE_COMMON_PROPERTIES</a>.
     * Native name: CLUSCTL_CLUSTER_VALIDATE_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static VALIDATE_COMMON_PROPERTIES => 117440609

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-enum-private-properties">CLUSCTL_CLUSTER_ENUM_PRIVATE_PROPERTIES</a>.
     * Native name: CLUSCTL_CLUSTER_ENUM_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static ENUM_PRIVATE_PROPERTIES => 117440633

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-ro-private-properties">CLUSCTL_CLUSTER_GET_RO_PRIVATE_PROPERTIES</a>.
     * Native name: CLUSCTL_CLUSTER_GET_RO_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_RO_PRIVATE_PROPERTIES => 117440637

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-private-properties">CLUSCTL_CLUSTER_GET_PRIVATE_PROPERTIES</a>.
     * Native name: CLUSCTL_CLUSTER_GET_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_PRIVATE_PROPERTIES => 117440641

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-set-private-properties">CLUSCTL_CLUSTER_SET_PRIVATE_PROPERTIES</a>.
     * Native name: CLUSCTL_CLUSTER_SET_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static SET_PRIVATE_PROPERTIES => 121634950

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-validate-private-properties">CLUSCTL_CLUSTER_VALIDATE_PRIVATE_PROPERTIES</a>.
     * Native name: CLUSCTL_CLUSTER_VALIDATE_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static VALIDATE_PRIVATE_PROPERTIES => 117440649

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-common-property-fmts">CLUSCTL_CLUSTER_GET_COMMON_PROPERTY_FMTS</a>.
     * Native name: CLUSCTL_CLUSTER_GET_COMMON_PROPERTY_FMTS
     * @type {Integer (Int32)}
     */
    static GET_COMMON_PROPERTY_FMTS => 117440613

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-private-property-fmts">CLUSCTL_CLUSTER_GET_PRIVATE_PROPERTY_FMTS</a>.
     * Native name: CLUSCTL_CLUSTER_GET_PRIVATE_PROPERTY_FMTS
     * @type {Integer (Int32)}
     */
    static GET_PRIVATE_PROPERTY_FMTS => 117440653

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-check-voter-evict">CLUSCTL_CLUSTER_CHECK_VOTER_EVICT</a>.
     * Native name: CLUSCTL_CLUSTER_CHECK_VOTER_EVICT
     * @type {Integer (Int32)}
     */
    static CHECK_VOTER_EVICT => 117440581

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-check-voter-down">CLUSCTL_CLUSTER_CHECK_VOTER_DOWN</a>.
     * Native name: CLUSCTL_CLUSTER_CHECK_VOTER_DOWN
     * @type {Integer (Int32)}
     */
    static CHECK_VOTER_DOWN => 117440585

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-shutdown">CLUSCTL_CLUSTER_SHUTDOWN</a>.
     * Native name: CLUSCTL_CLUSTER_SHUTDOWN
     * @type {Integer (Int32)}
     */
    static SHUTDOWN => 117440589

    /**
     * Not supported.
     * Native name: CLUSCTL_CLUSTER_BATCH_BLOCK_KEY
     * @type {Integer (Int32)}
     */
    static BATCH_BLOCK_KEY => 117441086

    /**
     * Not supported.
     * Native name: CLUSCTL_CLUSTER_BATCH_UNBLOCK_KEY
     * @type {Integer (Int32)}
     */
    static BATCH_UNBLOCK_KEY => 117441089

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-shared-volume-id">CLUSCTL_CLUSTER_GET_SHARED_VOLUME_ID</a>.
     * 
     * <b>Windows Server 2008:  </b>This control code is not supported before Windows Server 2008 R2.
     * Native name: CLUSCTL_CLUSTER_GET_SHARED_VOLUME_ID
     * @type {Integer (Int32)}
     */
    static GET_SHARED_VOLUME_ID => 117441169

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-clusdb-timestamp">CLUSCTL_CLUSTER_GET_CLUSDB_TIMESTAMP</a>.
     * Native name: CLUSCTL_CLUSTER_GET_CLUSDB_TIMESTAMP
     * @type {Integer (Int32)}
     */
    static GET_CLUSDB_TIMESTAMP => 117441193

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-gum-lock-owner">CLUSCTL_CLUSTER_GET_GUM_LOCK_OWNER</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * Native name: CLUSCTL_CLUSTER_GET_GUM_LOCK_OWNER
     * @type {Integer (Int32)}
     */
    static GET_GUM_LOCK_OWNER => 117441209

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-remove-node">CLUSCTL_CLUSTER_REMOVE_NODE</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * Native name: CLUSCTL_CLUSTER_REMOVE_NODE
     * @type {Integer (Int32)}
     */
    static REMOVE_NODE => 121635566

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-set-account-access">CLUSCTL_CLUSTER_SET_ACCOUNT_ACCESS</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * Native name: CLUSCTL_CLUSTER_SET_ACCOUNT_ACCESS
     * @type {Integer (Int32)}
     */
    static SET_ACCOUNT_ACCESS => 121635058

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-clear-node-connection-info">CLUSCTL_CLUSTER_CLEAR_NODE_CONNECTION_INFO</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * Native name: CLUSCTL_CLUSTER_CLEAR_NODE_CONNECTION_INFO
     * @type {Integer (Int32)}
     */
    static CLEAR_NODE_CONNECTION_INFO => 121635590

    /**
     * See <a href="https://msdn.microsoft.com/C08360F8-4930-4BEA-B831-CD380EBCFF7D">CLUSCTL_CLUSTER_SET_DNS_DOMAIN</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * Native name: CLUSCTL_CLUSTER_SET_DNS_DOMAIN
     * @type {Integer (Int32)}
     */
    static SET_DNS_DOMAIN => 121635594

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-set-cluster-das-mode-enabled">CLUSCTL_CLUSTER_SET_CLUSTER_S2D_ENABLED</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * Native name: CLUSCTL_CLUSTER_SET_CLUSTER_S2D_ENABLED
     * @type {Integer (Int32)}
     */
    static SET_CLUSTER_S2D_ENABLED => 121646434

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-set-cluster-s2d-cache-metadata-reserve-bytes">CLUSCTL_CLUSTER_SET_CLUSTER_S2D_CACHE_METADATA_RESERVE_BYTES</a>
     * 
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This operation code is not available before Windows Server 2016.
     * Native name: CLUSCTL_CLUSTER_SET_CLUSTER_S2D_CACHE_METADATA_RESERVE_BYTES
     * @type {Integer (Int32)}
     */
    static SET_CLUSTER_S2D_CACHE_METADATA_RESERVE_BYTES => 121646446

    /**
     * Native name: CLUSCTL_CLUSTER_STORAGE_RENAME_SHARED_VOLUME
     * @type {Integer (Int32)}
     */
    static STORAGE_RENAME_SHARED_VOLUME => 117452246

    /**
     * Native name: CLUSCTL_CLUSTER_STORAGE_RENAME_SHARED_VOLUME_GUID
     * @type {Integer (Int32)}
     */
    static STORAGE_RENAME_SHARED_VOLUME_GUID => 117452250

    /**
     * Native name: CLUSCTL_CLUSTER_RELOAD_AUTOLOGGER_CONFIG
     * @type {Integer (Int32)}
     */
    static RELOAD_AUTOLOGGER_CONFIG => 117452242

    /**
     * Native name: CLUSCTL_CLUSTER_ENUM_AFFINITY_RULE_NAMES
     * @type {Integer (Int32)}
     */
    static ENUM_AFFINITY_RULE_NAMES => 117452253

    /**
     * Native name: CLUSCTL_CLUSTER_GET_NODES_IN_FD
     * @type {Integer (Int32)}
     */
    static GET_NODES_IN_FD => 117452257

    /**
     * Native name: CLUSCTL_CLUSTER_FORCE_FLUSH_DB
     * @type {Integer (Int32)}
     */
    static FORCE_FLUSH_DB => 121646566

    /**
     * Native name: CLUSCTL_CLUSTER_GET_CLMUSR_TOKEN
     * @type {Integer (Int32)}
     */
    static GET_CLMUSR_TOKEN => 117440877

    /**
     * Native name: CLUSCTL_CLUSTER_CHECK_VOTER_EVICT_WITNESS
     * @type {Integer (Int32)}
     */
    static CHECK_VOTER_EVICT_WITNESS => 117440621

    /**
     * Native name: CLUSCTL_CLUSTER_CHECK_VOTER_DOWN_WITNESS
     * @type {Integer (Int32)}
     */
    static CHECK_VOTER_DOWN_WITNESS => 117440625
}
