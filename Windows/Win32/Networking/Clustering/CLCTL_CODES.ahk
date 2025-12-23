#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLCTL_CODES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_CHARACTERISTICS => 5

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_FLAGS => 9

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_CLASS_INFO => 13

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_REQUIRED_DEPENDENCIES => 17

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_ARB_TIMEOUT => 21

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_FAILURE_INFO => 25

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_NAME => 41

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_RESOURCE_TYPE => 45

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_NODE => 49

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_NETWORK => 53

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_ID => 57

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_FQDN => 61

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_CLUSTER_SERVICE_ACCOUNT_NAME => 65

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_CHECK_VOTER_EVICT => 69

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_CHECK_VOTER_DOWN => 73

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SHUTDOWN => 77

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_ENUM_COMMON_PROPERTIES => 81

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_RO_COMMON_PROPERTIES => 85

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_COMMON_PROPERTIES => 89

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_COMMON_PROPERTIES => 4194398

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_VALIDATE_COMMON_PROPERTIES => 97

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_COMMON_PROPERTY_FMTS => 101

    /**
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
     * @type {Integer (Int32)}
     */
    static CLCTL_ENUM_PRIVATE_PROPERTIES => 121

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_RO_PRIVATE_PROPERTIES => 125

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_PRIVATE_PROPERTIES => 129

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_PRIVATE_PROPERTIES => 4194438

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_VALIDATE_PRIVATE_PROPERTIES => 137

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_PRIVATE_PROPERTY_FMTS => 141

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_PRIVATE_RESOURCE_PROPERTY_FMTS => 145

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_ADD_REGISTRY_CHECKPOINT => 4194466

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_DELETE_REGISTRY_CHECKPOINT => 4194470

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_REGISTRY_CHECKPOINTS => 169

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_ADD_CRYPTO_CHECKPOINT => 4194478

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_DELETE_CRYPTO_CHECKPOINT => 4194482

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_CRYPTO_CHECKPOINTS => 181

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_RESOURCE_UPGRADE_DLL => 4194490

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_ADD_REGISTRY_CHECKPOINT_64BIT => 4194494

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_ADD_REGISTRY_CHECKPOINT_32BIT => 4194498

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_LOADBAL_PROCESS_LIST => 201

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_ACCOUNT_ACCESS => 4194546

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_NETWORK_NAME => 361

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_GET_VIRTUAL_SERVER_TOKEN => 365

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_REGISTER_DNS_RECORDS => 370

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_DNS_NAME => 373

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_SET_PWD_INFO => 378

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_DELETE_CO => 382

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_VALIDATE_VCO => 385

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_RESET_VCO => 389

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_REPAIR_VCO => 397

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_DISK_INFO => 401

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_AVAILABLE_DISKS => 405

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_IS_PATH_VALID => 409

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_SYNC_CLUSDISK_DB => 4194718

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_DISK_NUMBER_INFO => 417

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_QUERY_DELETE => 441

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_IPADDRESS_RENEW_LEASE => 4194750

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_IPADDRESS_RELEASE_LEASE => 4194754

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_QUERY_MAINTENANCE_MODE => 481

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_MAINTENANCE_MODE => 4194790

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_SET_DRIVELETTER => 4194794

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_DRIVELETTERS => 493

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_DISK_INFO_EX => 497

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_AVAILABLE_DISKS_EX => 501

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_DISK_INFO_EX2 => 505

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_CLUSPORT_DISK_COUNT => 509

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_REMAP_DRIVELETTER => 513

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_DISKID => 517

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_IS_CLUSTERABLE => 521

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_REMOVE_VM_OWNERSHIP => 4194830

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_MOUNTPOINTS => 529

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_DIRTY => 537

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_SHARED_VOLUME_INFO => 549

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_IS_CSV_FILE => 553

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_RESOURCEID => 557

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_VALIDATE_PATH => 561

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_VALIDATE_NETNAME => 565

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_VALIDATE_DIRECTORY => 569

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_BATCH_BLOCK_KEY => 574

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_BATCH_UNBLOCK_KEY => 577

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_FILESERVER_SHARE_ADD => 4194886

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_FILESERVER_SHARE_DEL => 4194890

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_FILESERVER_SHARE_MODIFY => 4194894

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_FILESERVER_SHARE_REPORT => 593

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_GET_OU_FOR_VCO => 4194926

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_ENABLE_SHARED_VOLUME_DIRECTIO => 4194954

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_DISABLE_SHARED_VOLUME_DIRECTIO => 4194958

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_SHARED_VOLUME_ID => 657

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_CSV_MAINTENANCE_MODE => 4194966

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_SHARED_VOLUME_BACKUP_MODE => 4194970

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_SHARED_VOLUME_PARTITION_NAMES => 669

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_SHARED_VOLUME_STATES => 4194978

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_IS_SHARED_VOLUME => 677

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_CLUSDB_TIMESTAMP => 681

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_RW_MODIFY_NOOP => 4194990

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_IS_QUORUM_BLOCKED => 689

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_POOL_GET_DRIVE_INFO => 693

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_GUM_LOCK_OWNER => 697

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_STUCK_NODES => 701

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_INJECT_GEM_FAULT => 705

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_INTRODUCE_GEM_REPAIR_DELAY => 709

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SEND_DUMMY_GEM_MESSAGES => 713

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_BLOCK_GEM_SEND_RECV => 717

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_GEMID_VECTOR => 721

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_ADD_CRYPTO_CHECKPOINT_EX => 4195030

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GROUP_GET_LAST_MOVE_TIME => 729

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_STORAGE_CONFIGURATION => 4195042

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_STORAGE_CONFIGURATION => 741

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_STORAGE_CONFIG_ATTRIBUTES => 745

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_REMOVE_NODE => 4195054

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_IS_FEATURE_INSTALLED => 753

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_IS_S2D_FEATURE_SUPPORTED => 757

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_PHYSICAL_DISK_INFO => 761

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_CLUSBFLT_PATHS => 765

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_CLUSBFLT_PATHINFO => 769

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_CLEAR_NODE_CONNECTION_INFO => 4195078

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_DNS_DOMAIN => 4195082

    /**
     * @type {Integer (Int32)}
     */
    static CTCTL_GET_ROUTESTATUS_BASIC => 781

    /**
     * @type {Integer (Int32)}
     */
    static CTCTL_GET_ROUTESTATUS_EXTENDED => 785

    /**
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
     * @type {Integer (Int32)}
     */
    static CLCTL_STORAGE_GET_AVAILABLE_DISKS_EX2_INT => 8161

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS => 8417

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_CLOUD_WITNESS_RESOURCE_UPDATE_TOKEN => 4202726

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_RESOURCE_PREPARE_UPGRADE => 4202730

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_RESOURCE_UPGRADE_COMPLETED => 4202734

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS_WITH_KEY => 8433

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_CLOUD_WITNESS_RESOURCE_UPDATE_KEY => 4202742

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_ADD_REPLICATION_GROUP => 8514

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_LOG_INFO => 8517

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_ELIGIBLE_LOGDISKS => 8521

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_ELIGIBLE_TARGET_DATADISKS => 8525

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_ELIGIBLE_SOURCE_DATADISKS => 8529

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_REPLICATED_DISKS => 8533

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_REPLICA_VOLUMES => 8537

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_LOG_VOLUME => 8541

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_RESOURCE_GROUP => 8545

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_REPLICATION_GET_REPLICATED_PARTITION_INFO => 8549

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_STATE_CHANGE_TIME => 11613

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_CLUSTER_S2D_ENABLED => 4205922

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_CLUSTER_S2D_CACHE_METADATA_RESERVE_BYTES => 4205934

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GROUPSET_GET_GROUPS => 11633

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GROUPSET_GET_PROVIDER_GROUPS => 11637

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GROUPSET_GET_PROVIDER_GROUPSETS => 11641

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GROUP_GET_PROVIDER_GROUPS => 11645

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GROUP_GET_PROVIDER_GROUPSETS => 11649

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GROUP_SET_CCF_FROM_MASTER => 4205958

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_INFRASTRUCTURE_SOFS_BUFFER => 11657

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_INFRASTRUCTURE_SOFS_BUFFER => 4205966

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_NOTIFY_INFRASTRUCTURE_SOFS_CHANGED => 4205970

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SCALEOUT_COMMAND => 4205974

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SCALEOUT_CONTROL => 4205978

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SCALEOUT_GET_CLUSTERS => 4205981

    /**
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
     * @type {Integer (Int32)}
     */
    static CLCTL_DELETE => 5242886

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_INSTALL_NODE => 5242890

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_EVICT_NODE => 5242894

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_ADD_DEPENDENCY => 5242898

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_REMOVE_DEPENDENCY => 5242902

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_ADD_OWNER => 5242906

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_REMOVE_OWNER => 5242910

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_SET_NAME => 5242918

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_CLUSTER_NAME_CHANGED => 5242922

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_CLUSTER_VERSION_CHANGED => 5242926

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_FIXUP_ON_UPGRADE => 5242930

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STARTING_PHASE1 => 5242934

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STARTING_PHASE2 => 5242938

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_HOLD_IO => 5242942

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_RESUME_IO => 5242946

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_FORCE_QUORUM => 5242950

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_INITIALIZE => 5242954

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_STATE_CHANGE_REASON => 5242958

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_PROVIDER_STATE_CHANGE => 5242962

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_LEAVING_GROUP => 5242966

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_JOINING_GROUP => 5242970

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_FSWITNESS_GET_EPOCH_INFO => 1048669

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_FSWITNESS_SET_EPOCH_INFO => 5242978

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_FSWITNESS_RELEASE_LOCK => 5242982

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_NETNAME_CREDS_NOTIFYCAM => 5242986

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_NOTIFY_QUORUM_STATUS => 5243006

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_NOTIFY_MONITOR_SHUTTING_DOWN => 1048705

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_UNDELETE => 5243014

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_GET_OPERATION_CONTEXT => 1057001

    /**
     * @type {Integer (Int32)}
     */
    static CLCTL_NOTIFY_OWNER_CHANGE => 5251362

    /**
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
