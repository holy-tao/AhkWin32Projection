#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSCTL_RESOURCE_TYPE_CODES enumeration (msclus.h) enumerates resource type control codes.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-clusctl_resource_type_codes
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSCTL_RESOURCE_TYPE_CODES extends Win32Enum{

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-unknown">CLUSCTL_RESOURCE_TYPE_UNKNOWN</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_UNKNOWN => 33554432

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-characteristics">CLUSCTL_RESOURCE_TYPE_GET_CHARACTERISTICS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GET_CHARACTERISTICS => 33554437

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-flags">CLUSCTL_RESOURCE_TYPE_GET_FLAGS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GET_FLAGS => 33554441

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-class-info">CLUSCTL_RESOURCE_TYPE_GET_CLASS_INFO</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GET_CLASS_INFO => 33554445

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-required-dependencies">CLUSCTL_RESOURCE_TYPE_GET_REQUIRED_DEPENDENCIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GET_REQUIRED_DEPENDENCIES => 33554449

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-arb-timeout">CLUSCTL_RESOURCE_TYPE_GET_ARB_TIMEOUT</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GET_ARB_TIMEOUT => 33554453

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-enum-common-properties">CLUSCTL_RESOURCE_TYPE_ENUM_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_ENUM_COMMON_PROPERTIES => 33554513

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-ro-common-properties">CLUSCTL_RESOURCE_TYPE_GET_RO_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GET_RO_COMMON_PROPERTIES => 33554517

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-common-properties">CLUSCTL_RESOURCE_TYPE_GET_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GET_COMMON_PROPERTIES => 33554521

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-validate-common-properties">CLUSCTL_RESOURCE_TYPE_VALIDATE_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_VALIDATE_COMMON_PROPERTIES => 33554529

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-set-common-properties">CLUSCTL_RESOURCE_TYPE_SET_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_SET_COMMON_PROPERTIES => 37748830

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-common-property-fmts">CLUSCTL_RESOURCE_TYPE_GET_COMMON_PROPERTY_FMTS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GET_COMMON_PROPERTY_FMTS => 33554533

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-common-resource-property-fmts">CLUSCTL_RESOURCE_TYPE_GET_COMMON_RESOURCE_PROPERTY_FMTS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GET_COMMON_RESOURCE_PROPERTY_FMTS => 33554537

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-enum-private-properties">CLUSCTL_RESOURCE_TYPE_ENUM_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_ENUM_PRIVATE_PROPERTIES => 33554553

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-ro-private-properties">CLUSCTL_RESOURCE_TYPE_GET_RO_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GET_RO_PRIVATE_PROPERTIES => 33554557

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-private-properties">CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_PROPERTIES => 33554561

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-set-private-properties">CLUSCTL_RESOURCE_TYPE_SET_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_SET_PRIVATE_PROPERTIES => 37748870

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-validate-private-properties">CLUSCTL_RESOURCE_TYPE_VALIDATE_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_VALIDATE_PRIVATE_PROPERTIES => 33554569

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-private-property-fmts">CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_PROPERTY_FMTS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_PROPERTY_FMTS => 33554573

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-private-resource-property-fmts">CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_RESOURCE_PROPERTY_FMTS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_RESOURCE_PROPERTY_FMTS => 33554577

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-registry-checkpoints">CLUSCTL_RESOURCE_TYPE_GET_REGISTRY_CHECKPOINTS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GET_REGISTRY_CHECKPOINTS => 33554601

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-crypto-checkpoints">CLUSCTL_RESOURCE_TYPE_GET_CRYPTO_CHECKPOINTS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GET_CRYPTO_CHECKPOINTS => 33554613

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-get-available-disks">CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS => 33554837

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-sync-clusdisk-db">CLUSCTL_RESOURCE_TYPE_STORAGE_SYNC_CLUSDISK_DB</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_STORAGE_SYNC_CLUSDISK_DB => 37749150

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-netname-validate-netname">CLUSCTL_RESOURCE_TYPE_NETNAME_VALIDATE_NETNAME</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_NETNAME_VALIDATE_NETNAME => 33554997

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-netname-get-ou-for-vco">CLUSCTL_RESOURCE_TYPE_NETNAME_GET_OU_FOR_VCO</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_NETNAME_GET_OU_FOR_VCO => 37749358

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-gen-app-validate-path">CLUSCTL_RESOURCE_TYPE_GEN_APP_VALIDATE_PATH</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GEN_APP_VALIDATE_PATH => 33554993

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-gen-app-validate-directory">CLUSCTL_RESOURCE_TYPE_GEN_APP_VALIDATE_DIRECTORY</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GEN_APP_VALIDATE_DIRECTORY => 33555001

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-gen-script-validate-path">CLUSCTL_RESOURCE_TYPE_GEN_SCRIPT_VALIDATE_PATH</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_GEN_SCRIPT_VALIDATE_PATH => 33554993

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-query-delete">CLUSCTL_RESOURCE_TYPE_QUERY_DELETE</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_QUERY_DELETE => 33554873

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-get-driveletters">CLUSCTL_RESOURCE_TYPE_STORAGE_GET_DRIVELETTERS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_STORAGE_GET_DRIVELETTERS => 33554925

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-get-available-disks-ex">CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX => 33554933

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-remap-driveletter">CLUSCTL_RESOURCE_TYPE_STORAGE_REMAP_DRIVELETTER</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_STORAGE_REMAP_DRIVELETTER => 33554945

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-get-diskid">CLUSCTL_RESOURCE_TYPE_STORAGE_GET_DISKID</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_STORAGE_GET_DISKID => 33554949

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-get-resourceid">CLUSCTL_RESOURCE_TYPE_STORAGE_GET_RESOURCEID</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_STORAGE_GET_RESOURCEID => 33554989

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-is-clusterable">CLUSCTL_RESOURCE_TYPE_STORAGE_IS_CLUSTERABLE</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_STORAGE_IS_CLUSTERABLE => 33554953

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-remove-vm-ownership">CLUSCTL_RESOURCE_TYPE_STORAGE_REMOVE_VM_OWNERSHIP</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_STORAGE_REMOVE_VM_OWNERSHIP => 37749262

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_STORAGE_IS_CSV_FILE => 16777769

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-witness-validate-path">CLUSCTL_RESOURCE_TYPE_WITNESS_VALIDATE_PATH</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_WITNESS_VALIDATE_PATH => 33554993

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-install-node">CLUSCTL_RESOURCE_TYPE_INSTALL_NODE</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_INSTALL_NODE => 38797322

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-evict-node">CLUSCTL_RESOURCE_TYPE_EVICT_NODE</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_EVICT_NODE => 38797326

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-cluster-version-changed">CLUSCTL_RESOURCE_TYPE_CLUSTER_VERSION_CHANGED</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_CLUSTER_VERSION_CHANGED => 38797358

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-fixup-on-upgrade">CLUSCTL_RESOURCE_TYPE_FIXUP_ON_UPGRADE</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_FIXUP_ON_UPGRADE => 38797362

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-starting-phase1">CLUSCTL_RESOURCE_TYPE_STARTING_PHASE1</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_STARTING_PHASE1 => 38797366

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-starting-phase2">CLUSCTL_RESOURCE_TYPE_STARTING_PHASE2</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_STARTING_PHASE2 => 38797370

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-hold-io">CLUSCTL_RESOURCE_TYPE_HOLD_IO</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_HOLD_IO => 38797374

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-resume-io">CLUSCTL_RESOURCE_TYPE_RESUME_IO</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_RESUME_IO => 38797378

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-get-available-disks-ex2-int">CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_INT</a>.
     * 
     * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available before Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_INT => 33562593

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-eligible-logdisks">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_LOGDISKS</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_LOGDISKS => 33562953

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-eligible-target-datadisks">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_TARGET_DATADISKS</a>
     * 
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_TARGET_DATADISKS => 33562957

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-eligible-source-datadisks">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_SOURCE_DATADISKS</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_ELIGIBLE_SOURCE_DATADISKS => 33562961

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-replicated-disks">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICATED_DISKS</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICATED_DISKS => 33562965

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-replica-volumes">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICA_VOLUMES</a>
     * 
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICA_VOLUMES => 33562969

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-log-volume">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_LOG_VOLUME</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_LOG_VOLUME => 33562973

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-resource-group">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_RESOURCE_GROUP</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_RESOURCE_GROUP => 33562977

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-replicated-partition-info">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICATED_PARTITION_INFO</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_REPLICATED_PARTITION_INFO => 33562981

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-replication-get-log-info">CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_LOG_INFO</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_REPLICATION_GET_LOG_INFO => 33562949

    /**
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_REPLICATION_ADD_REPLICATION_GROUP => 33562946

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cloud-witness-resource-type-validate-credentials">CLUSCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS => 33562849

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cloud-witness-resource-type-validate-credentials-with-key">CLUSCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS_WITH_KEY</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS_WITH_KEY => 33562865

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-prepare-upgrade">CLUSCTL_RESOURCE_TYPE_PREPARE_UPGRADE</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_PREPARE_UPGRADE => 37757162

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-upgrade-completed">CLUSCTL_RESOURCE_TYPE_UPGRADE_COMPLETED</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available before Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_UPGRADE_COMPLETED => 37757166

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_NOTIFY_MONITOR_SHUTTING_DOWN => 34603137

    /**
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_CHECK_DRAIN_VETO => 34611501

    /**
     * @type {Integer (Int32)}
     */
    static CLUSCTL_RESOURCE_TYPE_NOTIFY_DRAIN_COMPLETE => 34611505
}
