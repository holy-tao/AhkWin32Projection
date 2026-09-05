#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLCTL_CODES extends Win32Enum {

    /**
     * Native name: CLCTL_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: CLCTL_GET_CHARACTERISTICS
     * @type {Integer (Int32)}
     */
    static GET_CHARACTERISTICS => 5

    /**
     * Native name: CLCTL_GET_FLAGS
     * @type {Integer (Int32)}
     */
    static GET_FLAGS => 9

    /**
     * Native name: CLCTL_GET_CLASS_INFO
     * @type {Integer (Int32)}
     */
    static GET_CLASS_INFO => 13

    /**
     * Native name: CLCTL_GET_REQUIRED_DEPENDENCIES
     * @type {Integer (Int32)}
     */
    static GET_REQUIRED_DEPENDENCIES => 17

    /**
     * Native name: CLCTL_GET_ARB_TIMEOUT
     * @type {Integer (Int32)}
     */
    static GET_ARB_TIMEOUT => 21

    /**
     * Native name: CLCTL_GET_FAILURE_INFO
     * @type {Integer (Int32)}
     */
    static GET_FAILURE_INFO => 25

    /**
     * Native name: CLCTL_GET_NAME
     * @type {Integer (Int32)}
     */
    static GET_NAME => 41

    /**
     * Native name: CLCTL_GET_RESOURCE_TYPE
     * @type {Integer (Int32)}
     */
    static GET_RESOURCE_TYPE => 45

    /**
     * Native name: CLCTL_GET_NODE
     * @type {Integer (Int32)}
     */
    static GET_NODE => 49

    /**
     * Native name: CLCTL_GET_NETWORK
     * @type {Integer (Int32)}
     */
    static GET_NETWORK => 53

    /**
     * Native name: CLCTL_GET_ID
     * @type {Integer (Int32)}
     */
    static GET_ID => 57

    /**
     * Native name: CLCTL_GET_FQDN
     * @type {Integer (Int32)}
     */
    static GET_FQDN => 61

    /**
     * Native name: CLCTL_GET_CLUSTER_SERVICE_ACCOUNT_NAME
     * @type {Integer (Int32)}
     */
    static GET_CLUSTER_SERVICE_ACCOUNT_NAME => 65

    /**
     * Native name: CLCTL_CHECK_VOTER_EVICT
     * @type {Integer (Int32)}
     */
    static CHECK_VOTER_EVICT => 69

    /**
     * Native name: CLCTL_CHECK_VOTER_DOWN
     * @type {Integer (Int32)}
     */
    static CHECK_VOTER_DOWN => 73

    /**
     * Native name: CLCTL_SHUTDOWN
     * @type {Integer (Int32)}
     */
    static SHUTDOWN => 77

    /**
     * Native name: CLCTL_ENUM_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static ENUM_COMMON_PROPERTIES => 81

    /**
     * Native name: CLCTL_GET_RO_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_RO_COMMON_PROPERTIES => 85

    /**
     * Native name: CLCTL_GET_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_COMMON_PROPERTIES => 89

    /**
     * Native name: CLCTL_SET_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static SET_COMMON_PROPERTIES => 4194398

    /**
     * Native name: CLCTL_VALIDATE_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static VALIDATE_COMMON_PROPERTIES => 97

    /**
     * Native name: CLCTL_GET_COMMON_PROPERTY_FMTS
     * @type {Integer (Int32)}
     */
    static GET_COMMON_PROPERTY_FMTS => 101

    /**
     * Native name: CLCTL_GET_COMMON_RESOURCE_PROPERTY_FMTS
     * @type {Integer (Int32)}
     */
    static GET_COMMON_RESOURCE_PROPERTY_FMTS => 105

    /**
     * Native name: CLCTL_CHECK_VOTER_EVICT_WITNESS
     * @type {Integer (Int32)}
     */
    static CHECK_VOTER_EVICT_WITNESS => 109

    /**
     * Native name: CLCTL_CHECK_VOTER_DOWN_WITNESS
     * @type {Integer (Int32)}
     */
    static CHECK_VOTER_DOWN_WITNESS => 113

    /**
     * Native name: CLCTL_ENUM_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static ENUM_PRIVATE_PROPERTIES => 121

    /**
     * Native name: CLCTL_GET_RO_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_RO_PRIVATE_PROPERTIES => 125

    /**
     * Native name: CLCTL_GET_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_PRIVATE_PROPERTIES => 129

    /**
     * Native name: CLCTL_SET_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static SET_PRIVATE_PROPERTIES => 4194438

    /**
     * Native name: CLCTL_VALIDATE_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static VALIDATE_PRIVATE_PROPERTIES => 137

    /**
     * Native name: CLCTL_GET_PRIVATE_PROPERTY_FMTS
     * @type {Integer (Int32)}
     */
    static GET_PRIVATE_PROPERTY_FMTS => 141

    /**
     * Native name: CLCTL_GET_PRIVATE_RESOURCE_PROPERTY_FMTS
     * @type {Integer (Int32)}
     */
    static GET_PRIVATE_RESOURCE_PROPERTY_FMTS => 145

    /**
     * Native name: CLCTL_ADD_REGISTRY_CHECKPOINT
     * @type {Integer (Int32)}
     */
    static ADD_REGISTRY_CHECKPOINT => 4194466

    /**
     * Native name: CLCTL_DELETE_REGISTRY_CHECKPOINT
     * @type {Integer (Int32)}
     */
    static DELETE_REGISTRY_CHECKPOINT => 4194470

    /**
     * Native name: CLCTL_GET_REGISTRY_CHECKPOINTS
     * @type {Integer (Int32)}
     */
    static GET_REGISTRY_CHECKPOINTS => 169

    /**
     * Native name: CLCTL_ADD_CRYPTO_CHECKPOINT
     * @type {Integer (Int32)}
     */
    static ADD_CRYPTO_CHECKPOINT => 4194478

    /**
     * Native name: CLCTL_DELETE_CRYPTO_CHECKPOINT
     * @type {Integer (Int32)}
     */
    static DELETE_CRYPTO_CHECKPOINT => 4194482

    /**
     * Native name: CLCTL_GET_CRYPTO_CHECKPOINTS
     * @type {Integer (Int32)}
     */
    static GET_CRYPTO_CHECKPOINTS => 181

    /**
     * Native name: CLCTL_RESOURCE_UPGRADE_DLL
     * @type {Integer (Int32)}
     */
    static RESOURCE_UPGRADE_DLL => 4194490

    /**
     * Native name: CLCTL_ADD_REGISTRY_CHECKPOINT_64BIT
     * @type {Integer (Int32)}
     */
    static ADD_REGISTRY_CHECKPOINT_64BIT => 4194494

    /**
     * Native name: CLCTL_ADD_REGISTRY_CHECKPOINT_32BIT
     * @type {Integer (Int32)}
     */
    static ADD_REGISTRY_CHECKPOINT_32BIT => 4194498

    /**
     * Native name: CLCTL_GET_LOADBAL_PROCESS_LIST
     * @type {Integer (Int32)}
     */
    static GET_LOADBAL_PROCESS_LIST => 201

    /**
     * Native name: CLCTL_SET_ACCOUNT_ACCESS
     * @type {Integer (Int32)}
     */
    static SET_ACCOUNT_ACCESS => 4194546

    /**
     * Native name: CLCTL_GET_NETWORK_NAME
     * @type {Integer (Int32)}
     */
    static GET_NETWORK_NAME => 361

    /**
     * Native name: CLCTL_NETNAME_GET_VIRTUAL_SERVER_TOKEN
     * @type {Integer (Int32)}
     */
    static NETNAME_GET_VIRTUAL_SERVER_TOKEN => 365

    /**
     * Native name: CLCTL_NETNAME_REGISTER_DNS_RECORDS
     * @type {Integer (Int32)}
     */
    static NETNAME_REGISTER_DNS_RECORDS => 370

    /**
     * Native name: CLCTL_GET_DNS_NAME
     * @type {Integer (Int32)}
     */
    static GET_DNS_NAME => 373

    /**
     * Native name: CLCTL_NETNAME_SET_PWD_INFO
     * @type {Integer (Int32)}
     */
    static NETNAME_SET_PWD_INFO => 378

    /**
     * Native name: CLCTL_NETNAME_DELETE_CO
     * @type {Integer (Int32)}
     */
    static NETNAME_DELETE_CO => 382

    /**
     * Native name: CLCTL_NETNAME_VALIDATE_VCO
     * @type {Integer (Int32)}
     */
    static NETNAME_VALIDATE_VCO => 385

    /**
     * Native name: CLCTL_NETNAME_RESET_VCO
     * @type {Integer (Int32)}
     */
    static NETNAME_RESET_VCO => 389

    /**
     * Native name: CLCTL_NETNAME_REPAIR_VCO
     * @type {Integer (Int32)}
     */
    static NETNAME_REPAIR_VCO => 397

    /**
     * Native name: CLCTL_STORAGE_GET_DISK_INFO
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_DISK_INFO => 401

    /**
     * Native name: CLCTL_STORAGE_GET_AVAILABLE_DISKS
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_AVAILABLE_DISKS => 405

    /**
     * Native name: CLCTL_STORAGE_IS_PATH_VALID
     * @type {Integer (Int32)}
     */
    static STORAGE_IS_PATH_VALID => 409

    /**
     * Native name: CLCTL_STORAGE_SYNC_CLUSDISK_DB
     * @type {Integer (Int32)}
     */
    static STORAGE_SYNC_CLUSDISK_DB => 4194718

    /**
     * Native name: CLCTL_STORAGE_GET_DISK_NUMBER_INFO
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_DISK_NUMBER_INFO => 417

    /**
     * Native name: CLCTL_QUERY_DELETE
     * @type {Integer (Int32)}
     */
    static QUERY_DELETE => 441

    /**
     * Native name: CLCTL_IPADDRESS_RENEW_LEASE
     * @type {Integer (Int32)}
     */
    static IPADDRESS_RENEW_LEASE => 4194750

    /**
     * Native name: CLCTL_IPADDRESS_RELEASE_LEASE
     * @type {Integer (Int32)}
     */
    static IPADDRESS_RELEASE_LEASE => 4194754

    /**
     * Native name: CLCTL_QUERY_MAINTENANCE_MODE
     * @type {Integer (Int32)}
     */
    static QUERY_MAINTENANCE_MODE => 481

    /**
     * Native name: CLCTL_SET_MAINTENANCE_MODE
     * @type {Integer (Int32)}
     */
    static SET_MAINTENANCE_MODE => 4194790

    /**
     * Native name: CLCTL_STORAGE_SET_DRIVELETTER
     * @type {Integer (Int32)}
     */
    static STORAGE_SET_DRIVELETTER => 4194794

    /**
     * Native name: CLCTL_STORAGE_GET_DRIVELETTERS
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_DRIVELETTERS => 493

    /**
     * Native name: CLCTL_STORAGE_GET_DISK_INFO_EX
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_DISK_INFO_EX => 497

    /**
     * Native name: CLCTL_STORAGE_GET_AVAILABLE_DISKS_EX
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_AVAILABLE_DISKS_EX => 501

    /**
     * Native name: CLCTL_STORAGE_GET_DISK_INFO_EX2
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_DISK_INFO_EX2 => 505

    /**
     * Native name: CLCTL_STORAGE_GET_CLUSPORT_DISK_COUNT
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_CLUSPORT_DISK_COUNT => 509

    /**
     * Native name: CLCTL_STORAGE_REMAP_DRIVELETTER
     * @type {Integer (Int32)}
     */
    static STORAGE_REMAP_DRIVELETTER => 513

    /**
     * Native name: CLCTL_STORAGE_GET_DISKID
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_DISKID => 517

    /**
     * Native name: CLCTL_STORAGE_IS_CLUSTERABLE
     * @type {Integer (Int32)}
     */
    static STORAGE_IS_CLUSTERABLE => 521

    /**
     * Native name: CLCTL_STORAGE_REMOVE_VM_OWNERSHIP
     * @type {Integer (Int32)}
     */
    static STORAGE_REMOVE_VM_OWNERSHIP => 4194830

    /**
     * Native name: CLCTL_STORAGE_GET_MOUNTPOINTS
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_MOUNTPOINTS => 529

    /**
     * Native name: CLCTL_STORAGE_GET_DIRTY
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_DIRTY => 537

    /**
     * Native name: CLCTL_STORAGE_GET_SHARED_VOLUME_INFO
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_SHARED_VOLUME_INFO => 549

    /**
     * Native name: CLCTL_STORAGE_IS_CSV_FILE
     * @type {Integer (Int32)}
     */
    static STORAGE_IS_CSV_FILE => 553

    /**
     * Native name: CLCTL_STORAGE_GET_RESOURCEID
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_RESOURCEID => 557

    /**
     * Native name: CLCTL_VALIDATE_PATH
     * @type {Integer (Int32)}
     */
    static VALIDATE_PATH => 561

    /**
     * Native name: CLCTL_VALIDATE_NETNAME
     * @type {Integer (Int32)}
     */
    static VALIDATE_NETNAME => 565

    /**
     * Native name: CLCTL_VALIDATE_DIRECTORY
     * @type {Integer (Int32)}
     */
    static VALIDATE_DIRECTORY => 569

    /**
     * Native name: CLCTL_BATCH_BLOCK_KEY
     * @type {Integer (Int32)}
     */
    static BATCH_BLOCK_KEY => 574

    /**
     * Native name: CLCTL_BATCH_UNBLOCK_KEY
     * @type {Integer (Int32)}
     */
    static BATCH_UNBLOCK_KEY => 577

    /**
     * Native name: CLCTL_FILESERVER_SHARE_ADD
     * @type {Integer (Int32)}
     */
    static FILESERVER_SHARE_ADD => 4194886

    /**
     * Native name: CLCTL_FILESERVER_SHARE_DEL
     * @type {Integer (Int32)}
     */
    static FILESERVER_SHARE_DEL => 4194890

    /**
     * Native name: CLCTL_FILESERVER_SHARE_MODIFY
     * @type {Integer (Int32)}
     */
    static FILESERVER_SHARE_MODIFY => 4194894

    /**
     * Native name: CLCTL_FILESERVER_SHARE_REPORT
     * @type {Integer (Int32)}
     */
    static FILESERVER_SHARE_REPORT => 593

    /**
     * Native name: CLCTL_NETNAME_GET_OU_FOR_VCO
     * @type {Integer (Int32)}
     */
    static NETNAME_GET_OU_FOR_VCO => 4194926

    /**
     * Native name: CLCTL_ENABLE_SHARED_VOLUME_DIRECTIO
     * @type {Integer (Int32)}
     */
    static ENABLE_SHARED_VOLUME_DIRECTIO => 4194954

    /**
     * Native name: CLCTL_DISABLE_SHARED_VOLUME_DIRECTIO
     * @type {Integer (Int32)}
     */
    static DISABLE_SHARED_VOLUME_DIRECTIO => 4194958

    /**
     * Native name: CLCTL_GET_SHARED_VOLUME_ID
     * @type {Integer (Int32)}
     */
    static GET_SHARED_VOLUME_ID => 657

    /**
     * Native name: CLCTL_SET_CSV_MAINTENANCE_MODE
     * @type {Integer (Int32)}
     */
    static SET_CSV_MAINTENANCE_MODE => 4194966

    /**
     * Native name: CLCTL_SET_SHARED_VOLUME_BACKUP_MODE
     * @type {Integer (Int32)}
     */
    static SET_SHARED_VOLUME_BACKUP_MODE => 4194970

    /**
     * Native name: CLCTL_STORAGE_GET_SHARED_VOLUME_PARTITION_NAMES
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_SHARED_VOLUME_PARTITION_NAMES => 669

    /**
     * Native name: CLCTL_STORAGE_GET_SHARED_VOLUME_STATES
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_SHARED_VOLUME_STATES => 4194978

    /**
     * Native name: CLCTL_STORAGE_IS_SHARED_VOLUME
     * @type {Integer (Int32)}
     */
    static STORAGE_IS_SHARED_VOLUME => 677

    /**
     * Native name: CLCTL_GET_CLUSDB_TIMESTAMP
     * @type {Integer (Int32)}
     */
    static GET_CLUSDB_TIMESTAMP => 681

    /**
     * Native name: CLCTL_RW_MODIFY_NOOP
     * @type {Integer (Int32)}
     */
    static RW_MODIFY_NOOP => 4194990

    /**
     * Native name: CLCTL_IS_QUORUM_BLOCKED
     * @type {Integer (Int32)}
     */
    static IS_QUORUM_BLOCKED => 689

    /**
     * Native name: CLCTL_POOL_GET_DRIVE_INFO
     * @type {Integer (Int32)}
     */
    static POOL_GET_DRIVE_INFO => 693

    /**
     * Native name: CLCTL_GET_GUM_LOCK_OWNER
     * @type {Integer (Int32)}
     */
    static GET_GUM_LOCK_OWNER => 697

    /**
     * Native name: CLCTL_GET_STUCK_NODES
     * @type {Integer (Int32)}
     */
    static GET_STUCK_NODES => 701

    /**
     * Native name: CLCTL_INJECT_GEM_FAULT
     * @type {Integer (Int32)}
     */
    static INJECT_GEM_FAULT => 705

    /**
     * Native name: CLCTL_INTRODUCE_GEM_REPAIR_DELAY
     * @type {Integer (Int32)}
     */
    static INTRODUCE_GEM_REPAIR_DELAY => 709

    /**
     * Native name: CLCTL_SEND_DUMMY_GEM_MESSAGES
     * @type {Integer (Int32)}
     */
    static SEND_DUMMY_GEM_MESSAGES => 713

    /**
     * Native name: CLCTL_BLOCK_GEM_SEND_RECV
     * @type {Integer (Int32)}
     */
    static BLOCK_GEM_SEND_RECV => 717

    /**
     * Native name: CLCTL_GET_GEMID_VECTOR
     * @type {Integer (Int32)}
     */
    static GET_GEMID_VECTOR => 721

    /**
     * Native name: CLCTL_ADD_CRYPTO_CHECKPOINT_EX
     * @type {Integer (Int32)}
     */
    static ADD_CRYPTO_CHECKPOINT_EX => 4195030

    /**
     * Native name: CLCTL_GROUP_GET_LAST_MOVE_TIME
     * @type {Integer (Int32)}
     */
    static GROUP_GET_LAST_MOVE_TIME => 729

    /**
     * Native name: CLCTL_SET_STORAGE_CONFIGURATION
     * @type {Integer (Int32)}
     */
    static SET_STORAGE_CONFIGURATION => 4195042

    /**
     * Native name: CLCTL_GET_STORAGE_CONFIGURATION
     * @type {Integer (Int32)}
     */
    static GET_STORAGE_CONFIGURATION => 741

    /**
     * Native name: CLCTL_GET_STORAGE_CONFIG_ATTRIBUTES
     * @type {Integer (Int32)}
     */
    static GET_STORAGE_CONFIG_ATTRIBUTES => 745

    /**
     * Native name: CLCTL_REMOVE_NODE
     * @type {Integer (Int32)}
     */
    static REMOVE_NODE => 4195054

    /**
     * Native name: CLCTL_IS_FEATURE_INSTALLED
     * @type {Integer (Int32)}
     */
    static IS_FEATURE_INSTALLED => 753

    /**
     * Native name: CLCTL_IS_S2D_FEATURE_SUPPORTED
     * @type {Integer (Int32)}
     */
    static IS_S2D_FEATURE_SUPPORTED => 757

    /**
     * Native name: CLCTL_STORAGE_GET_PHYSICAL_DISK_INFO
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_PHYSICAL_DISK_INFO => 761

    /**
     * Native name: CLCTL_STORAGE_GET_CLUSBFLT_PATHS
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_CLUSBFLT_PATHS => 765

    /**
     * Native name: CLCTL_STORAGE_GET_CLUSBFLT_PATHINFO
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_CLUSBFLT_PATHINFO => 769

    /**
     * Native name: CLCTL_CLEAR_NODE_CONNECTION_INFO
     * @type {Integer (Int32)}
     */
    static CLEAR_NODE_CONNECTION_INFO => 4195078

    /**
     * Native name: CLCTL_SET_DNS_DOMAIN
     * @type {Integer (Int32)}
     */
    static SET_DNS_DOMAIN => 4195082

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
     * Native name: CLCTL_NETNAME_SET_PWD_INFOEX
     * @type {Integer (Int32)}
     */
    static NETNAME_SET_PWD_INFOEX => 794

    /**
     * Native name: CLCTL_GET_NODE_NETWORK_CONNECTIVITY
     * @type {Integer (Int32)}
     */
    static GET_NODE_NETWORK_CONNECTIVITY => 797

    /**
     * Native name: CLCTL_STORAGE_GET_AVAILABLE_DISKS_EX2_INT
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_AVAILABLE_DISKS_EX2_INT => 8161

    /**
     * Native name: CLCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS
     * @type {Integer (Int32)}
     */
    static CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS => 8417

    /**
     * Native name: CLCTL_CLOUD_WITNESS_RESOURCE_UPDATE_TOKEN
     * @type {Integer (Int32)}
     */
    static CLOUD_WITNESS_RESOURCE_UPDATE_TOKEN => 4202726

    /**
     * Native name: CLCTL_RESOURCE_PREPARE_UPGRADE
     * @type {Integer (Int32)}
     */
    static RESOURCE_PREPARE_UPGRADE => 4202730

    /**
     * Native name: CLCTL_RESOURCE_UPGRADE_COMPLETED
     * @type {Integer (Int32)}
     */
    static RESOURCE_UPGRADE_COMPLETED => 4202734

    /**
     * Native name: CLCTL_CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS_WITH_KEY
     * @type {Integer (Int32)}
     */
    static CLOUD_WITNESS_RESOURCE_TYPE_VALIDATE_CREDENTIALS_WITH_KEY => 8433

    /**
     * Native name: CLCTL_CLOUD_WITNESS_RESOURCE_UPDATE_KEY
     * @type {Integer (Int32)}
     */
    static CLOUD_WITNESS_RESOURCE_UPDATE_KEY => 4202742

    /**
     * Native name: CLCTL_REPLICATION_ADD_REPLICATION_GROUP
     * @type {Integer (Int32)}
     */
    static REPLICATION_ADD_REPLICATION_GROUP => 8514

    /**
     * Native name: CLCTL_REPLICATION_GET_LOG_INFO
     * @type {Integer (Int32)}
     */
    static REPLICATION_GET_LOG_INFO => 8517

    /**
     * Native name: CLCTL_REPLICATION_GET_ELIGIBLE_LOGDISKS
     * @type {Integer (Int32)}
     */
    static REPLICATION_GET_ELIGIBLE_LOGDISKS => 8521

    /**
     * Native name: CLCTL_REPLICATION_GET_ELIGIBLE_TARGET_DATADISKS
     * @type {Integer (Int32)}
     */
    static REPLICATION_GET_ELIGIBLE_TARGET_DATADISKS => 8525

    /**
     * Native name: CLCTL_REPLICATION_GET_ELIGIBLE_SOURCE_DATADISKS
     * @type {Integer (Int32)}
     */
    static REPLICATION_GET_ELIGIBLE_SOURCE_DATADISKS => 8529

    /**
     * Native name: CLCTL_REPLICATION_GET_REPLICATED_DISKS
     * @type {Integer (Int32)}
     */
    static REPLICATION_GET_REPLICATED_DISKS => 8533

    /**
     * Native name: CLCTL_REPLICATION_GET_REPLICA_VOLUMES
     * @type {Integer (Int32)}
     */
    static REPLICATION_GET_REPLICA_VOLUMES => 8537

    /**
     * Native name: CLCTL_REPLICATION_GET_LOG_VOLUME
     * @type {Integer (Int32)}
     */
    static REPLICATION_GET_LOG_VOLUME => 8541

    /**
     * Native name: CLCTL_REPLICATION_GET_RESOURCE_GROUP
     * @type {Integer (Int32)}
     */
    static REPLICATION_GET_RESOURCE_GROUP => 8545

    /**
     * Native name: CLCTL_REPLICATION_GET_REPLICATED_PARTITION_INFO
     * @type {Integer (Int32)}
     */
    static REPLICATION_GET_REPLICATED_PARTITION_INFO => 8549

    /**
     * Native name: CLCTL_GET_STATE_CHANGE_TIME
     * @type {Integer (Int32)}
     */
    static GET_STATE_CHANGE_TIME => 11613

    /**
     * Native name: CLCTL_SET_CLUSTER_S2D_ENABLED
     * @type {Integer (Int32)}
     */
    static SET_CLUSTER_S2D_ENABLED => 4205922

    /**
     * Native name: CLCTL_SET_CLUSTER_S2D_CACHE_METADATA_RESERVE_BYTES
     * @type {Integer (Int32)}
     */
    static SET_CLUSTER_S2D_CACHE_METADATA_RESERVE_BYTES => 4205934

    /**
     * Native name: CLCTL_GROUPSET_GET_GROUPS
     * @type {Integer (Int32)}
     */
    static GROUPSET_GET_GROUPS => 11633

    /**
     * Native name: CLCTL_GROUPSET_GET_PROVIDER_GROUPS
     * @type {Integer (Int32)}
     */
    static GROUPSET_GET_PROVIDER_GROUPS => 11637

    /**
     * Native name: CLCTL_GROUPSET_GET_PROVIDER_GROUPSETS
     * @type {Integer (Int32)}
     */
    static GROUPSET_GET_PROVIDER_GROUPSETS => 11641

    /**
     * Native name: CLCTL_GROUP_GET_PROVIDER_GROUPS
     * @type {Integer (Int32)}
     */
    static GROUP_GET_PROVIDER_GROUPS => 11645

    /**
     * Native name: CLCTL_GROUP_GET_PROVIDER_GROUPSETS
     * @type {Integer (Int32)}
     */
    static GROUP_GET_PROVIDER_GROUPSETS => 11649

    /**
     * Native name: CLCTL_GROUP_SET_CCF_FROM_MASTER
     * @type {Integer (Int32)}
     */
    static GROUP_SET_CCF_FROM_MASTER => 4205958

    /**
     * Native name: CLCTL_GET_INFRASTRUCTURE_SOFS_BUFFER
     * @type {Integer (Int32)}
     */
    static GET_INFRASTRUCTURE_SOFS_BUFFER => 11657

    /**
     * Native name: CLCTL_SET_INFRASTRUCTURE_SOFS_BUFFER
     * @type {Integer (Int32)}
     */
    static SET_INFRASTRUCTURE_SOFS_BUFFER => 4205966

    /**
     * Native name: CLCTL_NOTIFY_INFRASTRUCTURE_SOFS_CHANGED
     * @type {Integer (Int32)}
     */
    static NOTIFY_INFRASTRUCTURE_SOFS_CHANGED => 4205970

    /**
     * Native name: CLCTL_SCALEOUT_COMMAND
     * @type {Integer (Int32)}
     */
    static SCALEOUT_COMMAND => 4205974

    /**
     * Native name: CLCTL_SCALEOUT_CONTROL
     * @type {Integer (Int32)}
     */
    static SCALEOUT_CONTROL => 4205978

    /**
     * Native name: CLCTL_SCALEOUT_GET_CLUSTERS
     * @type {Integer (Int32)}
     */
    static SCALEOUT_GET_CLUSTERS => 4205981

    /**
     * Native name: CLCTL_RELOAD_AUTOLOGGER_CONFIG
     * @type {Integer (Int32)}
     */
    static RELOAD_AUTOLOGGER_CONFIG => 11730

    /**
     * Native name: CLCTL_STORAGE_RENAME_SHARED_VOLUME
     * @type {Integer (Int32)}
     */
    static STORAGE_RENAME_SHARED_VOLUME => 11734

    /**
     * Native name: CLCTL_STORAGE_RENAME_SHARED_VOLUME_GUID
     * @type {Integer (Int32)}
     */
    static STORAGE_RENAME_SHARED_VOLUME_GUID => 11738

    /**
     * Native name: CLCTL_ENUM_AFFINITY_RULE_NAMES
     * @type {Integer (Int32)}
     */
    static ENUM_AFFINITY_RULE_NAMES => 11741

    /**
     * Native name: CLCTL_GET_NODES_IN_FD
     * @type {Integer (Int32)}
     */
    static GET_NODES_IN_FD => 11745

    /**
     * Native name: CLCTL_FORCE_DB_FLUSH
     * @type {Integer (Int32)}
     */
    static FORCE_DB_FLUSH => 4206054

    /**
     * Native name: CLCTL_DELETE
     * @type {Integer (Int32)}
     */
    static DELETE => 5242886

    /**
     * Native name: CLCTL_INSTALL_NODE
     * @type {Integer (Int32)}
     */
    static INSTALL_NODE => 5242890

    /**
     * Native name: CLCTL_EVICT_NODE
     * @type {Integer (Int32)}
     */
    static EVICT_NODE => 5242894

    /**
     * Native name: CLCTL_ADD_DEPENDENCY
     * @type {Integer (Int32)}
     */
    static ADD_DEPENDENCY => 5242898

    /**
     * Native name: CLCTL_REMOVE_DEPENDENCY
     * @type {Integer (Int32)}
     */
    static REMOVE_DEPENDENCY => 5242902

    /**
     * Native name: CLCTL_ADD_OWNER
     * @type {Integer (Int32)}
     */
    static ADD_OWNER => 5242906

    /**
     * Native name: CLCTL_REMOVE_OWNER
     * @type {Integer (Int32)}
     */
    static REMOVE_OWNER => 5242910

    /**
     * Native name: CLCTL_SET_NAME
     * @type {Integer (Int32)}
     */
    static SET_NAME => 5242918

    /**
     * Native name: CLCTL_CLUSTER_NAME_CHANGED
     * @type {Integer (Int32)}
     */
    static CLUSTER_NAME_CHANGED => 5242922

    /**
     * Native name: CLCTL_CLUSTER_VERSION_CHANGED
     * @type {Integer (Int32)}
     */
    static CLUSTER_VERSION_CHANGED => 5242926

    /**
     * Native name: CLCTL_FIXUP_ON_UPGRADE
     * @type {Integer (Int32)}
     */
    static FIXUP_ON_UPGRADE => 5242930

    /**
     * Native name: CLCTL_STARTING_PHASE1
     * @type {Integer (Int32)}
     */
    static STARTING_PHASE1 => 5242934

    /**
     * Native name: CLCTL_STARTING_PHASE2
     * @type {Integer (Int32)}
     */
    static STARTING_PHASE2 => 5242938

    /**
     * Native name: CLCTL_HOLD_IO
     * @type {Integer (Int32)}
     */
    static HOLD_IO => 5242942

    /**
     * Native name: CLCTL_RESUME_IO
     * @type {Integer (Int32)}
     */
    static RESUME_IO => 5242946

    /**
     * Native name: CLCTL_FORCE_QUORUM
     * @type {Integer (Int32)}
     */
    static FORCE_QUORUM => 5242950

    /**
     * Native name: CLCTL_INITIALIZE
     * @type {Integer (Int32)}
     */
    static INITIALIZE => 5242954

    /**
     * Native name: CLCTL_STATE_CHANGE_REASON
     * @type {Integer (Int32)}
     */
    static STATE_CHANGE_REASON => 5242958

    /**
     * Native name: CLCTL_PROVIDER_STATE_CHANGE
     * @type {Integer (Int32)}
     */
    static PROVIDER_STATE_CHANGE => 5242962

    /**
     * Native name: CLCTL_LEAVING_GROUP
     * @type {Integer (Int32)}
     */
    static LEAVING_GROUP => 5242966

    /**
     * Native name: CLCTL_JOINING_GROUP
     * @type {Integer (Int32)}
     */
    static JOINING_GROUP => 5242970

    /**
     * Native name: CLCTL_FSWITNESS_GET_EPOCH_INFO
     * @type {Integer (Int32)}
     */
    static FSWITNESS_GET_EPOCH_INFO => 1048669

    /**
     * Native name: CLCTL_FSWITNESS_SET_EPOCH_INFO
     * @type {Integer (Int32)}
     */
    static FSWITNESS_SET_EPOCH_INFO => 5242978

    /**
     * Native name: CLCTL_FSWITNESS_RELEASE_LOCK
     * @type {Integer (Int32)}
     */
    static FSWITNESS_RELEASE_LOCK => 5242982

    /**
     * Native name: CLCTL_NETNAME_CREDS_NOTIFYCAM
     * @type {Integer (Int32)}
     */
    static NETNAME_CREDS_NOTIFYCAM => 5242986

    /**
     * Native name: CLCTL_NOTIFY_QUORUM_STATUS
     * @type {Integer (Int32)}
     */
    static NOTIFY_QUORUM_STATUS => 5243006

    /**
     * Native name: CLCTL_NOTIFY_MONITOR_SHUTTING_DOWN
     * @type {Integer (Int32)}
     */
    static NOTIFY_MONITOR_SHUTTING_DOWN => 1048705

    /**
     * Native name: CLCTL_UNDELETE
     * @type {Integer (Int32)}
     */
    static UNDELETE => 5243014

    /**
     * Native name: CLCTL_GET_OPERATION_CONTEXT
     * @type {Integer (Int32)}
     */
    static GET_OPERATION_CONTEXT => 1057001

    /**
     * Native name: CLCTL_NOTIFY_OWNER_CHANGE
     * @type {Integer (Int32)}
     */
    static NOTIFY_OWNER_CHANGE => 5251362

    /**
     * Native name: CLCTL_VALIDATE_CHANGE_GROUP
     * @type {Integer (Int32)}
     */
    static VALIDATE_CHANGE_GROUP => 1057061

    /**
     * Native name: CLCTL_CHECK_DRAIN_VETO
     * @type {Integer (Int32)}
     */
    static CHECK_DRAIN_VETO => 1057069

    /**
     * Native name: CLCTL_NOTIFY_DRAIN_COMPLETE
     * @type {Integer (Int32)}
     */
    static NOTIFY_DRAIN_COMPLETE => 1057073
}
