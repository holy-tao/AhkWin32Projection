#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_VERSION_FLAG_MIXED_MODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_VERSION_UNKNOWN := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global NT4_MAJOR_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global NT4SP4_MAJOR_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global NT5_MAJOR_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global NT51_MAJOR_VERSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global NT6_MAJOR_VERSION := 5

/**
 * @type {Integer (UInt32)}
 */
export global NT7_MAJOR_VERSION := 6

/**
 * @type {Integer (UInt32)}
 */
export global NT8_MAJOR_VERSION := 7

/**
 * @type {Integer (UInt32)}
 */
export global NT9_MAJOR_VERSION := 8

/**
 * @type {Integer (UInt32)}
 */
export global NT10_MAJOR_VERSION := 9

/**
 * @type {Integer (UInt32)}
 */
export global NT11_MAJOR_VERSION := 10

/**
 * @type {Integer (UInt32)}
 */
export global NT12_MAJOR_VERSION := 11

/**
 * @type {Integer (UInt32)}
 */
export global NT13_MAJOR_VERSION := 12

/**
 * @type {Integer (UInt32)}
 */
export global WS2016_TP4_UPGRADE_VERSION := 6

/**
 * @type {Integer (UInt32)}
 */
export global WS2016_TP5_UPGRADE_VERSION := 7

/**
 * @type {Integer (UInt32)}
 */
export global WS2016_RTM_UPGRADE_VERSION := 8

/**
 * @type {Integer (UInt32)}
 */
export global RS3_UPGRADE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global RS4_UPGRADE_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global RS5_UPGRADE_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global NINETEEN_H1_UPGRADE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global NINETEEN_H2_UPGRADE_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global MN_UPGRADE_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global FE_UPGRADE_VERSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global FE_22H2_UPGRADE_VERSION := 5

/**
 * @type {Integer (UInt32)}
 */
export global CA_UPGRADE_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global NI_UPGRADE_VERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global CU_UPGRADE_VERSION := 3

/**
 * @type {Integer (UInt32)}
 */
export global ZN_UPGRADE_VERSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global GA_UPGRADE_VERSION := 5

/**
 * @type {Integer (UInt32)}
 */
export global GE_UPGRADE_VERSION := 6

/**
 * @type {Integer (UInt32)}
 */
export global HCI_UPGRADE_BIT := 32768

/**
 * @type {String}
 */
export global CLUSREG_NAME_MIXED_MODE := "MixedMode"

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_VERSION_SERVER2008 := 1536

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_VERSION_SERVER2008R2 := 1792

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_VERSION_WINDOWS8 := 1793

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_VERSION_WINDOWSBLUE := 1794

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_VERSION_WINTHRESHOLD := 1795

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_VERSION_RS3 := 2560

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_VERSION_NI := 2572

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_VERSION_CU := 3075

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_VERSION_ZN := 3076

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_VERSION_GA := 3077

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_VERSION := 3077

/**
 * @type {Integer (UInt32)}
 */
export global CREATE_CLUSTER_VERSION := 1536

/**
 * @type {Integer (UInt32)}
 */
export global CREATE_CLUSTER_MAJOR_VERSION_MASK := 4294967040

/**
 * @type {Integer (UInt32)}
 */
export global MAX_CLUSTERNAME_LENGTH := 63

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_INSTALLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_CONFIGURED := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_RUNNING := 16

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_HYBRID_QUORUM := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_NODE_MAJORITY_QUORUM := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLUSCTL_RESOURCE_STATE_CHANGE_REASON_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSREG_DATABASE_SYNC_WRITE_TO_ALL_NODES := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSREG_DATABASE_ISOLATE_READ := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_ENUM_ITEM_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_ENUM_ITEM_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_CREATE_GROUP_INFO_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_CREATE_GROUP_INFO_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global GROUPSET_READY_SETTING_DELAY := 1

/**
 * @type {Integer (UInt32)}
 */
export global GROUPSET_READY_SETTING_ONLINE := 2

/**
 * @type {Integer (UInt32)}
 */
export global GROUPSET_READY_SETTING_OS_HEARTBEAT := 3

/**
 * @type {Integer (UInt32)}
 */
export global GROUPSET_READY_SETTING_APPLICATION_READY := 4

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_GRP_MOVE_ALLOWED := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_GRP_MOVE_LOCKED := 1

/**
 * @type {Integer (Int32)}
 */
export global CLUSAPI_READ_ACCESS := 1

/**
 * @type {Integer (Int32)}
 */
export global CLUSAPI_CHANGE_ACCESS := 2

/**
 * @type {Integer (Int32)}
 */
export global CLUSAPI_NO_ACCESS := 4

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_SET_ACCESS_TYPE_ALLOWED := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_SET_ACCESS_TYPE_DENIED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_DELETE_ACCESS_CONTROL_ENTRY := 2

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGROUPSET_STATUS_GROUPS_PENDING := 1

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGROUPSET_STATUS_GROUPS_ONLINE := 2

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGROUPSET_STATUS_OS_HEARTBEAT := 4

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGROUPSET_STATUS_APPLICATION_READY := 8

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_AVAILABILITY_SET_CONFIG_V1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_GROUP_ENUM_ITEM_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_GROUP_ENUM_ITEM_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_RESOURCE_ENUM_ITEM_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_RESOURCE_ENUM_ITEM_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_NODE_PAUSE_REMAIN_ON_PAUSED_NODE_ON_MOVE_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_NODE_AVOID_PLACEMENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_NODE_PAUSE_RETRY_DRAIN_ON_FAILURE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_NODE_RESUME_FAILBACK_STORAGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_NODE_RESUME_FAILBACK_VMS := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_NODE_RESUME_FAILBACK_PINNED_VMS_ONLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_NODE_RESUME_FAILBACK_VMS_FORCEFULLY := 8

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGRP_STATUS_LOCKED_MODE := 1

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGRP_STATUS_PREEMPTED := 2

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGRP_STATUS_WAITING_IN_QUEUE_FOR_MOVE := 4

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGRP_STATUS_PHYSICAL_RESOURCES_LACKING := 8

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGRP_STATUS_WAITING_TO_START := 16

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGRP_STATUS_EMBEDDED_FAILURE := 32

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGRP_STATUS_OFFLINE_DUE_TO_ANTIAFFINITY_CONFLICT := 64

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGRP_STATUS_NETWORK_FAILURE := 128

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGRP_STATUS_UNMONITORED := 256

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGRP_STATUS_OS_HEARTBEAT := 512

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGRP_STATUS_APPLICATION_READY := 1024

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGRP_STATUS_OFFLINE_NOT_LOCAL_DISK_OWNER := 2048

/**
 * @type {Integer (UInt64)}
 */
export global CLUSGRP_STATUS_WAITING_FOR_DEPENDENCIES := 4096

/**
 * @type {Integer (UInt64)}
 */
export global CLUSRES_STATUS_LOCKED_MODE := 1

/**
 * @type {Integer (UInt64)}
 */
export global CLUSRES_STATUS_EMBEDDED_FAILURE := 2

/**
 * @type {Integer (UInt64)}
 */
export global CLUSRES_STATUS_FAILED_DUE_TO_INSUFFICIENT_CPU := 4

/**
 * @type {Integer (UInt64)}
 */
export global CLUSRES_STATUS_FAILED_DUE_TO_INSUFFICIENT_MEMORY := 8

/**
 * @type {Integer (UInt64)}
 */
export global CLUSRES_STATUS_FAILED_DUE_TO_INSUFFICIENT_GENERIC_RESOURCES := 16

/**
 * @type {Integer (UInt64)}
 */
export global CLUSRES_STATUS_NETWORK_FAILURE := 32

/**
 * @type {Integer (UInt64)}
 */
export global CLUSRES_STATUS_UNMONITORED := 64

/**
 * @type {Integer (UInt64)}
 */
export global CLUSRES_STATUS_OS_HEARTBEAT := 128

/**
 * @type {Integer (UInt64)}
 */
export global CLUSRES_STATUS_APPLICATION_READY := 256

/**
 * @type {Integer (UInt64)}
 */
export global CLUSRES_STATUS_OFFLINE_NOT_LOCAL_DISK_OWNER := 512

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_GROUP_ONLINE_IGNORE_RESOURCE_STATUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_GROUP_ONLINE_SYNCHRONOUS := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_GROUP_ONLINE_BEST_POSSIBLE_NODE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_GROUP_ONLINE_IGNORE_AFFINITY_RULE := 8

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_GROUP_OFFLINE_IGNORE_RESOURCE_STATUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_RESOURCE_ONLINE_IGNORE_RESOURCE_STATUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_RESOURCE_ONLINE_DO_NOT_UPDATE_PERSISTENT_STATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_RESOURCE_ONLINE_NECESSARY_FOR_QUORUM := 4

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_RESOURCE_ONLINE_BEST_POSSIBLE_NODE := 8

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_RESOURCE_ONLINE_IGNORE_AFFINITY_RULE := 32

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_RESOURCE_OFFLINE_IGNORE_RESOURCE_STATUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_RESOURCE_OFFLINE_FORCE_WITH_TERMINATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_RESOURCE_OFFLINE_DO_NOT_UPDATE_PERSISTENT_STATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_RESOURCE_OFFLINE_REASON_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_RESOURCE_OFFLINE_REASON_UNKNOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_RESOURCE_OFFLINE_REASON_MOVING := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_RESOURCE_OFFLINE_REASON_USER_REQUESTED := 4

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_RESOURCE_OFFLINE_REASON_BEING_DELETED := 8

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_RESOURCE_OFFLINE_REASON_BEING_RESTARTED := 16

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_RESOURCE_OFFLINE_REASON_PREEMPTED := 32

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_RESOURCE_OFFLINE_REASON_SHUTTING_DOWN := 64

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_GROUP_MOVE_IGNORE_RESOURCE_STATUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_GROUP_MOVE_RETURN_TO_SOURCE_NODE_ON_ERROR := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_GROUP_MOVE_QUEUE_ENABLED := 4

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_GROUP_MOVE_HIGH_PRIORITY_START := 8

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_GROUP_MOVE_FAILBACK := 16

/**
 * @type {Integer (UInt32)}
 */
export global CLUSAPI_GROUP_MOVE_IGNORE_AFFINITY_RULE := 32

/**
 * @type {Integer (UInt64)}
 */
export global CLUSAPI_CHANGE_RESOURCE_GROUP_FORCE_MOVE_TO_CSV := 1

/**
 * @type {Integer (UInt64)}
 */
export global CLUSAPI_VALID_CHANGE_RESOURCE_GROUP_FLAGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global GROUP_FAILURE_INFO_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global RESOURCE_FAILURE_INFO_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_ACCESS_ANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_ACCESS_READ := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_ACCESS_WRITE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_NO_MODIFY := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_MODIFY := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_NOT_GLOBAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_GLOBAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSCTL_ACCESS_SHIFT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLUSCTL_FUNCTION_SHIFT := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLCTL_INTERNAL_SHIFT := 20

/**
 * @type {Integer (UInt32)}
 */
export global CLCTL_USER_SHIFT := 21

/**
 * @type {Integer (UInt32)}
 */
export global CLCTL_MODIFY_SHIFT := 22

/**
 * @type {Integer (UInt32)}
 */
export global CLCTL_GLOBAL_SHIFT := 23

/**
 * @type {Integer (UInt32)}
 */
export global CLUSCTL_OBJECT_SHIFT := 24

/**
 * @type {Integer (UInt32)}
 */
export global CLUSCTL_CONTROL_CODE_MASK := 4194303

/**
 * @type {Integer (UInt32)}
 */
export global CLUSCTL_OBJECT_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global CLUSCTL_ACCESS_MODE_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global CLCTL_CLUSTER_BASE := 0

/**
 * @type {Integer (Int32)}
 */
export global BitLockerEnabled := 1

/**
 * @type {Integer (Int32)}
 */
export global BitLockerDecrypted := 4

/**
 * @type {Integer (Int32)}
 */
export global BitlockerEncrypted := 8

/**
 * @type {Integer (Int32)}
 */
export global BitLockerDecrypting := 16

/**
 * @type {Integer (Int32)}
 */
export global BitlockerEncrypting := 32

/**
 * @type {Integer (Int32)}
 */
export global BitLockerPaused := 64

/**
 * @type {Integer (Int32)}
 */
export global BitLockerStopped := 128

/**
 * @type {Integer (UInt64)}
 */
export global RedirectedIOReasonUserRequest := 1

/**
 * @type {Integer (UInt64)}
 */
export global RedirectedIOReasonUnsafeFileSystemFilter := 2

/**
 * @type {Integer (UInt64)}
 */
export global RedirectedIOReasonUnsafeVolumeFilter := 4

/**
 * @type {Integer (UInt64)}
 */
export global RedirectedIOReasonFileSystemTiering := 8

/**
 * @type {Integer (UInt64)}
 */
export global RedirectedIOReasonBitLockerInitializing := 16

/**
 * @type {Integer (UInt64)}
 */
export global RedirectedIOReasonReFs := 32

/**
 * @type {Integer (UInt64)}
 */
export global RedirectedIOReasonMax := 9223372036854775808

/**
 * @type {Integer (UInt64)}
 */
export global VolumeRedirectedIOReasonNoDiskConnectivity := 1

/**
 * @type {Integer (UInt64)}
 */
export global VolumeRedirectedIOReasonStorageSpaceNotAttached := 2

/**
 * @type {Integer (UInt64)}
 */
export global VolumeRedirectedIOReasonVolumeReplicationEnabled := 4

/**
 * @type {Integer (UInt64)}
 */
export global VolumeRedirectedIOReasonMax := 9223372036854775808

/**
 * @type {Integer (UInt32)}
 */
export global MAX_OBJECTID := 64

/**
 * @type {Integer (UInt32)}
 */
export global MAX_CO_PASSWORD_LENGTH := 16

/**
 * @type {Integer (UInt32)}
 */
export global GUID_PRESENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global CREATEDC_PRESENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAX_CO_PASSWORD_LENGTHEX := 127

/**
 * @type {Integer (UInt32)}
 */
export global MAX_CO_PASSWORD_STORAGEEX := 128

/**
 * @type {Integer (UInt32)}
 */
export global MAX_CREATINGDC_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global DNS_LENGTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global MAINTENANCE_MODE_V2_SIG := 2881155087

/**
 * @type {Integer (UInt32)}
 */
export global NNLEN := 80

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_GENAPP := "Generic Application"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_GENSVC := "Generic Service"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_GENSCRIPT := "Generic Script"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_IPADDR := "IP Address"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_NETNAME := "Network Name"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_DNN := "Distributed Network Name"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_FILESHR := "File Share"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_PRTSPLR := "Print Spooler"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_IPV6_NATIVE := "IPv6 Address"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_IPV6_TUNNEL := "IPv6 Tunnel Address"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_VSSTASK := "Volume Shadow Copy Service Task"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_WINS := "WINS Service"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_DHCP := "DHCP Service"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_MSMQ := "Microsoft Message Queue Server"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_NEW_MSMQ := "MSMQ"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_MSMQ_TRIGGER := "MSMQTriggers"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_MSDTC := "Distributed Transaction Coordinator"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_NFS := "NFS Share"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_NETWORK_FILE_SYSTEM := "Network File System"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_ISNS := "Microsoft iSNS"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_HARDDISK := "Physical Disk"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_PHYS_DISK := "Physical Disk"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_FSWITNESS := "File Share Witness"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_FILESERVER := "File Server"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_SODAFILESERVER := "Scale Out File Server"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_DFS := "Distributed File System"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_DFSR := "DFS Replicated Folder"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_VM := "Virtual Machine"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_VM_CONFIG := "Virtual Machine Configuration"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_ISCSITARGET := "iSCSI Target Server"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_STORAGE_POOL := "Storage Pool"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_TASKSCHEDULER := "Task Scheduler"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_VMREPLICA_BROKER := "Virtual Machine Replication Broker"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_VMREPLICA_COORDINATOR := "Virtual Machine Replication Coordinator"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_NFS_V2 := "Network File System"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_NFS_MSNS := "NFS Multi Server Namespace"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_CAU := "ClusterAwareUpdatingResource"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_NV_PROVIDER_ADDRESS := "Provider Address"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_NAT := "Nat"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_STORAGE_POLICIES := "Storage Policies"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_STORQOS := "Storage QoS Policy Manager"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_HEALTH_SERVICE := "Health Service"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_VM_WMI := "Virtual Machine Cluster WMI"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_SDDC_MANAGEMENT := "SDDC Management"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_HCSVM := "HCS Virtual Machine"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_VIRTUAL_IPV4 := "Disjoint IPv4 Address"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_VIRTUAL_IPV6 := "Disjoint IPv6 Address"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_CLOUD_WITNESS := "Cloud Witness"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_STORAGE_REPLICA := "Storage Replica"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_CROSS_CLUSTER := "Cross Cluster Dependency Orchestrator"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_SCALEOUT_MASTER := "Scaleout Master"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_SCALEOUT_WORKER := "Scaleout Worker"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_CONTAINER := "Container"

/**
 * @type {String}
 */
export global CLUS_RES_NAME_SCALEOUT_MASTER := "Scaleout Master"

/**
 * @type {String}
 */
export global CLUS_RES_NAME_SCALEOUT_WORKER := "Scaleout Worker"

/**
 * @type {String}
 */
export global CLUS_RESTYPE_NAME_KEY_VALUE_STORE := "Key Value Store"

/**
 * @type {String}
 */
export global CLUSREG_NAME_CLUS_DESC := "Description"

/**
 * @type {String}
 */
export global CLUSREG_NAME_CLUS_SD := "Security Descriptor"

/**
 * @type {String}
 */
export global CLUSREG_NAME_CLUS_DEFAULT_NETWORK_ROLE := "DefaultNetworkRole"

/**
 * @type {String}
 */
export global CLUSREG_NAME_QUORUM_ARBITRATION_TIMEOUT := "QuorumArbitrationTimeMax"

/**
 * @type {String}
 */
export global CLUSTER_HANG_TIMEOUT_KEYNAME := "ClusSvcHangTimeout"

/**
 * @type {String}
 */
export global CLUSTER_HANG_RECOVERY_ACTION_KEYNAME := "HangRecoveryAction"

/**
 * @type {String}
 */
export global CLUSTER_CSA_VSS_STATE := "BackupInProgress"

/**
 * @type {String}
 */
export global CLUSTER_REQUEST_REPLY_TIMEOUT := "RequestReplyTimeout"

/**
 * @type {String}
 */
export global CLUSTER_WITNESS_FAILED_RESTART_INTERVAL := "WitnessRestartInterval"

/**
 * @type {String}
 */
export global CLUSTER_WITNESS_DATABASE_WRITE_TIMEOUT := "WitnessDatabaseWriteTimeout"

/**
 * @type {String}
 */
export global CLUSTER_ADD_EVICT_DELAY := "AddEvictDelay"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FIXQUORUM := "FixQuorum"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PREVENTQUORUM := "PreventQuorum"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IGNORE_PERSISTENT_STATE := "IgnorePersistentStateOnStartup"

/**
 * @type {String}
 */
export global CLUSTER_SHARED_VOLUMES_ROOT := "SharedVolumesRoot"

/**
 * @type {String}
 */
export global ENABLE_CLUSTER_SHARED_VOLUMES := "EnableSharedVolumes"

/**
 * @type {String}
 */
export global CLUSTER_SHARED_VOLUME_VSS_WRITER_OPERATION_TIMEOUT := "SharedVolumeVssWriterOperationTimeout"

/**
 * @type {String}
 */
export global USE_CLIENT_ACCESS_NETWORKS_FOR_CSV := "UseClientAccessNetworksForSharedVolumes"

/**
 * @type {String}
 */
export global CLUSTER_CSV_COMPATIBLE_FILTERS := "SharedVolumeCompatibleFilters"

/**
 * @type {String}
 */
export global CLUSTER_CSV_INCOMPATIBLE_FILTERS := "SharedVolumeIncompatibleFilters"

/**
 * @type {String}
 */
export global CLUSTER_GROUP_WAIT_DELAY := "ClusterGroupWaitDelay"

/**
 * @type {String}
 */
export global MINIMUM_PREEMPTOR_PRIORITY := "MinimumPreemptorPriority"

/**
 * @type {String}
 */
export global MINIMUM_NEVER_PREEMPT_PRIORITY := "MinimumNeverPreemptPriority"

/**
 * @type {String}
 */
export global CLUSTER_ENFORCED_ANTIAFFINITY := "ClusterEnforcedAntiaffinity"

/**
 * @type {String}
 */
export global CLUSREG_NAME_SHUTDOWN_TIMEOUT_MINUTES := "ShutdownTimeoutInMinutes"

/**
 * @type {String}
 */
export global CLUSREG_NAME_CSV_MDS_SD := "SharedVolumeSecurityDescriptor"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FAILOVER_MOVE_MIGRATION_TYPE := "FailoverMoveMigrationType"

/**
 * @type {String}
 */
export global CLUSREG_NAME_CSV_BLOCK_CACHE := "BlockCacheSize"

/**
 * @type {String}
 */
export global CLUSREG_NAME_ROUTE_HISTORY_LENGTH := "RouteHistoryLength"

/**
 * @type {String}
 */
export global CLUSREG_NAME_LAST_RECENT_EVENTS_RESET_TIME := "RecentEventsResetTime"

/**
 * @type {String}
 */
export global CLUSREG_NAME_DRAIN_ON_SHUTDOWN := "DrainOnShutdown"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETFT_IPSEC_ENABLED := "NetftIPSecEnabled"

/**
 * @type {String}
 */
export global CLUSREG_NAME_WITNESS_DYNAMIC_WEIGHT := "WitnessDynamicWeight"

/**
 * @type {String}
 */
export global CLUSREG_NAME_MESSAGE_BUFFER_LENGTH := "MessageBufferLength"

/**
 * @type {String}
 */
export global CLUSREG_NAME_DATABASE_READ_WRITE_MODE := "DatabaseReadWriteMode"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FUNCTIONAL_LEVEL := "ClusterFunctionalLevel"

/**
 * @type {String}
 */
export global CLUSREG_NAME_UPGRADE_VERSION := "ClusterUpgradeVersion"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESILIENCY_LEVEL := "ResiliencyLevel"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESILIENCY_DEFAULT_SECONDS := "ResiliencyDefaultPeriod"

/**
 * @type {String}
 */
export global CLUSREG_NAME_QUARANTINE_THRESHOLD := "QuarantineThreshold"

/**
 * @type {String}
 */
export global CLUSREG_NAME_QUARANTINE_DURATION := "QuarantineDuration"

/**
 * @type {String}
 */
export global CLUSTER_S2D_ENABLED := "S2DEnabled"

/**
 * @type {String}
 */
export global CLUSTER_S2D_BUS_TYPES := "S2DBusTypes"

/**
 * @type {String}
 */
export global CLUSTER_S2D_CACHE_PAGE_SIZE_KBYTES := "S2DCachePageSizeKBytes"

/**
 * @type {String}
 */
export global CLUSTER_S2D_OPTIMIZATIONS := "S2DOptimizations"

/**
 * @type {String}
 */
export global CLUSTER_S2D_IO_LATENCY_THRESHOLD := "S2DIOLatencyThreshold"

/**
 * @type {String}
 */
export global CLUSTER_S2D_CACHE_DESIRED_STATE := "S2DCacheDesiredState"

/**
 * @type {String}
 */
export global CLUSTER_S2D_CACHE_METADATA_RESERVE := "S2DCacheMetadataReserveBytes"

/**
 * @type {String}
 */
export global CLUSTER_S2D_CACHE_FLASH_RESERVE_PERCENT := "S2DCacheFlashReservePercent"

/**
 * @type {String}
 */
export global CLUSTER_S2D_CACHE_BEHAVIOR_FLAGS := "S2DCacheBehavior"

/**
 * @type {String}
 */
export global CLUSTER_NAME_PREFERRED_SITE := "PreferredSite"

/**
 * @type {String}
 */
export global CLUSTER_NAME_AUTO_BALANCER_MODE := "AutoBalancerMode"

/**
 * @type {String}
 */
export global CLUSTER_NAME_AUTO_BALANCER_LEVEL := "AutoBalancerLevel"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GROUP_DEPENDENCY_TIMEOUT := "GroupDependencyTimeout"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PLACEMENT_OPTIONS := "PlacementOptions"

/**
 * @type {String}
 */
export global CLUSREG_NAME_ENABLED_EVENT_LOGS := "EnabledEventLogs"

/**
 * @type {String}
 */
export global CLUSREG_NAME_MAX_PARALLEL_MIGRATIONS := "MaximumParallelMigrations"

/**
 * @type {String}
 */
export global CLUSREG_NAME_ACCELERATED_NETWORKING_ENABLED := "AcceleratedNetworkingEnabled"

/**
 * @type {String}
 */
export global CLUSREG_NAME_ACCELERATED_NETWORKING_NODE_RESERVE := "AcceleratedNetworkingNodeReserve"

/**
 * @type {String}
 */
export global CLUSREG_NAME_SAME_SUBNET_DELAY := "SameSubnetDelay"

/**
 * @type {String}
 */
export global CLUSREG_NAME_CROSS_SUBNET_DELAY := "CrossSubnetDelay"

/**
 * @type {String}
 */
export global CLUSREG_NAME_CROSS_SITE_DELAY := "CrossSiteDelay"

/**
 * @type {String}
 */
export global CLUSREG_NAME_SAME_SUBNET_THRESHOLD := "SameSubnetThreshold"

/**
 * @type {String}
 */
export global CLUSREG_NAME_CROSS_SUBNET_THRESHOLD := "CrossSubnetThreshold"

/**
 * @type {String}
 */
export global CLUSREG_NAME_CROSS_SITE_THRESHOLD := "CrossSiteThreshold"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PLUMB_ALL_CROSS_SUBNET_ROUTES := "PlumbAllCrossSubnetRoutes"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_NAME := "NodeName"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_HIGHEST_VERSION := "NodeHighestVersion"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_LOWEST_VERSION := "NodeLowestVersion"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_DESC := "Description"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_MAJOR_VERSION := "MajorVersion"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_MINOR_VERSION := "MinorVersion"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_BUILD_NUMBER := "BuildNumber"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_CSDVERSION := "CSDVersion"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_WEIGHT := "NodeWeight"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_DYNAMIC_WEIGHT := "DynamicWeight"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_IS_PRIMARY := "IsPrimary"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_DRAIN_STATUS := "NodeDrainStatus"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_DRAIN_TARGET := "NodeDrainTarget"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_NEEDS_PQ := "NeedsPreventQuorum"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_FDID := "FaultDomainId"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_STATUS_INFO := "StatusInformation"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_FAULT_DOMAIN := "FaultDomain"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_MODEL := "Model"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_SERIALNUMBER := "SerialNumber"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_MANUFACTURER := "Manufacturer"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_UNIQUEID := "UniqueID"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_DRAIN_ERROR_CODE := "DrainErrorCode"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_FAILBACK_STATUS := "NodeFailbackStatus"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_FAILBACK_ERROR_CODE := "FailbackErrorCode"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NODE_HYPERTHREADING_ENABLED := "HyperthreadingEnabled"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_NAME := "Name"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_TYPE := "GroupType"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_DESC := "Description"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_PERSISTENT_STATE := "PersistentState"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_FAILBACK_TYPE := "AutoFailbackType"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_FAILBACK_WIN_START := "FailbackWindowStart"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_FAILBACK_WIN_END := "FailbackWindowEnd"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_FAILOVER_THRESHOLD := "FailoverThreshold"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_FAILOVER_PERIOD := "FailoverPeriod"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_PRIORITY := "Priority"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_DEFAULT_OWNER := "DefaultOwner"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_STATUS_INFORMATION := "StatusInformation"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_ANTI_AFFINITY_CLASS_NAME := "AntiAffinityClassNames"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_START_DELAY := "GroupStartDelay"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_CCF_EPOCH := "CCFEpoch"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_CCF_EPOCH_HIGH := "CCFEpochHigh"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_RESILIENCY_PERIOD := "ResiliencyPeriod"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_PREFERRED_SITE := "PreferredSite"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_COLD_START_SETTING := "ColdStartSetting"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_FAULT_DOMAIN := "FaultDomain"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_UPDATE_DOMAIN := "UpdateDomain"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_PLACEMENT_OPTIONS := "PlacementOptions"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GRP_LOCK_MOVE := "LockedFromMoving"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_NAME := "Name"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_TYPE := "Type"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_DESC := "Description"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_SEPARATE_MONITOR := "SeparateMonitor"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_PERSISTENT_STATE := "PersistentState"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_LOOKS_ALIVE := "LooksAlivePollInterval"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_IS_ALIVE := "IsAlivePollInterval"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_RESTART_ACTION := "RestartAction"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_RESTART_THRESHOLD := "RestartThreshold"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_RESTART_PERIOD := "RestartPeriod"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_RESTART_DELAY := "RestartDelay"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_RETRY_PERIOD_ON_FAILURE := "RetryPeriodOnFailure"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_EMBEDDED_FAILURE_ACTION := "EmbeddedFailureAction"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_PENDING_TIMEOUT := "PendingTimeout"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_DEADLOCK_TIMEOUT := "DeadlockTimeout"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_MONITOR_PID := "MonitorProcessId"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_STATUS_INFORMATION := "StatusInformation"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_LAST_OPERATION_STATUS_CODE := "LastOperationStatusCode"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_DATA1 := "ResourceSpecificData1"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_DATA2 := "ResourceSpecificData2"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RES_STATUS := "ResourceSpecificStatus"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESTYPE_NAME := "Name"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESTYPE_DESC := "Description"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESTYPE_DLL_NAME := "DllName"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESTYPE_ADMIN_EXTENSIONS := "AdminExtensions"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESTYPE_LOOKS_ALIVE := "LooksAlivePollInterval"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESTYPE_IS_ALIVE := "IsAlivePollInterval"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESTYPE_PENDING_TIMEOUT := "PendingTimeout"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESTYPE_DEADLOCK_TIMEOUT := "DeadlockTimeout"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESTYPE_DUMP_POLICY := "DumpPolicy"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESTYPE_DUMP_LOG_QUERY := "DumpLogQuery"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESTYPE_DUMP_SERVICES := "DumpServices"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESTYPE_ENABLED_EVENT_LOGS := "EnabledEventLogs"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESTYPE_MAX_MONITORS := "MaximumMonitors"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESTYPE_WPR_START_AFTER := "WprStartAfter"

/**
 * @type {String}
 */
export global CLUSREG_NAME_RESTYPE_WPR_PROFILES := "WprProfiles"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NET_NAME := "Name"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NET_IPV6_ADDRESSES := "IPv6Addresses"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NET_IPV6_PREFIXLENGTHS := "IPv6PrefixLengths"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NET_IPV4_ADDRESSES := "IPv4Addresses"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NET_IPV4_PREFIXLENGTHS := "IPv4PrefixLengths"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NET_ADDRESS := "Address"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NET_ADDRESS_MASK := "AddressMask"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NET_DESC := "Description"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NET_ROLE := "Role"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NET_SPEED := "LinkSpeed"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NET_RDMA_CAPABLE := "RdmaCapable"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NET_RSS_CAPABLE := "RssCapable"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NET_METRIC := "Metric"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NET_AUTOMETRIC := "AutoMetric"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETIFACE_NAME := "Name"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETIFACE_NODE := "Node"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETIFACE_NETWORK := "Network"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETIFACE_ADAPTER_NAME := "Adapter"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETIFACE_ADAPTER_ID := "AdapterId"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETIFACE_DHCP_ENABLED := "DhcpEnabled"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETIFACE_IPV6_ADDRESSES := "IPv6Addresses"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETIFACE_IPV4_ADDRESSES := "IPv4Addresses"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETIFACE_ADDRESS := "Address"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETIFACE_DESC := "Description"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GROUPSET_NAME := "Name"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GROUPSET_STARTUP_SETTING := "StartupSetting"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GROUPSET_STARTUP_COUNT := "StartupCount"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GROUPSET_STARTUP_DELAY := "StartupDelay"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GROUPSET_IS_GLOBAL := "IsGlobal"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GROUPSET_STATUS_INFORMATION := "StatusInformation"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GROUPSET_IS_AVAILABILITY_SET := "IsAvailabilitySet"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GROUPSET_UPDATE_DOMAINS := "UpdateDomains"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GROUPSET_FAULT_DOMAINS := "FaultDomains"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GROUPSET_RESERVE_NODE := "ReserveSpareNode"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GROUPSET_AVAILABILITY_SET_INDEX_TO_NODE_MAPPING := "NodeDomainInfo"

/**
 * @type {String}
 */
export global CLUSREG_NAME_AFFINITYRULE_NAME := "Name"

/**
 * @type {String}
 */
export global CLUSREG_NAME_AFFINITYRULE_TYPE := "RuleType"

/**
 * @type {String}
 */
export global CLUSREG_NAME_AFFINITYRULE_GROUPS := "Groups"

/**
 * @type {String}
 */
export global CLUSREG_NAME_AFFINITYRULE_ENABLED := "Enabled"

/**
 * @type {String}
 */
export global CLUSREG_NAME_AFFINITYRULE_SOFTANTIAFFINITY := "SoftAntiAffinity"

/**
 * @type {String}
 */
export global CLUSREG_NAME_START_MEMORY := "StartMemory"

/**
 * @type {String}
 */
export global CLUSREG_NAME_VIRTUAL_NUMA_COUNT := "VirtualNumaCount"

/**
 * @type {String}
 */
export global CLUSREG_NAME_DDA_DEVICE_ALLOCATIONS := "DdaDeviceAllocations"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GPUP_DEVICE_ALLOCATIONS := "GpupDeviceAllocations"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_DISKIDTYPE := "DiskIdType"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_DISKSIGNATURE := "DiskSignature"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_DISKIDGUID := "DiskIdGuid"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_DISKRUNCHKDSK := "DiskRunChkDsk"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_DISKUNIQUEIDS := "DiskUniqueIds"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_DISKVOLUMEINFO := "DiskVolumeInfo"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_DISKARBTYPE := "DiskArbType"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_DISKARBINTERVAL := "DiskArbInterval"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_DISKPATH := "DiskPath"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_DISKRELOAD := "DiskReload"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_MAINTMODE := "MaintenanceMode"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_DISKIODELAY := "MaxIoLatency"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_MIGRATEFIXUP := "MigrateDriveLetters"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_CSVWRITETHROUGH := "CsvEnforceWriteThrough"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_CSVBLOCKCACHE := "EnableBlockCache"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_FASTONLINEARBITRATE := "FastOnlineArbitrate"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_SPACEIDGUID := "VirtualDiskId"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_POOLIDGUID := "PoolId"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_CSVSNAPSHOTDIFFAREASIZE := "SnapshotDiffSize"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_CSVSNAPSHOTAGELIMIT := "SnapshotAgeLimit"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_DISKGUID := "DiskGuid"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_VOLSNAPACTIVATETIMEOUT := "VolsnapActivateTimeout"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PHYSDISK_DISKRECOVERYACTION := "DiskRecoveryAction"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_NAME := "VirtualDiskName"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_DESCRIPTION := "VirtualDiskDescription"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_HEALTH := "VirtualDiskHealth"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_STATE := "VirtualDiskState"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_PROVISIONING := "VirtualDiskProvisioning"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_RESILIENCYTYPE := "VirtualDiskResiliencyType"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_RESILIENCYCOLUMNS := "VirtualDiskResiliencyColumns"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_RESILIENCYINTERLEAVE := "VirtualDiskResiliencyInterleave"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GENAPP_COMMAND_LINE := "CommandLine"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GENAPP_CURRENT_DIRECTORY := "CurrentDirectory"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GENAPP_USE_NETWORK_NAME := "UseNetworkName"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GENSCRIPT_SCRIPT_FILEPATH := "ScriptFilepath"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GENSVC_SERVICE_NAME := "ServiceName"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GENSVC_STARTUP_PARAMS := "StartupParameters"

/**
 * @type {String}
 */
export global CLUSREG_NAME_GENSVC_USE_NETWORK_NAME := "UseNetworkName"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPADDR_NETWORK := "Network"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPADDR_ADDRESS := "Address"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPADDR_SUBNET_MASK := "SubnetMask"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPADDR_ENABLE_NETBIOS := "EnableNetBIOS"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPADDR_OVERRIDE_ADDRMATCH := "OverrideAddressMatch"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPADDR_ENABLE_DHCP := "EnableDhcp"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPADDR_LEASE_OBTAINED_TIME := "LeaseObtainedTime"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPADDR_LEASE_TERMINATES_TIME := "LeaseExpiresTime"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPADDR_T1 := "T1"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPADDR_T2 := "T2"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPADDR_DHCP_SERVER := "DhcpServer"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPADDR_DHCP_ADDRESS := "DhcpAddress"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPADDR_DHCP_SUBNET_MASK := "DhcpSubnetMask"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPADDR_SHARED_NETNAME := "SharedNetname"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPADDR_PROBE_PORT := "ProbePort"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPADDR_PROBE_FAILURE_THRESHOLD := "ProbeFailureThreshold"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPV6_NATIVE_NETWORK := "Network"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPV6_NATIVE_ADDRESS := "Address"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPV6_NATIVE_PREFIX_LENGTH := "PrefixLength"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPV6_TUNNEL_ADDRESS := "Address"

/**
 * @type {String}
 */
export global CLUSREG_NAME_IPV6_TUNNEL_TUNNELTYPE := "TunnelType"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_NAME := "Name"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_CREATING_DC := "CreatingDC"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_OBJECT_ID := "ObjectGUID"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_DNS_NAME := "DnsName"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_REMAP_PIPE_NAMES := "RemapPipeNames"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_RESOURCE_DATA := "ResourceData"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_STATUS_NETBIOS := "StatusNetBIOS"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_STATUS_DNS := "StatusDNS"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_STATUS_KERBEROS := "StatusKerberos"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_VCO_CONTAINER := "VcoContainer"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_LAST_DNS_UPDATE := "LastDNSUpdateTime"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_CONTAINERGUID := "CryptoContainerGUID"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_HOST_TTL := "HostRecordTTL"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_PUBLISH_PTR := "PublishPTRRecords"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_REMOVEVCO_ONDELETE := "DeleteVcoOnResCleanup"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_REGISTER_ALL_IP := "RegisterAllProvidersIP"

/**
 * @type {String}
 */
export global CLUSREG_KEYNAME_OBJECTGUIDS := "ObjectGUIDs"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_EXCLUDE_NETWORKS := "ExcludeNetworks"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_ALIASES := "Aliases"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_IN_USE_NETWORKS := "InUseNetworks"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_DNS_SUFFIX := "DnsSuffix"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_AD_AWARE := "ADAware"

/**
 * @type {String}
 */
export global CLUSREG_NAME_NETNAME_DNN_DISABLE_CLONES := "DisableClones"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PRTSPOOL_DEFAULT_SPOOL_DIR := "DefaultSpoolDirectory"

/**
 * @type {String}
 */
export global CLUSREG_NAME_PRTSPOOL_TIMEOUT := "JobCompletionTimeout"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FILESHR_SERVER_NAME := "ServerName"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FILESHR_SHARE_NAME := "ShareName"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FILESHR_PATH := "Path"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FILESHR_REMARK := "Remark"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FILESHR_MAX_USERS := "MaxUsers"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FILESHR_SD := "Security Descriptor"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FILESHR_SHARE_SUBDIRS := "ShareSubDirs"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FILESHR_HIDE_SUBDIR_SHARES := "HideSubDirShares"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FILESHR_IS_DFS_ROOT := "IsDfsRoot"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FILESHR_SHARE_FLAGS := "ShareFlags"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FILESHR_CA_TIMEOUT := "CATimeout"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FILESHR_QOS_FLOWSCOPE := "QosFlowScope"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FILESHR_QOS_POLICYID := "QosPolicyId"

/**
 * @type {String}
 */
export global CLUSREG_NAME_DHCP_DATABASE_PATH := "DatabasePath"

/**
 * @type {String}
 */
export global CLUSREG_NAME_DHCP_BACKUP_PATH := "BackupPath"

/**
 * @type {String}
 */
export global CLUSREG_NAME_LOG_FILE_PATH := "LogFilePath"

/**
 * @type {String}
 */
export global CLUSREG_NAME_WINS_DATABASE_PATH := "DatabasePath"

/**
 * @type {String}
 */
export global CLUSREG_NAME_WINS_BACKUP_PATH := "BackupPath"

/**
 * @type {String}
 */
export global CLUSREG_NAME_VSSTASK_CURRENTDIRECTORY := "CurrentDirectory"

/**
 * @type {String}
 */
export global CLUSREG_NAME_VSSTASK_APPNAME := "ApplicationName"

/**
 * @type {String}
 */
export global CLUSREG_NAME_VSSTASK_APPPARAMS := "ApplicationParams"

/**
 * @type {String}
 */
export global CLUSREG_NAME_VSSTASK_TRIGGERARRAY := "TriggerArray"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FSWITNESS_SHARE_PATH := "SharePath"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FSWITNESS_ARB_DELAY := "ArbitrationDelay"

/**
 * @type {String}
 */
export global CLUSREG_NAME_FSWITNESS_IMPERSONATE_CNO := "ImpersonateCNO"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_POOLNAME := "Name"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_POOLDESC := "Description"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_POOLDRIVEIDS := "DriveIds"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_POOLHEALTH := "Health"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_POOLSTATE := "State"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_POOLTOTALCAPACITY := "TotalCapacity"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_POOLCONSUMEDCAPACITY := "ConsumedCapacity"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_POOLARBITRATE := "Arbitrate"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_POOLREEVALTIMEOUT := "ReEvaluatePlacementTimeout"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_POOLQUORUMSHARE := "PoolQuorumShare"

/**
 * @type {String}
 */
export global CLUSREG_NAME_STORAGESPACE_POOLQUORUMUSERACCOUNT := "PoolQuorumUserAccount"

/**
 * @type {String}
 */
export global CLUSREG_NAME_SOFS_SMBASYMMETRYMODE := "SmbAsymmetryMode"

/**
 * @type {String}
 */
export global CLUSREG_NAME_VIP_PREFIX_LENGTH := "PrefixLength"

/**
 * @type {String}
 */
export global CLUSREG_NAME_VIP_ADAPTER_NAME := "AdapterName"

/**
 * @type {String}
 */
export global CLUSREG_NAME_VIP_ADDRESS := "Address"

/**
 * @type {String}
 */
export global CLUSREG_NAME_VIP_VSID := "VSID"

/**
 * @type {String}
 */
export global CLUSREG_NAME_VIP_RDID := "RDID"

/**
 * @type {String}
 */
export global CLUSREG_NAME_CLOUDWITNESS_PRIMARY_TOKEN := "PrimaryToken"

/**
 * @type {String}
 */
export global CLUSREG_NAME_CLOUDWITNESS_PRIMARY_KEY := "PrimaryKey"

/**
 * @type {String}
 */
export global CLUSREG_NAME_CLOUDWITNESS_ACCOUNT_NAME := "AccountName"

/**
 * @type {String}
 */
export global CLUSREG_NAME_CLOUDWITNESS_ENDPOINT_INFO := "EndpointInfo"

/**
 * @type {String}
 */
export global CLUSREG_NAME_CLOUDWITNESS_CONTAINER_NAME := "ContainerName"

/**
 * @type {String}
 */
export global CLUSREG_NAME_CLOUDWITNESS_MANAGED_IDENTITY := "IsManagedIdentity"

/**
 * @type {String}
 */
export global CLOUD_WITNESS_CONTAINER_NAME := "msft-cloud-witness"

/**
 * @type {String}
 */
export global CLUS_NAME_RES_TYPE_SOURCE_RESID := "SourceResourceId"

/**
 * @type {String}
 */
export global CLUS_NAME_RES_TYPE_TARGET_RESID := "TargetResourceId"

/**
 * @type {String}
 */
export global CLUS_NAME_RES_TYPE_SOURCE_VOLUMES := "SourceVolumes"

/**
 * @type {String}
 */
export global CLUS_NAME_RES_TYPE_TARGET_VOLUMES := "TargetVolumes"

/**
 * @type {String}
 */
export global CLUS_NAME_RES_TYPE_DATA_RESID := "DataResourceId"

/**
 * @type {String}
 */
export global CLUS_NAME_RES_TYPE_LOG_RESID := "LogResourceId"

/**
 * @type {String}
 */
export global CLUS_NAME_RES_TYPE_LOG_VOLUME := "LogVolume"

/**
 * @type {String}
 */
export global CLUS_NAME_RES_TYPE_REPLICATION_GROUPID := "ReplicationGroupId"

/**
 * @type {String}
 */
export global CLUS_NAME_RES_TYPE_CLUSTER_GROUPID := "ClusterGroupId"

/**
 * @type {String}
 */
export global CLUS_NAME_RES_TYPE_REPLICATION_GROUP_TYPE := "ReplicationClusterGroupType"

/**
 * @type {String}
 */
export global CLUS_NAME_RES_TYPE_MINIMUM_LOG_SIZE := "MinimumLogSizeInBytes"

/**
 * @type {String}
 */
export global CLUS_NAME_RES_TYPE_UNIT_LOG_SIZE_CHANGE := "UnitOfLogSizeChangeInBytes"

/**
 * @type {String}
 */
export global CLUS_NAME_RES_TYPE_LOG_MULTIPLE := "LogSizeMultiple"

/**
 * @type {String}
 */
export global CLUSREG_NAME_KEYVALUESTORE_NAME := "KeyValueStores"

/**
 * @type {String}
 */
export global CLUSREG_NAME_KEYVALUESTORE_MANAGERNAME := "ManagerName"

/**
 * @type {String}
 */
export global CLUSREG_NAME_KEYVALUESTORE_MANAGERPATH := "ManagerPath"

/**
 * @type {Integer (UInt32)}
 */
export global SR_REPLICATED_PARTITION_DISALLOW_MULTINODE_IO := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_FLAG_ADD_VOLUME_INFO := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_FLAG_FILTER_BY_POOL := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_FLAG_INCLUDE_NON_SHARED_DISKS := 4

/**
 * @type {String}
 */
export global STARTUP_ROUTINE := "Startup"

/**
 * @type {Integer (UInt32)}
 */
export global CLRES_VERSION_V1_00 := 256

/**
 * @type {String}
 */
export global STARTUP_EX_ROUTINE := "StartupEx"

/**
 * @type {Integer (UInt32)}
 */
export global CLRES_VERSION_V2_00 := 512

/**
 * @type {Integer (UInt32)}
 */
export global CLRES_VERSION_V3_00 := 768

/**
 * @type {Integer (UInt32)}
 */
export global CLRES_VERSION_V4_00 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CLUSCTL_GET_OPERATION_CONTEXT_PARAMS_VERSION_1 := 1

/**
 * @type {String}
 */
export global CLUSRES_NAME_GET_OPERATION_CONTEXT_FLAGS := "Flags"

/**
 * @type {Integer (UInt32)}
 */
export global CLUSRESDLL_STATUS_OFFLINE_BUSY := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSRESDLL_STATUS_OFFLINE_SOURCE_THROTTLED := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLUSRESDLL_STATUS_OFFLINE_DESTINATION_THROTTLED := 4

/**
 * @type {Integer (UInt32)}
 */
export global CLUSRESDLL_STATUS_OFFLINE_DESTINATION_REJECTED := 8

/**
 * @type {Integer (UInt32)}
 */
export global CLUSRESDLL_STATUS_INSUFFICIENT_MEMORY := 16

/**
 * @type {Integer (UInt32)}
 */
export global CLUSRESDLL_STATUS_INSUFFICIENT_PROCESSOR := 32

/**
 * @type {Integer (UInt32)}
 */
export global CLUSRESDLL_STATUS_INSUFFICIENT_OTHER_RESOURCES := 64

/**
 * @type {Integer (UInt32)}
 */
export global CLUSRESDLL_STATUS_INVALID_PARAMETERS := 128

/**
 * @type {Integer (UInt32)}
 */
export global CLUSRESDLL_STATUS_NETWORK_NOT_AVAILABLE := 256

/**
 * @type {Integer (UInt32)}
 */
export global CLUSRESDLL_STATUS_DO_NOT_COLLECT_WER_REPORT := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CLUSRESDLL_STATUS_DUMP_NOW := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_RESDLL_OPEN_RECOVER_MONITOR_STATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_RESDLL_ONLINE_RECOVER_MONITOR_STATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_RESDLL_ONLINE_IGNORE_RESOURCE_STATUS := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_RESDLL_ONLINE_RETURN_TO_SOURCE_NODE_ON_ERROR := 4

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_RESDLL_ONLINE_RESTORE_ONLINE_STATE := 8

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_RESDLL_ONLINE_IGNORE_NETWORK_CONNECTIVITY := 16

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_RESDLL_OFFLINE_IGNORE_RESOURCE_STATUS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_RESDLL_OFFLINE_RETURN_TO_SOURCE_NODE_ON_ERROR := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_RESDLL_OFFLINE_QUEUE_ENABLED := 4

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_RESDLL_OFFLINE_RETURNING_TO_SOURCE_NODE_BECAUSE_OF_ERROR := 8

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_RESDLL_OFFLINE_DUE_TO_EMBEDDED_FAILURE := 16

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_RESDLL_OFFLINE_IGNORE_NETWORK_CONNECTIVITY := 32

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_RESDLL_OFFLINE_DO_NOT_UPDATE_PERSISTENT_STATE := 64

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_RESDLL_OPEN_DONT_DELETE_TEMP_DISK := 2

/**
 * @type {Integer (UInt32)}
 */
export global RESTYPE_MONITOR_SHUTTING_DOWN_NODE_STOP := 1

/**
 * @type {Integer (UInt32)}
 */
export global RESTYPE_MONITOR_SHUTTING_DOWN_CLUSSVC_CRASH := 2

/**
 * @type {Integer (UInt32)}
 */
export global RESUTIL_PROPITEM_READ_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global RESUTIL_PROPITEM_REQUIRED := 2

/**
 * @type {Integer (UInt32)}
 */
export global RESUTIL_PROPITEM_SIGNED := 4

/**
 * @type {Integer (UInt32)}
 */
export global RESUTIL_PROPITEM_IN_MEMORY := 8

/**
 * @type {Integer (UInt32)}
 */
export global LOCKED_MODE_FLAGS_DONT_REMOVE_FROM_MOVE_QUEUE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSRES_DISABLE_WPR_WATCHDOG_FOR_ONLINE_CALLS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSRES_DISABLE_WPR_WATCHDOG_FOR_OFFLINE_CALLS := 2

/**
 * @type {String}
 */
export global CLUSTER_HEALTH_FAULT_PROPERTY_NAME := "ClusterHealth"

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_HEALTH_FAULT_ARGS := 7

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_HEALTH_FAULT_ID := 0

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_HEALTH_FAULT_ERRORTYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_HEALTH_FAULT_ERRORCODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_HEALTH_FAULT_DESCRIPTION := 3

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_HEALTH_FAULT_PROVIDER := 4

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_HEALTH_FAULT_FLAGS := 5

/**
 * @type {Integer (UInt32)}
 */
export global CLUSTER_HEALTH_FAULT_RESERVED := 6

/**
 * @type {String}
 */
export global CLUSTER_HEALTH_FAULT_ID_LABEL := "Id"

/**
 * @type {String}
 */
export global CLUSTER_HEALTH_FAULT_ERRORTYPE_LABEL := "ErrorType"

/**
 * @type {String}
 */
export global CLUSTER_HEALTH_FAULT_ERRORCODE_LABEL := "ErrorCode"

/**
 * @type {String}
 */
export global CLUSTER_HEALTH_FAULT_DESCRIPTION_LABEL := "Description"

/**
 * @type {String}
 */
export global CLUSTER_HEALTH_FAULT_PROVIDER_LABEL := "Provider"

/**
 * @type {String}
 */
export global CLUSTER_HEALTH_FAULT_FLAGS_LABEL := "Flags"

/**
 * @type {String}
 */
export global CLUSTER_HEALTH_FAULT_RESERVED_LABEL := "Reserved"

/**
 * @type {Integer (UInt32)}
 */
export global CLUS_CREATE_CRYPT_CONTAINER_NOT_FOUND := 1

/**
 * @type {Integer (UInt32)}
 */
export global SET_APPINSTANCE_CSV_FLAGS_VALID_ONLY_IF_CSV_COORDINATOR := 1
;@endregion Constants
