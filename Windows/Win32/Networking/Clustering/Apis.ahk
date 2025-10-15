#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\System\Registry\HKEY.ahk
/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class Clustering {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_VERSION_FLAG_MIXED_MODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_VERSION_UNKNOWN => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static NT4_MAJOR_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NT4SP4_MAJOR_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NT5_MAJOR_VERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NT51_MAJOR_VERSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NT6_MAJOR_VERSION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static NT7_MAJOR_VERSION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static NT8_MAJOR_VERSION => 7

    /**
     * @type {Integer (UInt32)}
     */
    static NT9_MAJOR_VERSION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NT10_MAJOR_VERSION => 9

    /**
     * @type {Integer (UInt32)}
     */
    static NT11_MAJOR_VERSION => 10

    /**
     * @type {Integer (UInt32)}
     */
    static NT12_MAJOR_VERSION => 11

    /**
     * @type {Integer (UInt32)}
     */
    static NT13_MAJOR_VERSION => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WS2016_TP4_UPGRADE_VERSION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WS2016_TP5_UPGRADE_VERSION => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WS2016_RTM_UPGRADE_VERSION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RS3_UPGRADE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RS4_UPGRADE_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RS5_UPGRADE_VERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NINETEEN_H1_UPGRADE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NINETEEN_H2_UPGRADE_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MN_UPGRADE_VERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FE_UPGRADE_VERSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FE_22H2_UPGRADE_VERSION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CA_UPGRADE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NI_UPGRADE_VERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CU_UPGRADE_VERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ZN_UPGRADE_VERSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GA_UPGRADE_VERSION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static GE_UPGRADE_VERSION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static HCI_UPGRADE_BIT => 32768

    /**
     * @type {String}
     */
    static CLUSREG_NAME_MIXED_MODE => "MixedMode"

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_VERSION_SERVER2008 => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_VERSION_SERVER2008R2 => 1792

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_VERSION_WINDOWS8 => 1793

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_VERSION_WINDOWSBLUE => 1794

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_VERSION_WINTHRESHOLD => 1795

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_VERSION_RS3 => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_VERSION_NI => 2572

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_VERSION_CU => 3075

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_VERSION_ZN => 3076

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_VERSION_GA => 3077

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_VERSION => 3077

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_CLUSTER_VERSION => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_CLUSTER_MAJOR_VERSION_MASK => 4294967040

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_CLUSTERNAME_LENGTH => 63

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_INSTALLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CONFIGURED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RUNNING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_HYBRID_QUORUM => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_NODE_MAJORITY_QUORUM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSCTL_RESOURCE_STATE_CHANGE_REASON_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSREG_DATABASE_SYNC_WRITE_TO_ALL_NODES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSREG_DATABASE_ISOLATE_READ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_ENUM_ITEM_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_ENUM_ITEM_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CREATE_GROUP_INFO_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CREATE_GROUP_INFO_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GROUPSET_READY_SETTING_DELAY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GROUPSET_READY_SETTING_ONLINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GROUPSET_READY_SETTING_OS_HEARTBEAT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GROUPSET_READY_SETTING_APPLICATION_READY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_GRP_MOVE_ALLOWED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_GRP_MOVE_LOCKED => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLUSAPI_READ_ACCESS => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLUSAPI_CHANGE_ACCESS => 2

    /**
     * @type {Integer (Int32)}
     */
    static CLUSAPI_NO_ACCESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_SET_ACCESS_TYPE_ALLOWED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_SET_ACCESS_TYPE_DENIED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_DELETE_ACCESS_CONTROL_ENTRY => 2

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGROUPSET_STATUS_GROUPS_PENDING => 1

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGROUPSET_STATUS_GROUPS_ONLINE => 2

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGROUPSET_STATUS_OS_HEARTBEAT => 4

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGROUPSET_STATUS_APPLICATION_READY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_AVAILABILITY_SET_CONFIG_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_GROUP_ENUM_ITEM_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_GROUP_ENUM_ITEM_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_ENUM_ITEM_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_ENUM_ITEM_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_NODE_PAUSE_REMAIN_ON_PAUSED_NODE_ON_MOVE_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_NODE_AVOID_PLACEMENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_NODE_PAUSE_RETRY_DRAIN_ON_FAILURE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_NODE_RESUME_FAILBACK_STORAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_NODE_RESUME_FAILBACK_VMS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_NODE_RESUME_FAILBACK_PINNED_VMS_ONLY => 4

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGRP_STATUS_LOCKED_MODE => 1

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGRP_STATUS_PREEMPTED => 2

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGRP_STATUS_WAITING_IN_QUEUE_FOR_MOVE => 4

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGRP_STATUS_PHYSICAL_RESOURCES_LACKING => 8

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGRP_STATUS_WAITING_TO_START => 16

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGRP_STATUS_EMBEDDED_FAILURE => 32

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGRP_STATUS_OFFLINE_DUE_TO_ANTIAFFINITY_CONFLICT => 64

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGRP_STATUS_NETWORK_FAILURE => 128

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGRP_STATUS_UNMONITORED => 256

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGRP_STATUS_OS_HEARTBEAT => 512

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGRP_STATUS_APPLICATION_READY => 1024

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGRP_STATUS_OFFLINE_NOT_LOCAL_DISK_OWNER => 2048

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSGRP_STATUS_WAITING_FOR_DEPENDENCIES => 4096

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSRES_STATUS_LOCKED_MODE => 1

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSRES_STATUS_EMBEDDED_FAILURE => 2

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSRES_STATUS_FAILED_DUE_TO_INSUFFICIENT_CPU => 4

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSRES_STATUS_FAILED_DUE_TO_INSUFFICIENT_MEMORY => 8

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSRES_STATUS_FAILED_DUE_TO_INSUFFICIENT_GENERIC_RESOURCES => 16

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSRES_STATUS_NETWORK_FAILURE => 32

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSRES_STATUS_UNMONITORED => 64

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSRES_STATUS_OS_HEARTBEAT => 128

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSRES_STATUS_APPLICATION_READY => 256

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSRES_STATUS_OFFLINE_NOT_LOCAL_DISK_OWNER => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_GROUP_ONLINE_IGNORE_RESOURCE_STATUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_GROUP_ONLINE_SYNCHRONOUS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_GROUP_ONLINE_BEST_POSSIBLE_NODE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_GROUP_ONLINE_IGNORE_AFFINITY_RULE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_GROUP_OFFLINE_IGNORE_RESOURCE_STATUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_RESOURCE_ONLINE_IGNORE_RESOURCE_STATUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_RESOURCE_ONLINE_DO_NOT_UPDATE_PERSISTENT_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_RESOURCE_ONLINE_NECESSARY_FOR_QUORUM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_RESOURCE_ONLINE_BEST_POSSIBLE_NODE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_RESOURCE_ONLINE_IGNORE_AFFINITY_RULE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_RESOURCE_OFFLINE_IGNORE_RESOURCE_STATUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_RESOURCE_OFFLINE_FORCE_WITH_TERMINATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_RESOURCE_OFFLINE_DO_NOT_UPDATE_PERSISTENT_STATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_RESOURCE_OFFLINE_REASON_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_RESOURCE_OFFLINE_REASON_UNKNOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_RESOURCE_OFFLINE_REASON_MOVING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_RESOURCE_OFFLINE_REASON_USER_REQUESTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_RESOURCE_OFFLINE_REASON_BEING_DELETED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_RESOURCE_OFFLINE_REASON_BEING_RESTARTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_RESOURCE_OFFLINE_REASON_PREEMPTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_RESOURCE_OFFLINE_REASON_SHUTTING_DOWN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_GROUP_MOVE_IGNORE_RESOURCE_STATUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_GROUP_MOVE_RETURN_TO_SOURCE_NODE_ON_ERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_GROUP_MOVE_QUEUE_ENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_GROUP_MOVE_HIGH_PRIORITY_START => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_GROUP_MOVE_FAILBACK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSAPI_GROUP_MOVE_IGNORE_AFFINITY_RULE => 32

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSAPI_CHANGE_RESOURCE_GROUP_FORCE_MOVE_TO_CSV => 1

    /**
     * @type {Integer (UInt64)}
     */
    static CLUSAPI_VALID_CHANGE_RESOURCE_GROUP_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GROUP_FAILURE_INFO_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_FAILURE_INFO_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_ACCESS_ANY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_ACCESS_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_ACCESS_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_NO_MODIFY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_MODIFY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_NOT_GLOBAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_GLOBAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSCTL_ACCESS_SHIFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSCTL_FUNCTION_SHIFT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLCTL_INTERNAL_SHIFT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static CLCTL_USER_SHIFT => 21

    /**
     * @type {Integer (UInt32)}
     */
    static CLCTL_MODIFY_SHIFT => 22

    /**
     * @type {Integer (UInt32)}
     */
    static CLCTL_GLOBAL_SHIFT => 23

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSCTL_OBJECT_SHIFT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSCTL_CONTROL_CODE_MASK => 4194303

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSCTL_OBJECT_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSCTL_ACCESS_MODE_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CLCTL_CLUSTER_BASE => 0

    /**
     * @type {Integer (Int32)}
     */
    static BitLockerEnabled => 1

    /**
     * @type {Integer (Int32)}
     */
    static BitLockerDecrypted => 4

    /**
     * @type {Integer (Int32)}
     */
    static BitlockerEncrypted => 8

    /**
     * @type {Integer (Int32)}
     */
    static BitLockerDecrypting => 16

    /**
     * @type {Integer (Int32)}
     */
    static BitlockerEncrypting => 32

    /**
     * @type {Integer (Int32)}
     */
    static BitLockerPaused => 64

    /**
     * @type {Integer (Int32)}
     */
    static BitLockerStopped => 128

    /**
     * @type {Integer (UInt64)}
     */
    static RedirectedIOReasonUserRequest => 1

    /**
     * @type {Integer (UInt64)}
     */
    static RedirectedIOReasonUnsafeFileSystemFilter => 2

    /**
     * @type {Integer (UInt64)}
     */
    static RedirectedIOReasonUnsafeVolumeFilter => 4

    /**
     * @type {Integer (UInt64)}
     */
    static RedirectedIOReasonFileSystemTiering => 8

    /**
     * @type {Integer (UInt64)}
     */
    static RedirectedIOReasonBitLockerInitializing => 16

    /**
     * @type {Integer (UInt64)}
     */
    static RedirectedIOReasonReFs => 32

    /**
     * @type {Integer (UInt64)}
     */
    static RedirectedIOReasonMax => 9223372036854775808

    /**
     * @type {Integer (UInt64)}
     */
    static VolumeRedirectedIOReasonNoDiskConnectivity => 1

    /**
     * @type {Integer (UInt64)}
     */
    static VolumeRedirectedIOReasonStorageSpaceNotAttached => 2

    /**
     * @type {Integer (UInt64)}
     */
    static VolumeRedirectedIOReasonVolumeReplicationEnabled => 4

    /**
     * @type {Integer (UInt64)}
     */
    static VolumeRedirectedIOReasonMax => 9223372036854775808

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_OBJECTID => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_CO_PASSWORD_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GUID_PRESENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREATEDC_PRESENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_CO_PASSWORD_LENGTHEX => 127

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_CO_PASSWORD_STORAGEEX => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_CREATINGDC_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_LENGTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MAINTENANCE_MODE_V2_SIG => 2881155087

    /**
     * @type {Integer (UInt32)}
     */
    static NNLEN => 80

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_GENAPP => "Generic Application"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_GENSVC => "Generic Service"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_GENSCRIPT => "Generic Script"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_IPADDR => "IP Address"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_NETNAME => "Network Name"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_DNN => "Distributed Network Name"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_FILESHR => "File Share"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_PRTSPLR => "Print Spooler"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_IPV6_NATIVE => "IPv6 Address"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_IPV6_TUNNEL => "IPv6 Tunnel Address"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_VSSTASK => "Volume Shadow Copy Service Task"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_WINS => "WINS Service"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_DHCP => "DHCP Service"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_MSMQ => "Microsoft Message Queue Server"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_NEW_MSMQ => "MSMQ"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_MSMQ_TRIGGER => "MSMQTriggers"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_MSDTC => "Distributed Transaction Coordinator"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_NFS => "NFS Share"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_NETWORK_FILE_SYSTEM => "Network File System"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_ISNS => "Microsoft iSNS"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_HARDDISK => "Physical Disk"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_PHYS_DISK => "Physical Disk"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_FSWITNESS => "File Share Witness"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_FILESERVER => "File Server"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_SODAFILESERVER => "Scale Out File Server"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_DFS => "Distributed File System"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_DFSR => "DFS Replicated Folder"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_VM => "Virtual Machine"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_VM_CONFIG => "Virtual Machine Configuration"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_ISCSITARGET => "iSCSI Target Server"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_STORAGE_POOL => "Storage Pool"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_TASKSCHEDULER => "Task Scheduler"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_VMREPLICA_BROKER => "Virtual Machine Replication Broker"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_VMREPLICA_COORDINATOR => "Virtual Machine Replication Coordinator"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_NFS_V2 => "Network File System"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_NFS_MSNS => "NFS Multi Server Namespace"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_CAU => "ClusterAwareUpdatingResource"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_NV_PROVIDER_ADDRESS => "Provider Address"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_NAT => "Nat"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_STORAGE_POLICIES => "Storage Policies"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_STORQOS => "Storage QoS Policy Manager"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_HEALTH_SERVICE => "Health Service"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_VM_WMI => "Virtual Machine Cluster WMI"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_SDDC_MANAGEMENT => "SDDC Management"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_HCSVM => "HCS Virtual Machine"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_VIRTUAL_IPV4 => "Disjoint IPv4 Address"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_VIRTUAL_IPV6 => "Disjoint IPv6 Address"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_CLOUD_WITNESS => "Cloud Witness"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_STORAGE_REPLICA => "Storage Replica"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_CROSS_CLUSTER => "Cross Cluster Dependency Orchestrator"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_SCALEOUT_MASTER => "Scaleout Master"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_SCALEOUT_WORKER => "Scaleout Worker"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_CONTAINER => "Container"

    /**
     * @type {String}
     */
    static CLUS_RES_NAME_SCALEOUT_MASTER => "Scaleout Master"

    /**
     * @type {String}
     */
    static CLUS_RES_NAME_SCALEOUT_WORKER => "Scaleout Worker"

    /**
     * @type {String}
     */
    static CLUS_RESTYPE_NAME_KEY_VALUE_STORE => "Key Value Store"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_CLUS_DESC => "Description"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_CLUS_SD => "Security Descriptor"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_CLUS_DEFAULT_NETWORK_ROLE => "DefaultNetworkRole"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_QUORUM_ARBITRATION_TIMEOUT => "QuorumArbitrationTimeMax"

    /**
     * @type {String}
     */
    static CLUSTER_HANG_TIMEOUT_KEYNAME => "ClusSvcHangTimeout"

    /**
     * @type {String}
     */
    static CLUSTER_HANG_RECOVERY_ACTION_KEYNAME => "HangRecoveryAction"

    /**
     * @type {String}
     */
    static CLUSTER_CSA_VSS_STATE => "BackupInProgress"

    /**
     * @type {String}
     */
    static CLUSTER_REQUEST_REPLY_TIMEOUT => "RequestReplyTimeout"

    /**
     * @type {String}
     */
    static CLUSTER_WITNESS_FAILED_RESTART_INTERVAL => "WitnessRestartInterval"

    /**
     * @type {String}
     */
    static CLUSTER_WITNESS_DATABASE_WRITE_TIMEOUT => "WitnessDatabaseWriteTimeout"

    /**
     * @type {String}
     */
    static CLUSTER_ADD_EVICT_DELAY => "AddEvictDelay"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FIXQUORUM => "FixQuorum"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PREVENTQUORUM => "PreventQuorum"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IGNORE_PERSISTENT_STATE => "IgnorePersistentStateOnStartup"

    /**
     * @type {String}
     */
    static CLUSTER_SHARED_VOLUMES_ROOT => "SharedVolumesRoot"

    /**
     * @type {String}
     */
    static ENABLE_CLUSTER_SHARED_VOLUMES => "EnableSharedVolumes"

    /**
     * @type {String}
     */
    static CLUSTER_SHARED_VOLUME_VSS_WRITER_OPERATION_TIMEOUT => "SharedVolumeVssWriterOperationTimeout"

    /**
     * @type {String}
     */
    static USE_CLIENT_ACCESS_NETWORKS_FOR_CSV => "UseClientAccessNetworksForSharedVolumes"

    /**
     * @type {String}
     */
    static CLUSTER_CSV_COMPATIBLE_FILTERS => "SharedVolumeCompatibleFilters"

    /**
     * @type {String}
     */
    static CLUSTER_CSV_INCOMPATIBLE_FILTERS => "SharedVolumeIncompatibleFilters"

    /**
     * @type {String}
     */
    static CLUSTER_GROUP_WAIT_DELAY => "ClusterGroupWaitDelay"

    /**
     * @type {String}
     */
    static MINIMUM_PREEMPTOR_PRIORITY => "MinimumPreemptorPriority"

    /**
     * @type {String}
     */
    static MINIMUM_NEVER_PREEMPT_PRIORITY => "MinimumNeverPreemptPriority"

    /**
     * @type {String}
     */
    static CLUSTER_ENFORCED_ANTIAFFINITY => "ClusterEnforcedAntiaffinity"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_SHUTDOWN_TIMEOUT_MINUTES => "ShutdownTimeoutInMinutes"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_CSV_MDS_SD => "SharedVolumeSecurityDescriptor"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FAILOVER_MOVE_MIGRATION_TYPE => "FailoverMoveMigrationType"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_CSV_BLOCK_CACHE => "BlockCacheSize"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_ROUTE_HISTORY_LENGTH => "RouteHistoryLength"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_LAST_RECENT_EVENTS_RESET_TIME => "RecentEventsResetTime"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_DRAIN_ON_SHUTDOWN => "DrainOnShutdown"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETFT_IPSEC_ENABLED => "NetftIPSecEnabled"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_WITNESS_DYNAMIC_WEIGHT => "WitnessDynamicWeight"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_MESSAGE_BUFFER_LENGTH => "MessageBufferLength"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_DATABASE_READ_WRITE_MODE => "DatabaseReadWriteMode"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FUNCTIONAL_LEVEL => "ClusterFunctionalLevel"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_UPGRADE_VERSION => "ClusterUpgradeVersion"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESILIENCY_LEVEL => "ResiliencyLevel"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESILIENCY_DEFAULT_SECONDS => "ResiliencyDefaultPeriod"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_QUARANTINE_THRESHOLD => "QuarantineThreshold"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_QUARANTINE_DURATION => "QuarantineDuration"

    /**
     * @type {String}
     */
    static CLUSTER_S2D_ENABLED => "S2DEnabled"

    /**
     * @type {String}
     */
    static CLUSTER_S2D_BUS_TYPES => "S2DBusTypes"

    /**
     * @type {String}
     */
    static CLUSTER_S2D_CACHE_PAGE_SIZE_KBYTES => "S2DCachePageSizeKBytes"

    /**
     * @type {String}
     */
    static CLUSTER_S2D_OPTIMIZATIONS => "S2DOptimizations"

    /**
     * @type {String}
     */
    static CLUSTER_S2D_IO_LATENCY_THRESHOLD => "S2DIOLatencyThreshold"

    /**
     * @type {String}
     */
    static CLUSTER_S2D_CACHE_DESIRED_STATE => "S2DCacheDesiredState"

    /**
     * @type {String}
     */
    static CLUSTER_S2D_CACHE_METADATA_RESERVE => "S2DCacheMetadataReserveBytes"

    /**
     * @type {String}
     */
    static CLUSTER_S2D_CACHE_FLASH_RESERVE_PERCENT => "S2DCacheFlashReservePercent"

    /**
     * @type {String}
     */
    static CLUSTER_S2D_CACHE_BEHAVIOR_FLAGS => "S2DCacheBehavior"

    /**
     * @type {String}
     */
    static CLUSTER_NAME_PREFERRED_SITE => "PreferredSite"

    /**
     * @type {String}
     */
    static CLUSTER_NAME_AUTO_BALANCER_MODE => "AutoBalancerMode"

    /**
     * @type {String}
     */
    static CLUSTER_NAME_AUTO_BALANCER_LEVEL => "AutoBalancerLevel"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GROUP_DEPENDENCY_TIMEOUT => "GroupDependencyTimeout"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PLACEMENT_OPTIONS => "PlacementOptions"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_ENABLED_EVENT_LOGS => "EnabledEventLogs"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_MAX_PARALLEL_MIGRATIONS => "MaximumParallelMigrations"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_ACCELERATED_NETWORKING_ENABLED => "AcceleratedNetworkingEnabled"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_ACCELERATED_NETWORKING_NODE_RESERVE => "AcceleratedNetworkingNodeReserve"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_SAME_SUBNET_DELAY => "SameSubnetDelay"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_CROSS_SUBNET_DELAY => "CrossSubnetDelay"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_CROSS_SITE_DELAY => "CrossSiteDelay"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_SAME_SUBNET_THRESHOLD => "SameSubnetThreshold"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_CROSS_SUBNET_THRESHOLD => "CrossSubnetThreshold"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_CROSS_SITE_THRESHOLD => "CrossSiteThreshold"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PLUMB_ALL_CROSS_SUBNET_ROUTES => "PlumbAllCrossSubnetRoutes"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_NAME => "NodeName"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_HIGHEST_VERSION => "NodeHighestVersion"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_LOWEST_VERSION => "NodeLowestVersion"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_DESC => "Description"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_MAJOR_VERSION => "MajorVersion"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_MINOR_VERSION => "MinorVersion"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_BUILD_NUMBER => "BuildNumber"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_CSDVERSION => "CSDVersion"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_WEIGHT => "NodeWeight"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_DYNAMIC_WEIGHT => "DynamicWeight"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_IS_PRIMARY => "IsPrimary"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_DRAIN_STATUS => "NodeDrainStatus"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_DRAIN_TARGET => "NodeDrainTarget"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_NEEDS_PQ => "NeedsPreventQuorum"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_FDID => "FaultDomainId"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_STATUS_INFO => "StatusInformation"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_FAULT_DOMAIN => "FaultDomain"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_MODEL => "Model"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_SERIALNUMBER => "SerialNumber"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_MANUFACTURER => "Manufacturer"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_UNIQUEID => "UniqueID"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_DRAIN_ERROR_CODE => "DrainErrorCode"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_FAILBACK_STATUS => "NodeFailbackStatus"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NODE_HYPERTHREADING_ENABLED => "HyperthreadingEnabled"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_NAME => "Name"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_TYPE => "GroupType"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_DESC => "Description"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_PERSISTENT_STATE => "PersistentState"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_FAILBACK_TYPE => "AutoFailbackType"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_FAILBACK_WIN_START => "FailbackWindowStart"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_FAILBACK_WIN_END => "FailbackWindowEnd"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_FAILOVER_THRESHOLD => "FailoverThreshold"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_FAILOVER_PERIOD => "FailoverPeriod"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_PRIORITY => "Priority"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_DEFAULT_OWNER => "DefaultOwner"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_STATUS_INFORMATION => "StatusInformation"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_ANTI_AFFINITY_CLASS_NAME => "AntiAffinityClassNames"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_START_DELAY => "GroupStartDelay"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_CCF_EPOCH => "CCFEpoch"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_CCF_EPOCH_HIGH => "CCFEpochHigh"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_RESILIENCY_PERIOD => "ResiliencyPeriod"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_PREFERRED_SITE => "PreferredSite"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_COLD_START_SETTING => "ColdStartSetting"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_FAULT_DOMAIN => "FaultDomain"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_UPDATE_DOMAIN => "UpdateDomain"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_PLACEMENT_OPTIONS => "PlacementOptions"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GRP_LOCK_MOVE => "LockedFromMoving"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_NAME => "Name"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_TYPE => "Type"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_DESC => "Description"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_SEPARATE_MONITOR => "SeparateMonitor"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_PERSISTENT_STATE => "PersistentState"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_LOOKS_ALIVE => "LooksAlivePollInterval"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_IS_ALIVE => "IsAlivePollInterval"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_RESTART_ACTION => "RestartAction"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_RESTART_THRESHOLD => "RestartThreshold"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_RESTART_PERIOD => "RestartPeriod"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_RESTART_DELAY => "RestartDelay"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_RETRY_PERIOD_ON_FAILURE => "RetryPeriodOnFailure"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_EMBEDDED_FAILURE_ACTION => "EmbeddedFailureAction"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_PENDING_TIMEOUT => "PendingTimeout"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_DEADLOCK_TIMEOUT => "DeadlockTimeout"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_MONITOR_PID => "MonitorProcessId"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_STATUS_INFORMATION => "StatusInformation"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_LAST_OPERATION_STATUS_CODE => "LastOperationStatusCode"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_DATA1 => "ResourceSpecificData1"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_DATA2 => "ResourceSpecificData2"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RES_STATUS => "ResourceSpecificStatus"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESTYPE_NAME => "Name"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESTYPE_DESC => "Description"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESTYPE_DLL_NAME => "DllName"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESTYPE_ADMIN_EXTENSIONS => "AdminExtensions"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESTYPE_LOOKS_ALIVE => "LooksAlivePollInterval"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESTYPE_IS_ALIVE => "IsAlivePollInterval"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESTYPE_PENDING_TIMEOUT => "PendingTimeout"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESTYPE_DEADLOCK_TIMEOUT => "DeadlockTimeout"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESTYPE_DUMP_POLICY => "DumpPolicy"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESTYPE_DUMP_LOG_QUERY => "DumpLogQuery"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESTYPE_DUMP_SERVICES => "DumpServices"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESTYPE_ENABLED_EVENT_LOGS => "EnabledEventLogs"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESTYPE_MAX_MONITORS => "MaximumMonitors"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESTYPE_WPR_START_AFTER => "WprStartAfter"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_RESTYPE_WPR_PROFILES => "WprProfiles"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NET_NAME => "Name"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NET_IPV6_ADDRESSES => "IPv6Addresses"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NET_IPV6_PREFIXLENGTHS => "IPv6PrefixLengths"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NET_IPV4_ADDRESSES => "IPv4Addresses"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NET_IPV4_PREFIXLENGTHS => "IPv4PrefixLengths"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NET_ADDRESS => "Address"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NET_ADDRESS_MASK => "AddressMask"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NET_DESC => "Description"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NET_ROLE => "Role"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NET_SPEED => "LinkSpeed"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NET_RDMA_CAPABLE => "RdmaCapable"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NET_RSS_CAPABLE => "RssCapable"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NET_METRIC => "Metric"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NET_AUTOMETRIC => "AutoMetric"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETIFACE_NAME => "Name"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETIFACE_NODE => "Node"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETIFACE_NETWORK => "Network"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETIFACE_ADAPTER_NAME => "Adapter"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETIFACE_ADAPTER_ID => "AdapterId"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETIFACE_DHCP_ENABLED => "DhcpEnabled"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETIFACE_IPV6_ADDRESSES => "IPv6Addresses"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETIFACE_IPV4_ADDRESSES => "IPv4Addresses"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETIFACE_ADDRESS => "Address"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETIFACE_DESC => "Description"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GROUPSET_NAME => "Name"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GROUPSET_STARTUP_SETTING => "StartupSetting"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GROUPSET_STARTUP_COUNT => "StartupCount"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GROUPSET_STARTUP_DELAY => "StartupDelay"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GROUPSET_IS_GLOBAL => "IsGlobal"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GROUPSET_STATUS_INFORMATION => "StatusInformation"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GROUPSET_IS_AVAILABILITY_SET => "IsAvailabilitySet"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GROUPSET_UPDATE_DOMAINS => "UpdateDomains"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GROUPSET_FAULT_DOMAINS => "FaultDomains"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GROUPSET_RESERVE_NODE => "ReserveSpareNode"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GROUPSET_AVAILABILITY_SET_INDEX_TO_NODE_MAPPING => "NodeDomainInfo"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_AFFINITYRULE_NAME => "Name"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_AFFINITYRULE_TYPE => "RuleType"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_AFFINITYRULE_GROUPS => "Groups"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_AFFINITYRULE_ENABLED => "Enabled"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_AFFINITYRULE_SOFTANTIAFFINITY => "SoftAntiAffinity"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_START_MEMORY => "StartMemory"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_VIRTUAL_NUMA_COUNT => "VirtualNumaCount"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_DDA_DEVICE_ALLOCATIONS => "DdaDeviceAllocations"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GPUP_DEVICE_ALLOCATIONS => "GpupDeviceAllocations"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_DISKIDTYPE => "DiskIdType"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_DISKSIGNATURE => "DiskSignature"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_DISKIDGUID => "DiskIdGuid"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_DISKRUNCHKDSK => "DiskRunChkDsk"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_DISKUNIQUEIDS => "DiskUniqueIds"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_DISKVOLUMEINFO => "DiskVolumeInfo"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_DISKARBTYPE => "DiskArbType"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_DISKARBINTERVAL => "DiskArbInterval"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_DISKPATH => "DiskPath"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_DISKRELOAD => "DiskReload"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_MAINTMODE => "MaintenanceMode"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_DISKIODELAY => "MaxIoLatency"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_MIGRATEFIXUP => "MigrateDriveLetters"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_CSVWRITETHROUGH => "CsvEnforceWriteThrough"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_CSVBLOCKCACHE => "EnableBlockCache"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_FASTONLINEARBITRATE => "FastOnlineArbitrate"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_SPACEIDGUID => "VirtualDiskId"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_POOLIDGUID => "PoolId"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_CSVSNAPSHOTDIFFAREASIZE => "SnapshotDiffSize"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_CSVSNAPSHOTAGELIMIT => "SnapshotAgeLimit"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_DISKGUID => "DiskGuid"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_VOLSNAPACTIVATETIMEOUT => "VolsnapActivateTimeout"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PHYSDISK_DISKRECOVERYACTION => "DiskRecoveryAction"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_NAME => "VirtualDiskName"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_DESCRIPTION => "VirtualDiskDescription"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_HEALTH => "VirtualDiskHealth"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_STATE => "VirtualDiskState"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_PROVISIONING => "VirtualDiskProvisioning"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_RESILIENCYTYPE => "VirtualDiskResiliencyType"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_RESILIENCYCOLUMNS => "VirtualDiskResiliencyColumns"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_RESILIENCYINTERLEAVE => "VirtualDiskResiliencyInterleave"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GENAPP_COMMAND_LINE => "CommandLine"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GENAPP_CURRENT_DIRECTORY => "CurrentDirectory"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GENAPP_USE_NETWORK_NAME => "UseNetworkName"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GENSCRIPT_SCRIPT_FILEPATH => "ScriptFilepath"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GENSVC_SERVICE_NAME => "ServiceName"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GENSVC_STARTUP_PARAMS => "StartupParameters"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_GENSVC_USE_NETWORK_NAME => "UseNetworkName"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPADDR_NETWORK => "Network"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPADDR_ADDRESS => "Address"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPADDR_SUBNET_MASK => "SubnetMask"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPADDR_ENABLE_NETBIOS => "EnableNetBIOS"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPADDR_OVERRIDE_ADDRMATCH => "OverrideAddressMatch"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPADDR_ENABLE_DHCP => "EnableDhcp"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPADDR_LEASE_OBTAINED_TIME => "LeaseObtainedTime"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPADDR_LEASE_TERMINATES_TIME => "LeaseExpiresTime"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPADDR_T1 => "T1"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPADDR_T2 => "T2"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPADDR_DHCP_SERVER => "DhcpServer"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPADDR_DHCP_ADDRESS => "DhcpAddress"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPADDR_DHCP_SUBNET_MASK => "DhcpSubnetMask"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPADDR_SHARED_NETNAME => "SharedNetname"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPADDR_PROBE_PORT => "ProbePort"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPADDR_PROBE_FAILURE_THRESHOLD => "ProbeFailureThreshold"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPV6_NATIVE_NETWORK => "Network"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPV6_NATIVE_ADDRESS => "Address"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPV6_NATIVE_PREFIX_LENGTH => "PrefixLength"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPV6_TUNNEL_ADDRESS => "Address"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_IPV6_TUNNEL_TUNNELTYPE => "TunnelType"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_NAME => "Name"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_CREATING_DC => "CreatingDC"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_OBJECT_ID => "ObjectGUID"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_DNS_NAME => "DnsName"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_REMAP_PIPE_NAMES => "RemapPipeNames"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_RESOURCE_DATA => "ResourceData"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_STATUS_NETBIOS => "StatusNetBIOS"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_STATUS_DNS => "StatusDNS"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_STATUS_KERBEROS => "StatusKerberos"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_VCO_CONTAINER => "VcoContainer"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_LAST_DNS_UPDATE => "LastDNSUpdateTime"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_CONTAINERGUID => "CryptoContainerGUID"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_HOST_TTL => "HostRecordTTL"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_PUBLISH_PTR => "PublishPTRRecords"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_REMOVEVCO_ONDELETE => "DeleteVcoOnResCleanup"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_REGISTER_ALL_IP => "RegisterAllProvidersIP"

    /**
     * @type {String}
     */
    static CLUSREG_KEYNAME_OBJECTGUIDS => "ObjectGUIDs"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_EXCLUDE_NETWORKS => "ExcludeNetworks"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_ALIASES => "Aliases"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_IN_USE_NETWORKS => "InUseNetworks"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_DNS_SUFFIX => "DnsSuffix"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_AD_AWARE => "ADAware"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_NETNAME_DNN_DISABLE_CLONES => "DisableClones"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PRTSPOOL_DEFAULT_SPOOL_DIR => "DefaultSpoolDirectory"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_PRTSPOOL_TIMEOUT => "JobCompletionTimeout"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FILESHR_SERVER_NAME => "ServerName"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FILESHR_SHARE_NAME => "ShareName"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FILESHR_PATH => "Path"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FILESHR_REMARK => "Remark"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FILESHR_MAX_USERS => "MaxUsers"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FILESHR_SD => "Security Descriptor"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FILESHR_SHARE_SUBDIRS => "ShareSubDirs"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FILESHR_HIDE_SUBDIR_SHARES => "HideSubDirShares"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FILESHR_IS_DFS_ROOT => "IsDfsRoot"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FILESHR_SHARE_FLAGS => "ShareFlags"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FILESHR_CA_TIMEOUT => "CATimeout"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FILESHR_QOS_FLOWSCOPE => "QosFlowScope"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FILESHR_QOS_POLICYID => "QosPolicyId"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_DHCP_DATABASE_PATH => "DatabasePath"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_DHCP_BACKUP_PATH => "BackupPath"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_LOG_FILE_PATH => "LogFilePath"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_WINS_DATABASE_PATH => "DatabasePath"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_WINS_BACKUP_PATH => "BackupPath"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_VSSTASK_CURRENTDIRECTORY => "CurrentDirectory"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_VSSTASK_APPNAME => "ApplicationName"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_VSSTASK_APPPARAMS => "ApplicationParams"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_VSSTASK_TRIGGERARRAY => "TriggerArray"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FSWITNESS_SHARE_PATH => "SharePath"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FSWITNESS_ARB_DELAY => "ArbitrationDelay"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_FSWITNESS_IMPERSONATE_CNO => "ImpersonateCNO"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_POOLNAME => "Name"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_POOLDESC => "Description"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_POOLDRIVEIDS => "DriveIds"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_POOLHEALTH => "Health"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_POOLSTATE => "State"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_POOLTOTALCAPACITY => "TotalCapacity"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_POOLCONSUMEDCAPACITY => "ConsumedCapacity"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_POOLARBITRATE => "Arbitrate"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_POOLREEVALTIMEOUT => "ReEvaluatePlacementTimeout"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_POOLQUORUMSHARE => "PoolQuorumShare"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_STORAGESPACE_POOLQUORUMUSERACCOUNT => "PoolQuorumUserAccount"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_SOFS_SMBASYMMETRYMODE => "SmbAsymmetryMode"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_VIP_PREFIX_LENGTH => "PrefixLength"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_VIP_ADAPTER_NAME => "AdapterName"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_VIP_ADDRESS => "Address"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_VIP_VSID => "VSID"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_VIP_RDID => "RDID"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_CLOUDWITNESS_PRIMARY_TOKEN => "PrimaryToken"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_CLOUDWITNESS_PRIMARY_KEY => "PrimaryKey"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_CLOUDWITNESS_ACCOUNT_NAME => "AccountName"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_CLOUDWITNESS_ENDPOINT_INFO => "EndpointInfo"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_CLOUDWITNESS_CONTAINER_NAME => "ContainerName"

    /**
     * @type {String}
     */
    static CLOUD_WITNESS_CONTAINER_NAME => "msft-cloud-witness"

    /**
     * @type {String}
     */
    static CLUS_NAME_RES_TYPE_SOURCE_RESID => "SourceResourceId"

    /**
     * @type {String}
     */
    static CLUS_NAME_RES_TYPE_TARGET_RESID => "TargetResourceId"

    /**
     * @type {String}
     */
    static CLUS_NAME_RES_TYPE_SOURCE_VOLUMES => "SourceVolumes"

    /**
     * @type {String}
     */
    static CLUS_NAME_RES_TYPE_TARGET_VOLUMES => "TargetVolumes"

    /**
     * @type {String}
     */
    static CLUS_NAME_RES_TYPE_DATA_RESID => "DataResourceId"

    /**
     * @type {String}
     */
    static CLUS_NAME_RES_TYPE_LOG_RESID => "LogResourceId"

    /**
     * @type {String}
     */
    static CLUS_NAME_RES_TYPE_LOG_VOLUME => "LogVolume"

    /**
     * @type {String}
     */
    static CLUS_NAME_RES_TYPE_REPLICATION_GROUPID => "ReplicationGroupId"

    /**
     * @type {String}
     */
    static CLUS_NAME_RES_TYPE_CLUSTER_GROUPID => "ClusterGroupId"

    /**
     * @type {String}
     */
    static CLUS_NAME_RES_TYPE_REPLICATION_GROUP_TYPE => "ReplicationClusterGroupType"

    /**
     * @type {String}
     */
    static CLUS_NAME_RES_TYPE_MINIMUM_LOG_SIZE => "MinimumLogSizeInBytes"

    /**
     * @type {String}
     */
    static CLUS_NAME_RES_TYPE_UNIT_LOG_SIZE_CHANGE => "UnitOfLogSizeChangeInBytes"

    /**
     * @type {String}
     */
    static CLUS_NAME_RES_TYPE_LOG_MULTIPLE => "LogSizeMultiple"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_KEYVALUESTORE_NAME => "KeyValueStores"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_KEYVALUESTORE_MANAGERNAME => "ManagerName"

    /**
     * @type {String}
     */
    static CLUSREG_NAME_KEYVALUESTORE_MANAGERPATH => "ManagerPath"

    /**
     * @type {Integer (UInt32)}
     */
    static SR_REPLICATED_PARTITION_DISALLOW_MULTINODE_IO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_FLAG_ADD_VOLUME_INFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_FLAG_FILTER_BY_POOL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS_EX2_FLAG_INCLUDE_NON_SHARED_DISKS => 4

    /**
     * @type {String}
     */
    static STARTUP_ROUTINE => "Startup"

    /**
     * @type {Integer (UInt32)}
     */
    static CLRES_VERSION_V1_00 => 256

    /**
     * @type {String}
     */
    static STARTUP_EX_ROUTINE => "StartupEx"

    /**
     * @type {Integer (UInt32)}
     */
    static CLRES_VERSION_V2_00 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CLRES_VERSION_V3_00 => 768

    /**
     * @type {Integer (UInt32)}
     */
    static CLRES_VERSION_V4_00 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSCTL_GET_OPERATION_CONTEXT_PARAMS_VERSION_1 => 1

    /**
     * @type {String}
     */
    static CLUSRES_NAME_GET_OPERATION_CONTEXT_FLAGS => "Flags"

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSRESDLL_STATUS_OFFLINE_BUSY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSRESDLL_STATUS_OFFLINE_SOURCE_THROTTLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSRESDLL_STATUS_OFFLINE_DESTINATION_THROTTLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSRESDLL_STATUS_OFFLINE_DESTINATION_REJECTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSRESDLL_STATUS_INSUFFICIENT_MEMORY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSRESDLL_STATUS_INSUFFICIENT_PROCESSOR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSRESDLL_STATUS_INSUFFICIENT_OTHER_RESOURCES => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSRESDLL_STATUS_INVALID_PARAMETERS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSRESDLL_STATUS_NETWORK_NOT_AVAILABLE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSRESDLL_STATUS_DO_NOT_COLLECT_WER_REPORT => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSRESDLL_STATUS_DUMP_NOW => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_RESDLL_OPEN_RECOVER_MONITOR_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_RESDLL_ONLINE_RECOVER_MONITOR_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_RESDLL_ONLINE_IGNORE_RESOURCE_STATUS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_RESDLL_ONLINE_RETURN_TO_SOURCE_NODE_ON_ERROR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_RESDLL_ONLINE_RESTORE_ONLINE_STATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_RESDLL_ONLINE_IGNORE_NETWORK_CONNECTIVITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_RESDLL_OFFLINE_IGNORE_RESOURCE_STATUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_RESDLL_OFFLINE_RETURN_TO_SOURCE_NODE_ON_ERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_RESDLL_OFFLINE_QUEUE_ENABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_RESDLL_OFFLINE_RETURNING_TO_SOURCE_NODE_BECAUSE_OF_ERROR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_RESDLL_OFFLINE_DUE_TO_EMBEDDED_FAILURE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_RESDLL_OFFLINE_IGNORE_NETWORK_CONNECTIVITY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_RESDLL_OFFLINE_DO_NOT_UPDATE_PERSISTENT_STATE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_RESDLL_OPEN_DONT_DELETE_TEMP_DISK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RESTYPE_MONITOR_SHUTTING_DOWN_NODE_STOP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RESTYPE_MONITOR_SHUTTING_DOWN_CLUSSVC_CRASH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RESUTIL_PROPITEM_READ_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RESUTIL_PROPITEM_REQUIRED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RESUTIL_PROPITEM_SIGNED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RESUTIL_PROPITEM_IN_MEMORY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LOCKED_MODE_FLAGS_DONT_REMOVE_FROM_MOVE_QUEUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSRES_DISABLE_WPR_WATCHDOG_FOR_ONLINE_CALLS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSRES_DISABLE_WPR_WATCHDOG_FOR_OFFLINE_CALLS => 2

    /**
     * @type {String}
     */
    static CLUSTER_HEALTH_FAULT_PROPERTY_NAME => "ClusterHealth"

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_HEALTH_FAULT_ARGS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_HEALTH_FAULT_ID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_HEALTH_FAULT_ERRORTYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_HEALTH_FAULT_ERRORCODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_HEALTH_FAULT_DESCRIPTION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_HEALTH_FAULT_PROVIDER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_HEALTH_FAULT_FLAGS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CLUSTER_HEALTH_FAULT_RESERVED => 6

    /**
     * @type {String}
     */
    static CLUSTER_HEALTH_FAULT_ID_LABEL => "Id"

    /**
     * @type {String}
     */
    static CLUSTER_HEALTH_FAULT_ERRORTYPE_LABEL => "ErrorType"

    /**
     * @type {String}
     */
    static CLUSTER_HEALTH_FAULT_ERRORCODE_LABEL => "ErrorCode"

    /**
     * @type {String}
     */
    static CLUSTER_HEALTH_FAULT_DESCRIPTION_LABEL => "Description"

    /**
     * @type {String}
     */
    static CLUSTER_HEALTH_FAULT_PROVIDER_LABEL => "Provider"

    /**
     * @type {String}
     */
    static CLUSTER_HEALTH_FAULT_FLAGS_LABEL => "Flags"

    /**
     * @type {String}
     */
    static CLUSTER_HEALTH_FAULT_RESERVED_LABEL => "Reserved"

    /**
     * @type {Integer (UInt32)}
     */
    static CLUS_CREATE_CRYPT_CONTAINER_NOT_FOUND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SET_APPINSTANCE_CSV_FLAGS_VALID_ONLY_IF_CSV_COORDINATOR => 1
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<CLUSAPI_REASON_HANDLER>} lpHandler 
     * @returns {Pointer<CLUSAPI_REASON_HANDLER>} 
     */
    static ClusapiSetReasonHandler(lpHandler) {
        result := DllCall("CLUSAPI.dll\ClusapiSetReasonHandler", "ptr", lpHandler, "ptr")
        return result
    }

    /**
     * Determines whether the Cluster service is installed and running on a node.
     * @param {PWSTR} lpszNodeName Pointer to a null-terminated Unicode string containing the name of the node to query. If 
     *        <i>lpszNodeName</i> is <b>NULL</b>, the local node is queried.
     * @param {Pointer<UInt32>} pdwClusterState Pointer to a value describing the state of the Cluster service on the node. A node will be described by one 
     *        of the following <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-node_cluster_state">NODE_CLUSTER_STATE</a> enumeration 
     *        values.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b> (0). If the operation 
     *        fails, the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getnodeclusterstate
     * @since windowsserver2008
     */
    static GetNodeClusterState(lpszNodeName, pdwClusterState) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName

        result := DllCall("CLUSAPI.dll\GetNodeClusterState", "ptr", lpszNodeName, "uint*", pdwClusterState, "uint")
        return result
    }

    /**
     * Opens a connection to a cluster and returns a handle to it.
     * @param {PWSTR} lpszClusterName 
     * @returns {HCLUSTER} If the operation was successful, <b>OpenCluster</b> returns 
     *        a cluster handle.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULL</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the function 
     *          <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-opencluster
     * @since windowsserver2008
     */
    static OpenCluster(lpszClusterName) {
        lpszClusterName := lpszClusterName is String ? StrPtr(lpszClusterName) : lpszClusterName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\OpenCluster", "ptr", lpszClusterName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a connection to a cluster and returns a handle to it.
     * @param {PWSTR} lpszClusterName 
     * @param {Integer} DesiredAccess The requested access privileges. This may be any combination of <b>GENERIC_READ</b> 
     *       (0x80000000), <b>GENERIC_ALL</b> (0x10000000), or <b>MAXIMUM_ALLOWED</b> 
     *       (0x02000000). If this value is zero (0) and undefined error may be returned. Using 
     *       <b>GENERIC_ALL</b> is the same as calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-opencluster">OpenCluster</a>.
     * @param {Pointer<UInt32>} GrantedAccess Optional parameter that contains the address of a <b>DWORD</b> that will receive the 
     *       access rights granted. If the <i>DesiredAccess</i> parameter is 
     *       <b>MAXIMUM_ALLOWED</b> (0x02000000) then the <b>DWORD</b> pointed to by 
     *       this parameter will contain the maximum privileges granted to this user.
     * @returns {HCLUSTER} If the operation was successful, <b>OpenClusterEx</b> returns 
     *        a cluster handle.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULL</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the 
     *         <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. If the target server does not 
     *         support the <a href="/windows/desktop/api/clusapi/nf-clusapi-openclusterex">OpenClusterEx</a> function (for example if 
     *         the target server is running Windows Server 2008 or earlier) then the 
     *         <b>GetLastError</b> function will return 
     *         <b>RPC_S_PROCNUM_OUT_OF_RANGE</b> (1745).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-openclusterex
     * @since windowsserver2008
     */
    static OpenClusterEx(lpszClusterName, DesiredAccess, GrantedAccess) {
        lpszClusterName := lpszClusterName is String ? StrPtr(lpszClusterName) : lpszClusterName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\OpenClusterEx", "ptr", lpszClusterName, "uint", DesiredAccess, "uint*", GrantedAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes a cluster handle.
     * @param {HCLUSTER} hCluster Handle to the cluster to close.
     * @returns {BOOL} This function always returns <b>TRUE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-closecluster
     * @since windowsserver2008
     */
    static CloseCluster(hCluster) {
        result := DllCall("CLUSAPI.dll\CloseCluster", "ptr", hCluster, "ptr")
        return result
    }

    /**
     * Sets the name for a cluster.
     * @param {HCLUSTER} hCluster Handle to a cluster to rename.
     * @param {PWSTR} lpszNewClusterName Pointer to a null-terminated Unicode string containing the new cluster name.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_RESOURCE_PROPERTIES_STORED</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-setclustername
     * @since windowsserver2008
     */
    static SetClusterName(hCluster, lpszNewClusterName) {
        lpszNewClusterName := lpszNewClusterName is String ? StrPtr(lpszNewClusterName) : lpszNewClusterName

        result := DllCall("CLUSAPI.dll\SetClusterName", "ptr", hCluster, "ptr", lpszNewClusterName, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {PWSTR} lpszNewClusterName 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static SetClusterNameEx(hCluster, lpszNewClusterName, lpszReason) {
        lpszNewClusterName := lpszNewClusterName is String ? StrPtr(lpszNewClusterName) : lpszNewClusterName
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\SetClusterNameEx", "ptr", hCluster, "ptr", lpszNewClusterName, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Retrieves a cluster's name and version.
     * @param {HCLUSTER} hCluster Handle to a cluster.
     * @param {PWSTR} lpszClusterName Pointer to a null-terminated Unicode string containing the name of the cluster identified by 
     *       <i>hCluster</i>.
     * @param {Pointer<UInt32>} lpcchClusterName Pointer to the size of the <i>lpszClusterName</i> buffer as a count of characters. On 
     *       input, specify the maximum number of characters the buffer can hold, including the terminating 
     *       <b>NULL</b>. On output, specifies the number of characters in the resulting name, excluding 
     *       the terminating <b>NULL</b>.
     * @param {Pointer<CLUSTERVERSIONINFO>} lpClusterInfo Either <b>NULL</b> or a pointer to a 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusterversioninfo">CLUSTERVERSIONINFO</a> structure describing the version 
     *       of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-service">Cluster service</a>. When 
     *       <i>lpClusterInfo</i> is not <b>NULL</b>, the 
     *       <b>dwVersionInfoSize</b> member of this structure should be set as follows: 
     *       <c>lpClusterInfo-&gt;dwVersionInfoSize = sizeof(CLUSTERVERSIONINFO);</c>
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b> (0).
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is one of the 
     *        possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpszClusterName</i> is not big enough to hold the result. 
     *         The <i>lpcchClusterName</i> parameter returns the number of characters in the result, 
     *         excluding the terminating <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusterinformation
     * @since windowsserver2008
     */
    static GetClusterInformation(hCluster, lpszClusterName, lpcchClusterName, lpClusterInfo) {
        lpszClusterName := lpszClusterName is String ? StrPtr(lpszClusterName) : lpszClusterName

        result := DllCall("CLUSAPI.dll\GetClusterInformation", "ptr", hCluster, "ptr", lpszClusterName, "uint*", lpcchClusterName, "ptr", lpClusterInfo, "uint")
        return result
    }

    /**
     * Returns the name of a cluster's quorum resource.
     * @param {HCLUSTER} hCluster Handle to an existing <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>.
     * @param {PWSTR} lpszResourceName Pointer to a null-terminated Unicode string containing the name of the cluster's quorum resource. The name is read from the quorum resource's  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources-name">Name</a> common property. Do not pass <b>NULL</b> for this parameter.
     * @param {Pointer<UInt32>} lpcchResourceName Pointer to the size of the <i>lpszResourceName</i> buffer as a count of characters. On input, specify the maximum number of characters the buffer can hold, including the terminating <b>NULL</b>. On output, specifies the number of characters in the resulting name, excluding the terminating <b>NULL</b>.
     * @param {PWSTR} lpszDeviceName Pointer to a null-terminated Unicode string containing the path to the location of the quorum log files maintained by the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-service">Cluster service</a>. Do not pass <b>NULL</b> for this parameter.
     * @param {Pointer<UInt32>} lpcchDeviceName Pointer to the size of the <i>lpszDeviceName</i> buffer as a count of characters. On input, specify the maximum number of characters the buffer can hold, including the terminating <b>NULL</b>. On output, specifies the number of characters in the resulting name, excluding the terminating <b>NULL</b>.
     * @param {Pointer<UInt32>} lpdwMaxQuorumLogSize Pointer to the maximum size (in bytes) of the log being maintained by the quorum resource. Do not pass <b>NULL</b> for this parameter.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is one of the possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpszResourceName</i> or the <i>lpszDeviceName</i> buffer is not big enough to hold the result. The <i>lpcchResourceName</i> and <i>lpcchDeviceName</i> parameters return the number of characters in the result, excluding the terminating <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusterquorumresource
     * @since windowsserver2008
     */
    static GetClusterQuorumResource(hCluster, lpszResourceName, lpcchResourceName, lpszDeviceName, lpcchDeviceName, lpdwMaxQuorumLogSize) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName
        lpszDeviceName := lpszDeviceName is String ? StrPtr(lpszDeviceName) : lpszDeviceName

        result := DllCall("CLUSAPI.dll\GetClusterQuorumResource", "ptr", hCluster, "ptr", lpszResourceName, "uint*", lpcchResourceName, "ptr", lpszDeviceName, "uint*", lpcchDeviceName, "uint*", lpdwMaxQuorumLogSize, "uint")
        return result
    }

    /**
     * Establishes a resource as the quorum resource for a cluster.
     * @param {HRESOURCE} hResource Handle to the new quorum resource; or the existing 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/quorum-resource">quorum resource</a> when 
     *        <i>dwMaxQuoLogSize</i> is 
     *        <b>CLUS_NODE_MAJORITY_QUORUM</b>.
     * @param {PWSTR} lpszDeviceName Determines the drive letter and path that the Cluster service will use to maintain the quorum files on the 
     *        new quorum resource. Pass a null-terminated Unicode string or <b>NULL</b>, as follows.
     * 
     * <ul>
     * <li>If you specify a drive letter in the path, the Cluster service will verify that the drive letter refers 
     *         to a valid partition on the new quorum resource.</li>
     * <li>If you do not specify a drive letter in the path, the Cluster service will use a default partition on the 
     *         new quorum resource (see below).</li>
     * <li>If <b>NULL</b>, the Cluster service will use a default partition and a default path 
     *         name (see below).</li>
     * </ul>
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-service">Cluster service</a> uses the partition flagged as 
     *        <b>CLUSPROP_PIFLAG_DEFAULT_QUORUM</b> as the default partition (see 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_partition_info">CLUSPROP_PARTITION_INFO</a>), or, if the flag 
     *        cannot be found, the first available NTFS partition on the new quorum resource.
     * 
     * For the default path name, the Cluster service uses the previous path name if one exists; otherwise it uses 
     *        "MSCS".
     * @param {Integer} dwMaxQuoLogSize The quorum type value. Specify one of the three constants listed. When you specify <b>CLUS_NODE_MAJORITY_QUORUM</b>, <i> hResource</i> must refer to the existing <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/quorum-resource">quorum resource</a>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b> (0).
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error 
     *        code.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RESOURCE_NOT_ONLINE</b></dt>
     * <dt>5004 (0x138C)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The quorum resource is not online.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-setclusterquorumresource
     * @since windowsserver2008
     */
    static SetClusterQuorumResource(hResource, lpszDeviceName, dwMaxQuoLogSize) {
        lpszDeviceName := lpszDeviceName is String ? StrPtr(lpszDeviceName) : lpszDeviceName

        result := DllCall("CLUSAPI.dll\SetClusterQuorumResource", "ptr", hResource, "ptr", lpszDeviceName, "uint", dwMaxQuoLogSize, "uint")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} hResource 
     * @param {PWSTR} lpszDeviceName 
     * @param {Integer} dwMaxQuorumLogSize 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static SetClusterQuorumResourceEx(hResource, lpszDeviceName, dwMaxQuorumLogSize, lpszReason) {
        lpszDeviceName := lpszDeviceName is String ? StrPtr(lpszDeviceName) : lpszDeviceName
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\SetClusterQuorumResourceEx", "ptr", hResource, "ptr", lpszDeviceName, "uint", dwMaxQuorumLogSize, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Creates a backup of the cluster database and all registry checkpoints.
     * @param {HCLUSTER} hCluster Handle to the cluster to be backed up.
     * @param {PWSTR} lpszPathName Null-terminated Unicode string specifying the path to where the backup should be created. Cluster 
     *       configuration information will be saved to this location; this is sensitive data that should be protected. For 
     *       example, this data can be protected by using an access control list to restrict access to the location where the 
     *       data is stored.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-backupclusterdatabase
     * @since windowsserver2003
     */
    static BackupClusterDatabase(hCluster, lpszPathName) {
        lpszPathName := lpszPathName is String ? StrPtr(lpszPathName) : lpszPathName

        result := DllCall("CLUSAPI.dll\BackupClusterDatabase", "ptr", hCluster, "ptr", lpszPathName, "uint")
        return result
    }

    /**
     * Restores the cluster database and restarts the Cluster service on the node from which the function is called. This node is called the restoring node.
     * @param {PWSTR} lpszPathName Null-terminated Unicode string specifying the path to the backup file. Cluster configuration information is 
     *        contained in this location; this is sensitive data that should be protected. For example, this data can be 
     *        protected by using an access control list to restrict access to the location where the data is stored.
     * @param {BOOL} bForce If <b>FALSE</b>, the restore operation will not be completed if either of the following 
     *        circumstances applies:
     * 
     * <ul>
     * <li>Other nodes are currently active.</li>
     * <li>The partition layout of the current quorum resource is not identical to the partition layout of the 
     *         quorum resource that was in place when the backup was made. (The term "partition layout" 
     *         refers to the number of partitions on the disk and the offsets to each partition. The disk signature and drive 
     *         letter assignments do not have to be identical.)</li>
     * </ul>
     * Setting <i>bForce</i> to <b>TRUE</b> causes the operation to proceed 
     *        regardless of these preceding circumstances; however, the operation may still fail for other reasons.
     * @param {PWSTR} lpszQuorumDriveLetter Optional. Identifies the drive letter of the quorum resource on which the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-database">cluster database</a> will be restored. Use this 
     *        parameter only if the quorum resource has been replaced since the backup was made. The string must be formatted 
     *        as follows:
     * 
     * <ul>
     * <li>The first character must be alphabetic, that is, in the range 'a'-'z' or 'A'-'Z'.</li>
     * <li>The second character must be a colon (':').</li>
     * <li>The third character must be a terminating null ('\0').</li>
     * </ul>
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error 
     *        codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CLUSTER_NODE_UP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed because other cluster nodes are currently active. If you call 
     *          <a href="/previous-versions/windows/desktop/api/clusapi/nf-clusapi-restoreclusterdatabase">RestoreClusterDatabase</a> again with 
     *          <i>bForce</i> set to <b>TRUE</b>, the cluster will attempt to shut down 
     *          the Cluster service on the other active nodes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_QUORUM_DISK_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed because the quorum disk described in the backup does not match the current quorum 
     *          disk. If you call <a href="/previous-versions/windows/desktop/api/clusapi/nf-clusapi-restoreclusterdatabase">RestoreClusterDatabase</a> 
     *          again with <i>bForce</i> set to <b>TRUE</b>, the cluster will attempt 
     *          to change the signature and drive letter of the current quorum disk to the values stored in the backup.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-restoreclusterdatabase
     * @since windowsserver2003
     */
    static RestoreClusterDatabase(lpszPathName, bForce, lpszQuorumDriveLetter) {
        lpszPathName := lpszPathName is String ? StrPtr(lpszPathName) : lpszPathName
        lpszQuorumDriveLetter := lpszQuorumDriveLetter is String ? StrPtr(lpszQuorumDriveLetter) : lpszQuorumDriveLetter

        result := DllCall("CLUSAPI.dll\RestoreClusterDatabase", "ptr", lpszPathName, "ptr", bForce, "ptr", lpszQuorumDriveLetter, "uint")
        return result
    }

    /**
     * Sets the priority order for the set of networks used for internal communication between cluster nodes.
     * @param {HCLUSTER} hCluster Handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a> to be affected.
     * @param {Integer} NetworkCount Number of items in the list specified by the <i>NetworkList</i> parameter.
     * @param {Pointer<HNETWORK>} NetworkList Prioritized array of handles to network objects. The first handle in the array has the highest priority. The 
     *        list must contain only those networks that are used for internal communication between nodes in the cluster, 
     *        and there can be no duplicates.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b> (0).
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error 
     *        codes.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87 (0x57)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was a duplicate network in <i>NetworkList</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-setclusternetworkpriorityorder
     * @since windowsserver2003
     */
    static SetClusterNetworkPriorityOrder(hCluster, NetworkCount, NetworkList) {
        result := DllCall("CLUSAPI.dll\SetClusterNetworkPriorityOrder", "ptr", hCluster, "uint", NetworkCount, "ptr", NetworkList, "uint")
        return result
    }

    /**
     * Changes the password for the Cluster service user account on all available cluster nodes.
     * @param {PWSTR} lpszClusterName <b>NULL</b>-terminated Unicode string specifying the name of the cluster.
     * @param {PWSTR} lpszNewPassword <b>NULL</b>-terminated Unicode string specifying the new password for the Cluster service 
     *        user account.
     * @param {Integer} dwFlags Optional bitfield of values enumerated from the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/cc512182(v=vs.85)">CLUSTER_SET_PASSWORD_FLAGS</a> enumeration 
     *        containing flags that describe how the password update is to be applied to the cluster.
     * 
     * By default (<i>dwFlags</i> = 0), the function will not proceed unless all cluster nodes 
     *        are available.
     * @param {Pointer} lpReturnStatusBuffer Pointer to an output buffer that receives an array of 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-cluster_set_password_status">CLUSTER_SET_PASSWORD_STATUS</a> structures 
     *        describing the result of the password update for each cluster node. If this parameter is not 
     *        <b>NULL</b> and the buffer is not large enough to hold the resulting data, the function 
     *        returns <b>ERROR_MORE_DATA</b> and sets <i>lpcbReturnStatusBufferSize</i> 
     *        to the required size for the output buffer. If this parameter is <b>NULL</b>, no password 
     *        update will be performed; the function will set <i>lpcbReturnStatusBufferSize</i> to the 
     *        required buffer size and return <b>ERROR_SUCCESS</b>.
     * @param {Pointer<UInt32>} lpcbReturnStatusBufferSize On input, pointer to a value specifying the size (in bytes) of the output buffer. On output, pointer to a 
     *        value specifying the actual size (in bytes) of the resulting data. The output size is always specified, even if 
     *        <i>lpReturnStatusBuffer</i> is <b>NULL</b>. This parameter cannot be 
     *        <b>NULL</b>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b> (0).
     * 
     * If the operation fails, the function returns a 
     *       <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error 
     *       codes.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALL_NODES_NOT_AVAILABLE</b></dt>
     * <dt>5037 (0x13AD)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some nodes in the cluster are unavailable (that is, not in the 
     *          <b>ClusterNodeStateUp</b> or <b>ClusterNodeStatePaused</b> states) 
     *          and the <b>CLUSTER_SET_PASSWORD_IGNORE_DOWN_NODES</b> flag is not set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer pointed to by <i>lpReturnStatusBuffer</i> was not large enough to hold 
     *          the resulting data.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-setclusterserviceaccountpassword
     * @since windowsserver2003
     */
    static SetClusterServiceAccountPassword(lpszClusterName, lpszNewPassword, dwFlags, lpReturnStatusBuffer, lpcbReturnStatusBufferSize) {
        lpszClusterName := lpszClusterName is String ? StrPtr(lpszClusterName) : lpszClusterName
        lpszNewPassword := lpszNewPassword is String ? StrPtr(lpszNewPassword) : lpszNewPassword

        result := DllCall("CLUSAPI.dll\SetClusterServiceAccountPassword", "ptr", lpszClusterName, "ptr", lpszNewPassword, "uint", dwFlags, "ptr", lpReturnStatusBuffer, "uint*", lpcbReturnStatusBufferSize, "uint")
        return result
    }

    /**
     * Initiates an operation that affects a cluster.
     * @param {HCLUSTER} hCluster Handle to the cluster to be affected.
     * @param {HNODE} hHostNode If non-<b>NULL</b>, handle to the node to perform the operation represented by the control 
     *        code. If <b>NULL</b>, the local node performs the operation. Specifying 
     *        <i>hHostNode</i> is optional.
     * @param {Integer} dwControlCode A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-control-codes">cluster control code</a> from the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-clusctl_cluster_codes">CLUSCTL_CLUSTER_CODES</a> enumeration that specifies 
     *        the operation to be performed. For the syntax associated with a control code, refer to 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/control-code-architecture">Control Code Architecture</a> and the following 
     *        topics:
     * 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-check-voter-down">CLUSCTL_CLUSTER_CHECK_VOTER_DOWN</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-check-voter-evict">CLUSCTL_CLUSTER_CHECK_VOTER_EVICT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-clear-node-connection-info">CLUSCTL_CLUSTER_CLEAR_NODE_CONNECTION_INFO</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-enum-common-properties">CLUSCTL_CLUSTER_ENUM_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-enum-private-properties">CLUSCTL_CLUSTER_ENUM_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-common-properties">CLUSCTL_CLUSTER_GET_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-fqdn">CLUSCTL_CLUSTER_GET_FQDN</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-common-property-fmts">CLUSCTL_CLUSTER_GET_COMMON_PROPERTY_FMTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-private-properties">CLUSCTL_CLUSTER_GET_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-private-property-fmts">CLUSCTL_CLUSTER_GET_PRIVATE_PROPERTY_FMTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-ro-common-properties">CLUSCTL_CLUSTER_GET_RO_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-ro-private-properties">CLUSCTL_CLUSTER_GET_RO_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-get-shared-volume-id">CLUSCTL_CLUSTER_GET_SHARED_VOLUME_ID</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-set-common-properties">CLUSCTL_CLUSTER_SET_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-set-private-properties">CLUSCTL_CLUSTER_SET_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-shutdown">CLUSCTL_CLUSTER_SHUTDOWN</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-unknown">CLUSCTL_CLUSTER_UNKNOWN</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-validate-common-properties">CLUSCTL_CLUSTER_VALIDATE_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cluster-validate-private-properties">CLUSCTL_CLUSTER_VALIDATE_PRIVATE_PROPERTIES</a>
     * </li>
     * </ul>
     * @param {Pointer} lpInBuffer Pointer to an input buffer containing information needed for the operation, or <b>NULL</b> 
     *        if no information is needed.
     * @param {Integer} nInBufferSize The allocated size (in bytes) of the input buffer.
     * @param {Pointer} lpOutBuffer Pointer to an output buffer to receive the data resulting from the operation, or 
     *        <b>NULL</b> if no data will be returned.
     * @param {Integer} nOutBufferSize The allocated size (in bytes) of the output buffer.
     * @param {Pointer<UInt32>} lpBytesReturned Returns the actual size (in bytes) of the data resulting from the operation. If this information is not 
     *        needed, pass <b>NULL</b> for <i>lpcbBytesReturned</i>.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful. If the operation required an output buffer, 
     *          <i>lpcbBytesReturned</i> (if not <b>NULL</b> on input) points to the 
     *          actual size of the data returned in the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer pointed to by <i>lpOutBuffer</i> was not large enough to hold the data 
     *          resulting from the operation. The <i>lpcbBytesReturned</i> parameter (if not 
     *          <b>NULL</b> on input) points to the size required for the output buffer. Only operations 
     *          requiring an output buffer return <b>ERROR_MORE_DATA</b>. If the 
     *          <i>lpOutBuffer</i> parameter is <b>NULL</b> and the 
     *          <i>nOutBufferSize</i> parameter is zero, then <b>ERROR_SUCCESS</b> may 
     *          be returned, not <b>ERROR_MORE_DATA</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/Debug/system-error-codes">System error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. If the operation required an output buffer, the value specified by 
     *          <i>lpcbBytesReturned</i> (if not <b>NULL</b> on input) is 
     *          unreliable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustercontrol
     * @since windowsserver2008
     */
    static ClusterControl(hCluster, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned) {
        result := DllCall("CLUSAPI.dll\ClusterControl", "ptr", hCluster, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesReturned, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {HNODE} hHostNode 
     * @param {Integer} dwControlCode 
     * @param {Pointer} lpInBuffer 
     * @param {Integer} nInBufferSize 
     * @param {Pointer} lpOutBuffer 
     * @param {Integer} nOutBufferSize 
     * @param {Pointer<UInt32>} lpBytesReturned 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterControlEx(hCluster, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\ClusterControlEx", "ptr", hCluster, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesReturned, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Initiates a rolling upgrade of the operating system on a cluster. PCLUSAPI_CLUSTER_UPGRADE defines a pointer to this function.
     * @param {HCLUSTER} hCluster A handle to the cluster to upgrade.
     * @param {BOOL} perform <b>True</b> to initiate the rolling upgrade; otherwise <b>false</b>.
     * @param {Pointer<PCLUSTER_UPGRADE_PROGRESS_CALLBACK>} pfnProgressCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nc-clusapi-pcluster_upgrade_progress_callback">ClusterUpgradeProgressCallback</a> callback function that retrieves the status of the rolling upgrade.
     * @param {Pointer<Void>} pvCallbackArg A pointer to the arguments for <b>pfnProgressCallback</b>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>. If the operation fails, the function returns a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterupgradefunctionallevel
     * @since windowsserver2016
     */
    static ClusterUpgradeFunctionalLevel(hCluster, perform, pfnProgressCallback, pvCallbackArg) {
        result := DllCall("CLUSAPI.dll\ClusterUpgradeFunctionalLevel", "ptr", hCluster, "ptr", perform, "ptr", pfnProgressCallback, "ptr", pvCallbackArg, "uint")
        return result
    }

    /**
     * Creates or modifies a notification port. For information about notification ports, see Receiving Cluster Events.
     * @param {HCHANGE} hChange A handle to a notification port or <b>INVALID_HANDLE_VALUE</b>, indicating that a new handle 
     *        should be created. If the <i>hChange</i>  parameter is an existing handle, the events that are specified in 
     *        the <i>dwFilter</i> parameter are added to the notification port.
     * @param {HCLUSTER} hCluster A handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a> to be associated with the 
     *        notification port that is  identified by the  <i>hChange</i>    parameter or 
     *        <b>INVALID_HANDLE_VALUE</b>, indicating that the notification port should not be associated 
     *        with a cluster. If the  <i>hChange</i>  parameter  is not set to 
     *        <b>INVALID_HANDLE_VALUE</b>, the <i>hCluster</i>  parameter cannot be set to 
     *        <b>INVALID_HANDLE_VALUE</b>.
     * @param {Pointer<NOTIFY_FILTER_AND_TYPE>} Filters A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ns-clusapi-notify_filter_and_type">NOTIFY_FILTER_AND_TYPE</a> structure that specifies the  type of notifications that the port can accept.
     * @param {Integer} dwFilterCount The number of filters that are  specified by the <i>Filters</i> parameter.
     * @param {Pointer} dwNotifyKey A user-specified value to associate with the retrieval of notifications from the notification port. The 
     *        <i>dwNotifyKey</i>  parameter is returned from 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-getclusternotifyv2">GetClusterNotifyV2</a> when an event of one of the types 
     *        that are    specified in <i>Filters</i> occurs.
     * @returns {HCHANGE} If the operation succeeds, the function returns a notification port handle.
     * 
     * If the operation fails, the 
     *        function returns <b>NULL</b>. For more information about the error, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-createclusternotifyportv2
     * @since windowsserver2012
     */
    static CreateClusterNotifyPortV2(hChange, hCluster, Filters, dwFilterCount, dwNotifyKey) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\CreateClusterNotifyPortV2", "ptr", hChange, "ptr", hCluster, "ptr", Filters, "uint", dwFilterCount, "ptr", dwNotifyKey, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers an event type with a notification port by adding the notification key to the event type.
     * @param {HCHANGE} hChange A handle to a notification port that is created with the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-createclusternotifyportv2">CreateClusterNotifyPortV2</a> function.
     * @param {NOTIFY_FILTER_AND_TYPE} Filter A <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ns-clusapi-notify_filter_and_type">NOTIFY_FILTER_AND_TYPE</a> structure that specifies the event type to create.
     * @param {HANDLE} hObject A handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-objects">failover cluster object</a> 
     *        that is affected by the event as specified in the <i>dwFilterType</i> parameter. The type of handle 
     *       depends on the value of <i>dwFilterType</i>.
     * @param {Pointer} dwNotifyKey The notification key that is returned from the  
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-getclusternotify">GetClusterNotify</a>  function when the requested event 
     *       occurs.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-registerclusternotifyv2
     * @since windowsserver2016
     */
    static RegisterClusterNotifyV2(hChange, Filter, hObject, dwNotifyKey) {
        hObject := hObject is Win32Handle ? NumGet(hObject, "ptr") : hObject

        result := DllCall("CLUSAPI.dll\RegisterClusterNotifyV2", "ptr", hChange, "ptr", Filter, "ptr", hObject, "ptr", dwNotifyKey, "uint")
        return result
    }

    /**
     * Retrieves a handle to a notification event.
     * @param {HCHANGE} hChange A handle to the notification port that received the notification event.
     * @param {Pointer<HANDLE>} lphTargetEvent The handle to the notification event.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>. 
     * 
     * If the operation fails, the function returns a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getnotifyeventhandle
     * @since windowsserver2012
     */
    static GetNotifyEventHandle(hChange, lphTargetEvent) {
        result := DllCall("CLUSAPI.dll\GetNotifyEventHandle", "ptr", hChange, "ptr", lphTargetEvent, "uint")
        return result
    }

    /**
     * Retrieves information about the next notification event for a notification port.
     * @param {HCHANGE} hChange A handle to the notification port. This handle is created by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-createclusternotifyportv2">CreateClusterNotifyPortV2</a> function.
     * @param {Pointer<UIntPtr>} lpdwNotifyKey A pointer to the notification key for the notification port.
     * @param {Pointer<NOTIFY_FILTER_AND_TYPE>} pFilterAndType A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ns-clusapi-notify_filter_and_type">NOTIFY_FILTER_AND_TYPE</a> 
     *       structure that describes the next notification event for the notification port.
     * @param {Pointer} buffer A pointer to a buffer for the notification event.
     * @param {Pointer<UInt32>} lpbBufferSize A pointer to  the size of the <i>buffer</i> parameter, in bytes.
     * @param {PWSTR} lpszObjectId A pointer to a  Unicode string   with  the ID of the 
     *        cluster object that triggered the event. The string ends with a  terminating null character.
     * @param {Pointer<UInt32>} lpcchObjectId On input, a pointer to a <b>DWORD</b> that specifies the maximum number of characters 
     *       that the <i>lpszObjectId</i> parameter can hold, including the terminating null character. On 
     *       output, a pointer to a <b>DWORD</b> that specifies the number of characters that 
     *       <i>lpszObjectId</i> received, excluding the terminating null character.
     * @param {PWSTR} lpszParentId A pointer to a Unicode string with the ID of the parent to the cluster object that triggered the event. The 
     *       string ends with a terminating null character.
     * @param {Pointer<UInt32>} lpcchParentId On input, a pointer to a <b>DWORD</b> that specifies the maximum number of characters 
     *       the <i>lpszParentId</i> parameter can hold, including the terminating null character. On 
     *       output, a pointer to a <b>DWORD</b> that specifies the number of characters that 
     *       <i>lpszParentId</i> received, excluding the terminating null character.
     * @param {PWSTR} lpszName A pointer to a Unicode string that contains the name of the cluster object that triggered the event. The 
     *       string ends with a terminating null character.
     * @param {Pointer<UInt32>} lpcchName On input, a pointer to a <b>DWORD</b> that specifies the maximum number of characters 
     *       that  the <i>lpszName</i> parameter can hold, including the terminating null character. On 
     *       output, a pointer to a <b>DWORD</b> that specifies the number of characters that 
     *       <i>lpszName</i> received, excluding the terminating null character.
     * @param {PWSTR} lpszType A pointer to a  Unicode string that contains the type of  cluster object that triggered the event. The 
     *       string ends with a  terminating null character.
     * @param {Pointer<UInt32>} lpcchType On input, a pointer to a <b>DWORD</b> that specifies the maximum number of characters 
     *       the <i>lpszType</i> parameter can hold, including the terminating null character. On output, 
     *       a pointer to a <b>DWORD</b> that specifies the number of characters that 
     *       <i>lpszType</i> received, excluding the terminating null character.
     * @param {Integer} dwMilliseconds A time-out value that specifies how long the caller is willing to wait for the notification.
     * @returns {Integer} if the operation succeeds,  this function returns  <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, this function returns one of the following 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle that is represented in the <i>hChange</i> parameter is invalid or has been 
     *          closed by another thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_TIMEOUT</b></dt>
     * <dt>258 (0x102)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call timed out before the notification could be successfully returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the  <i>lpszName</i>  parameter is not big enough to hold the 
     *          result. The <i>lpcchName</i> parameter returns the number of characters in the result, 
     *          excluding the terminating null character.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusternotifyv2
     * @since windowsserver2012
     */
    static GetClusterNotifyV2(hChange, lpdwNotifyKey, pFilterAndType, buffer, lpbBufferSize, lpszObjectId, lpcchObjectId, lpszParentId, lpcchParentId, lpszName, lpcchName, lpszType, lpcchType, dwMilliseconds) {
        lpszObjectId := lpszObjectId is String ? StrPtr(lpszObjectId) : lpszObjectId
        lpszParentId := lpszParentId is String ? StrPtr(lpszParentId) : lpszParentId
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName
        lpszType := lpszType is String ? StrPtr(lpszType) : lpszType

        result := DllCall("CLUSAPI.dll\GetClusterNotifyV2", "ptr", hChange, "ptr*", lpdwNotifyKey, "ptr", pFilterAndType, "ptr", buffer, "uint*", lpbBufferSize, "ptr", lpszObjectId, "uint*", lpcchObjectId, "ptr", lpszParentId, "uint*", lpcchParentId, "ptr", lpszName, "uint*", lpcchName, "ptr", lpszType, "uint*", lpcchType, "uint", dwMilliseconds, "uint")
        return result
    }

    /**
     * Creates or modifies a notification port. For information on notification ports, see Receiving Cluster Events.
     * @param {HCHANGE} hChange Handle to a notification port or <b>INVALID_HANDLE_VALUE</b>, indicating that a new handle 
     *        should be created. If <i>hChange</i> is an existing handle, the events specified in 
     *        <i>dwFilter</i> are added to the notification port.
     * @param {HCLUSTER} hCluster Handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a> to be associated with the 
     *        notification port identified by <i>hChange</i>, or 
     *        <b>INVALID_HANDLE_VALUE</b>, indicating that the notification port should not be associated 
     *        with a cluster. If <i>hChange</i> is not set to 
     *        <b>INVALID_HANDLE_VALUE</b>, <i>hCluster</i> cannot be set to 
     *        <b>INVALID_HANDLE_VALUE</b>.
     * @param {Integer} dwFilter Bitmask of flags enumerated from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_change">CLUSTER_CHANGE</a> 
     *        enumeration that specifies the events that will cause notifications to be stored in the queue. One or more of 
     *        the following flags can be set using the OR operator, or you can specify all of the flags by using the value 
     *        <b>CLUSTER_CHANGE_ALL</b>.
     * @param {Pointer} dwNotifyKey A user-specified value to be associated with retrieving notifications from the notification port. The 
     *        <i>dwNotifyKey</i> is returned from 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-getclusternotify">GetClusterNotify</a> when an event of one of the types 
     *        specified in <i>dwFilter</i> occurs.
     * @returns {HCHANGE} If the operation succeeds, the function returns a notification port handle.
     * 
     * If the operation fails, the 
     *        function returns <b>NULL</b>. For more information about the error, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-createclusternotifyport
     * @since windowsserver2008
     */
    static CreateClusterNotifyPort(hChange, hCluster, dwFilter, dwNotifyKey) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\CreateClusterNotifyPort", "ptr", hChange, "ptr", hCluster, "uint", dwFilter, "ptr", dwNotifyKey, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds an event type to the list of events stored for a notification port.
     * @param {HCHANGE} hChange Handle to a notification port created with the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-createclusternotifyport">CreateClusterNotifyPort</a> function.
     * @param {Integer} dwFilterType Bitmask of flags that describes the event to be added to the set of events currently being monitored by the 
     *       notification port. For more information about these event types, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-createclusternotifyport">CreateClusterNotifyPort</a>. The 
     *       <i>dwFilterType</i> parameter can be set to one of the following flags.
     * @param {HANDLE} hObject Handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-objects">failover cluster object</a> 
     *       affected by the event specified in the <i>dwFilterType</i> parameter. The type of handle 
     *       depends on the value of <i>dwFilterType</i> as described in the following list.
     * @param {Pointer} dwNotifyKey Notification key returned from 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-getclusternotify">GetClusterNotify</a> when the requested event 
     *       occurs.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-registerclusternotify
     * @since windowsserver2008
     */
    static RegisterClusterNotify(hChange, dwFilterType, hObject, dwNotifyKey) {
        hObject := hObject is Win32Handle ? NumGet(hObject, "ptr") : hObject

        result := DllCall("CLUSAPI.dll\RegisterClusterNotify", "ptr", hChange, "uint", dwFilterType, "ptr", hObject, "ptr", dwNotifyKey, "uint")
        return result
    }

    /**
     * Information relating to the next notification event that is stored for a notification port.
     * @param {HCHANGE} hChange The handle to a notification port that is created with the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-createclusternotifyport">CreateClusterNotifyPort</a> function.
     * @param {Pointer<UIntPtr>} lpdwNotifyKey A  pointer to the notification key for the port that is  identified by the  <i>hChange</i> parameter.
     * @param {Pointer<UInt32>} lpdwFilterType 
     * @param {PWSTR} lpszName A pointer to a null-terminated Unicode string containing the name of the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-objects">cluster object</a> that triggered the event. The 
     *        following list describes the content of <i>lpszName</i> by event type. Note that 
     *        <b>CLUSTER_CHANGE_REGISTRY_SUBTREE</b> is not included in the table; this event type is 
     *        never handled by <b>GetClusterNotify</b>.
     * @param {Pointer<UInt32>} lpcchName A pointer to the size of the <i>lpszName</i> buffer as a count of characters. On input, 
     *        specify the maximum number of characters that the buffer can hold, including the terminating 
     *        <b>NULL</b>. On output, specifies the number of characters in the resulting name, excluding 
     *        the terminating <b>NULL</b>.
     * @param {Integer} dwMilliseconds Optional time-out value that specifies how long the caller is willing to wait for the notification.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible 
     *        values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle that is represented in the <i>hChange</i> parameter is invalid or has been closed by 
     *          another thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_TIMEOUT</b></dt>
     * <dt>258 (0x102)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call timed out before the notification could be successfully returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the  <i>lpszName</i>   parameter is not big enough to hold the result. The 
     *          <i>lpcchName</i>  parameter returns the number of characters in the result, excluding the 
     *          terminating <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusternotify
     * @since windowsserver2008
     */
    static GetClusterNotify(hChange, lpdwNotifyKey, lpdwFilterType, lpszName, lpcchName, dwMilliseconds) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        result := DllCall("CLUSAPI.dll\GetClusterNotify", "ptr", hChange, "ptr*", lpdwNotifyKey, "uint*", lpdwFilterType, "ptr", lpszName, "uint*", lpcchName, "uint", dwMilliseconds, "uint")
        return result
    }

    /**
     * Closes a notification port established through CreateClusterNotifyPort.
     * @param {HCHANGE} hChange Handle to the notification port to close.
     * @returns {BOOL} This function always returns <b>TRUE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-closeclusternotifyport
     * @since windowsserver2008
     */
    static CloseClusterNotifyPort(hChange) {
        result := DllCall("CLUSAPI.dll\CloseClusterNotifyPort", "ptr", hChange, "ptr")
        return result
    }

    /**
     * Opens an enumerator for iterating through cluster objects in a cluster.
     * @param {HCLUSTER} hCluster A handle to a cluster.
     * @param {Integer} dwType 
     * @returns {HCLUSENUM} If the operation succeeds, <b>ClusterOpenEnum</b> 
     *        returns a handle to a cluster enumerator.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information about the 
     *        error, call the function <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusteropenenum
     * @since windowsserver2008
     */
    static ClusterOpenEnum(hCluster, dwType) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\ClusterOpenEnum", "ptr", hCluster, "uint", dwType, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the number of cluster objects associated with a cluster enumeration handle.
     * @param {HCLUSENUM} hEnum Handle to a cluster enumeration. This handle is obtained from 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusteropenenum">ClusterOpenEnum</a>. A valid handle is required. This 
     *       parameter cannot be NULL.
     * @returns {Integer} <b>ClusterGetEnumCount</b> returns the number of 
     *        objects associated with the enumeration handle.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustergetenumcount
     * @since windowsserver2008
     */
    static ClusterGetEnumCount(hEnum) {
        result := DllCall("CLUSAPI.dll\ClusterGetEnumCount", "ptr", hEnum, "uint")
        return result
    }

    /**
     * Enumerates the cluster objects in a cluster, returning the name of one object with each call.
     * @param {HCLUSENUM} hEnum A cluster enumeration handle returned by the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusteropenenum">ClusterOpenEnum</a> function.
     * @param {Integer} dwIndex The index used to identify the next entry to be enumerated. This parameter should be zero for the first call 
     *        to <b>ClusterEnum</b> and then incremented for subsequent 
     *        calls.
     * @param {Pointer<UInt32>} lpdwType 
     * @param {PWSTR} lpszName A pointer to a null-terminated Unicode string containing the name of the returned object.
     * @param {Pointer<UInt32>} lpcchName A pointer to the size of the <i>lpszName</i> buffer as a count of characters. On input, 
     *        specify the maximum number of characters the buffer can hold, including the terminating 
     *        <b>NULL</b>. On output, specifies the number of characters in the resulting name, excluding 
     *        the terminating <b>NULL</b>.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * <dt>259 (0x103)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more data is available. This value is returned if there are no more objects of the requested type to be 
     *          returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More data is available. This value is returned if the buffer pointed to by 
     *          <i>lpszName</i> is not big enough to hold the result. The 
     *          <i>lpcchName</i> parameter returns the number of characters in the result, excluding the 
     *          terminating <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterenum
     * @since windowsserver2008
     */
    static ClusterEnum(hEnum, dwIndex, lpdwType, lpszName, lpcchName) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        result := DllCall("CLUSAPI.dll\ClusterEnum", "ptr", hEnum, "uint", dwIndex, "uint*", lpdwType, "ptr", lpszName, "uint*", lpcchName, "uint")
        return result
    }

    /**
     * Closes a cluster enumeration handle originally opened by ClusterOpenEnum.
     * @param {HCLUSENUM} hEnum Cluster enumeration handle to close. This is a handle originally returned by the  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusteropenenum">ClusterOpenEnum</a> function.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustercloseenum
     * @since windowsserver2008
     */
    static ClusterCloseEnum(hEnum) {
        result := DllCall("CLUSAPI.dll\ClusterCloseEnum", "ptr", hEnum, "uint")
        return result
    }

    /**
     * Opens a handle to a cluster in order to iterate through its objects.
     * @param {HCLUSTER} hCluster The handle to the cluster.
     * @param {Integer} dwType A bitmask that describes the type of objects to be enumerated. This must be one or more of the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_enum">CLUSTER_ENUM</a> enumeration values.
     * @param {Pointer<Void>} pOptions Options.
     * @returns {HCLUSENUMEX} If the operation succeeds, returns a handle to a cluster enumerator.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information about the 
     *        error, call the function <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusteropenenumex
     * @since windowsserver2008
     */
    static ClusterOpenEnumEx(hCluster, dwType, pOptions) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\ClusterOpenEnumEx", "ptr", hCluster, "uint", dwType, "ptr", pOptions, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the number of cluster objects that are associated with a cluster enumeration handle.
     * @param {HCLUSENUMEX} hClusterEnum The handle to a cluster enumeration. This handle is obtained from the  
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusteropenenumex">ClusterOpenEnumEx</a>    function. A valid handle is required. This 
     *       parameter cannot be NULL.
     * @returns {Integer} The number of 
     *        objects that are associated with the enumeration handle.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustergetenumcountex
     * @since windowsserver2008
     */
    static ClusterGetEnumCountEx(hClusterEnum) {
        result := DllCall("CLUSAPI.dll\ClusterGetEnumCountEx", "ptr", hClusterEnum, "uint")
        return result
    }

    /**
     * Enumerates the objects in a cluster, and then gets the name and properties of the cluster object.
     * @param {HCLUSENUMEX} hClusterEnum A handle to the enumerator that is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusteropenenumex">ClusterOpenEnumEx</a> function.
     * @param {Integer} dwIndex The index that identifies the next cluster object to enumerate. This parameter should be zero for the first call to the  <b>ClusterEnumEx</b>  function and then be  incremented for subsequent calls.
     * @param {Pointer<CLUSTER_ENUM_ITEM>} pItem A pointer that receives the returned cluster object properties.
     * @param {Pointer<UInt32>} cbItem On input, the size of the  <i>pItem</i>   parameter.
     * 
     * On output, either the required size in bytes of the buffer if the buffer is too small, or the number of bytes that are  written into the buffer.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwIndex</i>  parameter is larger than the number of items in the enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer was filled successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterenumex
     * @since windowsserver2008
     */
    static ClusterEnumEx(hClusterEnum, dwIndex, pItem, cbItem) {
        result := DllCall("CLUSAPI.dll\ClusterEnumEx", "ptr", hClusterEnum, "uint", dwIndex, "ptr", pItem, "uint*", cbItem, "uint")
        return result
    }

    /**
     * Closes a handle to an enumeration that was opened by the ClusterOpenEnumEx function.
     * @param {HCLUSENUMEX} hClusterEnum The handle to the cluster enumeration  to close. This is a handle that originally was returned by <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusteropenenumex">ClusterOpenEnumEx</a>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustercloseenumex
     * @since windowsserver2008
     */
    static ClusterCloseEnumEx(hClusterEnum) {
        result := DllCall("CLUSAPI.dll\ClusterCloseEnumEx", "ptr", hClusterEnum, "uint")
        return result
    }

    /**
     * Adds a groupset to a cluster and returns a handle to the newly added groupset.
     * @param {HCLUSTER} hCluster A handle to the target cluster.
     * @param {PWSTR} groupSetName Pointer to a null-terminated Unicode string containing the name of the groupset to be added.
     * @returns {HGROUPSET} If the operation succeeds, 
     * returns a groupset handle.
     * 
     * If the operation fails, 
     * returns <b>NULL</b>. For more information about the error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-createclustergroupset
     * @since windowsserver2016
     */
    static CreateClusterGroupSet(hCluster, groupSetName) {
        groupSetName := groupSetName is String ? StrPtr(groupSetName) : groupSetName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\CreateClusterGroupSet", "ptr", hCluster, "ptr", groupSetName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a handle to the specified groupset.
     * @param {HCLUSTER} hCluster A handle to the cluster containing the collection.
     * @param {PWSTR} lpszGroupSetName The name of the collection to be opened
     * @returns {HGROUPSET} If the operation succeeds, 
     * the function returns a groupset handle.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information about the error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-openclustergroupset
     * @since windowsserver2016
     */
    static OpenClusterGroupSet(hCluster, lpszGroupSetName) {
        lpszGroupSetName := lpszGroupSetName is String ? StrPtr(lpszGroupSetName) : lpszGroupSetName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\OpenClusterGroupSet", "ptr", hCluster, "ptr", lpszGroupSetName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes a groupset handle returned from OpenClusterGroupSet.
     * @param {HGROUPSET} hGroupSet The handle to close
     * @returns {BOOL} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the function  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-closeclustergroupset
     * @since windowsserver2016
     */
    static CloseClusterGroupSet(hGroupSet) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\CloseClusterGroupSet", "ptr", hGroupSet, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Deletes the specified groupset from the cluster.
     * @param {HGROUPSET} hGroupSet A handle to the collection to be deleted
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-deleteclustergroupset
     * @since windowsserver2016
     */
    static DeleteClusterGroupSet(hGroupSet) {
        result := DllCall("CLUSAPI.dll\DeleteClusterGroupSet", "ptr", hGroupSet, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUPSET} hGroupSet 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static DeleteClusterGroupSetEx(hGroupSet, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\DeleteClusterGroupSetEx", "ptr", hGroupSet, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Adds the specified group to a groupset in the cluster.
     * @param {HGROUPSET} hGroupSet The collection to which to add the group
     * @param {HGROUP} hGroup The group to add to the collection
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusteraddgrouptogroupset
     * @since windowsserver2016
     */
    static ClusterAddGroupToGroupSet(hGroupSet, hGroup) {
        result := DllCall("CLUSAPI.dll\ClusterAddGroupToGroupSet", "ptr", hGroupSet, "ptr", hGroup, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUPSET} hGroupSet 
     * @param {HGROUP} hGroup 
     * @param {Integer} faultDomain 
     * @param {Integer} updateDomain 
     * @returns {Integer} 
     */
    static ClusterAddGroupToGroupSetWithDomains(hGroupSet, hGroup, faultDomain, updateDomain) {
        result := DllCall("CLUSAPI.dll\ClusterAddGroupToGroupSetWithDomains", "ptr", hGroupSet, "ptr", hGroup, "uint", faultDomain, "uint", updateDomain, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUPSET} hGroupSet 
     * @param {HGROUP} hGroup 
     * @param {Integer} faultDomain 
     * @param {Integer} updateDomain 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterAddGroupToGroupSetWithDomainsEx(hGroupSet, hGroup, faultDomain, updateDomain, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\ClusterAddGroupToGroupSetWithDomainsEx", "ptr", hGroupSet, "ptr", hGroup, "uint", faultDomain, "uint", updateDomain, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Removes the specified group from the groupset to which it is currently a member.
     * @param {HGROUP} hGroup A handle to the group to remove.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b>  if successful, or if the group was not currently a member of a collection.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterremovegroupfromgroupset
     * @since windowsserver2016
     */
    static ClusterRemoveGroupFromGroupSet(hGroup) {
        result := DllCall("CLUSAPI.dll\ClusterRemoveGroupFromGroupSet", "ptr", hGroup, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} hGroup 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterRemoveGroupFromGroupSetEx(hGroup, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\ClusterRemoveGroupFromGroupSetEx", "ptr", hGroup, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Initiates an operation affecting a groupset.
     * @param {HGROUPSET} hGroupSet Handle to the groupset to be affected.
     * @param {HNODE} hHostNode If non-<b>NULL</b>, handle to the node to perform the operation represented by the control 
     *        code. If <b>NULL</b>, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">node</a> that owns the 
     *        groupset performs the operation. Specifying <i>hHostNode</i> is optional.
     * @param {Integer} dwControlCode A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/collection-control-codes-">Collection Control Code</a> specifying 
     *        the operation to be performed. For the syntax associated with a control code, refer to  
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/control-code-architecture">Control Code Architecture</a> and the following 
     *        topics.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-get-common-properties">CLUSCTL_GROUPSET_GET_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-get-groups">CLUSCTL_GROUPSET_GET_GROUPS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-get-provider-groups">CLUSCTL_GROUPSET_GET_PROVIDER_GROUPS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-get-provider-collections">CLUSCTL_GROUPSET_GET_PROVIDER_COLLECTIONS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-get-ro-common-properties">CLUSCTL_GROUPSET_GET_RO_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-set-common-properties">CLUSCTL_GROUPSET_SET_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-provider-groups">CLUSCTL_GROUP_GET_PROVIDER_GROUPS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-provider-collections">CLUSCTL_GROUP_GET_PROVIDER_COLLECTIONS</a>
     * </li>
     * </ul>
     * @param {Pointer} lpInBuffer Pointer to an input buffer containing information needed for the operation, or <b>NULL</b> 
     *        if no information is needed.
     * @param {Integer} cbInBufferSize The allocated size (in bytes) of the input buffer.
     * @param {Pointer} lpOutBuffer Pointer to an output buffer to receive the data resulting from the operation, or 
     *        <b>NULL</b> if no data will be returned.
     * @param {Integer} cbOutBufferSize The allocated size (in bytes) of the output buffer.
     * @param {Pointer<UInt32>} lpBytesReturned Returns the actual size (in bytes) of the data resulting from the operation. If this information is not 
     *        needed, pass <b>NULL</b> for <i>lpBytesReturned</i>.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful. If the operation required an output buffer, 
     *          <i>lpBytesReturned</i> (if not <b>NULL</b> on input) points to the 
     *          actual size of the data returned in the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer pointed to by <i>lpOutBuffer</i> was not large enough to hold the data 
     *          resulting from the operation. The <i>lpBytesReturned</i> parameter (if not 
     *          <b>NULL</b> on input) points to the size required for the output buffer. Only operations 
     *          requiring an output buffer return <b>ERROR_MORE_DATA</b>. If the 
     *          <i>lpOutBuffer</i> parameter is <b>NULL</b> and the 
     *          <i>nOutBufferSize</i> parameter is zero, then <b>ERROR_SUCCESS</b> may 
     *          be returned, not <b>ERROR_MORE_DATA</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/Debug/system-error-codes">System error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. If the operation required an output buffer, the value specified by 
     *          <i>lpBytesReturned</i> (if not <b>NULL</b> on input) is 
     *          unreliable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustergroupsetcontrol
     * @since windowsserver2016
     */
    static ClusterGroupSetControl(hGroupSet, hHostNode, dwControlCode, lpInBuffer, cbInBufferSize, lpOutBuffer, cbOutBufferSize, lpBytesReturned) {
        result := DllCall("CLUSAPI.dll\ClusterGroupSetControl", "ptr", hGroupSet, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", cbInBufferSize, "ptr", lpOutBuffer, "uint", cbOutBufferSize, "uint*", lpBytesReturned, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUPSET} hGroupSet 
     * @param {HNODE} hHostNode 
     * @param {Integer} dwControlCode 
     * @param {Pointer} lpInBuffer 
     * @param {Integer} cbInBufferSize 
     * @param {Pointer} lpOutBuffer 
     * @param {Integer} cbOutBufferSize 
     * @param {Pointer<UInt32>} lpBytesReturned 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterGroupSetControlEx(hGroupSet, hHostNode, dwControlCode, lpInBuffer, cbInBufferSize, lpOutBuffer, cbOutBufferSize, lpBytesReturned, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\ClusterGroupSetControlEx", "ptr", hGroupSet, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", cbInBufferSize, "ptr", lpOutBuffer, "uint", cbOutBufferSize, "uint*", lpBytesReturned, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Adds a dependency between two cluster groups.
     * @param {HGROUP} hDependentGroup The dependent group
     * @param {HGROUP} hProviderGroup The group <i>hDependentGroup</i> depends on
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-addclustergroupdependency
     * @since windowsserver2016
     */
    static AddClusterGroupDependency(hDependentGroup, hProviderGroup) {
        result := DllCall("CLUSAPI.dll\AddClusterGroupDependency", "ptr", hDependentGroup, "ptr", hProviderGroup, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} hDependentGroup 
     * @param {HGROUP} hProviderGroup 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static AddClusterGroupDependencyEx(hDependentGroup, hProviderGroup, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\AddClusterGroupDependencyEx", "ptr", hDependentGroup, "ptr", hProviderGroup, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Sets the dependency expression for a cluster group.
     * @param {HGROUP} hGroup A handle to the group on which to set the dependency expression.
     * @param {PWSTR} lpszDependencyExpression The dependency expression to set on the group.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-setgroupdependencyexpression
     * @since windowsserver2016
     */
    static SetGroupDependencyExpression(hGroup, lpszDependencyExpression) {
        lpszDependencyExpression := lpszDependencyExpression is String ? StrPtr(lpszDependencyExpression) : lpszDependencyExpression

        result := DllCall("CLUSAPI.dll\SetGroupDependencyExpression", "ptr", hGroup, "ptr", lpszDependencyExpression, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} hGroup 
     * @param {PWSTR} lpszDependencyExpression 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static SetGroupDependencyExpressionEx(hGroup, lpszDependencyExpression, lpszReason) {
        lpszDependencyExpression := lpszDependencyExpression is String ? StrPtr(lpszDependencyExpression) : lpszDependencyExpression
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\SetGroupDependencyExpressionEx", "ptr", hGroup, "ptr", lpszDependencyExpression, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Removes a dependency between two cluster groups.
     * @param {HGROUP} hGroup The dependent group
     * @param {HGROUP} hDependsOn The group <i>hDependentGroup</i> depends on
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-removeclustergroupdependency
     * @since windowsserver2016
     */
    static RemoveClusterGroupDependency(hGroup, hDependsOn) {
        result := DllCall("CLUSAPI.dll\RemoveClusterGroupDependency", "ptr", hGroup, "ptr", hDependsOn, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} hGroup 
     * @param {HGROUP} hDependsOn 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static RemoveClusterGroupDependencyEx(hGroup, hDependsOn, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\RemoveClusterGroupDependencyEx", "ptr", hGroup, "ptr", hDependsOn, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Adds a dependency between two cluster groupsets.
     * @param {HGROUPSET} hDependentGroupSet The dependent collection
     * @param {HGROUPSET} hProviderGroupSet The collection <i>hDependentGroupSet</i> depends on.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-addclustergroupsetdependency
     * @since windowsserver2016
     */
    static AddClusterGroupSetDependency(hDependentGroupSet, hProviderGroupSet) {
        result := DllCall("CLUSAPI.dll\AddClusterGroupSetDependency", "ptr", hDependentGroupSet, "ptr", hProviderGroupSet, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUPSET} hDependentGroupSet 
     * @param {HGROUPSET} hProviderGroupSet 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static AddClusterGroupSetDependencyEx(hDependentGroupSet, hProviderGroupSet, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\AddClusterGroupSetDependencyEx", "ptr", hDependentGroupSet, "ptr", hProviderGroupSet, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Sets the dependency expression for a cluster groupset.
     * @param {HGROUPSET} hGroupSet The collection to receive the dependency expression
     * @param {PWSTR} lpszDependencyExprssion The dependency expression for <i>hCollection</i>
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-setclustergroupsetdependencyexpression
     * @since windowsserver2016
     */
    static SetClusterGroupSetDependencyExpression(hGroupSet, lpszDependencyExprssion) {
        lpszDependencyExprssion := lpszDependencyExprssion is String ? StrPtr(lpszDependencyExprssion) : lpszDependencyExprssion

        result := DllCall("CLUSAPI.dll\SetClusterGroupSetDependencyExpression", "ptr", hGroupSet, "ptr", lpszDependencyExprssion, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUPSET} hGroupSet 
     * @param {PWSTR} lpszDependencyExpression 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static SetClusterGroupSetDependencyExpressionEx(hGroupSet, lpszDependencyExpression, lpszReason) {
        lpszDependencyExpression := lpszDependencyExpression is String ? StrPtr(lpszDependencyExpression) : lpszDependencyExpression
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\SetClusterGroupSetDependencyExpressionEx", "ptr", hGroupSet, "ptr", lpszDependencyExpression, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Removes a groupset from a groupset's dependency expression.
     * @param {HGROUPSET} hGroupSet The groupset from which to remove the dependency.
     * @param {HGROUPSET} hDependsOn The collection to remove
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-removeclustergroupsetdependency
     * @since windowsserver2016
     */
    static RemoveClusterGroupSetDependency(hGroupSet, hDependsOn) {
        result := DllCall("CLUSAPI.dll\RemoveClusterGroupSetDependency", "ptr", hGroupSet, "ptr", hDependsOn, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUPSET} hGroupSet 
     * @param {HGROUPSET} hDependsOn 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static RemoveClusterGroupSetDependencyEx(hGroupSet, hDependsOn, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\RemoveClusterGroupSetDependencyEx", "ptr", hGroupSet, "ptr", hDependsOn, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Adds a dependency between a cluster group and a cluster groupset.
     * @param {HGROUP} hDependentGroup The dependent group
     * @param {HGROUPSET} hProviderGroupSet The collection <i>hDependentGroup</i> depends on
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-addclustergrouptogroupsetdependency
     * @since windowsserver2016
     */
    static AddClusterGroupToGroupSetDependency(hDependentGroup, hProviderGroupSet) {
        result := DllCall("CLUSAPI.dll\AddClusterGroupToGroupSetDependency", "ptr", hDependentGroup, "ptr", hProviderGroupSet, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} hDependentGroup 
     * @param {HGROUPSET} hProviderGroupSet 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static AddClusterGroupToGroupSetDependencyEx(hDependentGroup, hProviderGroupSet, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\AddClusterGroupToGroupSetDependencyEx", "ptr", hDependentGroup, "ptr", hProviderGroupSet, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Removes a groupset from a group's dependency expression.
     * @param {HGROUP} hGroup The group from which to remove the dependency.
     * @param {HGROUPSET} hDependsOn The groupset to remove.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-removeclustergrouptogroupsetdependency
     * @since windowsserver2016
     */
    static RemoveClusterGroupToGroupSetDependency(hGroup, hDependsOn) {
        result := DllCall("CLUSAPI.dll\RemoveClusterGroupToGroupSetDependency", "ptr", hGroup, "ptr", hDependsOn, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} hGroup 
     * @param {HGROUPSET} hDependsOn 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static RemoveClusterGroupToGroupSetDependencyEx(hGroup, hDependsOn, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\RemoveClusterGroupToGroupSetDependencyEx", "ptr", hGroup, "ptr", hDependsOn, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Starts the enumeration of groupset for a cluster.
     * @param {HCLUSTER} hCluster A handle to the cluster containing the groupset.
     * @returns {HGROUPSETENUM} If successful, returns a handle suitable for use with <a href="/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clustergroupsetenum">ClusterGroupSetEnum</a>
     * 
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information about the error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustergroupsetopenenum
     * @since windowsserver2016
     */
    static ClusterGroupSetOpenEnum(hCluster) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\ClusterGroupSetOpenEnum", "ptr", hCluster, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Gets the number of items contained the enumerator's collection.
     * @param {HGROUPSETENUM} hGroupSetEnum A handle to an enumerator returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clustergroupsetopenenum">ClusterGroupSetOpenEnum</a>.
     * @returns {Integer} The number of items in the enumerator's collection. May be zero.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustergroupsetgetenumcount
     * @since windowsserver2016
     */
    static ClusterGroupSetGetEnumCount(hGroupSetEnum) {
        result := DllCall("CLUSAPI.dll\ClusterGroupSetGetEnumCount", "ptr", hGroupSetEnum, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUPSETENUM} hGroupSetEnum 
     * @param {Integer} dwIndex 
     * @param {PWSTR} lpszName 
     * @param {Pointer<UInt32>} lpcchName 
     * @returns {Integer} 
     * @since windowsserver2016
     */
    static ClusterGroupSetEnum(hGroupSetEnum, dwIndex, lpszName, lpcchName) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        result := DllCall("CLUSAPI.dll\ClusterGroupSetEnum", "ptr", hGroupSetEnum, "uint", dwIndex, "ptr", lpszName, "uint*", lpcchName, "uint")
        return result
    }

    /**
     * Closes an open enumeration for a groupset.
     * @param {HGROUPSETENUM} hGroupSetEnum The enumeration to be closed.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustergroupsetcloseenum
     * @since windowsserver2016
     */
    static ClusterGroupSetCloseEnum(hGroupSetEnum) {
        result := DllCall("CLUSAPI.dll\ClusterGroupSetCloseEnum", "ptr", hGroupSetEnum, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUPSET} hDependentGroupSet 
     * @param {PWSTR} lpRemoteClusterName 
     * @param {PWSTR} lpRemoteGroupSetName 
     * @returns {Integer} 
     */
    static AddCrossClusterGroupSetDependency(hDependentGroupSet, lpRemoteClusterName, lpRemoteGroupSetName) {
        lpRemoteClusterName := lpRemoteClusterName is String ? StrPtr(lpRemoteClusterName) : lpRemoteClusterName
        lpRemoteGroupSetName := lpRemoteGroupSetName is String ? StrPtr(lpRemoteGroupSetName) : lpRemoteGroupSetName

        result := DllCall("CLUSAPI.dll\AddCrossClusterGroupSetDependency", "ptr", hDependentGroupSet, "ptr", lpRemoteClusterName, "ptr", lpRemoteGroupSetName, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUPSET} hDependentGroupSet 
     * @param {PWSTR} lpRemoteClusterName 
     * @param {PWSTR} lpRemoteGroupSetName 
     * @returns {Integer} 
     */
    static RemoveCrossClusterGroupSetDependency(hDependentGroupSet, lpRemoteClusterName, lpRemoteGroupSetName) {
        lpRemoteClusterName := lpRemoteClusterName is String ? StrPtr(lpRemoteClusterName) : lpRemoteClusterName
        lpRemoteGroupSetName := lpRemoteGroupSetName is String ? StrPtr(lpRemoteGroupSetName) : lpRemoteGroupSetName

        result := DllCall("CLUSAPI.dll\RemoveCrossClusterGroupSetDependency", "ptr", hDependentGroupSet, "ptr", lpRemoteClusterName, "ptr", lpRemoteGroupSetName, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {PWSTR} lpAvailabilitySetName 
     * @param {Pointer<CLUSTER_AVAILABILITY_SET_CONFIG>} pAvailabilitySetConfig 
     * @returns {HGROUPSET} 
     */
    static CreateClusterAvailabilitySet(hCluster, lpAvailabilitySetName, pAvailabilitySetConfig) {
        lpAvailabilitySetName := lpAvailabilitySetName is String ? StrPtr(lpAvailabilitySetName) : lpAvailabilitySetName

        result := DllCall("CLUSAPI.dll\CreateClusterAvailabilitySet", "ptr", hCluster, "ptr", lpAvailabilitySetName, "ptr", pAvailabilitySetConfig, "ptr")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {PWSTR} lpszNodeNameCurrent 
     * @param {PWSTR} lpszNodeNameNew 
     * @returns {Integer} 
     */
    static ClusterNodeReplacement(hCluster, lpszNodeNameCurrent, lpszNodeNameNew) {
        lpszNodeNameCurrent := lpszNodeNameCurrent is String ? StrPtr(lpszNodeNameCurrent) : lpszNodeNameCurrent
        lpszNodeNameNew := lpszNodeNameNew is String ? StrPtr(lpszNodeNameNew) : lpszNodeNameNew

        result := DllCall("CLUSAPI.dll\ClusterNodeReplacement", "ptr", hCluster, "ptr", lpszNodeNameCurrent, "ptr", lpszNodeNameNew, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {PWSTR} ruleName 
     * @param {Integer} ruleType 
     * @returns {Integer} 
     */
    static ClusterCreateAffinityRule(hCluster, ruleName, ruleType) {
        ruleName := ruleName is String ? StrPtr(ruleName) : ruleName

        result := DllCall("CLUSAPI.dll\ClusterCreateAffinityRule", "ptr", hCluster, "ptr", ruleName, "int", ruleType, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {PWSTR} ruleName 
     * @returns {Integer} 
     */
    static ClusterRemoveAffinityRule(hCluster, ruleName) {
        ruleName := ruleName is String ? StrPtr(ruleName) : ruleName

        result := DllCall("CLUSAPI.dll\ClusterRemoveAffinityRule", "ptr", hCluster, "ptr", ruleName, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {PWSTR} ruleName 
     * @param {HGROUP} hGroup 
     * @returns {Integer} 
     */
    static ClusterAddGroupToAffinityRule(hCluster, ruleName, hGroup) {
        ruleName := ruleName is String ? StrPtr(ruleName) : ruleName

        result := DllCall("CLUSAPI.dll\ClusterAddGroupToAffinityRule", "ptr", hCluster, "ptr", ruleName, "ptr", hGroup, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {PWSTR} ruleName 
     * @param {HGROUP} hGroup 
     * @returns {Integer} 
     */
    static ClusterRemoveGroupFromAffinityRule(hCluster, ruleName, hGroup) {
        ruleName := ruleName is String ? StrPtr(ruleName) : ruleName

        result := DllCall("CLUSAPI.dll\ClusterRemoveGroupFromAffinityRule", "ptr", hCluster, "ptr", ruleName, "ptr", hGroup, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {PWSTR} affinityRuleName 
     * @param {HNODE} hHostNode 
     * @param {Integer} dwControlCode 
     * @param {Pointer} lpInBuffer 
     * @param {Integer} cbInBufferSize 
     * @param {Pointer} lpOutBuffer 
     * @param {Integer} cbOutBufferSize 
     * @param {Pointer<UInt32>} lpBytesReturned 
     * @returns {Integer} 
     */
    static ClusterAffinityRuleControl(hCluster, affinityRuleName, hHostNode, dwControlCode, lpInBuffer, cbInBufferSize, lpOutBuffer, cbOutBufferSize, lpBytesReturned) {
        affinityRuleName := affinityRuleName is String ? StrPtr(affinityRuleName) : affinityRuleName

        result := DllCall("CLUSAPI.dll\ClusterAffinityRuleControl", "ptr", hCluster, "ptr", affinityRuleName, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", cbInBufferSize, "ptr", lpOutBuffer, "uint", cbOutBufferSize, "uint*", lpBytesReturned, "uint")
        return result
    }

    /**
     * Opens a node and returns a handle to it.
     * @param {HCLUSTER} hCluster Handle to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a> returned from the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-opencluster">OpenCluster</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-openclusterex">OpenClusterEx</a> functions.
     * @param {PWSTR} lpszNodeName Pointer to the NetBIOS name of an existing node. If the DNS name of the node is used, the 
     *       <b>OpenClusterNode</b> function will fail and 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return 
     *       <b>ERROR_CLUSTER_NODE_NOT_FOUND</b>.
     * @returns {HNODE} If the operation was successful, <b>OpenClusterNode</b> 
     *        returns a node handle.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the function 
     *       <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-openclusternode
     * @since windowsserver2008
     */
    static OpenClusterNode(hCluster, lpszNodeName) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\OpenClusterNode", "ptr", hCluster, "ptr", lpszNodeName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a node and returns a handle to it.
     * @param {HCLUSTER} hCluster Handle to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a> returned from the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-opencluster">OpenCluster</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-openclusterex">OpenClusterEx</a> functions.
     * @param {PWSTR} lpszNodeName Pointer to the NetBIOS name of an existing node. If the DNS name of the node is used, the 
     *       <b>OpenClusterNodeEx</b> function will fail and 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return 
     *       <b>ERROR_CLUSTER_NODE_NOT_FOUND</b>.
     * @param {Integer} dwDesiredAccess The requested access privileges. This may be any combination of <b>GENERIC_READ</b> 
     *       (0x80000000), <b>GENERIC_ALL</b> (0x10000000), or <b>MAXIMUM_ALLOWED</b> 
     *       (0x02000000). If this value is zero (0) and undefined error may be returned. Using 
     *       <b>GENERIC_ALL</b> is the same as calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-openclusternode">OpenClusterNode</a>.
     * @param {Pointer<UInt32>} lpdwGrantedAccess Optional parameter that contains the address of a <b>DWORD</b> that will receive the 
     *       access rights granted. If the <i>DesiredAccess</i> parameter is 
     *       <b>MAXIMUM_ALLOWED</b> (0x02000000) then the <b>DWORD</b> pointed to by 
     *       this parameter will contain the maximum privileges granted to this user.
     * @returns {HNODE} If the operation was successful, 
     *       <b>OpenClusterNodeEx</b> returns a node handle.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the 
     *         <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. If the target server does not 
     *         support the <a href="/windows/desktop/api/clusapi/nf-clusapi-openclusternodeex">OpenClusterNodeEx</a> function (for 
     *         example if the target server is running Windows Server 2008 or earlier) then the 
     *         <b>GetLastError</b> function will return 
     *         <b>RPC_S_PROCNUM_OUT_OF_RANGE</b> (1745).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-openclusternodeex
     * @since windowsserver2008
     */
    static OpenClusterNodeEx(hCluster, lpszNodeName, dwDesiredAccess, lpdwGrantedAccess) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\OpenClusterNodeEx", "ptr", hCluster, "ptr", lpszNodeName, "uint", dwDesiredAccess, "uint*", lpdwGrantedAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {Integer} nodeId 
     * @returns {HNODE} 
     */
    static OpenClusterNodeById(hCluster, nodeId) {
        result := DllCall("CLUSAPI.dll\OpenClusterNodeById", "ptr", hCluster, "uint", nodeId, "ptr")
        return result
    }

    /**
     * Closes a node handle.
     * @param {HNODE} hNode Handle to an existing node.
     * @returns {BOOL} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the function  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-closeclusternode
     * @since windowsserver2008
     */
    static CloseClusterNode(hNode) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\CloseClusterNode", "ptr", hNode, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the current state of a node.
     * @param {HNODE} hNode Handle to the node for which state information should be returned.
     * @returns {Integer} <b>GetClusterNodeState</b> returns the current state 
     *        of the node, which is represented by one of the following values.
     * 
     * 
     * The returned values are from the 
     *        <a href="/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_node_state">CLUSTER_NODE_STATE</a> enumeration.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterNodeUp</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The node is physically plugged in, turned on, booted, and capable of executing programs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterNodeDown</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The node is turned off or not operational.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterNodeJoining</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The node is in the process of joining a 
     *         <a href="/previous-versions/windows/desktop/mscs/c-gly">cluster</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterNodePaused</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The node is running but not participating in cluster operations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterNodeStateUnknown</b></dt>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the function 
     *         <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusternodestate
     * @since windowsserver2008
     */
    static GetClusterNodeState(hNode) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterNodeState", "ptr", hNode, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the unique identifier of a cluster node.
     * @param {HNODE} hNode Handle to the node with the identifier to be returned or <b>NULL</b>. If 
     *        <i>hNode</i> is set to <b>NULL</b>, the node identifier for the node on 
     *        which the application is running is returned in the content of <i>lpszNodeId</i>.
     * @param {PWSTR} lpszNodeId This parameter points to a buffer that receives the unique ID of <i>hNode</i>, including 
     *        the terminating <b>NULL</b> character.
     * @param {Pointer<UInt32>} lpcchName On input, pointer to the count of characters in the buffer pointed to by the 
     *        <i>lpszNodeId</i> parameter, including the <b>NULL</b> terminator. On 
     *        output, pointer to the count of characters stored in the buffer excluding the <b>NULL</b> 
     *        terminator.
     * @returns {Integer} This function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are the 
     *        possible values:
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More data is available. This value is returned if the buffer pointed to by 
     *          <i>lpszNodeId</i> is not long enough to hold the required number of characters. 
     *          <a href="/windows/desktop/api/clusapi/nf-clusapi-getclusternodeid">GetClusterNodeId</a> sets the content of 
     *          <i>lpcchName</i> to the required length.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusternodeid
     * @since windowsserver2008
     */
    static GetClusterNodeId(hNode, lpszNodeId, lpcchName) {
        lpszNodeId := lpszNodeId is String ? StrPtr(lpszNodeId) : lpszNodeId

        result := DllCall("CLUSAPI.dll\GetClusterNodeId", "ptr", hNode, "ptr", lpszNodeId, "uint*", lpcchName, "uint")
        return result
    }

    /**
     * Returns a handle to the cluster associated with a node.
     * @param {HNODE} hNode Handle to the node.
     * @returns {HCLUSTER} If the operation succeeds, the function returns a handle to the cluster that owns the node.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information about the error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusterfromnode
     * @since windowsserver2008
     */
    static GetClusterFromNode(hNode) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterFromNode", "ptr", hNode, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Requests that a node temporarily suspend its cluster activity. The PCLUSAPI_PAUSE_CLUSTER_NODE type defines a pointer to this function.
     * @param {HNODE} hNode Handle to the node to suspend activity.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-pauseclusternode
     * @since windowsserver2008
     */
    static PauseClusterNode(hNode) {
        result := DllCall("CLUSAPI.dll\PauseClusterNode", "ptr", hNode, "uint")
        return result
    }

    /**
     * Requests that a paused node resume its cluster activity. The PCLUSAPI_RESUME_CLUSTER_NODE type defines a pointer to this function.
     * @param {HNODE} hNode Handle to the paused node.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-resumeclusternode
     * @since windowsserver2008
     */
    static ResumeClusterNode(hNode) {
        result := DllCall("CLUSAPI.dll\ResumeClusterNode", "ptr", hNode, "uint")
        return result
    }

    /**
     * Deletes a node from the cluster database.
     * @param {HNODE} hNode Handle to the node to delete.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-evictclusternode
     * @since windowsserver2008
     */
    static EvictClusterNode(hNode) {
        result := DllCall("CLUSAPI.dll\EvictClusterNode", "ptr", hNode, "uint")
        return result
    }

    /**
     * Opens an enumerator for iterating through the installed network interfaces.
     * @param {HCLUSTER} hCluster Handle to a cluster
     * @param {PWSTR} lpszNodeName The name of the node.
     * @param {PWSTR} lpszNetworkName The name of the network.
     * @returns {HNETINTERFACEENUM} If the operation succeeds, returns a handle to an 
     *        enumerator.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information about the 
     *        error, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternetinterfaceopenenum
     * @since windowsserver2016
     */
    static ClusterNetInterfaceOpenEnum(hCluster, lpszNodeName, lpszNetworkName) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName
        lpszNetworkName := lpszNetworkName is String ? StrPtr(lpszNetworkName) : lpszNetworkName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\ClusterNetInterfaceOpenEnum", "ptr", hCluster, "ptr", lpszNodeName, "ptr", lpszNetworkName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the network interfaces installed on a cluster, returning one name with each call.
     * @param {HNETINTERFACEENUM} hNetInterfaceEnum Handle to an existing enumeration object originally returned by the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusternetinterfaceopenenum">ClusterNetInterfaceOpenEnum</a> function.
     * @param {Integer} dwIndex Index used to identify the entry to be enumerated. This parameter should be zero for the first call and then incremented for each subsequent 
     *        call.
     * @param {PWSTR} lpszName Pointer to a null-terminated Unicode string containing the name of the returned object.
     * @param {Pointer<UInt32>} lpcchName Pointer to the size, in characters, of the <i>lpszName</i> buffer. On input, 
     *        specify the maximum number of characters the buffer can hold, including the terminating 
     *        <b>NULL</b>. On output, indicates the number of characters in the resulting name, excluding 
     *        the terminating <b>NULL</b>.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * <dt>259 (0x103)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more data is available. This value is returned if there are no more objects to be 
     *          returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More data is available. This value is returned if the buffer pointed to by 
     *          <i>lpszName</i> is not big enough to hold the result. The 
     *          <i>lpcchName</i> parameter returns the number of characters in the result, excluding the 
     *          terminating <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternetinterfaceenum
     * @since windowsserver2016
     */
    static ClusterNetInterfaceEnum(hNetInterfaceEnum, dwIndex, lpszName, lpcchName) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        result := DllCall("CLUSAPI.dll\ClusterNetInterfaceEnum", "ptr", hNetInterfaceEnum, "uint", dwIndex, "ptr", lpszName, "uint*", lpcchName, "uint")
        return result
    }

    /**
     * Closes a network interface enumeration handle.
     * @param {HNETINTERFACEENUM} hNetInterfaceEnum Handle to the node enumerator to close. This is a handle originally returned by the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusternetinterfaceopenenum">ClusterNetInterfaceOpenEnum</a> function.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     *      If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternetinterfacecloseenum
     * @since windowsserver2016
     */
    static ClusterNetInterfaceCloseEnum(hNetInterfaceEnum) {
        result := DllCall("CLUSAPI.dll\ClusterNetInterfaceCloseEnum", "ptr", hNetInterfaceEnum, "uint")
        return result
    }

    /**
     * Opens an enumerator for iterating through the network interfaces or groups installed on a node.
     * @param {HNODE} hNode Handle to a node.
     * @param {Integer} dwType Bitmask describing the type of objects to be enumerated. The following values of the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_node_enum">CLUSTER_NODE_ENUM</a> enumeration are valid.
     * @returns {HNODEENUM} If the operation succeeds, 
     *        <b>ClusterNodeOpenEnum</b> returns a handle to a node 
     *        enumerator.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information about the 
     *        error, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternodeopenenum
     * @since windowsserver2008
     */
    static ClusterNodeOpenEnum(hNode, dwType) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\ClusterNodeOpenEnum", "ptr", hNode, "uint", dwType, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens an enumerator that can iterate through the network interfaces or groups that are installed on a node.
     * @param {HNODE} hNode A handle to the  node.
     * @param {Integer} dwType A bitmask that describes the type of objects to enumerate. This parameter  is retrieved from a 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_node_enum">CLUSTER_NODE_ENUM</a> enumeration value.
     * @param {Pointer<Void>} pOptions Options.
     * @returns {HNODEENUMEX} If the operation succeeds, 
     *        the <b>ClusterNodeOpenEnumEx</b>  function  returns a handle to a node 
     *        enumerator.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information about the 
     *        error, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternodeopenenumex
     * @since windowsserver2008
     */
    static ClusterNodeOpenEnumEx(hNode, dwType, pOptions) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\ClusterNodeOpenEnumEx", "ptr", hNode, "uint", dwType, "ptr", pOptions, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the number of cluster objects that are associated with a node enumeration handle.
     * @param {HNODEENUMEX} hNodeEnum The handle to a node enumeration that was retrieved by the   <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusternodeopenenumex">ClusterNodeOpenEnumEx</a> function. A valid handle is required. This parameter cannot be <b>NULL</b>.
     * @returns {Integer} The number of objects that are associated with the enumeration handle.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternodegetenumcountex
     * @since windowsserver2008
     */
    static ClusterNodeGetEnumCountEx(hNodeEnum) {
        result := DllCall("CLUSAPI.dll\ClusterNodeGetEnumCountEx", "ptr", hNodeEnum, "uint")
        return result
    }

    /**
     * Retrieves the specified cluster node from a CLUSTER_ENUM_ITEM enumeration.
     * @param {HNODEENUMEX} hNodeEnum A handle to the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ns-clusapi-cluster_enum_item">CLUSTER_ENUM_ITEM</a> enumeration that contains the cluster node to retrieve.
     * @param {Integer} dwIndex The index that identifies the next object to enumerate. This parameter should be zero for the first call to the  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterenumex">ClusterEnumEx</a>  function and then be incremented for subsequent calls.
     * @param {Pointer<CLUSTER_ENUM_ITEM>} pItem A pointer that receives the returned cluster node.
     * @param {Pointer<UInt32>} cbItem On input, the size of the  <i>pItem</i>    parameter.
     * 
     * On output, either the required size in bytes of the buffer if the buffer is too small, or the number of bytes written into the buffer.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwIndex</i> is larger than the number of items in the enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer was filled successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternodeenumex
     * @since windowsserver2008
     */
    static ClusterNodeEnumEx(hNodeEnum, dwIndex, pItem, cbItem) {
        result := DllCall("CLUSAPI.dll\ClusterNodeEnumEx", "ptr", hNodeEnum, "uint", dwIndex, "ptr", pItem, "uint*", cbItem, "uint")
        return result
    }

    /**
     * Closes a node enumeration handle.
     * @param {HNODEENUMEX} hNodeEnum The handle to the node enumeration  to close. This handle is returned by the  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusternodeopenenumex">ClusterNodeOpenEnumEx</a> function.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     *      If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternodecloseenumex
     * @since windowsserver2008
     */
    static ClusterNodeCloseEnumEx(hNodeEnum) {
        result := DllCall("CLUSAPI.dll\ClusterNodeCloseEnumEx", "ptr", hNodeEnum, "uint")
        return result
    }

    /**
     * Returns the number of cluster objects associated with a node enumeration handle.
     * @param {HNODEENUM} hNodeEnum Handle to a node enumeration. This handle is obtained from  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusternodeopenenum">ClusterNodeOpenEnum</a>. A valid handle is required. This parameter cannot be <b>NULL</b>.
     * @returns {Integer} <b>ClusterNodeGetEnumCount</b> returns the number of objects associated with the enumeration handle.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternodegetenumcount
     * @since windowsserver2008
     */
    static ClusterNodeGetEnumCount(hNodeEnum) {
        result := DllCall("CLUSAPI.dll\ClusterNodeGetEnumCount", "ptr", hNodeEnum, "uint")
        return result
    }

    /**
     * Closes a node enumeration handle.
     * @param {HNODEENUM} hNodeEnum Handle to the node enumerator to close. This is a handle originally returned by the  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusternodeopenenum">ClusterNodeOpenEnum</a> function.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     *      If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternodecloseenum
     * @since windowsserver2008
     */
    static ClusterNodeCloseEnum(hNodeEnum) {
        result := DllCall("CLUSAPI.dll\ClusterNodeCloseEnum", "ptr", hNodeEnum, "uint")
        return result
    }

    /**
     * Enumerates the network interfaces or groups installed on a node, returning the name of each with each call.
     * @param {HNODEENUM} hNodeEnum Handle to an existing enumeration object originally returned by the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusternodeopenenum">ClusterNodeOpenEnum</a> function.
     * @param {Integer} dwIndex Index used to identify the next entry to be enumerated. This parameter should be zero for the first call to 
     *        <b>ClusterNodeEnum</b> and then incremented for subsequent 
     *        calls.
     * @param {Pointer<UInt32>} lpdwType Pointer to the type of object returned. The following value of the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_node_enum">CLUSTER_NODE_ENUM</a> enumeration is returned with each 
     *        call.
     * @param {PWSTR} lpszName Pointer to a null-terminated Unicode string containing the name of the returned object.
     * @param {Pointer<UInt32>} lpcchName Pointer to the size of the <i>lpszName</i> buffer as a count of characters. On input, 
     *        specify the maximum number of characters the buffer can hold, including the terminating 
     *        <b>NULL</b>. On output, specifies the number of characters in the resulting name, excluding 
     *        the terminating <b>NULL</b>.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * <dt>259 (0x103)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more data is available. This value is returned if there are no more objects of the requested type to be 
     *          returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More data is available. This value is returned if the buffer pointed to by 
     *          <i>lpszName</i> is not big enough to hold the result. The 
     *          <i>lpcchName</i> parameter returns the number of characters in the result, excluding the 
     *          terminating <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternodeenum
     * @since windowsserver2008
     */
    static ClusterNodeEnum(hNodeEnum, dwIndex, lpdwType, lpszName, lpcchName) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        result := DllCall("CLUSAPI.dll\ClusterNodeEnum", "ptr", hNodeEnum, "uint", dwIndex, "uint*", lpdwType, "ptr", lpszName, "uint*", lpcchName, "uint")
        return result
    }

    /**
     * Evicts a node from the cluster and initiates cleanup operations on the node.
     * @param {HNODE} hNode Handle to the node to remove from the cluster.
     * @param {Integer} dwTimeOut Specifies the number of milliseconds for the function to wait for cleanup operations to occur. The function 
     *       will return when the cleanup is complete or when the specified time elapses, whichever is sooner.
     * @param {Pointer<HRESULT>} phrCleanupStatus Pointer to an <b>HRESULT</b>   that describes the results of the cleanup operation.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *       <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, including the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CLUSTER_EVICT_WITHOUT_CLEANUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The node was evicted but the cleanup operation returned a value other than S_OK.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-evictclusternodeex
     * @since windowsserver2008
     */
    static EvictClusterNodeEx(hNode, dwTimeOut, phrCleanupStatus) {
        result := DllCall("CLUSAPI.dll\EvictClusterNodeEx", "ptr", hNode, "uint", dwTimeOut, "ptr", phrCleanupStatus, "uint")
        return result
    }

    /**
     * 
     * @param {HNODE} hNode 
     * @param {Integer} dwTimeout 
     * @param {Pointer<HRESULT>} phrCleanupStatus 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static EvictClusterNodeEx2(hNode, dwTimeout, phrCleanupStatus, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\EvictClusterNodeEx2", "ptr", hNode, "uint", dwTimeout, "ptr", phrCleanupStatus, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Opens the root of the cluster database subtree for a resource type.
     * @param {HCLUSTER} hCluster Handle to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>.
     * @param {PWSTR} lpszTypeName Pointer to a NULL-terminated Unicode string specifying the name of a resource type (the registered type name, not the display name).
     * @param {Integer} samDesired Access mask that describes the security access needed for the opened key.
     * @returns {HKEY} If the operation succeeds, the function returns a registry key handle for the resource type.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information about the error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusterresourcetypekey
     * @since windowsserver2008
     */
    static GetClusterResourceTypeKey(hCluster, lpszTypeName, samDesired) {
        lpszTypeName := lpszTypeName is String ? StrPtr(lpszTypeName) : lpszTypeName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterResourceTypeKey", "ptr", hCluster, "ptr", lpszTypeName, "uint", samDesired, "ptr")
        if(A_LastError)
            throw OSError()

        return HKEY({Value: result}, True)
    }

    /**
     * Adds a group to a cluster and returns a handle to the newly added group.
     * @param {HCLUSTER} hCluster Handle to the target cluster.
     * @param {PWSTR} lpszGroupName Pointer to a null-terminated Unicode string containing the name of the group to be added to the cluster identified by <i>hCluster</i>. If there is not a group by this name,  <b>CreateClusterGroup</b> creates it.
     * @returns {HGROUP} If the operation succeeds, 
     * the function returns a group handle.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information about the error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-createclustergroup
     * @since windowsserver2008
     */
    static CreateClusterGroup(hCluster, lpszGroupName) {
        lpszGroupName := lpszGroupName is String ? StrPtr(lpszGroupName) : lpszGroupName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\CreateClusterGroup", "ptr", hCluster, "ptr", lpszGroupName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a failover cluster group and returns a handle to it.
     * @param {HCLUSTER} hCluster Handle to a cluster that includes the group to open.
     * @param {PWSTR} lpszGroupName Name of the group to open.
     * @returns {HGROUP} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For information about the error, call the function 
     *         <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the operation was successful, 
     *        <b>OpenClusterGroup</b> returns a group handle.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-openclustergroup
     * @since windowsserver2008
     */
    static OpenClusterGroup(hCluster, lpszGroupName) {
        lpszGroupName := lpszGroupName is String ? StrPtr(lpszGroupName) : lpszGroupName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\OpenClusterGroup", "ptr", hCluster, "ptr", lpszGroupName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a failover cluster group and returns a handle to it.
     * @param {HCLUSTER} hCluster Handle to a cluster that includes the group to open.
     * @param {PWSTR} lpszGroupName Name of the group to open.
     * @param {Integer} dwDesiredAccess The requested access privileges. This may be any combination of <b>GENERIC_READ</b> 
     *       (0x80000000), <b>GENERIC_ALL</b> (0x10000000), or <b>MAXIMUM_ALLOWED</b> 
     *       (0x02000000). If this value is zero (0) and undefined error may be returned. Using 
     *       <b>GENERIC_ALL</b> is the same as calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-openclustergroup">OpenClusterGroup</a>.
     * @param {Pointer<UInt32>} lpdwGrantedAccess Optional parameter that contains the address of a <b>DWORD</b> that will receive the 
     *       access rights granted. If the <i>DesiredAccess</i> parameter is 
     *       <b>MAXIMUM_ALLOWED</b> (0x02000000) then the <b>DWORD</b> pointed to by 
     *       this parameter will contain the maximum privileges granted to this user.
     * @returns {HGROUP} If the operation was successful, 
     *       <b>OpenClusterGroupEx</b> returns a group handle.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the 
     *         <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. If the target server does not 
     *         support the <a href="/windows/desktop/api/clusapi/nf-clusapi-openclustergroupex">OpenClusterGroupEx</a> function (for 
     *         example if the target server is running Windows Server 2008 or earlier) then the 
     *         <b>GetLastError</b> function will return 
     *         <b>RPC_S_PROCNUM_OUT_OF_RANGE</b> (1745).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-openclustergroupex
     * @since windowsserver2008
     */
    static OpenClusterGroupEx(hCluster, lpszGroupName, dwDesiredAccess, lpdwGrantedAccess) {
        lpszGroupName := lpszGroupName is String ? StrPtr(lpszGroupName) : lpszGroupName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\OpenClusterGroupEx", "ptr", hCluster, "ptr", lpszGroupName, "uint", dwDesiredAccess, "uint*", lpdwGrantedAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Requests that a node temporarily suspends its cluster activity.
     * @param {HNODE} hNode A handle to the node to suspend.
     * @param {BOOL} bDrainNode <b>TRUE</b> to drain the node; otherwise <b>FALSE</b>.
     * @param {Integer} dwPauseFlags One of the following flags:
     * - CLUSAPI_NODE_PAUSE_REMAIN_ON_PAUSED_NODE_ON_MOVE_ERROR  0x00000001
     * - CLUSAPI_NODE_AVOID_PLACEMENT                            0x00000002
     * - CLUSAPI_NODE_PAUSE_RETRY_DRAIN_ON_FAILURE  0x00000004
     * @param {HNODE} hNodeDrainTarget The node drain topic.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-pauseclusternodeex
     * @since windowsserver2012
     */
    static PauseClusterNodeEx(hNode, bDrainNode, dwPauseFlags, hNodeDrainTarget) {
        result := DllCall("CLUSAPI.dll\PauseClusterNodeEx", "ptr", hNode, "ptr", bDrainNode, "uint", dwPauseFlags, "ptr", hNodeDrainTarget, "uint")
        return result
    }

    /**
     * 
     * @param {HNODE} hNode 
     * @param {BOOL} bDrainNode 
     * @param {Integer} dwPauseFlags 
     * @param {HNODE} hNodeDrainTarget 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static PauseClusterNodeEx2(hNode, bDrainNode, dwPauseFlags, hNodeDrainTarget, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\PauseClusterNodeEx2", "ptr", hNode, "ptr", bDrainNode, "uint", dwPauseFlags, "ptr", hNodeDrainTarget, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Initiates the specified failback operation, and then requests that a paused node resumes cluster activity.
     * @param {HNODE} hNode The  handle to the paused node.
     * @param {Integer} eResumeFailbackType The type of failback operation to use when cluster activity resumes. The available failback types are specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_node_resume_failback_type">CLUSTER_NODE_RESUME_FAILBACK_TYPE</a> enumeration.
     * @param {Integer} dwResumeFlagsReserved This parameter is reserved for future use.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-resumeclusternodeex
     * @since windowsserver2012
     */
    static ResumeClusterNodeEx(hNode, eResumeFailbackType, dwResumeFlagsReserved) {
        result := DllCall("CLUSAPI.dll\ResumeClusterNodeEx", "ptr", hNode, "int", eResumeFailbackType, "uint", dwResumeFlagsReserved, "uint")
        return result
    }

    /**
     * 
     * @param {HNODE} hNode 
     * @param {Integer} eResumeFailbackType 
     * @param {Integer} dwResumeFlagsReserved 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ResumeClusterNodeEx2(hNode, eResumeFailbackType, dwResumeFlagsReserved, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\ResumeClusterNodeEx2", "ptr", hNode, "int", eResumeFailbackType, "uint", dwResumeFlagsReserved, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Creates a new cluster group with the options specified in the CLUSTER_CREATE_GROUP_INFO structure in a single operation.
     * @param {HCLUSTER} hCluster The handle to the cluster in which the group will be created.
     * @param {PWSTR} lpszGroupName The name of the new cluster group.
     * @param {Pointer<CLUSTER_CREATE_GROUP_INFO>} pGroupInfo The additional information used to create the group.
     * @returns {HGROUP} If the operation is successful, the function returns a handle to the newly created group.
     * If the operation fails, the function returns <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-createclustergroupex
     * @since windowsserver2012
     */
    static CreateClusterGroupEx(hCluster, lpszGroupName, pGroupInfo) {
        lpszGroupName := lpszGroupName is String ? StrPtr(lpszGroupName) : lpszGroupName

        result := DllCall("CLUSAPI.dll\CreateClusterGroupEx", "ptr", hCluster, "ptr", lpszGroupName, "ptr", pGroupInfo, "ptr")
        return result
    }

    /**
     * Opens a handle to the group enumeration.
     * @param {HCLUSTER} hCluster The handle to the cluster on which the enumeration will be performed.
     * @param {Pointer} lpszProperties A pointer to a list of names of common properties.
     * @param {Integer} cbProperties The size, in bytes, of the <b>lpszProperties</b> field.
     * @param {Pointer} lpszRoProperties A pointer to a list of names of read-only common properties.
     * @param {Integer} cbRoProperties The size, in bytes, of the <b>lpszRoProperties</b> field.
     * @param {Integer} dwFlags Reserved for future use. This value must be 0.
     * @returns {HGROUPENUMEX} If the operation is successful, the function returns a handle to the enumeration.
     * 
     * If the operation fails, the function returns <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustergroupopenenumex
     * @since windowsserver2012
     */
    static ClusterGroupOpenEnumEx(hCluster, lpszProperties, cbProperties, lpszRoProperties, cbRoProperties, dwFlags) {
        result := DllCall("CLUSAPI.dll\ClusterGroupOpenEnumEx", "ptr", hCluster, "ptr", lpszProperties, "uint", cbProperties, "ptr", lpszRoProperties, "uint", cbRoProperties, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Returns the number of elements in the enumeration.
     * @param {HGROUPENUMEX} hGroupEnumEx The handle to the enumeration from which the number of entries will be returned.
     * @returns {Integer} The number of items in the enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustergroupgetenumcountex
     * @since windowsserver2012
     */
    static ClusterGroupGetEnumCountEx(hGroupEnumEx) {
        result := DllCall("CLUSAPI.dll\ClusterGroupGetEnumCountEx", "ptr", hGroupEnumEx, "uint")
        return result
    }

    /**
     * Retrieves an item in the enumeration.
     * @param {HGROUPENUMEX} hGroupEnumEx The handle to the enumeration from which the item will be retrieved.
     * @param {Integer} dwIndex The zero-based index of the item in the enumeration.
     * @param {Pointer<CLUSTER_GROUP_ENUM_ITEM>} pItem A pointer to the buffer to be filled.
     * @param {Pointer<UInt32>} cbItem On input, the size of <i>pItem</i>.
     * 
     * On output, either the required size in bytes of the buffer if the buffer is too small, or the number of bytes written into the buffer.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwIndex</i> is larger than the number of items in the enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer was filled successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustergroupenumex
     * @since windowsserver2012
     */
    static ClusterGroupEnumEx(hGroupEnumEx, dwIndex, pItem, cbItem) {
        result := DllCall("CLUSAPI.dll\ClusterGroupEnumEx", "ptr", hGroupEnumEx, "uint", dwIndex, "ptr", pItem, "uint*", cbItem, "uint")
        return result
    }

    /**
     * Closes the enumeration and frees any memory held by the hGroupEnumEx handle.
     * @param {HGROUPENUMEX} hGroupEnumEx The handle to the enumeration that will be freed.
     * @returns {Integer} ERROR_SUCCESS is returned when the enumeration handle is freed.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustergroupcloseenumex
     * @since windowsserver2012
     */
    static ClusterGroupCloseEnumEx(hGroupEnumEx) {
        result := DllCall("CLUSAPI.dll\ClusterGroupCloseEnumEx", "ptr", hGroupEnumEx, "uint")
        return result
    }

    /**
     * Opens a handle to a resource enumeration that enables iteration through a resource's dependencies and nodes.
     * @param {HCLUSTER} hCluster A handle to the resource to iterate through.
     * @param {Pointer} lpszProperties A pointer to a list of names of common properties.
     * @param {Integer} cbProperties The size, in bytes, of the <i>lpszProperties</i>  parameter.
     * @param {Pointer} lpszRoProperties A pointer to a list of names of read-only common properties.
     * @param {Integer} cbRoProperties The size, in bytes, of the <i>lpszRoProperties</i>  parameter.
     * @param {Integer} dwFlags The index that identifies the next object to enumerate. This parameter should be zero for the first call to <b>ClusterResourceOpenEnumEx</b> and then be incremented for subsequent calls.
     * @returns {HRESENUMEX} If the operation succeeds, the function returns an enumeration handle.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information about the 
     *        error, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterresourceopenenumex
     * @since windowsserver2012
     */
    static ClusterResourceOpenEnumEx(hCluster, lpszProperties, cbProperties, lpszRoProperties, cbRoProperties, dwFlags) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\ClusterResourceOpenEnumEx", "ptr", hCluster, "ptr", lpszProperties, "uint", cbProperties, "ptr", lpszRoProperties, "uint", cbRoProperties, "uint", dwFlags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the number of cluster objects that are associated with a resource enumeration handle.
     * @param {HRESENUMEX} hResourceEnumEx The handle to a resource enumeration. This handle is obtained from 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceopenenumex">ClusterResourceOpenEnumEx</a> function. A valid handle is required. This parameter cannot be <b>NULL</b>.
     * @returns {Integer} The number of objects that are associated with the enumeration handle.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterresourcegetenumcountex
     * @since windowsserver2012
     */
    static ClusterResourceGetEnumCountEx(hResourceEnumEx) {
        result := DllCall("CLUSAPI.dll\ClusterResourceGetEnumCountEx", "ptr", hResourceEnumEx, "uint")
        return result
    }

    /**
     * Enumerates a resource and then returns a pointer to the current dependent resource or node.
     * @param {HRESENUMEX} hResourceEnumEx A handle to a resource enumeration   that is returned from 
     *        the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceopenenumex">ClusterResourceOpenEnumEx</a> function.
     * @param {Integer} dwIndex The index of the resource or node object to return. This parameter should be zero for the first call to the 
     *        <b>ClusterResourceEnumEx</b> function and then be  
     *        incremented for subsequent calls.
     * @param {Pointer<CLUSTER_RESOURCE_ENUM_ITEM>} pItem A pointer that receives the returned object.
     * @param {Pointer<UInt32>} cbItem On input, the size of the  <i>pItem</i> parameter.
     * 
     * On output, either the required size in bytes of the buffer if the buffer is too small, or the number of bytes written into the buffer.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation finished  successfully, or the <i>lpszName</i> parameter is 
     *          <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer to which   the <i>lpszName</i> parameter points is not big enough to hold the 
     *          result. The <i>lpcchName</i> parameter returns the number of characters in the result, 
     *          excluding the terminating null character.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * <dt>259 (0x103)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more objects to be returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/Debug/system-error-codes">System error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Any other returned error code indicates that the operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterresourceenumex
     * @since windowsserver2012
     */
    static ClusterResourceEnumEx(hResourceEnumEx, dwIndex, pItem, cbItem) {
        result := DllCall("CLUSAPI.dll\ClusterResourceEnumEx", "ptr", hResourceEnumEx, "uint", dwIndex, "ptr", pItem, "uint*", cbItem, "uint")
        return result
    }

    /**
     * Closes a handle to a resource enumeration.
     * @param {HRESENUMEX} hResourceEnumEx The handle to a resource enumeration  to  close.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     *      If the operation fails, 
     * the function returns a different <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterresourcecloseenumex
     * @since windowsserver2012
     */
    static ClusterResourceCloseEnumEx(hResourceEnumEx) {
        result := DllCall("CLUSAPI.dll\ClusterResourceCloseEnumEx", "ptr", hResourceEnumEx, "uint")
        return result
    }

    /**
     * Brings a group online.
     * @param {HGROUP} hGroup A handle to the group to be brought online.
     * @param {HNODE} hDestinationNode A handle to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">node</a> that is to host the group.
     * @param {Integer} dwOnlineFlags A flag that specifies settings for the resource that is to be brought online.
     * @param {Pointer} lpInBuffer A pointer to the input buffer that receives instructions for the operation.  The <i>lpInBuffer</i>  parameter is formatted as a property list.
     * @param {Integer} cbInBufferSize The size of the <i>lpInBuffer</i> parameter, in bytes.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HOST_NODE_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A suitable host node was not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is in progress.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-onlineclustergroupex
     * @since windowsserver2012
     */
    static OnlineClusterGroupEx(hGroup, hDestinationNode, dwOnlineFlags, lpInBuffer, cbInBufferSize) {
        result := DllCall("CLUSAPI.dll\OnlineClusterGroupEx", "ptr", hGroup, "ptr", hDestinationNode, "uint", dwOnlineFlags, "ptr", lpInBuffer, "uint", cbInBufferSize, "uint")
        return result
    }

    /**
     * Extends the OfflineClusterGroup method.
     * @param {HGROUP} hGroup The handle to a cluster group.
     * @param {Integer} dwOfflineFlags Flags that influence the offline policy. Along with 0x0, the following is an acceptable value: 
     *       <b>CLUSAPI_GROUP_OFFLINE_IGNORE_RESOURCE_LOCKED_STATUS</b> (0x00000001): disregard if a 
     *       resource has indicated that it should be “locked” in its current state.
     * @param {Pointer} lpInBuffer Contains instructions for the offline operation that are targeted at specific resources within the group. 
     *       <i>lpInBuffer</i> is formatted as a property list, which means that the instructions are 
     *       contained in property values. Resources in the group search the property list for property names that they 
     *       support for offline operations and then interpret the instructions in the associated property value. Note that 
     *       the properties supported by a resource in an 
     *       <b>OfflineClusterGroupEx</b> operation are not 
     *       related to the private properties associated with a resource.
     * @param {Integer} cbInBufferSize The size of <i>lpInBuffer</i>, in bytes.
     * @returns {Integer} <b>OfflineClusterGroupEx</b> returns 
     *       <b>ERROR_IO_PENDING</b> if the offline command has been accepted and is in progress. 
     *       <b>OfflineClusterGroupEx</b> returns a nonzero error 
     *       code if the offline command was rejected immediately with no changes to group state.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-offlineclustergroupex
     * @since windowsserver2012
     */
    static OfflineClusterGroupEx(hGroup, dwOfflineFlags, lpInBuffer, cbInBufferSize) {
        result := DllCall("CLUSAPI.dll\OfflineClusterGroupEx", "ptr", hGroup, "uint", dwOfflineFlags, "ptr", lpInBuffer, "uint", cbInBufferSize, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} hGroup 
     * @param {HNODE} hDestinationNode 
     * @param {Integer} dwOnlineFlags 
     * @param {Pointer} lpInBuffer 
     * @param {Integer} cbInBufferSize 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static OnlineClusterGroupEx2(hGroup, hDestinationNode, dwOnlineFlags, lpInBuffer, cbInBufferSize, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\OnlineClusterGroupEx2", "ptr", hGroup, "ptr", hDestinationNode, "uint", dwOnlineFlags, "ptr", lpInBuffer, "uint", cbInBufferSize, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} hGroup 
     * @param {Integer} dwOfflineFlags 
     * @param {Pointer<Byte>} lpInBuffer 
     * @param {Integer} cbInBufferSize 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static OfflineClusterGroupEx2(hGroup, dwOfflineFlags, lpInBuffer, cbInBufferSize, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\OfflineClusterGroupEx2", "ptr", hGroup, "uint", dwOfflineFlags, "char*", lpInBuffer, "uint", cbInBufferSize, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Brings an offline or failed resource online.
     * @param {HRESOURCE} hResource The handle to the resource to bring online.
     * @param {Integer} dwOnlineFlags A flag that specifies settings for the resource that is to be brought online.
     * @param {Pointer} lpInBuffer A pointer to the input buffer that receives instructions for the operation. The <i>lpInBuffer</i>  parameter is formatted as a property list.
     * @param {Integer} cbInBufferSize The size of <i>lpInBuffer</i>, in bytes.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource or one of the resources that  it depends on has returned <b>ERROR_IO_PENDING</b> from its  <a href="/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> entry point function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-onlineclusterresourceex
     * @since windowsserver2012
     */
    static OnlineClusterResourceEx(hResource, dwOnlineFlags, lpInBuffer, cbInBufferSize) {
        result := DllCall("CLUSAPI.dll\OnlineClusterResourceEx", "ptr", hResource, "uint", dwOnlineFlags, "ptr", lpInBuffer, "uint", cbInBufferSize, "uint")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} hResource 
     * @param {Integer} dwOnlineFlags 
     * @param {Pointer} lpInBuffer 
     * @param {Integer} cbInBufferSize 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static OnlineClusterResourceEx2(hResource, dwOnlineFlags, lpInBuffer, cbInBufferSize, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\OnlineClusterResourceEx2", "ptr", hResource, "uint", dwOnlineFlags, "ptr", lpInBuffer, "uint", cbInBufferSize, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Extends the OfflineClusterResource method.
     * @param {HRESOURCE} hResource The handle to a cluster resource.
     * @param {Integer} dwOfflineFlags Flags that influence the offline policy.
     * @param {Pointer} lpInBuffer Contains instructions for the offline operation that are targeted at the specific resource. 
     *       <i>lpInBuffer</i> is formatted as a property list, which means that the instructions are 
     *       contained in property values. The resource DLL searches the property list for property names that it supports 
     *       for offline operations and then interprets the instructions in the associated property value. Note that the 
     *       properties supported by a resource in an 
     *       <b>OfflineClusterResourceEx</b> operation are not 
     *       related to the private properties associated with a resource.
     * @param {Integer} cbInBufferSize The size of <i>lpInBuffer</i>, in bytes.
     * @returns {Integer} <b>OfflineClusterResourceEx</b> returns 
     *       <b>ERROR_IO_PENDING</b> if the offline command has been accepted and is in progress. 
     *       <b>OfflineClusterResourceEx</b> returns a nonzero 
     *       error code if the offline command was rejected immediately with no changes to resource state.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-offlineclusterresourceex
     * @since windowsserver2012
     */
    static OfflineClusterResourceEx(hResource, dwOfflineFlags, lpInBuffer, cbInBufferSize) {
        result := DllCall("CLUSAPI.dll\OfflineClusterResourceEx", "ptr", hResource, "uint", dwOfflineFlags, "ptr", lpInBuffer, "uint", cbInBufferSize, "uint")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} hResource 
     * @param {Integer} dwOfflineFlags 
     * @param {Pointer} lpInBuffer 
     * @param {Integer} cbInBufferSize 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static OfflineClusterResourceEx2(hResource, dwOfflineFlags, lpInBuffer, cbInBufferSize, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\OfflineClusterResourceEx2", "ptr", hResource, "uint", dwOfflineFlags, "ptr", lpInBuffer, "uint", cbInBufferSize, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Extends the existing MoveClusterGroup method with the addition of flags and a buffer.
     * @param {HGROUP} hGroup The handle to a cluster group.
     * @param {HNODE} hDestinationNode The handle to a cluster node, indicating the node to which the group should be moved. This parameter is optional. If left <b>NULL</b>, the cluster will move the group to the most suitable node, according to failover policies configured for the cluster and for this particular group.
     * @param {Integer} dwMoveFlags A bitwise combination of the flags that influence the failover policy with respect to this move operation.
     * @param {Pointer} lpInBuffer A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-lists">property list</a> that contains move operation instructions for specific resources within the group. The instructions are contained in property values. Resources in the group search the property list for property names that they support for move operations and then interpret the instructions in the associated property value. The properties supported by a resource in a <b>MoveClusterGroupEx</b> operation are not related to the private properties associated with a resource.
     * @param {Integer} cbInBufferSize The size of <i>lpInBuffer</i>, in bytes.
     * @returns {Integer} <b>MoveClusterGroupEx</b> returns <b>ERROR_IO_PENDING</b> if the move command has been accepted and is in progress. <b>MoveClusterGroupEx</b> returns a nonzero error code if the move command was rejected immediately with no changes to group state. For instance, this would happen if <i>hDestinationNode</i> is not Up at the time of the move request.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-moveclustergroupex
     * @since windowsserver2012
     */
    static MoveClusterGroupEx(hGroup, hDestinationNode, dwMoveFlags, lpInBuffer, cbInBufferSize) {
        result := DllCall("CLUSAPI.dll\MoveClusterGroupEx", "ptr", hGroup, "ptr", hDestinationNode, "uint", dwMoveFlags, "ptr", lpInBuffer, "uint", cbInBufferSize, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} hGroup 
     * @param {HNODE} hDestinationNode 
     * @param {Integer} dwMoveFlags 
     * @param {Pointer} lpInBuffer 
     * @param {Integer} cbInBufferSize 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static MoveClusterGroupEx2(hGroup, hDestinationNode, dwMoveFlags, lpInBuffer, cbInBufferSize, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\MoveClusterGroupEx2", "ptr", hGroup, "ptr", hDestinationNode, "uint", dwMoveFlags, "ptr", lpInBuffer, "uint", cbInBufferSize, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Enables a client to cancel a MoveClusterGroup or MoveClusterGroupEx operation that is pending for a group. The group is then returned to its persistent state.
     * @param {HGROUP} hGroup The handle to a cluster group.
     * @param {Integer} dwCancelFlags_RESERVED This parameter is reserved for future use and must be set to zero.
     * @returns {Integer} <b>CancelClusterGroupOperation</b> returns 
     *       <b>ERROR_SUCCESS</b> if the move operation on the group was successfully cancelled.
     * 
     * <b>CancelClusterGroupOperation</b> returns 
     *       <b>ERROR_IO_PENDING</b> if the cancellation of the move operation is now in progress.
     * 
     * <b>CancelClusterGroupOperation</b> returns a 
     *       different nonzero error code if there was a failure issuing the cancellation for the move group operation on the 
     *       designated group.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-cancelclustergroupoperation
     * @since windowsserver2012
     */
    static CancelClusterGroupOperation(hGroup, dwCancelFlags_RESERVED) {
        result := DllCall("CLUSAPI.dll\CancelClusterGroupOperation", "ptr", hGroup, "uint", dwCancelFlags_RESERVED, "uint")
        return result
    }

    /**
     * Restarts a cluster resource.
     * @param {HRESOURCE} hResource A handle to  the cluster resource.
     * @param {Integer} dwFlags TBD
     * @returns {Integer} TBD
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-restartclusterresource
     * @since windowsserver2012
     */
    static RestartClusterResource(hResource, dwFlags) {
        result := DllCall("CLUSAPI.dll\RestartClusterResource", "ptr", hResource, "uint", dwFlags, "uint")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} hResource 
     * @param {Integer} dwFlags 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static RestartClusterResourceEx(hResource, dwFlags, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\RestartClusterResourceEx", "ptr", hResource, "uint", dwFlags, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Closes a group handle.
     * @param {HGROUP} hGroup Handle to the group to close.
     * @returns {BOOL} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the function  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-closeclustergroup
     * @since windowsserver2008
     */
    static CloseClusterGroup(hGroup) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\CloseClusterGroup", "ptr", hGroup, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns a handle to the cluster associated with a group.
     * @param {HGROUP} hGroup Handle to the group.
     * @returns {HCLUSTER} If the operation succeeds, the function returns a handle to the cluster that owns the group.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information about the error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusterfromgroup
     * @since windowsserver2008
     */
    static GetClusterFromGroup(hGroup) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterFromGroup", "ptr", hGroup, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the current state of a group.
     * @param {HGROUP} hGroup Handle to the group for which state information should be returned.
     * @param {PWSTR} lpszNodeName Pointer to a null-terminated Unicode string containing the name of the node that currently owns the group.
     * @param {Pointer<UInt32>} lpcchNodeName Pointer to the size of the <i>lpszNodeName</i> buffer as a count of characters. On input, 
     *        specify the maximum number of characters the buffer can hold, including the terminating 
     *        <b>NULL</b>. On output, specifies the number of characters in the resulting name, excluding 
     *        the terminating <b>NULL</b>.
     * @returns {Integer} <b>GetClusterGroupState</b> returns the current 
     *        state of the group, which is represented by one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterGroupStateUnknown</b></dt>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the function 
     *          <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterGroupOnline</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All of the resources in the group are <a href="/previous-versions/windows/desktop/mscs/o-gly">online</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterGroupOffline</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All of the resources in the group are <a href="/previous-versions/windows/desktop/mscs/o-gly">offline</a> or 
     *          there are no resources in the group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterGroupFailed</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one <a href="/previous-versions/windows/desktop/mscs/resources">resource</a> in the group has failed (set a state 
     *          of <b>ClusterResourceFailed</b> from the <a href="/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_state">CLUSTER_RESOURCE_STATE</a> enumeration).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterGroupPartialOnline</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one resource in the group is online. No resources are 
     *          <a href="/previous-versions/windows/desktop/mscs/p-gly">pending</a> or 
     *          <a href="/previous-versions/windows/desktop/mscs/f-gly">failed</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterGroupPending</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one resource in the group is in a pending state. There are no failed resources.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclustergroupstate
     * @since windowsserver2008
     */
    static GetClusterGroupState(hGroup, lpszNodeName, lpcchNodeName) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterGroupState", "ptr", hGroup, "ptr", lpszNodeName, "uint*", lpcchNodeName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the name for a group.
     * @param {HGROUP} hGroup Handle to the group to name.
     * @param {PWSTR} lpszGroupName Pointer to the new name for the group identified by <i>hGroup</i>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-setclustergroupname
     * @since windowsserver2008
     */
    static SetClusterGroupName(hGroup, lpszGroupName) {
        lpszGroupName := lpszGroupName is String ? StrPtr(lpszGroupName) : lpszGroupName

        result := DllCall("CLUSAPI.dll\SetClusterGroupName", "ptr", hGroup, "ptr", lpszGroupName, "uint")
        return result
    }

    /**
     * Sets the preferred node list for a group.
     * @param {HGROUP} hGroup Handle to the group to be assigned the list of nodes.
     * @param {Integer} NodeCount Count of nodes in the list identified by <i>NodeList</i>.
     * @param {Pointer<HNODE>} NodeList Array of handles to nodes, in order by preference, with the first node being the most preferred and the last node the least preferred. The number of nodes in the <i>NodeList</i> array is controlled by the <i>NodeCount</i> parameter.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-setclustergroupnodelist
     * @since windowsserver2008
     */
    static SetClusterGroupNodeList(hGroup, NodeCount, NodeList) {
        result := DllCall("CLUSAPI.dll\SetClusterGroupNodeList", "ptr", hGroup, "uint", NodeCount, "ptr", NodeList, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} hGroup 
     * @param {PWSTR} lpszGroupName 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static SetClusterGroupNameEx(hGroup, lpszGroupName, lpszReason) {
        lpszGroupName := lpszGroupName is String ? StrPtr(lpszGroupName) : lpszGroupName
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\SetClusterGroupNameEx", "ptr", hGroup, "ptr", lpszGroupName, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} hGroup 
     * @param {Integer} NodeCount 
     * @param {Pointer<HNODE>} NodeList 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static SetClusterGroupNodeListEx(hGroup, NodeCount, NodeList, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\SetClusterGroupNodeListEx", "ptr", hGroup, "uint", NodeCount, "ptr", NodeList, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Brings a group online.
     * @param {HGROUP} hGroup Handle to the group to be brought online.
     * @param {HNODE} hDestinationNode Handle to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">node</a> where the group identified by <i>hGroup</i> should be brought online or <b>NULL</b>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HOST_NODE_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A suitable host node was not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is in progress.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-onlineclustergroup
     * @since windowsserver2008
     */
    static OnlineClusterGroup(hGroup, hDestinationNode) {
        result := DllCall("CLUSAPI.dll\OnlineClusterGroup", "ptr", hGroup, "ptr", hDestinationNode, "uint")
        return result
    }

    /**
     * Moves a group and all of its resources from one node to another.
     * @param {HGROUP} hGroup Handle to the group to be moved.
     * @param {HNODE} hDestinationNode Handle to the node where the moved group should be brought back online or <b>NULL</b>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is one of the possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reassignment of ownership of the group is in progress.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-moveclustergroup
     * @since windowsserver2008
     */
    static MoveClusterGroup(hGroup, hDestinationNode) {
        result := DllCall("CLUSAPI.dll\MoveClusterGroup", "ptr", hGroup, "ptr", hDestinationNode, "uint")
        return result
    }

    /**
     * Takes a group offline.
     * @param {HGROUP} hGroup Handle to the group to be taken offline.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is one of the possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation is in progress.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-offlineclustergroup
     * @since windowsserver2008
     */
    static OfflineClusterGroup(hGroup) {
        result := DllCall("CLUSAPI.dll\OfflineClusterGroup", "ptr", hGroup, "uint")
        return result
    }

    /**
     * Removes an offline and empty group from a cluster.
     * @param {HGROUP} hGroup Handle to the group to be removed. You must close this handle separately.
     * @returns {Integer} This function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. If the 
     *        operation completes successfully the function returns <b>ERROR_SUCCESS</b> (0). Any other 
     *        returned system error code would indicate that the 
     *        operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-deleteclustergroup
     * @since windowsserver2008
     */
    static DeleteClusterGroup(hGroup) {
        result := DllCall("CLUSAPI.dll\DeleteClusterGroup", "ptr", hGroup, "uint")
        return result
    }

    /**
     * Deletes the specified group from a cluster.
     * @param {HGROUP} hGroup This parameter takes a handle to the cluster group to be destroyed.
     * @returns {Integer} This function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. If the 
     *        operation completes successfully the function returns <b>ERROR_SUCCESS</b> (0). Any other 
     *        returned system error code would indicate that the 
     *        operation failed.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-destroyclustergroup
     * @since windowsserver2008
     */
    static DestroyClusterGroup(hGroup) {
        result := DllCall("CLUSAPI.dll\DestroyClusterGroup", "ptr", hGroup, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} hGroup 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static DeleteClusterGroupEx(hGroup, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\DeleteClusterGroupEx", "ptr", hGroup, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} hGroup 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static DestroyClusterGroupEx(hGroup, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\DestroyClusterGroupEx", "ptr", hGroup, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Opens an enumerator for iterating through a group's resources and/or the nodes that are included in its list of preferred owners.
     * @param {HGROUP} hGroup A handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups">group</a> to be enumerated.
     * @param {Integer} dwType A bitmask that describes the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-objects">cluster objects</a> to be 
     *        enumerated. The following are valid values of the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_group_enum">CLUSTER_GROUP_ENUM</a> enumeration.
     * @returns {HGROUPENUM} If the operation succeeds, 
     *        <b>ClusterGroupOpenEnum</b> returns a handle to an 
     *        enumerator that can be passed to the 
     *        <a href="/windows/desktop/api/clusapi/nf-clusapi-clustergroupenum">ClusterGroupEnum</a> function.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information about the 
     *        error, call the function <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustergroupopenenum
     * @since windowsserver2008
     */
    static ClusterGroupOpenEnum(hGroup, dwType) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\ClusterGroupOpenEnum", "ptr", hGroup, "uint", dwType, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the number of cluster objects associated with a group enumeration handle.
     * @param {HGROUPENUM} hGroupEnum Handle to a group enumeration. This handle is obtained from 
     *       <a href="https://docs.microsoft.com/windows/win32/api/clusapi/nf-clusapi-clustergroupopenenum">ClusterGroupOpenEnum</a>. A valid handle is 
     *       required. This parameter cannot be <b>NULL</b>.
     * @returns {Integer} <b>ClusterGroupGetEnumCount</b> returns the 
     *        number of objects associated with the enumeration handle.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustergroupgetenumcount
     * @since windowsserver2008
     */
    static ClusterGroupGetEnumCount(hGroupEnum) {
        result := DllCall("CLUSAPI.dll\ClusterGroupGetEnumCount", "ptr", hGroupEnum, "uint")
        return result
    }

    /**
     * Enumerates the resources in a group or the nodes that are the preferred owners of a group, returning the name of the resource or node with each call.
     * @param {HGROUPENUM} hGroupEnum A group enumeration handle returned by the 
     *        <a href="https://docs.microsoft.com/windows/win32/api/clusapi/nf-clusapi-clustergroupopenenum">ClusterGroupOpenEnum</a> function.
     * @param {Integer} dwIndex The index of the resource or node to return. This parameter should be zero for the first call to 
     *        <b>ClusterGroupEnum</b> and then incremented for 
     *        subsequent calls.
     * @param {Pointer<UInt32>} lpdwType A pointer to the type of object returned by 
     *        <b>ClusterGroupEnum</b>. The following are valid values 
     *        of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_group_enum">CLUSTER_GROUP_ENUM</a> enumeration.
     * @param {PWSTR} lpszResourceName A pointer to a null-terminated Unicode string containing the name of the returned resource or node.
     * @param {Pointer<UInt32>} lpcchName A pointer to the size of the <i>lpszResourceName</i> buffer as a count of characters. On 
     *        input, specify the maximum number of characters the buffer can hold, including the terminating 
     *        <b>NULL</b>. On output, specifies the number of characters in the resulting name, excluding 
     *        the terminating <b>NULL</b>.
     * @returns {Integer} The function can returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More data is available. This value is returned if the buffer pointed to by 
     *          <i>lpszResourceName</i> is not big enough to hold the result. The 
     *          <i>lpcchName</i> parameter returns the number of characters in the result, excluding the 
     *          terminating <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * <dt>259 (0x103)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more data is available. This value is returned if there are no more resources or nodes to be 
     *          returned.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the operation was not successful due to a problem other than those described with the 
     *        <b>ERROR_NO_MORE_ITEMS</b> or <b>ERROR_MORE_DATA</b> values, 
     *        <b>ClusterGroupEnum</b> returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustergroupenum
     * @since windowsserver2008
     */
    static ClusterGroupEnum(hGroupEnum, dwIndex, lpdwType, lpszResourceName, lpcchName) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName

        result := DllCall("CLUSAPI.dll\ClusterGroupEnum", "ptr", hGroupEnum, "uint", dwIndex, "uint*", lpdwType, "ptr", lpszResourceName, "uint*", lpcchName, "uint")
        return result
    }

    /**
     * Closes a group enumeration handle.
     * @param {HGROUPENUM} hGroupEnum Enumeration handle to close.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustergroupcloseenum
     * @since windowsserver2008
     */
    static ClusterGroupCloseEnum(hGroupEnum) {
        result := DllCall("CLUSAPI.dll\ClusterGroupCloseEnum", "ptr", hGroupEnum, "uint")
        return result
    }

    /**
     * Creates a resource in a cluster.
     * @param {HGROUP} hGroup Handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups">group</a> that should receive the resource.
     * @param {PWSTR} lpszResourceName Pointer to a null-terminated Unicode string containing the name of the new resource. The specified name 
     *       must be unique within the cluster.
     * @param {PWSTR} lpszResourceType Pointer to the type of new resource. The specified type must be installed in the cluster.
     * @param {Integer} dwFlags Bitmask describing how the resource should be added to the cluster. The <i>dwFlags</i>
     * @returns {HRESOURCE} If the operation succeeds, the function returns a resource handle.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information about the 
     *        error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-createclusterresource
     * @since windowsserver2008
     */
    static CreateClusterResource(hGroup, lpszResourceName, lpszResourceType, dwFlags) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName
        lpszResourceType := lpszResourceType is String ? StrPtr(lpszResourceType) : lpszResourceType

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\CreateClusterResource", "ptr", hGroup, "ptr", lpszResourceName, "ptr", lpszResourceType, "uint", dwFlags, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HGROUP} hGroup 
     * @param {PWSTR} lpszResourceName 
     * @param {PWSTR} lpszResourceType 
     * @param {Integer} dwFlags 
     * @param {PWSTR} lpszReason 
     * @returns {HRESOURCE} 
     */
    static CreateClusterResourceEx(hGroup, lpszResourceName, lpszResourceType, dwFlags, lpszReason) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName
        lpszResourceType := lpszResourceType is String ? StrPtr(lpszResourceType) : lpszResourceType
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\CreateClusterResourceEx", "ptr", hGroup, "ptr", lpszResourceName, "ptr", lpszResourceType, "uint", dwFlags, "ptr", lpszReason, "ptr")
        return result
    }

    /**
     * Opens a resource and returns a handle to it.
     * @param {HCLUSTER} hCluster Handle to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>.
     * @param {PWSTR} lpszResourceName Pointer to a null-terminated Unicode string containing the name of the resource to be opened.
     * 
     * Resource names are not case sensitive. A resource name must be unique within the cluster. The name is set 
     *        when the resource is created and can be changed using the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-setclusterresourcename">SetClusterResourceName</a> function.
     * @returns {HRESOURCE} If the operation was successful, 
     *        <b>OpenClusterResource</b> returns a handle to the 
     *        opened resource.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For information about the error, call the function 
     *         <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-openclusterresource
     * @since windowsserver2008
     */
    static OpenClusterResource(hCluster, lpszResourceName) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\OpenClusterResource", "ptr", hCluster, "ptr", lpszResourceName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a resource and returns a handle to it.
     * @param {HCLUSTER} hCluster Handle to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>.
     * @param {PWSTR} lpszResourceName Pointer to a null-terminated Unicode string containing the name of the resource to be opened.
     * 
     * Resource names are not case sensitive. A resource name must be unique within the cluster. The name is set 
     *        when the resource is created and can be changed using the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-setclusterresourcename">SetClusterResourceName</a> function.
     * @param {Integer} dwDesiredAccess The requested access privileges. This may be any combination of <b>GENERIC_READ</b> 
     *       (0x80000000), <b>GENERIC_ALL</b> (0x10000000), or <b>MAXIMUM_ALLOWED</b> 
     *       (0x02000000). If this value is zero (0) and undefined error may be returned. Using 
     *       <b>GENERIC_ALL</b> is the same as calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-openclusterresource">OpenClusterResource</a>.
     * @param {Pointer<UInt32>} lpdwGrantedAccess Optional parameter that contains the address of a <b>DWORD</b> that will receive the 
     *       access rights granted. If the <i>DesiredAccess</i> parameter is 
     *       <b>MAXIMUM_ALLOWED</b> (0x02000000) then the <b>DWORD</b> pointed to by 
     *       this parameter will contain the maximum privileges granted to this user.
     * @returns {HRESOURCE} If the operation was successful, 
     *       <b>OpenClusterResourceEx</b> returns a handle to the 
     *       opened resource.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the 
     *         <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. If the target server does not 
     *         support the <a href="/windows/desktop/api/clusapi/nf-clusapi-openclusterresourceex">OpenClusterResourceEx</a> function 
     *         (for example if the target server is running Windows Server 2008 or earlier) then the 
     *         <b>GetLastError</b> function will return 
     *         <b>RPC_S_PROCNUM_OUT_OF_RANGE</b> (1745).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-openclusterresourceex
     * @since windowsserver2008
     */
    static OpenClusterResourceEx(hCluster, lpszResourceName, dwDesiredAccess, lpdwGrantedAccess) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\OpenClusterResourceEx", "ptr", hCluster, "ptr", lpszResourceName, "uint", dwDesiredAccess, "uint*", lpdwGrantedAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes a resource handle.
     * @param {HRESOURCE} hResource Handle to the resource to be closed.
     * @returns {BOOL} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For information about the error, call the function  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-closeclusterresource
     * @since windowsserver2008
     */
    static CloseClusterResource(hResource) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\CloseClusterResource", "ptr", hResource, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns a handle to the cluster associated with a resource.
     * @param {HRESOURCE} hResource Handle to the resource.
     * @returns {HCLUSTER} If the operation succeeds, the function returns a handle to the cluster that owns the resource.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information about the error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusterfromresource
     * @since windowsserver2008
     */
    static GetClusterFromResource(hResource) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterFromResource", "ptr", hResource, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes an offline resource from a cluster.
     * @param {HRESOURCE} hResource Handle to an offline resource. You must close this handle separately.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RESOURCE_ONLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Server 2008 R2: The resource identified by <i>hResource</i> is not offline currently.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Server 2012: The resource identified by <i>hResource</i> is not offline currently.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-deleteclusterresource
     * @since windowsserver2008
     */
    static DeleteClusterResource(hResource) {
        result := DllCall("CLUSAPI.dll\DeleteClusterResource", "ptr", hResource, "uint")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} hResource 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static DeleteClusterResourceEx(hResource, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\DeleteClusterResourceEx", "ptr", hResource, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Returns the current state of a resource.
     * @param {HRESOURCE} hResource Handle specifying the resource for which state information should be returned.
     * @param {PWSTR} lpszNodeName Pointer to a buffer that receives the name of the specified resource's current owner node as a 
     *        <b>NULL</b>-terminated Unicode string. Pass <b>NULL</b> if the node name 
     *        is not required.
     * @param {Pointer<UInt32>} lpcchNodeName Pointer to the size of the <i>lpszNodeName</i> buffer as a count of characters. This 
     *        pointer cannot be <b>NULL</b> unless <i>lpszNodeName</i> is also 
     *        <b>NULL</b>. On input, specifies the maximum number of characters the buffer can hold, 
     *        including the terminating <b>NULL</b>. On output, specifies the number of characters in the 
     *        resulting name, excluding the terminating <b>NULL</b>.
     * @param {PWSTR} lpszGroupName Pointer to a buffer that receives the name of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups">group</a> that 
     *        contains the specified resource. The name is returned as a <b>NULL</b>-terminated Unicode 
     *        string. Pass <b>NULL</b> if the group name is not required.
     * @param {Pointer<UInt32>} lpcchGroupName Pointer to the size of the <i>lpszGroupName</i> buffer as a count of characters. This 
     *        pointer cannot be <b>NULL</b> unless <i>lpszNodeName</i> is also 
     *        <b>NULL</b>. On input, specifies the maximum number of characters the buffer can hold, 
     *        including the terminating <b>NULL</b>. On output, specifies the number of characters in the 
     *        resulting name, excluding the terminating <b>NULL</b>.
     * @returns {Integer} <b>GetClusterResourceState</b> returns the 
     *        current state of the resource enumerated from the 
     *        <a href="/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_state">CLUSTER_RESOURCE_STATE</a> enumeration, which can be 
     *        represented by one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterResourceInitializing</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is performing initialization.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterResourceOnline</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is operational and functioning normally.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterResourceOffline</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is not operational. This value will be returned if the resource reported a state of 
     *          <b>ClusterResourceOffline</b> (3) or 
     *          <b>ClusterResourceCannotComeOnlineOnThisNode</b> (127).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterResourceFailed</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource has failed. This value will be returned if the resource reported a state of 
     *          <b>ClusterResourceFailed</b> (4) or 
     *          <b>ClusterResourceCannotComeOnlineOnAnyNode</b> (126).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterResourcePending</b></dt>
     * <dt>128</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is in the process of coming online or going offline.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterResourceOnlinePending</b></dt>
     * <dt>129</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is in the process of coming online.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterResourceOfflinePending</b></dt>
     * <dt>130</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is in the process of going offline.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterResourceStateUnknown</b></dt>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the function 
     *          <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusterresourcestate
     * @since windowsserver2008
     */
    static GetClusterResourceState(hResource, lpszNodeName, lpcchNodeName, lpszGroupName, lpcchGroupName) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName
        lpszGroupName := lpszGroupName is String ? StrPtr(lpszGroupName) : lpszGroupName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterResourceState", "ptr", hResource, "ptr", lpszNodeName, "uint*", lpcchNodeName, "ptr", lpszGroupName, "uint*", lpcchGroupName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the name for a resource.
     * @param {HRESOURCE} hResource Handle to a resource to rename.
     * @param {PWSTR} lpszResourceName Pointer to the new name for the resource identified by <i>hResource</i>. Resource names 
     *       are not case sensitive. A resource name must be unique within the cluster.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-setclusterresourcename
     * @since windowsserver2008
     */
    static SetClusterResourceName(hResource, lpszResourceName) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName

        result := DllCall("CLUSAPI.dll\SetClusterResourceName", "ptr", hResource, "ptr", lpszResourceName, "uint")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} hResource 
     * @param {PWSTR} lpszResourceName 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static SetClusterResourceNameEx(hResource, lpszResourceName, lpszReason) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\SetClusterResourceNameEx", "ptr", hResource, "ptr", lpszResourceName, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Initiates a resource failure.
     * @param {HRESOURCE} hResource Handle to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources">resource</a> that is the target of the failure.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-failclusterresource
     * @since windowsserver2008
     */
    static FailClusterResource(hResource) {
        result := DllCall("CLUSAPI.dll\FailClusterResource", "ptr", hResource, "uint")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} hResource 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static FailClusterResourceEx(hResource, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\FailClusterResourceEx", "ptr", hResource, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Brings an offline or failed resource online.
     * @param {HRESOURCE} hResource Handle to the resource to be brought online.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource or one of the resources it depends on has returned <b>ERROR_IO_PENDING</b> from its  <a href="/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> entry point function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-onlineclusterresource
     * @since windowsserver2008
     */
    static OnlineClusterResource(hResource) {
        result := DllCall("CLUSAPI.dll\OnlineClusterResource", "ptr", hResource, "uint")
        return result
    }

    /**
     * Takes a resource offline.
     * @param {HRESOURCE} hResource Handle to the resource to be taken offline.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns one of the following 
     *       <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource or one of the resources it depends on has returned <b>ERROR_IO_PENDING</b> from its 
     *         <a href="/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> entry point function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RESOURCE_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This system error code is not returned.
     * 
     * <b>Windows Server 2008 Datacenter and Windows Server 2008 Enterprise:  </b>The function attempted to take offline a failed resource, so the failed resource has not been transitioned to an offline state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-offlineclusterresource
     * @since windowsserver2008
     */
    static OfflineClusterResource(hResource) {
        result := DllCall("CLUSAPI.dll\OfflineClusterResource", "ptr", hResource, "uint")
        return result
    }

    /**
     * Moves a resource from one group to another.
     * @param {HRESOURCE} hResource Handle of the resource to be moved.
     * @param {HGROUP} hGroup Handle of the group that should receive the resource identified by 
     *       <i>hResource</i>.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-changeclusterresourcegroup
     * @since windowsserver2008
     */
    static ChangeClusterResourceGroup(hResource, hGroup) {
        result := DllCall("CLUSAPI.dll\ChangeClusterResourceGroup", "ptr", hResource, "ptr", hGroup, "uint")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} hResource 
     * @param {HGROUP} hGroup 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static ChangeClusterResourceGroupEx(hResource, hGroup, Flags) {
        result := DllCall("CLUSAPI.dll\ChangeClusterResourceGroupEx", "ptr", hResource, "ptr", hGroup, "uint", Flags, "uint")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} hResource 
     * @param {HGROUP} hGroup 
     * @param {Integer} Flags 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ChangeClusterResourceGroupEx2(hResource, hGroup, Flags, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\ChangeClusterResourceGroupEx2", "ptr", hResource, "ptr", hGroup, "uint", Flags, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Adds a node to the list of possible nodes that a resource can run on.
     * @param {HRESOURCE} hResource Handle to a resource that will add a node to its possible owners list.
     * @param {HNODE} hNode Handle to the node to be added to the list of potential host nodes belonging to the resource identified by 
     *       <i>hResource</i>.
     * @returns {Integer} If the operation succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     *        <b>AddClusterResourceNode</b> returns one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-addclusterresourcenode
     * @since windowsserver2008
     */
    static AddClusterResourceNode(hResource, hNode) {
        result := DllCall("CLUSAPI.dll\AddClusterResourceNode", "ptr", hResource, "ptr", hNode, "uint")
        return result
    }

    /**
     * Removes a node from the list of nodes that can host a resource.
     * @param {HRESOURCE} hResource Handle to the target resource.
     * @param {HNODE} hNode Handle to the node that should be removed from the list of potential host nodes belonging to the resource identified by <i>hResource</i>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-removeclusterresourcenode
     * @since windowsserver2008
     */
    static RemoveClusterResourceNode(hResource, hNode) {
        result := DllCall("CLUSAPI.dll\RemoveClusterResourceNode", "ptr", hResource, "ptr", hNode, "uint")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} hResource 
     * @param {HNODE} hNode 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static AddClusterResourceNodeEx(hResource, hNode, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\AddClusterResourceNodeEx", "ptr", hResource, "ptr", hNode, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} hResource 
     * @param {HNODE} hNode 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static RemoveClusterResourceNodeEx(hResource, hNode, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\RemoveClusterResourceNodeEx", "ptr", hResource, "ptr", hNode, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Creates a dependency relationship between two resources.
     * @param {HRESOURCE} hResource Handle to the dependent resource.
     * @param {HRESOURCE} hDependsOn Handle to the resource that the resource identified by <i>hResource</i> should depend 
     *        on.
     * @returns {Integer} If the operation succeeds, it returns <b>ERROR_SUCCESS</b> (0).
     * 
     * If the operation fails, 
     *        <b>AddClusterResourceDependency</b> returns 
     *        one of the <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>. The following are 
     *        possible return values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CIRCULAR_DEPENDENCY</b></dt>
     * <dt>1059 (0x423)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A resource depends on itself.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEPENDENCY_ALREADY_EXISTS</b></dt>
     * <dt>5003 (0x138B)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource dependency already exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEPENDENCY_NOT_ALLOWED</b></dt>
     * <dt>5069 (0x13CD)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The dependent resource is the quorum.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87 (0x57)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resources are not in the same group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RESOURCE_NOT_AVAILABLE</b></dt>
     * <dt>5006 (0x138E)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one of the resources is marked for deletion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RESOURCE_ONLINE</b></dt>
     * <dt>5019 (0x139B)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The dependent resource is already online.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-addclusterresourcedependency
     * @since windowsserver2008
     */
    static AddClusterResourceDependency(hResource, hDependsOn) {
        result := DllCall("CLUSAPI.dll\AddClusterResourceDependency", "ptr", hResource, "ptr", hDependsOn, "uint")
        return result
    }

    /**
     * Removes a dependency relationship between two resources.
     * @param {HRESOURCE} hResource Handle to the dependent resource.
     * @param {HRESOURCE} hDependsOn Handle to the resource that the resource identified by <i>hResource</i> currently depends on.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-removeclusterresourcedependency
     * @since windowsserver2008
     */
    static RemoveClusterResourceDependency(hResource, hDependsOn) {
        result := DllCall("CLUSAPI.dll\RemoveClusterResourceDependency", "ptr", hResource, "ptr", hDependsOn, "uint")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} hResource 
     * @param {HRESOURCE} hDependsOn 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static AddClusterResourceDependencyEx(hResource, hDependsOn, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\AddClusterResourceDependencyEx", "ptr", hResource, "ptr", hDependsOn, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} hResource 
     * @param {HRESOURCE} hDependsOn 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static RemoveClusterResourceDependencyEx(hResource, hDependsOn, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\RemoveClusterResourceDependencyEx", "ptr", hResource, "ptr", hDependsOn, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Specifies the dependency expression to be associated with the resource referred to by hResource. Any existing dependency relationships for the resource will be overwritten.
     * @param {HRESOURCE} hResource Handle to the resource.
     * @param {PWSTR} lpszDependencyExpression Address of Unicode string containing the dependency expression.
     * @returns {Integer} <b>ERROR_SUCCESS</b> (0) if successful.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-setclusterresourcedependencyexpression
     * @since windowsserver2008
     */
    static SetClusterResourceDependencyExpression(hResource, lpszDependencyExpression) {
        lpszDependencyExpression := lpszDependencyExpression is String ? StrPtr(lpszDependencyExpression) : lpszDependencyExpression

        result := DllCall("CLUSAPI.dll\SetClusterResourceDependencyExpression", "ptr", hResource, "ptr", lpszDependencyExpression, "uint")
        return result
    }

    /**
     * Retrieves the dependency expression associated with the specified resource.
     * @param {HRESOURCE} hResource Handle to the resource.
     * @param {PWSTR} lpszDependencyExpression Address of buffer that will receive the dependency expression.
     * @param {Pointer<UInt32>} lpcchDependencyExpression Size in characters of the buffer pointed to by the <i>lpszDependencyExpression</i> 
     *       parameter.
     * @returns {Integer} <b>ERROR_SUCCESS</b> (0) if successful.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusterresourcedependencyexpression
     * @since windowsserver2008
     */
    static GetClusterResourceDependencyExpression(hResource, lpszDependencyExpression, lpcchDependencyExpression) {
        lpszDependencyExpression := lpszDependencyExpression is String ? StrPtr(lpszDependencyExpression) : lpszDependencyExpression

        result := DllCall("CLUSAPI.dll\GetClusterResourceDependencyExpression", "ptr", hResource, "ptr", lpszDependencyExpression, "uint*", lpcchDependencyExpression, "uint")
        return result
    }

    /**
     * Adds storage to Cluster Shared Volumes.
     * @param {HRESOURCE} hResource Handle to the physical disk resource to add to Cluster Shared Volumes.
     * @returns {Integer} If the operation succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     *        <b>AddResourceToClusterSharedVolumes</b> 
     *        returns one of the <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-addresourcetoclustersharedvolumes
     * @since windowsserver2008
     */
    static AddResourceToClusterSharedVolumes(hResource) {
        result := DllCall("CLUSAPI.dll\AddResourceToClusterSharedVolumes", "ptr", hResource, "uint")
        return result
    }

    /**
     * Removes storage from Cluster Shared Volumes.
     * @param {HRESOURCE} hResource Handle to the physical disk resource to remove from Cluster Shared Volumes.
     * @returns {Integer} If the operation succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     *        <b>RemoveResourceFromClusterSharedVolumes</b> 
     *        returns one of the <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-removeresourcefromclustersharedvolumes
     * @since windowsserver2008
     */
    static RemoveResourceFromClusterSharedVolumes(hResource) {
        result := DllCall("CLUSAPI.dll\RemoveResourceFromClusterSharedVolumes", "ptr", hResource, "uint")
        return result
    }

    /**
     * Specifies whether the file is on the cluster shared volume.
     * @param {PWSTR} lpszPathName A Unicode string that specifies the path of the cluster shared volume. The string ends with a terminating null character.
     * @param {Pointer<BOOL>} pbFileIsOnSharedVolume <b>True</b> if the file is on the cluster shared volume; otherwise <b>false.</b>
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, 
     * it returns one of the <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-isfileonclustersharedvolume
     * @since windowsserver2008
     */
    static IsFileOnClusterSharedVolume(lpszPathName, pbFileIsOnSharedVolume) {
        lpszPathName := lpszPathName is String ? StrPtr(lpszPathName) : lpszPathName

        result := DllCall("CLUSAPI.dll\IsFileOnClusterSharedVolume", "ptr", lpszPathName, "ptr", pbFileIsOnSharedVolume, "uint")
        return result
    }

    /**
     * Updates the state of a snapshot of a cluster shared volume.
     * @param {Pointer<Guid>} guidSnapshotSet The <b>GUID</b> of the snapshot.
     * @param {PWSTR} lpszVolumeName A pointer to the name of the cluster shared volume.
     * @param {Integer} state A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_shared_volume_snapshot_state">CLUSTER_SHARED_VOLUME_SNAPSHOT_STATE</a> enumeration value that specifies the state of the snapshot.
     * @returns {Integer} If the operation succeeds, the function returns a resource handle.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information about the 
     *        error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustersharedvolumesetsnapshotstate
     * @since windowsserver2008
     */
    static ClusterSharedVolumeSetSnapshotState(guidSnapshotSet, lpszVolumeName, state) {
        lpszVolumeName := lpszVolumeName is String ? StrPtr(lpszVolumeName) : lpszVolumeName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\ClusterSharedVolumeSetSnapshotState", "ptr", guidSnapshotSet, "ptr", lpszVolumeName, "int", state, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines if one resource can be dependent upon another resource.
     * @param {HRESOURCE} hResource Handle to the resource in question.
     * @param {HRESOURCE} hResourceDependent Handle to the resource upon which the resource identified by <i>hResource</i> may depend.
     * @returns {BOOL} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource identified by <i>hResource</i> can depend on the resource identified by <i>hResourceDependent</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource identified by <i>hResource</i> cannot depend on the resource identified by <i>hResourceDependent</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-canresourcebedependent
     * @since windowsserver2008
     */
    static CanResourceBeDependent(hResource, hResourceDependent) {
        result := DllCall("CLUSAPI.dll\CanResourceBeDependent", "ptr", hResource, "ptr", hResourceDependent, "ptr")
        return result
    }

    /**
     * Initiates an operation affecting a resource. The operation performed depends on the control code passed to the dwControlCode parameter.
     * @param {HRESOURCE} hResource Handle to the resource to be affected.
     * @param {HNODE} hHostNode Optional handle to the node to perform the operation. If <b>NULL</b>, the node that owns 
     *        the resource identified by <i>hResource</i> performs the operation.
     * @param {Integer} dwControlCode A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-control-codes">resource control code</a>, enumerated by the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-clusctl_resource_codes">CLUSCTL_RESOURCE_CODES</a> enumeration, specifying 
     *        the operation to be performed. For the syntax associated with a control code, refer to  
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/control-code-architecture">Control Code Architecture</a> and the following 
     *        topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-unknown">CLUSCTL_RESOURCE_UNKNOWN</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-characteristics">CLUSCTL_RESOURCE_GET_CHARACTERISTICS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-flags">CLUSCTL_RESOURCE_GET_FLAGS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-class-info">CLUSCTL_RESOURCE_GET_CLASS_INFO</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-required-dependencies">CLUSCTL_RESOURCE_GET_REQUIRED_DEPENDENCIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-name">CLUSCTL_RESOURCE_GET_NAME</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-id">CLUSCTL_RESOURCE_GET_ID</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-resource-type">CLUSCTL_RESOURCE_GET_RESOURCE_TYPE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-enum-common-properties">CLUSCTL_RESOURCE_ENUM_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-ro-common-properties">CLUSCTL_RESOURCE_GET_RO_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-common-properties">CLUSCTL_RESOURCE_GET_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-common-properties">CLUSCTL_RESOURCE_SET_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-validate-common-properties">CLUSCTL_RESOURCE_VALIDATE_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-common-property-fmts">CLUSCTL_RESOURCE_GET_COMMON_PROPERTY_FMTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-enum-private-properties">CLUSCTL_RESOURCE_ENUM_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-ro-private-properties">CLUSCTL_RESOURCE_GET_RO_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-private-properties">CLUSCTL_RESOURCE_GET_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-private-properties">CLUSCTL_RESOURCE_SET_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-validate-private-properties">CLUSCTL_RESOURCE_VALIDATE_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-private-property-fmts">CLUSCTL_RESOURCE_GET_PRIVATE_PROPERTY_FMTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-registry-checkpoint">CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-delete-registry-checkpoint">CLUSCTL_RESOURCE_DELETE_REGISTRY_CHECKPOINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-registry-checkpoints">CLUSCTL_RESOURCE_GET_REGISTRY_CHECKPOINTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-crypto-checkpoint">CLUSCTL_RESOURCE_ADD_CRYPTO_CHECKPOINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-delete-crypto-checkpoint">CLUSCTL_RESOURCE_DELETE_CRYPTO_CHECKPOINT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-crypto-checkpoints">CLUSCTL_RESOURCE_GET_CRYPTO_CHECKPOINTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-loadbal-process-list">CLUSCTL_RESOURCE_GET_LOADBAL_PROCESS_LIST</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-network-name">CLUSCTL_RESOURCE_GET_NETWORK_NAME</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-get-virtual-server-token">CLUSCTL_RESOURCE_NETNAME_GET_VIRTUAL_SERVER_TOKEN</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-set-pwd-info">CLUSCTL_RESOURCE_NETNAME_SET_PWD_INFO</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-delete-co">CLUSCTL_RESOURCE_NETNAME_DELETE_CO</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-validate-vco">CLUSCTL_RESOURCE_NETNAME_VALIDATE_VCO</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-reset-vco">CLUSCTL_RESOURCE_NETNAME_RESET_VCO</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-register-dns-records">CLUSCTL_RESOURCE_NETNAME_REGISTER_DNS_RECORDS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-dns-name">CLUSCTL_RESOURCE_GET_DNS_NAME</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-disk-info">CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-is-path-valid">CLUSCTL_RESOURCE_STORAGE_IS_PATH_VALID</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-query-delete">CLUSCTL_RESOURCE_QUERY_DELETE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-upgrade-dll">CLUSCTL_RESOURCE_UPGRADE_DLL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-ipaddress-renew-lease">CLUSCTL_RESOURCE_IPADDRESS_RENEW_LEASE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-ipaddress-release-lease">CLUSCTL_RESOURCE_IPADDRESS_RELEASE_LEASE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-registry-checkpoint-64bit">CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT_64BIT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-registry-checkpoint-32bit">CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT_32BIT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-query-maintenance-mode">CLUSCTL_RESOURCE_QUERY_MAINTENANCE_MODE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-maintenance-mode">CLUSCTL_RESOURCE_SET_MAINTENANCE_MODE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-set-driveletter">CLUSCTL_RESOURCE_STORAGE_SET_DRIVELETTER</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-disk-info-ex">CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO_EX</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fileserver-share-add">CLUSCTL_RESOURCE_FILESERVER_SHARE_ADD</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fileserver-share-del">CLUSCTL_RESOURCE_FILESERVER_SHARE_DEL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fileserver-share-modify">CLUSCTL_RESOURCE_FILESERVER_SHARE_MODIFY</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fileserver-share-report">CLUSCTL_RESOURCE_FILESERVER_SHARE_REPORT</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-mountpoints">CLUSCTL_RESOURCE_STORAGE_GET_MOUNTPOINTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-cluster-disk">CLUSCTL_RESOURCE_STORAGE_CLUSTER_DISK</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-dirty">CLUSCTL_RESOURCE_STORAGE_GET_DIRTY</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-csv-maintenance-mode">CLUSCTL_RESOURCE_SET_CSV_MAINTENANCE_MODE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-enable-shared-volume-directio">CLUSCTL_RESOURCE_ENABLE_SHARED_VOLUME_DIRECTIO</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-disable-shared-volume-directio">CLUSCTL_RESOURCE_DISABLE_SHARED_VOLUME_DIRECTIO</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-shared-volume-backup-mode">CLUSCTL_RESOURCE_SET_SHARED_VOLUME_BACKUP_MODE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-delete">CLUSCTL_RESOURCE_DELETE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-install-node">CLUSCTL_RESOURCE_INSTALL_NODE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-evict-node">CLUSCTL_RESOURCE_EVICT_NODE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-dependency">CLUSCTL_RESOURCE_ADD_DEPENDENCY</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-remove-dependency">CLUSCTL_RESOURCE_REMOVE_DEPENDENCY</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-owner">CLUSCTL_RESOURCE_ADD_OWNER</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-remove-owner">CLUSCTL_RESOURCE_REMOVE_OWNER</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-name">CLUSCTL_RESOURCE_SET_NAME</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-cluster-name-changed">CLUSCTL_RESOURCE_CLUSTER_NAME_CHANGED</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-cluster-version-changed">CLUSCTL_RESOURCE_CLUSTER_VERSION_CHANGED</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-force-quorum">CLUSCTL_RESOURCE_FORCE_QUORUM</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-initialize">CLUSCTL_RESOURCE_INITIALIZE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-state-change-reason">CLUSCTL_RESOURCE_STATE_CHANGE_REASON</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-provider-state-change">CLUSCTL_RESOURCE_PROVIDER_STATE_CHANGE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-leaving-group">CLUSCTL_RESOURCE_LEAVING_GROUP</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-joining-group">CLUSCTL_RESOURCE_JOINING_GROUP</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fswitness-get-epoch-info">CLUSCTL_RESOURCE_FSWITNESS_GET_EPOCH_INFO</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fswitness-set-epoch-info">CLUSCTL_RESOURCE_FSWITNESS_SET_EPOCH_INFO</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fswitness-release-lock">CLUSCTL_RESOURCE_FSWITNESS_RELEASE_LOCK</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-creds-updated">CLUSCTL_RESOURCE_NETNAME_CREDS_UPDATED</a>
     * </li>
     * </ul>
     * @param {Pointer} lpInBuffer Pointer to an input buffer containing information needed for the operation, or <b>NULL</b> 
     *        if no information is needed.
     * @param {Integer} cbInBufferSize The allocated size (in bytes) of the input buffer.
     * @param {Pointer} lpOutBuffer Pointer to an output buffer to receive the data resulting from the operation, or 
     *        <b>NULL</b> if no data will be returned.
     * @param {Integer} cbOutBufferSize The allocated size (in bytes) of the output buffer.
     * @param {Pointer<UInt32>} lpBytesReturned Returns the actual size (in bytes) of the data resulting from the operation. If this information is not 
     *        needed, pass <b>NULL</b> for <i>lpBytesReturned</i>.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful. If the operation required an output buffer, 
     *          <i>lpBytesReturned</i> (if not <b>NULL</b> on input) points to the 
     *          actual size of the data returned in the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer pointed to by <i>lpOutBuffer</i> was not large enough to hold the data 
     *          resulting from the operation. The <i>lpBytesReturned</i> parameter (if not 
     *          <b>NULL</b> on input) points to the size required for the output buffer. Only operations 
     *          requiring an output buffer return <b>ERROR_MORE_DATA</b>. If the 
     *          <i>lpOutBuffer</i> parameter is <b>NULL</b> and the 
     *          <i>cbOutBufferSize</i> parameter is zero, then <b>ERROR_SUCCESS</b> may 
     *          be returned, not <b>ERROR_MORE_DATA</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RESOURCE_PROPERTIES_STORED</b></dt>
     * <dt>5024 (0x13A0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Applies only to 
     *          <a href="/previous-versions/windows/desktop/mscs/clusctl-resource-set-common-properties">CLUSCTL_RESOURCE_SET_COMMON_PROPERTIES</a> 
     *          and 
     *          <a href="/previous-versions/windows/desktop/mscs/clusctl-resource-set-private-properties">CLUSCTL_RESOURCE_SET_PRIVATE_PROPERTIES</a>. 
     *          Indicates that the properties were successfully stored but have not yet been applied to the resource. The new 
     *          properties will take effect after the resource is taken offline and brought online again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HOST_NODE_NOT_RESOURCE_OWNER</b></dt>
     * <dt>5015 (0x1397)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The node specified by the <i>hNode</i> parameter is not the node that owns the resource 
     *          specified by <i>hResource</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/Debug/system-error-codes">System error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. If the operation required an output buffer, the value specified by 
     *          <i>lpBytesReturned</i> (if not <b>NULL</b> on input) is 
     *          unreliable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterresourcecontrol
     * @since windowsserver2008
     */
    static ClusterResourceControl(hResource, hHostNode, dwControlCode, lpInBuffer, cbInBufferSize, lpOutBuffer, cbOutBufferSize, lpBytesReturned) {
        result := DllCall("CLUSAPI.dll\ClusterResourceControl", "ptr", hResource, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", cbInBufferSize, "ptr", lpOutBuffer, "uint", cbOutBufferSize, "uint*", lpBytesReturned, "uint")
        return result
    }

    /**
     * Initiates an operation affecting a resource.
     * @param {HRESOURCE} hResource Handle to the resource to be affected.
     * @param {HNODE} hHostNode Optional handle to the node to perform the operation. If <b>NULL</b>, the node that owns 
     *        the resource identified by <i>hResource</i> performs the operation.
     * @param {Integer} dwControlCode A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-control-codes">resource control code</a>, enumerated by the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-clusctl_resource_codes">CLUSCTL_RESOURCE_CODES</a> enumeration, specifying 
     *        the operation to be performed. For the syntax associated with a control code, refer to  
     *        the link on the <b>CLUSCTL_RESOURCE_CODES</b> topic.
     * @param {Pointer} lpInBuffer Pointer to an input buffer containing information needed for the operation, or <b>NULL</b> 
     *        if no information is needed.
     * @param {Integer} cbInBufferSize The allocated size (in bytes) of the input buffer.
     * @param {Pointer} lpOutBuffer Pointer to an output buffer to receive the data resulting from the operation, or 
     *        <b>NULL</b> if no data will be returned.
     * @param {Integer} cbOutBufferSize The allocated size (in bytes) of the output buffer.
     * @param {Pointer<UInt32>} lpBytesReturned Returns the actual size (in bytes) of the data resulting from the operation. If this information is not 
     *        needed, pass <b>NULL</b> for <i>lpBytesReturned</i>.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful. If the operation required an output buffer, 
     *          <i>lpBytesReturned</i> (if not <b>NULL</b> on input) points to the 
     *          actual size of the data returned in the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer pointed to by <i>lpOutBuffer</i> was not large enough to hold the data 
     *          resulting from the operation. The <i>lpBytesReturned</i> parameter (if not 
     *          <b>NULL</b> on input) points to the size required for the output buffer. Only operations 
     *          requiring an output buffer return <b>ERROR_MORE_DATA</b>. If the 
     *          <i>lpOutBuffer</i> parameter is <b>NULL</b> and the 
     *          <i>cbOutBufferSize</i> parameter is zero, then <b>ERROR_SUCCESS</b> may 
     *          be returned, not <b>ERROR_MORE_DATA</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RESOURCE_PROPERTIES_STORED</b></dt>
     * <dt>5024 (0x13A0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Applies only to 
     *          <a href="/previous-versions/windows/desktop/mscs/clusctl-resource-set-common-properties">CLUSCTL_RESOURCE_SET_COMMON_PROPERTIES</a> 
     *          and 
     *          <a href="/previous-versions/windows/desktop/mscs/clusctl-resource-set-private-properties">CLUSCTL_RESOURCE_SET_PRIVATE_PROPERTIES</a>. 
     *          Indicates that the properties were successfully stored but have not yet been applied to the resource. The new 
     *          properties will take effect after the resource is taken offline and brought online again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HOST_NODE_NOT_RESOURCE_OWNER</b></dt>
     * <dt>5015 (0x1397)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The node specified by the <i>hNode</i> parameter is not the node that owns the resource 
     *          specified by <i>hResource</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/Debug/system-error-codes">System error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. If the operation required an output buffer, the value specified by 
     *          <i>lpBytesReturned</i> (if not <b>NULL</b> on input) is 
     *          unreliable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterresourcecontrolasuser
     * @since windowsserver2016
     */
    static ClusterResourceControlAsUser(hResource, hHostNode, dwControlCode, lpInBuffer, cbInBufferSize, lpOutBuffer, cbOutBufferSize, lpBytesReturned) {
        result := DllCall("CLUSAPI.dll\ClusterResourceControlAsUser", "ptr", hResource, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", cbInBufferSize, "ptr", lpOutBuffer, "uint", cbOutBufferSize, "uint*", lpBytesReturned, "uint")
        return result
    }

    /**
     * Initiates an operation affecting a resource type. The operation performed depends on the control code passed to the dwControlCode parameter.
     * @param {HCLUSTER} hCluster Handle to the cluster containing the resource type identified in 
     *        <i>lpszResourceTypeName</i>.
     * @param {PWSTR} lpszResourceTypeName Pointer to a <b>NULL</b>-terminated Unicode string containing the name of the resource 
     *        type to be affected.
     * @param {HNODE} hHostNode Handle to the node hosting the affected resource type.
     * @param {Integer} dwControlCode A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-type-control-codes">resource type control code</a> specifying 
     *        the operation to be performed. For the syntax associated with a control code, refer to  
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/control-code-architecture">Control Code Architecture</a> and the following 
     *        topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-enum-common-properties">CLUSCTL_RESOURCE_TYPE_ENUM_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-enum-private-properties">CLUSCTL_RESOURCE_TYPE_ENUM_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-characteristics">CLUSCTL_RESOURCE_TYPE_GET_CHARACTERISTICS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-class-info">CLUSCTL_RESOURCE_TYPE_GET_CLASS_INFO</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-common-properties">CLUSCTL_RESOURCE_TYPE_GET_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-common-property-fmts">CLUSCTL_RESOURCE_TYPE_GET_COMMON_PROPERTY_FMTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-common-resource-property-fmts">CLUSCTL_RESOURCE_TYPE_GET_COMMON_RESOURCE_PROPERTY_FMTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-crypto-checkpoints">CLUSCTL_RESOURCE_TYPE_GET_CRYPTO_CHECKPOINTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-flags">CLUSCTL_RESOURCE_TYPE_GET_FLAGS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-private-properties">CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-private-property-fmts">CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_PROPERTY_FMTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-private-resource-property-fmts">CLUSCTL_RESOURCE_TYPE_GET_PRIVATE_RESOURCE_PROPERTY_FMTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-registry-checkpoints">CLUSCTL_RESOURCE_TYPE_GET_REGISTRY_CHECKPOINTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-required-dependencies">CLUSCTL_RESOURCE_TYPE_GET_REQUIRED_DEPENDENCIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-ro-common-properties">CLUSCTL_RESOURCE_TYPE_GET_RO_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-get-ro-private-properties">CLUSCTL_RESOURCE_TYPE_GET_RO_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-query-delete">CLUSCTL_RESOURCE_TYPE_QUERY_DELETE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-set-common-properties">CLUSCTL_RESOURCE_TYPE_SET_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-set-private-properties">CLUSCTL_RESOURCE_TYPE_SET_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-get-available-disks">CLUSCTL_RESOURCE_TYPE_STORAGE_GET_AVAILABLE_DISKS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-storage-get-resourceid">CLUSCTL_RESOURCE_TYPE_STORAGE_GET_RESOURCEID</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-unknown">CLUSCTL_RESOURCE_TYPE_UNKNOWN</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-validate-common-properties">CLUSCTL_RESOURCE_TYPE_VALIDATE_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-type-validate-private-properties">CLUSCTL_RESOURCE_TYPE_VALIDATE_PRIVATE_PROPERTIES</a>
     * </li>
     * </ul>
     * @param {Pointer} lpInBuffer Pointer to the input buffer with information needed for the operation, or <b>NULL</b> if 
     *        no information is needed.
     * @param {Integer} nInBufferSize Number of bytes in the buffer pointed to by <i>lpInBuffer</i>.
     * @param {Pointer} lpOutBuffer Pointer to the output buffer with information resulting from the operation, or 
     *       <b>NULL</b> if nothing will be returned.
     * @param {Integer} nOutBufferSize Number of bytes in the output buffer pointed to by <i>lpOutBuffer</i>, or zero if the 
     *        caller does not know how much data will be returned.
     * @param {Pointer<UInt32>} lpBytesReturned Pointer to the number of bytes in the buffer pointed to by <i>lpOutBuffer</i> that were 
     *        actually filled in as a result of the operation. The caller can pass <b>NULL</b> for 
     *        <i>lpBytesReturned</i> if 
     *        <b>ClusterResourceTypeControl</b> does not need 
     *        to pass back the number of bytes in the output buffer.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful. If the operation required an output buffer, 
     *          <i>lpBytesReturned</i> (if not <b>NULL</b> on input) points to the 
     *          actual size of the data returned in the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer pointed to by <i>lpOutBuffer</i> was not large enough to hold the data 
     *          resulting from the operation. The <i>lpBytesReturned</i> parameter (if not 
     *          <b>NULL</b> on input) points to the size required for the output buffer. Only operations 
     *          requiring an output buffer return <b>ERROR_MORE_DATA</b>. If the 
     *          <i>lpOutBuffer</i> parameter is <b>NULL</b> and the 
     *          <i>nOutBufferSize</i> parameter is zero, then <b>ERROR_SUCCESS</b> may 
     *          be returned, not <b>ERROR_MORE_DATA</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/Debug/system-error-codes">System error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. If the operation required an output buffer, the value specified by 
     *          <i>lpBytesReturned</i> is unreliable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterresourcetypecontrol
     * @since windowsserver2008
     */
    static ClusterResourceTypeControl(hCluster, lpszResourceTypeName, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned) {
        lpszResourceTypeName := lpszResourceTypeName is String ? StrPtr(lpszResourceTypeName) : lpszResourceTypeName

        result := DllCall("CLUSAPI.dll\ClusterResourceTypeControl", "ptr", hCluster, "ptr", lpszResourceTypeName, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesReturned, "uint")
        return result
    }

    /**
     * Initiates an operation affecting a resource type.
     * @param {HCLUSTER} hCluster Handle to the cluster containing the resource type identified in 
     *        <i>lpszResourceTypeName</i>.
     * @param {PWSTR} lpszResourceTypeName Pointer to a <b>NULL</b>-terminated Unicode string containing the name of the resource 
     *        type to be affected.
     * @param {HNODE} hHostNode Handle to the node hosting the affected resource type.
     * @param {Integer} dwControlCode A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-control-codes">resource control code</a>, enumerated by the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-clusctl_resource_type_codes">CLUSCTL_RESOURCE_TYPE_CODES</a> enumeration, 
     *        specifying the operation to be performed. For the syntax associated with a control code, refer to  the link on 
     *        the <b>CLUSCTL_RESOURCE_TYPE_CODES</b> topic.
     * @param {Pointer} lpInBuffer Pointer to the input buffer with information needed for the operation, or <b>NULL</b> if 
     *        no information is needed.
     * @param {Integer} nInBufferSize Number of bytes in the buffer pointed to by <i>lpInBuffer</i>.
     * @param {Pointer} lpOutBuffer Pointer to the output buffer with information resulting from the operation, or 
     *       <b>NULL</b> if nothing will be returned.
     * @param {Integer} nOutBufferSize Number of bytes in the output buffer pointed to by <i>lpOutBuffer</i>, or zero if the 
     *        caller does not know how much data will be returned.
     * @param {Pointer<UInt32>} lpBytesReturned Pointer to the number of bytes in the buffer pointed to by <i>lpOutBuffer</i> that were 
     *        actually filled in as a result of the operation. The caller can pass <b>NULL</b> for 
     *        <i>lpBytesReturned</i> if 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterresourcetypecontrol">ClusterResourceTypeControl</a> does not need 
     *        to pass back the number of bytes in the output buffer.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful. If the operation required an output buffer, 
     *          <i>lpBytesReturned</i> (if not <b>NULL</b> on input) points to the 
     *          actual size of the data returned in the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer pointed to by <i>lpOutBuffer</i> was not large enough to hold the data 
     *          resulting from the operation. The <i>lpBytesReturned</i> parameter (if not 
     *          <b>NULL</b> on input) points to the size required for the output buffer. Only operations 
     *          requiring an output buffer return <b>ERROR_MORE_DATA</b>. If the 
     *          <i>lpOutBuffer</i> parameter is <b>NULL</b> and the 
     *          <i>nOutBufferSize</i> parameter is zero, then <b>ERROR_SUCCESS</b> may 
     *          be returned, not <b>ERROR_MORE_DATA</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/Debug/system-error-codes">System error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. If the operation required an output buffer, the value specified by 
     *          <i>lpBytesReturned</i> is unreliable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterresourcetypecontrolasuser
     * @since windowsserver2016
     */
    static ClusterResourceTypeControlAsUser(hCluster, lpszResourceTypeName, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned) {
        lpszResourceTypeName := lpszResourceTypeName is String ? StrPtr(lpszResourceTypeName) : lpszResourceTypeName

        result := DllCall("CLUSAPI.dll\ClusterResourceTypeControlAsUser", "ptr", hCluster, "ptr", lpszResourceTypeName, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesReturned, "uint")
        return result
    }

    /**
     * Initiates an operation that affects a group. The operation performed depends on the control code passed to the dwControlCode parameter.
     * @param {HGROUP} hGroup Handle to the group to be affected.
     * @param {HNODE} hHostNode If non-<b>NULL</b>, handle to the node to perform the operation represented by the control 
     *        code. If <b>NULL</b>, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">node</a> that owns the 
     *        group performs the operation. Specifying <i>hHostNode</i> is optional.
     * @param {Integer} dwControlCode A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/group-control-codes">group control code</a> specifying the operation to 
     *        be performed. For the syntax associated with a control code, refer to  
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/control-code-architecture">Control Code Architecture</a> and the following 
     *        topics:
     * 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-enum-common-properties">CLUSCTL_GROUP_ENUM_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-enum-private-properties">CLUSCTL_GROUP_ENUM_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-characteristics">CLUSCTL_GROUP_GET_CHARACTERISTICS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-common-properties">CLUSCTL_GROUP_GET_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-common-property-fmts">CLUSCTL_GROUP_GET_COMMON_PROPERTY_FMTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-flags">CLUSCTL_GROUP_GET_FLAGS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-id">CLUSCTL_GROUP_GET_ID</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-name">CLUSCTL_GROUP_GET_NAME</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-private-properties">CLUSCTL_GROUP_GET_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-private-property-fmts">CLUSCTL_GROUP_GET_PRIVATE_PROPERTY_FMTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-ro-common-properties">CLUSCTL_GROUP_GET_RO_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-ro-private-properties">CLUSCTL_GROUP_GET_RO_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-query-delete">CLUSCTL_GROUP_QUERY_DELETE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-set-common-properties">CLUSCTL_GROUP_SET_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-set-private-properties">CLUSCTL_GROUP_SET_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-unknown">CLUSCTL_GROUP_UNKNOWN</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-validate-common-properties">CLUSCTL_GROUP_VALIDATE_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-validate-private-properties">CLUSCTL_GROUP_VALIDATE_PRIVATE_PROPERTIES</a>
     * </li>
     * </ul>
     * @param {Pointer} lpInBuffer Pointer to an input buffer containing information needed for the operation, or <b>NULL</b> 
     *        if no information is needed.
     * @param {Integer} nInBufferSize The allocated size (in bytes) of the input buffer.
     * @param {Pointer} lpOutBuffer Pointer to an output buffer to receive the data resulting from the operation, or 
     *        <b>NULL</b> if no data will be returned.
     * @param {Integer} nOutBufferSize The allocated size (in bytes) of the output buffer.
     * @param {Pointer<UInt32>} lpBytesReturned Returns the actual size (in bytes) of the data resulting from the operation. If this information is not 
     *        needed, pass <b>NULL</b> for <i>lpBytesReturned</i>.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful. If the operation required an output buffer, 
     *          <i>lpBytesReturned</i> (if not <b>NULL</b> on input) points to the 
     *          actual size of the data returned in the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer pointed to by <i>lpOutBuffer</i> was not large enough to hold the data 
     *          resulting from the operation. The <i>lpBytesReturned</i> parameter (if not 
     *          <b>NULL</b> on input) points to the size required for the output buffer. Only operations 
     *          requiring an output buffer return <b>ERROR_MORE_DATA</b>. If the 
     *          <i>lpOutBuffer</i> parameter is <b>NULL</b> and the 
     *          <i>nOutBufferSize</i> parameter is zero, then <b>ERROR_SUCCESS</b> may 
     *          be returned, not <b>ERROR_MORE_DATA</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/Debug/system-error-codes">System error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. If the operation required an output buffer, the value specified by 
     *          <i>lpBytesReturned</i> (if not <b>NULL</b> on input) is 
     *          unreliable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustergroupcontrol
     * @since windowsserver2008
     */
    static ClusterGroupControl(hGroup, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned) {
        result := DllCall("CLUSAPI.dll\ClusterGroupControl", "ptr", hGroup, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesReturned, "uint")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} hResource 
     * @param {HNODE} hHostNode 
     * @param {Integer} dwControlCode 
     * @param {Pointer} lpInBuffer 
     * @param {Integer} cbInBufferSize 
     * @param {Pointer} lpOutBuffer 
     * @param {Integer} cbOutBufferSize 
     * @param {Pointer<UInt32>} lpBytesReturned 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterResourceControlEx(hResource, hHostNode, dwControlCode, lpInBuffer, cbInBufferSize, lpOutBuffer, cbOutBufferSize, lpBytesReturned, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\ClusterResourceControlEx", "ptr", hResource, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", cbInBufferSize, "ptr", lpOutBuffer, "uint", cbOutBufferSize, "uint*", lpBytesReturned, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} hResource 
     * @param {HNODE} hHostNode 
     * @param {Integer} dwControlCode 
     * @param {Pointer} lpInBuffer 
     * @param {Integer} cbInBufferSize 
     * @param {Pointer} lpOutBuffer 
     * @param {Integer} cbOutBufferSize 
     * @param {Pointer<UInt32>} lpBytesReturned 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterResourceControlAsUserEx(hResource, hHostNode, dwControlCode, lpInBuffer, cbInBufferSize, lpOutBuffer, cbOutBufferSize, lpBytesReturned, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\ClusterResourceControlAsUserEx", "ptr", hResource, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", cbInBufferSize, "ptr", lpOutBuffer, "uint", cbOutBufferSize, "uint*", lpBytesReturned, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {PWSTR} lpszResourceTypeName 
     * @param {HNODE} hHostNode 
     * @param {Integer} dwControlCode 
     * @param {Pointer} lpInBuffer 
     * @param {Integer} nInBufferSize 
     * @param {Pointer} lpOutBuffer 
     * @param {Integer} nOutBufferSize 
     * @param {Pointer<UInt32>} lpBytesReturned 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterResourceTypeControlEx(hCluster, lpszResourceTypeName, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned, lpszReason) {
        lpszResourceTypeName := lpszResourceTypeName is String ? StrPtr(lpszResourceTypeName) : lpszResourceTypeName
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\ClusterResourceTypeControlEx", "ptr", hCluster, "ptr", lpszResourceTypeName, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesReturned, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {PWSTR} lpszResourceTypeName 
     * @param {HNODE} hHostNode 
     * @param {Integer} dwControlCode 
     * @param {Pointer} lpInBuffer 
     * @param {Integer} nInBufferSize 
     * @param {Pointer} lpOutBuffer 
     * @param {Integer} nOutBufferSize 
     * @param {Pointer<UInt32>} lpBytesReturned 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterResourceTypeControlAsUserEx(hCluster, lpszResourceTypeName, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned, lpszReason) {
        lpszResourceTypeName := lpszResourceTypeName is String ? StrPtr(lpszResourceTypeName) : lpszResourceTypeName
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\ClusterResourceTypeControlAsUserEx", "ptr", hCluster, "ptr", lpszResourceTypeName, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesReturned, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} hGroup 
     * @param {HNODE} hHostNode 
     * @param {Integer} dwControlCode 
     * @param {Pointer} lpInBuffer 
     * @param {Integer} nInBufferSize 
     * @param {Pointer} lpOutBuffer 
     * @param {Integer} nOutBufferSize 
     * @param {Pointer<UInt32>} lpBytesReturned 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterGroupControlEx(hGroup, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\ClusterGroupControlEx", "ptr", hGroup, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesReturned, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Initiates an operation that affects a node. The operation performed depends on the control code passed to the dwControlCode parameter.
     * @param {HNODE} hNode Handle to the node to be affected.
     * @param {HNODE} hHostNode If non-<b>NULL</b>, handle to the node that will perform the operation instead of the node 
     *        specified in <i>hNode</i>. If <b>NULL</b>, the node that handles the call 
     *        performs the operation.
     * @param {Integer} dwControlCode A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/node-control-codes">node control code</a> specifying the operation to be 
     *        performed. For the syntax associated with a control code, refer to  
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/control-code-architecture">Control Code Architecture</a> and the following 
     *        topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-enum-common-properties">CLUSCTL_NODE_ENUM_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-enum-private-properties">CLUSCTL_NODE_ENUM_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-characteristics">CLUSCTL_NODE_GET_CHARACTERISTICS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-common-properties">CLUSCTL_NODE_GET_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-common-property-fmts">CLUSCTL_NODE_GET_COMMON_PROPERTY_FMTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-flags">CLUSCTL_NODE_GET_FLAGS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-id">CLUSCTL_NODE_GET_ID</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-name">CLUSCTL_NODE_GET_NAME</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-private-properties">CLUSCTL_NODE_GET_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-private-property-fmts">CLUSCTL_NODE_GET_PRIVATE_PROPERTY_FMTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-ro-common-properties">CLUSCTL_NODE_GET_RO_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-get-ro-private-properties">CLUSCTL_NODE_GET_RO_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-set-common-properties">CLUSCTL_NODE_SET_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-set-private-properties">CLUSCTL_NODE_SET_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-unknown">CLUSCTL_NODE_UNKNOWN</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-validate-common-properties">CLUSCTL_NODE_VALIDATE_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-node-validate-private-properties">CLUSCTL_NODE_VALIDATE_PRIVATE_PROPERTIES</a>
     * </li>
     * </ul>
     * @param {Pointer} lpInBuffer Pointer to an input buffer containing information needed for the operation, or <b>NULL</b> 
     *        if no information is needed.
     * @param {Integer} nInBufferSize The allocated size (in bytes) of the input buffer.
     * @param {Pointer} lpOutBuffer Pointer to an output buffer to receive the data resulting from the operation, or 
     *        <b>NULL</b> if no data will be returned.
     * @param {Integer} nOutBufferSize The allocated size (in bytes) of the output buffer.
     * @param {Pointer<UInt32>} lpBytesReturned Returns the actual size (in bytes) of the data resulting from the operation. If this information is not 
     *        needed, pass <b>NULL</b> for <i>lpBytesReturned</i>.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful. If the operation required an output buffer, 
     *          <i>lpBytesReturned</i> (if not <b>NULL</b> on input) points to the 
     *          actual size of the data returned in the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer pointed to by <i>lpOutBuffer</i> was not large enough to hold the data 
     *          resulting from the operation. The <i>lpBytesReturned</i> parameter (if not 
     *          <b>NULL</b> on input) points to the size required for the output buffer. Only operations 
     *          requiring an output buffer return <b>ERROR_MORE_DATA</b>. If the 
     *          <i>lpOutBuffer</i> parameter is <b>NULL</b> and the 
     *          <i>nOutBufferSize</i> parameter is zero, then <b>ERROR_SUCCESS</b> may 
     *          be returned, not <b>ERROR_MORE_DATA</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/Debug/system-error-codes">System error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. If the operation required an output buffer, the value specified by 
     *          <i>lpBytesReturned</i> (if not <b>NULL</b> on input) is 
     *          unreliable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternodecontrol
     * @since windowsserver2008
     */
    static ClusterNodeControl(hNode, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned) {
        result := DllCall("CLUSAPI.dll\ClusterNodeControl", "ptr", hNode, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesReturned, "uint")
        return result
    }

    /**
     * 
     * @param {HNODE} hNode 
     * @param {HNODE} hHostNode 
     * @param {Integer} dwControlCode 
     * @param {Pointer} lpInBuffer 
     * @param {Integer} nInBufferSize 
     * @param {Pointer} lpOutBuffer 
     * @param {Integer} nOutBufferSize 
     * @param {Pointer<UInt32>} lpBytesReturned 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterNodeControlEx(hNode, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\ClusterNodeControlEx", "ptr", hNode, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesReturned, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Retrieves the Name private property of the Network Name resource on which a resource is dependent.
     * @param {HRESOURCE} hResource Handle to the dependent resource.
     * @param {PWSTR} lpBuffer Buffer containing a null-terminated Unicode string that contains the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-names-name">Name</a> private property of the Network Name 
     *       resource on which the resource depends.
     * @param {Pointer<UInt32>} nSize On input, pointer to a count of characters in the buffer pointed to by <i>lpBuffer</i>. 
     *       On output, pointer to a count of characters in the network name of the Network Name resource contained in the 
     *       buffer pointed to by <i>lpBuffer</i>, excluding the null-terminating character.
     * @returns {BOOL} If the operation succeeds, the function returns <b>TRUE</b>.
     * 
     * If the operation fails, the function returns <b>FALSE</b>. For more information about the 
     *        error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusterresourcenetworkname
     * @since windowsserver2008
     */
    static GetClusterResourceNetworkName(hResource, lpBuffer, nSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterResourceNetworkName", "ptr", hResource, "ptr", lpBuffer, "uint*", nSize, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens an enumerator for iterating through a resource's dependencies and nodes.
     * @param {HRESOURCE} hResource A handle to a resource.
     * @param {Integer} dwType A bitmask that describes the type of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-objects">cluster objects</a> 
     *        to be enumerated.
     * 
     * 
     * The following values of the 
     *         <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_enum">CLUSTER_RESOURCE_ENUM</a> enumeration are valid.
     * @returns {HRESENUM} If the operation succeeds, the function returns an enumeration handle.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information about the 
     *        error, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterresourceopenenum
     * @since windowsserver2008
     */
    static ClusterResourceOpenEnum(hResource, dwType) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\ClusterResourceOpenEnum", "ptr", hResource, "uint", dwType, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the number of cluster objects associated with a resource enumeration handle.
     * @param {HRESENUM} hResEnum Handle to a resource enumeration. This handle is obtained from  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceopenenum">ClusterResourceOpenEnum</a>. A valid handle is required. This parameter cannot be <b>NULL</b>.
     * @returns {Integer} <b>ClusterResourceGetEnumCount</b> returns the number of objects associated with the enumeration handle.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterresourcegetenumcount
     * @since windowsserver2008
     */
    static ClusterResourceGetEnumCount(hResEnum) {
        result := DllCall("CLUSAPI.dll\ClusterResourceGetEnumCount", "ptr", hResEnum, "uint")
        return result
    }

    /**
     * Enumerates a resource's dependent resources, nodes, or both.
     * @param {HRESENUM} hResEnum A resource enumeration handle returned from 
     *        the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourceopenenum">ClusterResourceOpenEnum</a> function.
     * @param {Integer} dwIndex The index of the resource or node object to return. This parameter should be zero for the first call to the 
     *        <b>ClusterResourceEnum</b> function and then 
     *        incremented for subsequent calls.
     * @param {Pointer<UInt32>} lpdwType The type of object returned by 
     *        <b>ClusterResourceEnum</b>.
     * 
     * 
     * The possible values are one of the following <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_enum">CLUSTER_RESOURCE_ENUM</a> enumeration values:
     * @param {PWSTR} lpszName A pointer to a null-terminated Unicode string containing the name of the returned object.
     * @param {Pointer<UInt32>} lpcchName A pointer to the size of the <i>lpszName</i> buffer as a count of characters. On input, 
     *        specify the maximum number of characters the buffer can hold, including the terminating null character. On 
     *        output, specifies the number of characters in the resulting name, excluding the terminating null character.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully or the <i>lpszName</i> parameter is 
     *          <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>lpszName</i> parameter is not big enough to hold the 
     *          result. The <i>lpcchName</i> parameter returns the number of characters in the result, 
     *          excluding the terminating null character.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * <dt>259 (0x103)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more objects to be returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/Debug/system-error-codes">System error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Any other returned error code indicates that the operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterresourceenum
     * @since windowsserver2008
     */
    static ClusterResourceEnum(hResEnum, dwIndex, lpdwType, lpszName, lpcchName) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        result := DllCall("CLUSAPI.dll\ClusterResourceEnum", "ptr", hResEnum, "uint", dwIndex, "uint*", lpdwType, "ptr", lpszName, "uint*", lpcchName, "uint")
        return result
    }

    /**
     * Closes a resource enumeration handle.
     * @param {HRESENUM} hResEnum A resource enumeration handle to be closed.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     *      If the operation fails, 
     * the function returns a different <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterresourcecloseenum
     * @since windowsserver2008
     */
    static ClusterResourceCloseEnum(hResEnum) {
        result := DllCall("CLUSAPI.dll\ClusterResourceCloseEnum", "ptr", hResEnum, "uint")
        return result
    }

    /**
     * Creates a resource type in a cluster.
     * @param {HCLUSTER} hCluster Handle to the cluster to receive the new resource type.
     * @param {PWSTR} lpszResourceTypeName Pointer to a null-terminated Unicode string containing the name of the new resource type. The specified name must be unique within the cluster.
     * @param {PWSTR} lpszDisplayName Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/display-names">display name</a> for the new resource type. While the content of <i>lpszResourceTypeName</i> should uniquely identify the resource type on all clusters, the content of <i>lpszDisplayName</i> should be a localized friendly name for the resource suitable for displaying to administrators.
     * @param {PWSTR} lpszResourceTypeDll Pointer to the fully qualified name of the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a> for the new resource type or the path name relative to the Cluster directory.
     * @param {Integer} dwLooksAlivePollInterval Default millisecond value to be used as the poll interval needed by the new resource type's  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plooks_alive_routine">LooksAlive</a> function. The <i>dwLooksAlivePollInterval</i> parameter is used to set the resource type's  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-types-looksalivepollinterval">LooksAlivePollInterval</a> property.
     * @param {Integer} dwIsAlivePollInterval Default millisecond value to be used as the poll interval needed by the new resource type's  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pis_alive_routine">IsAlive</a> function. The <i>dwIsAlivePollInterval</i> parameter is used to set the resource type's  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-types-isalivepollinterval">IsAlivePollInterval</a> property.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-createclusterresourcetype
     * @since windowsserver2008
     */
    static CreateClusterResourceType(hCluster, lpszResourceTypeName, lpszDisplayName, lpszResourceTypeDll, dwLooksAlivePollInterval, dwIsAlivePollInterval) {
        lpszResourceTypeName := lpszResourceTypeName is String ? StrPtr(lpszResourceTypeName) : lpszResourceTypeName
        lpszDisplayName := lpszDisplayName is String ? StrPtr(lpszDisplayName) : lpszDisplayName
        lpszResourceTypeDll := lpszResourceTypeDll is String ? StrPtr(lpszResourceTypeDll) : lpszResourceTypeDll

        result := DllCall("CLUSAPI.dll\CreateClusterResourceType", "ptr", hCluster, "ptr", lpszResourceTypeName, "ptr", lpszDisplayName, "ptr", lpszResourceTypeDll, "uint", dwLooksAlivePollInterval, "uint", dwIsAlivePollInterval, "uint")
        return result
    }

    /**
     * Removes a resource type from a cluster.
     * @param {HCLUSTER} hCluster Handle to the cluster containing the resource type to be removed.
     * @param {PWSTR} lpszResourceTypeName Pointer to a null-terminated Unicode string containing the name of the resource type to be removed.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-deleteclusterresourcetype
     * @since windowsserver2008
     */
    static DeleteClusterResourceType(hCluster, lpszResourceTypeName) {
        lpszResourceTypeName := lpszResourceTypeName is String ? StrPtr(lpszResourceTypeName) : lpszResourceTypeName

        result := DllCall("CLUSAPI.dll\DeleteClusterResourceType", "ptr", hCluster, "ptr", lpszResourceTypeName, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {PWSTR} lpszResourceTypeName 
     * @param {PWSTR} lpszDisplayName 
     * @param {PWSTR} lpszResourceTypeDll 
     * @param {Integer} dwLooksAlivePollInterval 
     * @param {Integer} dwIsAlivePollInterval 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static CreateClusterResourceTypeEx(hCluster, lpszResourceTypeName, lpszDisplayName, lpszResourceTypeDll, dwLooksAlivePollInterval, dwIsAlivePollInterval, lpszReason) {
        lpszResourceTypeName := lpszResourceTypeName is String ? StrPtr(lpszResourceTypeName) : lpszResourceTypeName
        lpszDisplayName := lpszDisplayName is String ? StrPtr(lpszDisplayName) : lpszDisplayName
        lpszResourceTypeDll := lpszResourceTypeDll is String ? StrPtr(lpszResourceTypeDll) : lpszResourceTypeDll
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\CreateClusterResourceTypeEx", "ptr", hCluster, "ptr", lpszResourceTypeName, "ptr", lpszDisplayName, "ptr", lpszResourceTypeDll, "uint", dwLooksAlivePollInterval, "uint", dwIsAlivePollInterval, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {PWSTR} lpszTypeName 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static DeleteClusterResourceTypeEx(hCluster, lpszTypeName, lpszReason) {
        lpszTypeName := lpszTypeName is String ? StrPtr(lpszTypeName) : lpszTypeName
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\DeleteClusterResourceTypeEx", "ptr", hCluster, "ptr", lpszTypeName, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Opens an enumerator for iterating through a resource type's possible owner nodes or resources.
     * @param {HCLUSTER} hCluster <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">Cluster</a> handle.
     * @param {PWSTR} lpszResourceTypeName A null-terminated Unicode string containing the name of the resource type.
     * @param {Integer} dwType Bitmask describing the type of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-objects">cluster objects</a> to be 
     *        enumerated. The following values of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_type_enum">CLUSTER_RESOURCE_TYPE_ENUM</a> enumeration are valid.
     * @returns {HRESTYPEENUM} If the operation succeeds, the function returns an enumeration handle which can be used in subsequent calls 
     *        to <a href="/windows/desktop/api/clusapi/nf-clusapi-clusterresourcetypeenum">ClusterResourceTypeEnum</a>.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information about the 
     *       error, call the function <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterresourcetypeopenenum
     * @since windowsserver2008
     */
    static ClusterResourceTypeOpenEnum(hCluster, lpszResourceTypeName, dwType) {
        lpszResourceTypeName := lpszResourceTypeName is String ? StrPtr(lpszResourceTypeName) : lpszResourceTypeName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\ClusterResourceTypeOpenEnum", "ptr", hCluster, "ptr", lpszResourceTypeName, "uint", dwType, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the number of cluster objects associated with a resource_type enumeration handle.
     * @param {HRESTYPEENUM} hResTypeEnum Handle to a resource type enumeration. This handle is obtained from  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourcetypeopenenum">ClusterResourceTypeOpenEnum</a>. A valid handle is required. This parameter cannot be <b>NULL</b>.
     * @returns {Integer} <b>ClusterResourceTypeGetEnumCount</b> returns the number of objects associated with the enumeration handle.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterresourcetypegetenumcount
     * @since windowsserver2008
     */
    static ClusterResourceTypeGetEnumCount(hResTypeEnum) {
        result := DllCall("CLUSAPI.dll\ClusterResourceTypeGetEnumCount", "ptr", hResTypeEnum, "uint")
        return result
    }

    /**
     * Enumerates a resource type's possible owner nodes or resources.
     * @param {HRESTYPEENUM} hResTypeEnum Resource type enumeration handle returned from 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterresourcetypeopenenum">ClusterResourceTypeOpenEnum</a>.
     * @param {Integer} dwIndex Index of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources">resource</a> or node object to return. This 
     *        parameter should be zero for the first call to 
     *        <b>ClusterResourceTypeEnum</b> and then 
     *        incremented for subsequent calls.
     * @param {Pointer<UInt32>} lpdwType Type of object returned by 
     *        <b>ClusterResourceTypeEnum</b>. The following 
     *        values of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_type_enum">CLUSTER_RESOURCE_TYPE_ENUM</a> 
     *        enumeration are valid.
     * @param {PWSTR} lpszName Pointer to a null-terminated Unicode string containing the name of the returned object.
     * @param {Pointer<UInt32>} lpcchName Pointer to the size of the <i>lpszName</i> buffer as a count of characters. On input, 
     *        specify the maximum number of characters the buffer can hold, including the terminating 
     *        <b>NULL</b>. On output, specifies the number of characters in the resulting name, excluding 
     *        the terminating <b>NULL</b>.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * <dt>259</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more objects to be returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpszName</i> is not big enough to hold the result. The 
     *          <i>lpcchName</i> parameter returns the number of characters in the result, excluding the 
     *          terminating <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/Debug/system-error-codes">System error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterresourcetypeenum
     * @since windowsserver2008
     */
    static ClusterResourceTypeEnum(hResTypeEnum, dwIndex, lpdwType, lpszName, lpcchName) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        result := DllCall("CLUSAPI.dll\ClusterResourceTypeEnum", "ptr", hResTypeEnum, "uint", dwIndex, "uint*", lpdwType, "ptr", lpszName, "uint*", lpcchName, "uint")
        return result
    }

    /**
     * Closes a resource type enumeration handle.
     * @param {HRESTYPEENUM} hResTypeEnum Enumeration handle to be closed.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterresourcetypecloseenum
     * @since windowsserver2008
     */
    static ClusterResourceTypeCloseEnum(hResTypeEnum) {
        result := DllCall("CLUSAPI.dll\ClusterResourceTypeCloseEnum", "ptr", hResTypeEnum, "uint")
        return result
    }

    /**
     * Opens a connection to a network and returns a handle to it.
     * @param {HCLUSTER} hCluster Handle to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>.
     * @param {PWSTR} lpszNetworkName Pointer to the name of an existing network.
     * @returns {HNETWORK} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the function 
     *         <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the operation was successful, 
     *        <b>OpenClusterNetwork</b> returns a network handle.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-openclusternetwork
     * @since windowsserver2008
     */
    static OpenClusterNetwork(hCluster, lpszNetworkName) {
        lpszNetworkName := lpszNetworkName is String ? StrPtr(lpszNetworkName) : lpszNetworkName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\OpenClusterNetwork", "ptr", hCluster, "ptr", lpszNetworkName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a connection to a network and returns a handle to it.
     * @param {HCLUSTER} hCluster Handle to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>.
     * @param {PWSTR} lpszNetworkName Pointer to the name of an existing network.
     * @param {Integer} dwDesiredAccess The requested access privileges. This may be any combination of <b>GENERIC_READ</b> 
     *       (0x80000000), <b>GENERIC_ALL</b> (0x10000000), or <b>MAXIMUM_ALLOWED</b> 
     *       (0x02000000). If this value is zero (0) and undefined error may be returned. Using 
     *       <b>GENERIC_ALL</b> is the same as calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-openclusternetwork">OpenClusterNetwork</a>.
     * @param {Pointer<UInt32>} lpdwGrantedAccess Optional parameter that contains the address of a <b>DWORD</b> that will receive the 
     *       access rights granted. If the <i>DesiredAccess</i> parameter is 
     *       <b>MAXIMUM_ALLOWED</b> (0x02000000) then the <b>DWORD</b> pointed to by 
     *       this parameter will contain the maximum privileges granted to this user.
     * @returns {HNETWORK} If the operation was successful, 
     *       <b>OpenClusterNetworkEx</b> returns a network 
     *       handle.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the 
     *         <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. If the target server does not 
     *         support the <a href="/windows/desktop/api/clusapi/nf-clusapi-openclusternetworkex">OpenClusterNetworkEx</a> function 
     *         (for example if the target server is running Windows Server 2008 or earlier) then the 
     *         <b>GetLastError</b> function will return 
     *         <b>RPC_S_PROCNUM_OUT_OF_RANGE</b> (1745).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-openclusternetworkex
     * @since windowsserver2008
     */
    static OpenClusterNetworkEx(hCluster, lpszNetworkName, dwDesiredAccess, lpdwGrantedAccess) {
        lpszNetworkName := lpszNetworkName is String ? StrPtr(lpszNetworkName) : lpszNetworkName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\OpenClusterNetworkEx", "ptr", hCluster, "ptr", lpszNetworkName, "uint", dwDesiredAccess, "uint*", lpdwGrantedAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes a network handle.
     * @param {HNETWORK} hNetwork Handle to the network to close.
     * @returns {BOOL} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful; call the function  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for more information.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-closeclusternetwork
     * @since windowsserver2008
     */
    static CloseClusterNetwork(hNetwork) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\CloseClusterNetwork", "ptr", hNetwork, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns a handle to the cluster associated with a network.
     * @param {HNETWORK} hNetwork Handle to the network.
     * @returns {HCLUSTER} If the operation succeeds, the function returns a handle to the cluster that owns the network.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information about the error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusterfromnetwork
     * @since windowsserver2008
     */
    static GetClusterFromNetwork(hNetwork) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterFromNetwork", "ptr", hNetwork, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens an enumerator for iterating through objects on a network.
     * @param {HNETWORK} hNetwork A handle to a network.
     * @param {Integer} dwType 
     * @returns {HNETWORKENUM} If the operation was successful, 
     *        <b>ClusterNetworkOpenEnum</b> returns a handle to a 
     *         network enumerator.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For 
     *         more information about the error, call the function 
     *         <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternetworkopenenum
     * @since windowsserver2008
     */
    static ClusterNetworkOpenEnum(hNetwork, dwType) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\ClusterNetworkOpenEnum", "ptr", hNetwork, "uint", dwType, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the number of cluster objects associated with a network enumeration handle.
     * @param {HNETWORKENUM} hNetworkEnum Handle to a network enumeration. This handle is obtained from 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusternetworkopenenum">ClusterNetworkOpenEnum</a>. A valid handle is 
     *       required. This parameter cannot be <b>NULL</b>.
     * @returns {Integer} <b>ClusterNetworkGetEnumCount</b> returns the 
     *        number of objects associated with the enumeration handle.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternetworkgetenumcount
     * @since windowsserver2008
     */
    static ClusterNetworkGetEnumCount(hNetworkEnum) {
        result := DllCall("CLUSAPI.dll\ClusterNetworkGetEnumCount", "ptr", hNetworkEnum, "uint")
        return result
    }

    /**
     * Enumerates cluster objects on a network, returning the name of one object with each call.
     * @param {HNETWORKENUM} hNetworkEnum A handle to an existing enumeration object originally returned by the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusternetworkopenenum">ClusterNetworkOpenEnum</a> function.
     * @param {Integer} dwIndex The index used to identify the next entry to be enumerated. This parameter should be zero for the first call 
     *        to <b>ClusterNetworkEnum</b> and then incremented for 
     *        subsequent calls.
     * @param {Pointer<UInt32>} lpdwType A pointer to the type of object returned. The following value of the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_network_enum">CLUSTER_NETWORK_ENUM</a> enumeration is returned with 
     *        each call.
     * @param {PWSTR} lpszName A pointer to a null-terminated Unicode string containing the name of the returned object.
     * @param {Pointer<UInt32>} lpcchName A pointer to the size of the <i>lpszName</i> buffer as a count of characters. On input, 
     *        specify the maximum number of characters the buffer can hold, including the terminating 
     *        <b>NULL</b>. On output, specifies the number of characters in the resulting name, excluding 
     *        the terminating <b>NULL</b>.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More data is available. This value is returned if the buffer pointed to by 
     *          <i>lpszName</i> is not big enough to hold the result. The 
     *          <i>lpcchName</i> parameter returns the number of characters in the result, excluding the 
     *          terminating <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * <dt>259 (0x103)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more data is available. This value is returned if there are no more objects of the requested type to be 
     *          returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternetworkenum
     * @since windowsserver2008
     */
    static ClusterNetworkEnum(hNetworkEnum, dwIndex, lpdwType, lpszName, lpcchName) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        result := DllCall("CLUSAPI.dll\ClusterNetworkEnum", "ptr", hNetworkEnum, "uint", dwIndex, "uint*", lpdwType, "ptr", lpszName, "uint*", lpcchName, "uint")
        return result
    }

    /**
     * Closes a network enumeration handle.
     * @param {HNETWORKENUM} hNetworkEnum Handle to the network enumerator to close. This is a handle originally returned by the  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusternetworkopenenum">ClusterNetworkOpenEnum</a> function.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternetworkcloseenum
     * @since windowsserver2008
     */
    static ClusterNetworkCloseEnum(hNetworkEnum) {
        result := DllCall("CLUSAPI.dll\ClusterNetworkCloseEnum", "ptr", hNetworkEnum, "uint")
        return result
    }

    /**
     * Current state of a network.
     * @param {HNETWORK} hNetwork Handle to the network for which state information should be returned.
     * @returns {Integer} <b>GetClusterNetworkState</b> returns the current 
     *        state of the network, which is represented by one of the following values enumerated by the 
     *        <a href="/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_network_state">CLUSTER_NETWORK_STATE</a> enumeration.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterNetworkUnavailable</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All of the network interfaces on the network are unavailable, which means that the nodes that own the 
     *         network interfaces are down.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterNetworkDown</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is not operational; none of the <a href="/previous-versions/windows/desktop/mscs/nodes">nodes</a> on the 
     *         network can communicate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterNetworkPartitioned</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is operational, but two or more nodes on the network cannot communicate. Typically a 
     *         path-specific problem has occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterNetworkUp</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is operational; all of the nodes in the cluster can communicate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterNetworkStateUnknown</b></dt>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the function 
     *         <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusternetworkstate
     * @since windowsserver2008
     */
    static GetClusterNetworkState(hNetwork) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterNetworkState", "ptr", hNetwork, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the name for a network.
     * @param {HNETWORK} hNetwork Handle to a network to name.
     * @param {PWSTR} lpszName Pointer to a null-terminated Unicode string containing the new network name.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-setclusternetworkname
     * @since windowsserver2008
     */
    static SetClusterNetworkName(hNetwork, lpszName) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName

        result := DllCall("CLUSAPI.dll\SetClusterNetworkName", "ptr", hNetwork, "ptr", lpszName, "uint")
        return result
    }

    /**
     * 
     * @param {HNETWORK} hNetwork 
     * @param {PWSTR} lpszName 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static SetClusterNetworkNameEx(hNetwork, lpszName, lpszReason) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\SetClusterNetworkNameEx", "ptr", hNetwork, "ptr", lpszName, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Returns the identifier of a network.
     * @param {HNETWORK} hNetwork Handle to a network.
     * @param {PWSTR} lpszNetworkId Pointer to the identifier of the network associated with <i>hNetwork</i>, including the null-terminating character.
     * @param {Pointer<UInt32>} lpcchName Pointer to the size of the <i>lpszNetworkID</i> buffer as a count of characters. On input, specify the maximum number of characters the buffer can hold, including the terminating <b>NULL</b>. On output, specifies the number of characters in the resulting name, excluding the terminating <b>NULL</b>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is one of the possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpszNetworkID</i> is not big enough to hold the result. The <i>lpcchNetworkID</i> parameter returns the number of characters in the result, excluding the terminating <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusternetworkid
     * @since windowsserver2008
     */
    static GetClusterNetworkId(hNetwork, lpszNetworkId, lpcchName) {
        lpszNetworkId := lpszNetworkId is String ? StrPtr(lpszNetworkId) : lpszNetworkId

        result := DllCall("CLUSAPI.dll\GetClusterNetworkId", "ptr", hNetwork, "ptr", lpszNetworkId, "uint*", lpcchName, "uint")
        return result
    }

    /**
     * Initiates an operation on a network. The operation performed depends on the control code passed to the dwControlCode parameter.
     * @param {HNETWORK} hNetwork Handle to the network to be affected by the operation.
     * @param {HNODE} hHostNode If non-<b>NULL</b>, handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">node</a> 
     *        hosting the affected network. If <b>NULL</b>, the local node performs the operation. 
     *        Specifying <i>hHostNode</i> is optional.
     * @param {Integer} dwControlCode A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-control-codes">network control code</a> specifying the 
     *        operation to be performed. For the syntax associated with a control code, refer to  
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/control-code-architecture">Control Code Architecture</a> and the following 
     *        topics:
     * 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-enum-common-properties">CLUSCTL_NETWORK_ENUM_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-enum-private-properties">CLUSCTL_NETWORK_ENUM_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-characteristics">CLUSCTL_NETWORK_GET_CHARACTERISTICS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-common-properties">CLUSCTL_NETWORK_GET_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-common-property-fmts">CLUSCTL_NETWORK_GET_COMMON_PROPERTY_FMTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-flags">CLUSCTL_NETWORK_GET_FLAGS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-id">CLUSCTL_NETWORK_GET_ID</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-name">CLUSCTL_NETWORK_GET_NAME</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-private-properties">CLUSCTL_NETWORK_GET_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-private-property-fmts">CLUSCTL_NETWORK_GET_PRIVATE_PROPERTY_FMTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-ro-common-properties">CLUSCTL_NETWORK_GET_RO_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-get-ro-private-properties">CLUSCTL_NETWORK_GET_RO_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-set-common-properties">CLUSCTL_NETWORK_SET_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-set-private-properties">CLUSCTL_NETWORK_SET_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-unknown">CLUSCTL_NETWORK_UNKNOWN</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-validate-common-properties">CLUSCTL_NETWORK_VALIDATE_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-network-validate-private-properties">CLUSCTL_NETWORK_VALIDATE_PRIVATE_PROPERTIES</a>
     * </li>
     * </ul>
     * @param {Pointer} lpInBuffer Pointer to an input buffer containing information needed for the operation, or <b>NULL</b> 
     *        if no information is needed.
     * @param {Integer} nInBufferSize The allocated size (in bytes) of the input buffer.
     * @param {Pointer} lpOutBuffer Pointer to an output buffer to receive the data resulting from the operation, or 
     *        <b>NULL</b> if no data will be returned.
     * @param {Integer} nOutBufferSize The allocated size (in bytes) of the output buffer.
     * @param {Pointer<UInt32>} lpBytesReturned Returns the actual size (in bytes) of the data resulting from the operation. If this information is not 
     *        needed, pass <b>NULL</b> for <i>lpBytesReturned</i>.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful. If the operation required an output buffer, 
     *          <i>lpBytesReturned</i> (if not <b>NULL</b> on input) points to the 
     *          actual size of the data returned in the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer pointed to by <i>lpOutBuffer</i> was not large enough to hold the data 
     *          resulting from the operation. The <i>lpBytesReturned</i> parameter (if not 
     *          <b>NULL</b> on input) points to the size required for the output buffer. Only operations 
     *          requiring an output buffer return <b>ERROR_MORE_DATA</b>. If the 
     *          <i>lpOutBuffer</i> parameter is <b>NULL</b> and the 
     *          <i>nOutBufferSize</i> parameter is zero, then <b>ERROR_SUCCESS</b> may 
     *          be returned, not <b>ERROR_MORE_DATA</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/Debug/system-error-codes">System error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. If the operation required an output buffer, the value specified by 
     *          <i>lpBytesReturned</i> (if not <b>NULL</b> on input) is unreliable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternetworkcontrol
     * @since windowsserver2008
     */
    static ClusterNetworkControl(hNetwork, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned) {
        result := DllCall("CLUSAPI.dll\ClusterNetworkControl", "ptr", hNetwork, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesReturned, "uint")
        return result
    }

    /**
     * 
     * @param {HNETWORK} hNetwork 
     * @param {HNODE} hHostNode 
     * @param {Integer} dwControlCode 
     * @param {Pointer} lpInBuffer 
     * @param {Integer} nInBufferSize 
     * @param {Pointer} lpOutBuffer 
     * @param {Integer} nOutBufferSize 
     * @param {Pointer<UInt32>} lpBytesReturned 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterNetworkControlEx(hNetwork, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\ClusterNetworkControlEx", "ptr", hNetwork, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesReturned, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Opens a handle to a network interface.
     * @param {HCLUSTER} hCluster Handle to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>.
     * @param {PWSTR} lpszInterfaceName Pointer to a null-terminated Unicode string containing the name of the network interface to open.
     * @returns {HNETINTERFACE} If the operation was successful, 
     *        <b>OpenClusterNetInterface</b> returns an open 
     *        handle to the specified network interface.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the function 
     *         <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-openclusternetinterface
     * @since windowsserver2008
     */
    static OpenClusterNetInterface(hCluster, lpszInterfaceName) {
        lpszInterfaceName := lpszInterfaceName is String ? StrPtr(lpszInterfaceName) : lpszInterfaceName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\OpenClusterNetInterface", "ptr", hCluster, "ptr", lpszInterfaceName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens a handle to a network interface.
     * @param {HCLUSTER} hCluster Handle to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>.
     * @param {PWSTR} lpszInterfaceName Pointer to a null-terminated Unicode string containing the name of the network interface to open.
     * @param {Integer} dwDesiredAccess The requested access privileges. This may be any combination of <b>GENERIC_READ</b> 
     *       (0x80000000), <b>GENERIC_ALL</b> (0x10000000), or <b>MAXIMUM_ALLOWED</b> 
     *       (0x02000000). If this value is zero (0) and undefined error may be returned. Using 
     *       <b>GENERIC_ALL</b> is the same as calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-openclusternetinterface">OpenClusterNetInterface</a>.
     * @param {Pointer<UInt32>} lpdwGrantedAccess Optional parameter that contains the address of a <b>DWORD</b> that will receive the 
     *       access rights granted. If the <i>DesiredAccess</i> parameter is 
     *       <b>MAXIMUM_ALLOWED</b> (0x02000000) then the <b>DWORD</b> pointed to by 
     *       this parameter will contain the maximum privileges granted to this user.
     * @returns {HNETINTERFACE} If the operation was successful, 
     *        <b>OpenClusterNetInterfaceEx</b> returns an open 
     *        handle to the specified network interface.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the 
     *         <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function. If the target server does not 
     *         support the <a href="/windows/desktop/api/clusapi/nf-clusapi-openclusternetinterfaceex">OpenClusterNetInterfaceEx</a> 
     *         function (for example if the target server is running Windows Server 2008 or earlier) then the 
     *         <b>GetLastError</b> function will return 
     *         <b>RPC_S_PROCNUM_OUT_OF_RANGE</b> (1745).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-openclusternetinterfaceex
     * @since windowsserver2008
     */
    static OpenClusterNetInterfaceEx(hCluster, lpszInterfaceName, dwDesiredAccess, lpdwGrantedAccess) {
        lpszInterfaceName := lpszInterfaceName is String ? StrPtr(lpszInterfaceName) : lpszInterfaceName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\OpenClusterNetInterfaceEx", "ptr", hCluster, "ptr", lpszInterfaceName, "uint", dwDesiredAccess, "uint*", lpdwGrantedAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the name of a node's interface to a network in a cluster.
     * @param {HCLUSTER} hCluster Handle to a cluster.
     * @param {PWSTR} lpszNodeName Pointer to a null-terminated Unicode string containing the name of the node in the cluster.
     * @param {PWSTR} lpszNetworkName Pointer to a null-terminated Unicode string containing the name of the network.
     * @param {PWSTR} lpszInterfaceName Pointer to an output buffer holding the name of the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-interfaces">network interface</a>.
     * @param {Pointer<UInt32>} lpcchInterfaceName Pointer to the size of the <i>lpszInterfaceName</i> buffer as a count of characters. On input, specify the maximum number of characters the buffer can hold, including the terminating <b>NULL</b>. On output, specifies the number of characters in the resulting name, excluding the terminating <b>NULL</b>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is one of the possible values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpszInterfaceName</i> is not big enough to hold the result. The <i>lpcchInterfaceName</i> parameter returns the number of characters in the result, excluding the terminating <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusternetinterface
     * @since windowsserver2008
     */
    static GetClusterNetInterface(hCluster, lpszNodeName, lpszNetworkName, lpszInterfaceName, lpcchInterfaceName) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName
        lpszNetworkName := lpszNetworkName is String ? StrPtr(lpszNetworkName) : lpszNetworkName
        lpszInterfaceName := lpszInterfaceName is String ? StrPtr(lpszInterfaceName) : lpszInterfaceName

        result := DllCall("CLUSAPI.dll\GetClusterNetInterface", "ptr", hCluster, "ptr", lpszNodeName, "ptr", lpszNetworkName, "ptr", lpszInterfaceName, "uint*", lpcchInterfaceName, "uint")
        return result
    }

    /**
     * Closes a network interface handle.
     * @param {HNETINTERFACE} hNetInterface Handle of the network interface to close.
     * @returns {BOOL} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful; call the function  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for more information.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-closeclusternetinterface
     * @since windowsserver2008
     */
    static CloseClusterNetInterface(hNetInterface) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\CloseClusterNetInterface", "ptr", hNetInterface, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns a handle to the cluster associated with a network interface.
     * @param {HNETINTERFACE} hNetInterface Handle to the network interface.
     * @returns {HCLUSTER} If the operation succeeds, the function returns a handle to the cluster that owns the network interface.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information about the error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusterfromnetinterface
     * @since windowsserver2008
     */
    static GetClusterFromNetInterface(hNetInterface) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterFromNetInterface", "ptr", hNetInterface, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns the current state of a network interface.
     * @param {HNETINTERFACE} hNetInterface Handle to the network interface for which state information should be returned.
     * @returns {Integer} <b>GetClusterNetInterfaceState</b> returns 
     *        the current state of the network interface, which is represented by one of the following values enumerated by 
     *        the <a href="/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_netinterface_state">CLUSTER_NETINTERFACE_STATE</a> 
     *        enumeration.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterNetInterfaceFailed</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network interface cannot communicate with any other network interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterNetInterfaceUnreachable</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network interface cannot communicate with at least one other network interface whose state is not <b>ClusterNetInterfaceFailed</b> or <b>ClusterNetInterfaceUnavailable</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterNetInterfaceUp</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network interface can communicate with all other network interfaces whose state is not <b>ClusterNetInterfaceFailed</b> or <b>ClusterNetInterfaceUnavailable</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterNetInterfaceUnavailable</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The node that owns the network interface is down.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterNetInterfaceStateUnknown</b></dt>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information about the error, call the function 
     *         <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusternetinterfacestate
     * @since windowsserver2008
     */
    static GetClusterNetInterfaceState(hNetInterface) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterNetInterfaceState", "ptr", hNetInterface, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initiates an operation that affects a network interface. The operation performed depends on the control code passed to the dwControlCode parameter.
     * @param {HNETINTERFACE} hNetInterface Handle to the network interface to be affected.
     * @param {HNODE} hHostNode If non-<b>NULL</b>, handle to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">node</a> that 
     *        owns the network interface to be affected. If <b>NULL</b>, the local node performs the 
     *        operation. Specifying <i>hHostNode</i> is optional.
     * @param {Integer} dwControlCode A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-interface-control-codes">network interface control code</a> 
     *        specifying the operation to be performed. For the syntax associated with a control code, refer to  
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/control-code-architecture">Control Code Architecture</a> and the following 
     *        topics:
     * 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-enum-common-properties">CLUSCTL_NETINTERFACE_ENUM_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-enum-private-properties">CLUSCTL_NETINTERFACE_ENUM_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-characteristics">CLUSCTL_NETINTERFACE_GET_CHARACTERISTICS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-common-properties">CLUSCTL_NETINTERFACE_GET_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-common-property-fmts">CLUSCTL_NETINTERFACE_GET_COMMON_PROPERTY_FMTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-flags">CLUSCTL_NETINTERFACE_GET_FLAGS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-id">CLUSCTL_NETINTERFACE_GET_ID</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-name">CLUSCTL_NETINTERFACE_GET_NAME</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-network">CLUSCTL_NETINTERFACE_GET_NETWORK</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-node">CLUSCTL_NETINTERFACE_GET_NODE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-private-properties">CLUSCTL_NETINTERFACE_GET_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-private-property-fmts">CLUSCTL_NETINTERFACE_GET_PRIVATE_PROPERTY_FMTS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-ro-common-properties">CLUSCTL_NETINTERFACE_GET_RO_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-get-ro-private-properties">CLUSCTL_NETINTERFACE_GET_RO_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-set-common-properties">CLUSCTL_NETINTERFACE_SET_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-set-private-properties">CLUSCTL_NETINTERFACE_SET_PRIVATE_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-unknown">CLUSCTL_NETINTERFACE_UNKNOWN</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-validate-common-properties">CLUSCTL_NETINTERFACE_VALIDATE_COMMON_PROPERTIES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-netinterface-validate-private-properties">CLUSCTL_NETINTERFACE_VALIDATE_PRIVATE_PROPERTIES</a>
     * </li>
     * </ul>
     * @param {Pointer} lpInBuffer Pointer to an input buffer containing information needed for the operation, or <b>NULL</b> 
     *        if no information is needed.
     * @param {Integer} nInBufferSize The allocated size (in bytes) of the input buffer.
     * @param {Pointer} lpOutBuffer Pointer to an output buffer to receive the data resulting from the operation, or 
     *        <b>NULL</b> if no data will be returned.
     * @param {Integer} nOutBufferSize The allocated size (in bytes) of the output buffer.
     * @param {Pointer<UInt32>} lpBytesReturned Returns the actual size (in bytes) of the data resulting from the operation. If this information is not 
     *        needed, pass <b>NULL</b> for <i>lpBytesReturned</i>.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful. If the operation required an output buffer, 
     *          <i>lpBytesReturned</i> (if not <b>NULL</b> on input) points to the actual size of the data 
     *          returned in the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer pointed to by <i>lpOutBuffer</i> was not large enough to hold the data 
     *          resulting from the operation. The <i>lpBytesReturned</i> parameter (if not 
     *          <b>NULL</b> on input) points to the size required for the output buffer. Only operations 
     *          requiring an output buffer return <b>ERROR_MORE_DATA</b>. If the 
     *          <i>lpOutBuffer</i> parameter is <b>NULL</b> and the 
     *          <i>nOutBufferSize</i> parameter is zero, then <b>ERROR_SUCCESS</b> may 
     *          be returned, not <b>ERROR_MORE_DATA</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/Debug/system-error-codes">System error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. If the operation required an output buffer, the value specified by 
     *          <i>lpBytesReturned</i> (if not <b>NULL</b> on input) is unreliable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusternetinterfacecontrol
     * @since windowsserver2008
     */
    static ClusterNetInterfaceControl(hNetInterface, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned) {
        result := DllCall("CLUSAPI.dll\ClusterNetInterfaceControl", "ptr", hNetInterface, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesReturned, "uint")
        return result
    }

    /**
     * 
     * @param {HNETINTERFACE} hNetInterface 
     * @param {HNODE} hHostNode 
     * @param {Integer} dwControlCode 
     * @param {Pointer} lpInBuffer 
     * @param {Integer} nInBufferSize 
     * @param {Pointer} lpOutBuffer 
     * @param {Integer} nOutBufferSize 
     * @param {Pointer<UInt32>} lpBytesReturned 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterNetInterfaceControlEx(hNetInterface, hHostNode, dwControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := DllCall("CLUSAPI.dll\ClusterNetInterfaceControlEx", "ptr", hNetInterface, "ptr", hHostNode, "uint", dwControlCode, "ptr", lpInBuffer, "uint", nInBufferSize, "ptr", lpOutBuffer, "uint", nOutBufferSize, "uint*", lpBytesReturned, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Opens the root of the cluster database subtree for a cluster.
     * @param {HCLUSTER} hCluster Handle to a cluster.
     * @param {Integer} samDesired Access mask that describes the security access needed for the new key. For more information and possible 
     *       values, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @returns {HKEY} If the operation succeeds, the function returns a database key handle for the cluster.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information about the error, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusterkey
     * @since windowsserver2008
     */
    static GetClusterKey(hCluster, samDesired) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterKey", "ptr", hCluster, "uint", samDesired, "ptr")
        if(A_LastError)
            throw OSError()

        return HKEY({Value: result}, True)
    }

    /**
     * Opens the root of the cluster database subtree for a group.
     * @param {HGROUP} hGroup Handle to a group.
     * @param {Integer} samDesired Access mask that describes the security access needed for the key.
     * @returns {HKEY} If the operation succeeds, the function returns a database key handle for the group.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information about the error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclustergroupkey
     * @since windowsserver2008
     */
    static GetClusterGroupKey(hGroup, samDesired) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterGroupKey", "ptr", hGroup, "uint", samDesired, "ptr")
        if(A_LastError)
            throw OSError()

        return HKEY({Value: result}, True)
    }

    /**
     * Opens the root of the cluster database subtree for a resource.
     * @param {HRESOURCE} hResource Handle to a resource.
     * @param {Integer} samDesired Access mask that describes the security access needed for the opened key.
     * @returns {HKEY} If the operation succeeds, the function returns a registry key handle for the resource.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information about the error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusterresourcekey
     * @since windowsserver2008
     */
    static GetClusterResourceKey(hResource, samDesired) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterResourceKey", "ptr", hResource, "uint", samDesired, "ptr")
        if(A_LastError)
            throw OSError()

        return HKEY({Value: result}, True)
    }

    /**
     * Opens the root of the cluster database subtree for a node.
     * @param {HNODE} hNode Handle to a node.
     * @param {Integer} samDesired Access mask that describes the security access needed for the key.
     * @returns {HKEY} If the operation succeeds, the function returns a registry key handle for the node.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information about the error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusternodekey
     * @since windowsserver2008
     */
    static GetClusterNodeKey(hNode, samDesired) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterNodeKey", "ptr", hNode, "uint", samDesired, "ptr")
        if(A_LastError)
            throw OSError()

        return HKEY({Value: result}, True)
    }

    /**
     * Opens the root of the cluster database subtree for a network.
     * @param {HNETWORK} hNetwork Handle to a network.
     * @param {Integer} samDesired Access mask that describes the security access needed for the new key.
     * @returns {HKEY} If the operation succeeds, the function returns a registry key handle for the network.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information about the error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusternetworkkey
     * @since windowsserver2008
     */
    static GetClusterNetworkKey(hNetwork, samDesired) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterNetworkKey", "ptr", hNetwork, "uint", samDesired, "ptr")
        if(A_LastError)
            throw OSError()

        return HKEY({Value: result}, True)
    }

    /**
     * Opens the root of the cluster database subtree for a network interface object.
     * @param {HNETINTERFACE} hNetInterface Handle to a network interface.
     * @param {Integer} samDesired Access mask that describes the security access needed for the key.
     * @returns {HKEY} If the operation succeeds, the function returns a registry key handle for the network interface.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information about the error, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getclusternetinterfacekey
     * @since windowsserver2008
     */
    static GetClusterNetInterfaceKey(hNetInterface, samDesired) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\GetClusterNetInterfaceKey", "ptr", hNetInterface, "uint", samDesired, "ptr")
        if(A_LastError)
            throw OSError()

        return HKEY({Value: result}, True)
    }

    /**
     * Creates a specified cluster database key. If the key already exists in the database, ClusterRegCreateKey opens it without making changes.
     * @param {HKEY} hKey Handle to an open cluster database key. This parameter cannot be <b>NULL</b>.
     * @param {PWSTR} lpszSubKey Pointer to a null-terminated Unicode string specifying the name of the subkey to be created or opened. The 
     *        <i>lpszSubKey</i> parameter must point to a subkey that:
     * 
     * <ul>
     * <li>Is a child key of the key identified by <i>hKey</i>.</li>
     * <li>Must not begin with the backslash character ( \ ).</li>
     * <li>Must not be <b>NULL</b>.</li>
     * </ul>
     * The <i>lpszSubKey</i> parameter can point to an empty string, causing 
     *        <b>ClusterRegCreateKey</b> to return a handle to the 
     *        database key represented by <i>hKey</i>.
     * @param {Integer} dwOptions Specifies special options for this key. Currently, <i>dwOptions</i> can be set to the 
     *        following value.
     * @param {Integer} samDesired Access mask that specifies the needed security access for the new key. The following values are valid.
     * 
     * For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes This parameter is ignored. To set the security attributes on a new registry key, call the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterregsetkeysecurity">ClusterRegSetKeySecurity</a> function after 
     *        <b>ClusterRegCreateKey</b> has returned 
     *        successfully.
     * @param {Pointer<HKEY>} phkResult Pointer to the handle of the opened or created key.
     * @param {Pointer<UInt32>} lpdwDisposition Pointer to a value that describes whether the key pointed to by <i>lpszSubKey</i> was 
     *        opened or created. The following values are valid.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregcreatekey
     * @since windowsserver2008
     */
    static ClusterRegCreateKey(hKey, lpszSubKey, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition) {
        lpszSubKey := lpszSubKey is String ? StrPtr(lpszSubKey) : lpszSubKey
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegCreateKey", "ptr", hKey, "ptr", lpszSubKey, "uint", dwOptions, "uint", samDesired, "ptr", lpSecurityAttributes, "ptr", phkResult, "uint*", lpdwDisposition, "int")
        return result
    }

    /**
     * 
     * @param {HKEY} hKey 
     * @param {PWSTR} lpSubKey 
     * @param {Integer} dwOptions 
     * @param {Integer} samDesired 
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes 
     * @param {Pointer<HKEY>} phkResult 
     * @param {Pointer<UInt32>} lpdwDisposition 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterRegCreateKeyEx(hKey, lpSubKey, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition, lpszReason) {
        lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegCreateKeyEx", "ptr", hKey, "ptr", lpSubKey, "uint", dwOptions, "uint", samDesired, "ptr", lpSecurityAttributes, "ptr", phkResult, "uint*", lpdwDisposition, "ptr", lpszReason, "int")
        return result
    }

    /**
     * Opens an existing cluster database key.
     * @param {HKEY} hKey Handle to a currently open key. This parameter cannot be <b>NULL</b>.
     * @param {PWSTR} lpszSubKey Pointer to a null-terminated Unicode string specifying the name of the subkey to be created or opened. The <i>lpszSubKey</i> parameter must point to a subkey that:
     * 
     * <ul>
     * <li>Is a child key of the key identified by <i>hKey</i>.</li>
     * <li>Must not begin with the backslash character ( \ ).</li>
     * <li>Must not be <b>NULL</b>.</li>
     * </ul>
     * The <i>lpszSubKey</i> parameter can point to an empty string, causing  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterregcreatekey">ClusterRegCreateKey</a> to return a handle to the database key represented by <i>hKey</i>.
     * @param {Integer} samDesired Access mask that specifies the security access needed for the new key.
     * @param {Pointer<HKEY>} phkResult Pointer to a handle to the opened or created key.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregopenkey
     * @since windowsserver2008
     */
    static ClusterRegOpenKey(hKey, lpszSubKey, samDesired, phkResult) {
        lpszSubKey := lpszSubKey is String ? StrPtr(lpszSubKey) : lpszSubKey
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegOpenKey", "ptr", hKey, "ptr", lpszSubKey, "uint", samDesired, "ptr", phkResult, "int")
        return result
    }

    /**
     * Deletes a cluster database key.
     * @param {HKEY} hKey Handle to a currently open key.
     * @param {PWSTR} lpszSubKey Pointer to a null-terminated Unicode string specifying the name of the key to delete. The key pointed to by 
     *       <i>lpszSubKey</i> cannot have subkeys; 
     *       <b>ClusterRegDeleteKey</b> can only delete keys without 
     *       subkeys. This parameter cannot be <b>NULL</b>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b> (0).
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregdeletekey
     * @since windowsserver2008
     */
    static ClusterRegDeleteKey(hKey, lpszSubKey) {
        lpszSubKey := lpszSubKey is String ? StrPtr(lpszSubKey) : lpszSubKey
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegDeleteKey", "ptr", hKey, "ptr", lpszSubKey, "int")
        return result
    }

    /**
     * 
     * @param {HKEY} hKey 
     * @param {PWSTR} lpSubKey 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterRegDeleteKeyEx(hKey, lpSubKey, lpszReason) {
        lpSubKey := lpSubKey is String ? StrPtr(lpSubKey) : lpSubKey
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegDeleteKeyEx", "ptr", hKey, "ptr", lpSubKey, "ptr", lpszReason, "int")
        return result
    }

    /**
     * Releases the handle of a cluster database key.
     * @param {HKEY} hKey Handle to the cluster database key to be closed.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregclosekey
     * @since windowsserver2008
     */
    static ClusterRegCloseKey(hKey) {
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegCloseKey", "ptr", hKey, "int")
        return result
    }

    /**
     * Enumerates the subkeys of an open cluster database key.
     * @param {HKEY} hKey <b>HKEY</b> specifying a currently open key.
     * @param {Integer} dwIndex Index used to identify the next subkey to be enumerated. This parameter should be zero for the first call to 
     *        <b>ClusterRegEnumKey</b> and then incremented for 
     *        subsequent calls.
     * 
     * Because subkeys are not ordered, any new subkey has an arbitrary index. This means that 
     *        <b>ClusterRegEnumKey</b> may return subkeys in any 
     *        order.
     * @param {PWSTR} lpszName Pointer to a buffer that receives the name of the subkey, including the null-terminating character. The 
     *        function copies only the name of the subkey, not the full key hierarchy, to the buffer.
     * @param {Pointer<UInt32>} lpcchName Pointer to the size of the <i>lpszName</i> buffer as a count of characters. On input, 
     *        specify the maximum number of characters the buffer can hold, including the terminating 
     *        <b>NULL</b>. On output, specifies the number of characters in the resulting name, excluding 
     *        the terminating <b>NULL</b>.
     * @param {Pointer<FILETIME>} lpftLastWriteTime Pointer to the last time the enumerated subkey was modified.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * <dt>259 (0x103)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more subkeys to be returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpszName</i> is not big enough to hold the result. The 
     *          <i>lpcchName</i> parameter returns the number of characters in the result, excluding the 
     *          terminating <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/Debug/system-error-codes">System error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregenumkey
     * @since windowsserver2008
     */
    static ClusterRegEnumKey(hKey, dwIndex, lpszName, lpcchName, lpftLastWriteTime) {
        lpszName := lpszName is String ? StrPtr(lpszName) : lpszName
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegEnumKey", "ptr", hKey, "uint", dwIndex, "ptr", lpszName, "uint*", lpcchName, "ptr", lpftLastWriteTime, "int")
        return result
    }

    /**
     * Sets a value for a cluster database key.
     * @param {HKEY} hKey Handle to a cluster database key.
     * @param {PWSTR} lpszValueName Pointer to a null-terminated Unicode string containing the name of the value to set. If a value with this 
     *        name is not already present in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources">resource</a>, 
     *        <b>ClusterRegSetValue</b> adds it to the resource.
     * @param {Integer} dwType 
     * @param {Pointer<Byte>} lpData Pointer to the data to be stored with the name pointed to by <i>lpszValueName</i>.
     * @param {Integer} cbData Count of bytes in the data pointed to by the <i>lpbData</i> parameter. If the data is of 
     *        type <b>REG_SZ</b>, <b>REG_EXPAND_SZ</b> or 
     *        <b>REG_MULTI_SZ</b>, <i>cbData</i> must include the size of the 
     *        null-terminating character.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *       <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregsetvalue
     * @since windowsserver2008
     */
    static ClusterRegSetValue(hKey, lpszValueName, dwType, lpData, cbData) {
        lpszValueName := lpszValueName is String ? StrPtr(lpszValueName) : lpszValueName
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\ClusterRegSetValue", "ptr", hKey, "ptr", lpszValueName, "uint", dwType, "char*", lpData, "uint", cbData, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes a named value from a cluster database key.
     * @param {HKEY} hKey Handle to a currently open key.
     * @param {PWSTR} lpszValueName Pointer to a null-terminated Unicode string containing the name of the value to be removed.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregdeletevalue
     * @since windowsserver2008
     */
    static ClusterRegDeleteValue(hKey, lpszValueName) {
        lpszValueName := lpszValueName is String ? StrPtr(lpszValueName) : lpszValueName
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegDeleteValue", "ptr", hKey, "ptr", lpszValueName, "uint")
        return result
    }

    /**
     * 
     * @param {HKEY} hKey 
     * @param {PWSTR} lpszValueName 
     * @param {Integer} dwType 
     * @param {Pointer<Byte>} lpData 
     * @param {Integer} cbData 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterRegSetValueEx(hKey, lpszValueName, dwType, lpData, cbData, lpszReason) {
        lpszValueName := lpszValueName is String ? StrPtr(lpszValueName) : lpszValueName
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegSetValueEx", "ptr", hKey, "ptr", lpszValueName, "uint", dwType, "char*", lpData, "uint", cbData, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * 
     * @param {HKEY} hKey 
     * @param {PWSTR} lpszValueName 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterRegDeleteValueEx(hKey, lpszValueName, lpszReason) {
        lpszValueName := lpszValueName is String ? StrPtr(lpszValueName) : lpszValueName
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegDeleteValueEx", "ptr", hKey, "ptr", lpszValueName, "ptr", lpszReason, "uint")
        return result
    }

    /**
     * Returns the name, type, and data components associated with a value for an open cluster database key.
     * @param {HKEY} hKey Handle of the cluster database key to query.
     * @param {PWSTR} lpszValueName Pointer to a null-terminated Unicode string containing the name of the value to be queried.
     * @param {Pointer<UInt32>} lpdwValueType Pointer to the key's value type. This parameter can be <b>NULL</b> if the type is not 
     *        required; otherwise, the value returned through this parameter is one of the following.
     * @param {Pointer} lpData Pointer to the value's data. This parameter can be <b>NULL</b> if the data is not 
     *        required.
     * @param {Pointer<UInt32>} lpcbData On input, pointer to the count of bytes in the buffer pointed to by the <i>lpbData</i> 
     *        parameter. On output, pointer to the count of bytes in the value's data, which is placed in the content of 
     *        <i>lpbData</i> if the caller passes in a valid pointer.
     * 
     * The <i>lpbData</i> parameter can be <b>NULL</b> only if 
     *        <i>lpbData</i> is also <b>NULL</b>.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpbData</i> is not large enough to hold the data for the 
     *          value. <a href="/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterregqueryvalue">ClusterRegQueryValue</a> stores the 
     *          required size in the content of <i>lpbData</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregqueryvalue
     * @since windowsserver2008
     */
    static ClusterRegQueryValue(hKey, lpszValueName, lpdwValueType, lpData, lpcbData) {
        lpszValueName := lpszValueName is String ? StrPtr(lpszValueName) : lpszValueName
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegQueryValue", "ptr", hKey, "ptr", lpszValueName, "uint*", lpdwValueType, "ptr", lpData, "uint*", lpcbData, "int")
        return result
    }

    /**
     * Enumerates the values of an open cluster database key.
     * @param {HKEY} hKey Handle of the cluster database key to enumerate.
     * @param {Integer} dwIndex Index used to identify the next value to be enumerated. This parameter should be zero for the first call to 
     *        <b>ClusterRegEnumValue</b> and then incremented for 
     *        subsequent calls.
     * 
     * Because values are not ordered, any new value has an arbitrary index. This means that 
     *        <b>ClusterRegEnumValue</b> may return values in any 
     *        order.
     * @param {PWSTR} lpszValueName Pointer to a null-terminated Unicode string containing the name of the returned value.
     * @param {Pointer<UInt32>} lpcchValueName Pointer to the size of the <i>lpszValueName</i> buffer as a count of characters. On input, 
     *        specify the maximum number of characters the buffer can hold, including the terminating 
     *        <b>NULL</b>. On output, specifies the number of characters in the resulting name, excluding 
     *        the terminating <b>NULL</b>.
     * @param {Pointer<UInt32>} lpdwType Pointer to the type code for the value entry, or <b>NULL</b> if the type code is not
     * @param {Pointer} lpData Pointer to the data for the value entry. This parameter can be <b>NULL</b> if the data is 
     *        not required.
     * @param {Pointer<UInt32>} lpcbData On input, pointer to a count of bytes in the buffer pointed to by the <i>lpbData</i> 
     *        parameter. On output, pointer to a count of bytes resulting from the operation. This parameter can be 
     *        <b>NULL</b> only if <i>lpbData</i> is <b>NULL</b>.
     * @returns {Integer} The function returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0 (0x0)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * <dt>259 (0x103)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more values to be returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the output buffers (<i>lpszValueName</i> or <i>lpbData</i>) is 
     *          too small to hold the resulting data. The <i>lpcchValueName</i> and the 
     *          <i>lpbData</i> parameters indicate the required size (note that 
     *          <i>lpcchValueName</i> does not include the terminating <b>NULL</b> in 
     *          the character count).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><a href="/windows/desktop/Debug/system-error-codes">System error code</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregenumvalue
     * @since windowsserver2008
     */
    static ClusterRegEnumValue(hKey, dwIndex, lpszValueName, lpcchValueName, lpdwType, lpData, lpcbData) {
        lpszValueName := lpszValueName is String ? StrPtr(lpszValueName) : lpszValueName
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegEnumValue", "ptr", hKey, "uint", dwIndex, "ptr", lpszValueName, "uint*", lpcchValueName, "uint*", lpdwType, "ptr", lpData, "uint*", lpcbData, "uint")
        return result
    }

    /**
     * Returns information about a cluster database key.
     * @param {HKEY} hKey Handle to a cluster database key. All subsequent parameters describe the contents of the key.
     * @param {Pointer<UInt32>} lpcSubKeys If not <b>NULL</b>, pointer to the number of subkeys in the specified key.
     * @param {Pointer<UInt32>} lpcchMaxSubKeyLen If not <b>NULL</b>, pointer to the number of characters in the longest subkey name in the specified key. The number does not include the terminating <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcValues If not <b>NULL</b>, pointer to the number of values in the specified key.
     * @param {Pointer<UInt32>} lpcchMaxValueNameLen If not <b>NULL</b>, pointer to the number of characters in the longest value name in the specified key. The number does not include the terminating <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcbMaxValueLen If not <b>NULL</b>, pointer to the byte size of the largest data value in the specified key.
     * @param {Pointer<UInt32>} lpcbSecurityDescriptor If not <b>NULL</b>, pointer to the byte size of the specified key's security descriptor.
     * @param {Pointer<FILETIME>} lpftLastWriteTime If not <b>NULL</b>, pointer to the time of the most recent modification to the specified key or any of its contents.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregqueryinfokey
     * @since windowsserver2008
     */
    static ClusterRegQueryInfoKey(hKey, lpcSubKeys, lpcchMaxSubKeyLen, lpcValues, lpcchMaxValueNameLen, lpcbMaxValueLen, lpcbSecurityDescriptor, lpftLastWriteTime) {
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegQueryInfoKey", "ptr", hKey, "uint*", lpcSubKeys, "uint*", lpcchMaxSubKeyLen, "uint*", lpcValues, "uint*", lpcchMaxValueNameLen, "uint*", lpcbMaxValueLen, "uint*", lpcbSecurityDescriptor, "ptr", lpftLastWriteTime, "int")
        return result
    }

    /**
     * Returns a copy of the security descriptor protecting the specified cluster database key.
     * @param {HKEY} hKey Handle to a cluster database key.
     * @param {Integer} RequestedInformation A  <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that indicates the requested security descriptor.
     * @param {Pointer} pSecurityDescriptor Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure containing a copy of the requested security descriptor.
     * @param {Pointer<UInt32>} lpcbSecurityDescriptor On input, pointer to a count of the number of bytes in the buffer pointed to by <i>pSecurityDescriptor</i>. On output, pointer to a count of the number of bytes written to the buffer.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterreggetkeysecurity
     * @since windowsserver2008
     */
    static ClusterRegGetKeySecurity(hKey, RequestedInformation, pSecurityDescriptor, lpcbSecurityDescriptor) {
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegGetKeySecurity", "ptr", hKey, "uint", RequestedInformation, "ptr", pSecurityDescriptor, "uint*", lpcbSecurityDescriptor, "int")
        return result
    }

    /**
     * Sets the security attributes for a cluster database key.
     * @param {HKEY} hKey Handle to a cluster database key.
     * @param {Integer} SecurityInformation A <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that 
     *        indicates the content of the security descriptor pointed to by 
     *        <i>pSecurityDescriptor</i>.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure 
     *        that describes the security attributes to set for the key corresponding to <i>hKey</i>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b> (0).
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregsetkeysecurity
     * @since windowsserver2008
     */
    static ClusterRegSetKeySecurity(hKey, SecurityInformation, pSecurityDescriptor) {
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := DllCall("CLUSAPI.dll\ClusterRegSetKeySecurity", "ptr", hKey, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "int")
        return result
    }

    /**
     * 
     * @param {HKEY} hKey 
     * @param {Integer} SecurityInformation 
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} 
     */
    static ClusterRegSetKeySecurityEx(hKey, SecurityInformation, pSecurityDescriptor, lpszReason) {
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor

        result := DllCall("CLUSAPI.dll\ClusterRegSetKeySecurityEx", "ptr", hKey, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "ptr", lpszReason, "int")
        return result
    }

    /**
     * Synchronizes the Cluster Database with a cluster.
     * @param {HCLUSTER} hCluster A handle to the cluster to synchronize with the cluster database.
     * @param {Integer} flags This parameter is reserved for future use.
     * @returns {Integer} If the operation succeeds, returns <b>ERROR_SUCCESS</b> (0); otherwise, returns a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregsyncdatabase
     * @since windowsserver2012
     */
    static ClusterRegSyncDatabase(hCluster, flags) {
        result := DllCall("CLUSAPI.dll\ClusterRegSyncDatabase", "ptr", hCluster, "uint", flags, "int")
        return result
    }

    /**
     * Creates a batch that will execute commands on a cluster registry key.
     * @param {HKEY} hKey The handle of the opened cluster registry key.  All the operations on the batch are relative to this cluster 
     *        registry key.
     * @param {Pointer<HREGBATCH>} pHREGBATCH The pointer to the handle of the created batch.
     * @returns {Integer} The function returns one of the following 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * <dt>14 (0xE)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough storage is available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GEN_FAILURE</b></dt>
     * <dt>31 (0x1F)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A device attached to the system is not functioning.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87 (0x57)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is incorrect. This value will be returned if the <i>hKey</i> parameter is 
     *          <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregcreatebatch
     * @since windowsserver2008
     */
    static ClusterRegCreateBatch(hKey, pHREGBATCH) {
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegCreateBatch", "ptr", hKey, "ptr", pHREGBATCH, "int")
        return result
    }

    /**
     * Adds a command to a batch that will be executed on a cluster registry key.
     * @param {HREGBATCH} hRegBatch The handle of the batch to which a command will be added.
     * @param {Integer} dwCommand A command supported by this API that is taken from the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ne-clusapi-cluster_reg_command">CLUSTER_REG_COMMAND</a> enumeration.  The possible 
     *        commands are as follows.
     * @param {PWSTR} wzName The name of the value or key relative to the command issued by the <i>dwCommand</i> 
     *        parameter.
     * @param {Integer} dwOptions If <i>dwCommand</i> takes the <b>CLUSREG_SET_VALUE</b> command, then 
     *        this parameter takes one of the standard 
     *        <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">registry value types</a>. If not, then 
     *        <i>dwCommand</i> is set to 0.
     * @param {Pointer} lpData A pointer to the data relative to the command issued by <i>dwCommand</i>. The value of 
     *        this parameter is <b>NULL</b> for all but the <b>CLUSREG_SET_VALUE</b> 
     *        command.
     * @param {Integer} cbData The count, in bytes, of the data relative to the command issued by <i>dwCommand</i>. The 
     *        value of this parameter is 0 for all but the <b>CLUSREG_SET_VALUE</b> command.
     * @returns {Integer} The function returns one of the following 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Incorrect function.  This value is returned if <i>dwCommand</i> takes any command other 
     *          than the commands described in the previous section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is not valid. This value is returned if the <i>hRegBatch</i> parameter is 
     *          <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * <dt>14 (0xE)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough storage is available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GEN_FAILURE</b></dt>
     * <dt>31 (0x1F)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A device attached to the system is not functioning.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * <dt>87 (0x57)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The parameter is incorrect. This value will be returned if the cluster registry key that the batch is 
     *          attempting to execute commands on is not the current key.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregbatchaddcommand
     * @since windowsserver2008
     */
    static ClusterRegBatchAddCommand(hRegBatch, dwCommand, wzName, dwOptions, lpData, cbData) {
        wzName := wzName is String ? StrPtr(wzName) : wzName

        result := DllCall("CLUSAPI.dll\ClusterRegBatchAddCommand", "ptr", hRegBatch, "int", dwCommand, "ptr", wzName, "uint", dwOptions, "ptr", lpData, "uint", cbData, "int")
        return result
    }

    /**
     * Executes or ignores the batch created by the ClusterRegCreateBatch function.
     * @param {HREGBATCH} hRegBatch The handle of the  cluster registry key opened by 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterregcreatebatch">ClusterRegCreateBatch</a>. After the completion 
     *        of <b>ClusterRegCloseBatch</b>, this handle is no 
     *        longer valid and memory associated with it is freed.
     * @param {BOOL} bCommit If the value this parameter takes is true, then a batch is sent for execution to a cluster server.
     * @param {Pointer<Int32>} failedCommandNumber If execution of the batch is not successful, the number of the command that failed is returned in the form of 
     *        a <i>failedCommandNumber</i> argument. The first command in the batch has number 0, the 
     *        second has number 1, and so on.
     * @returns {Integer} The function returns one of the following 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is not valid. This value is returned if the <i>hRegBatch</i> parameter 
     *         is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregclosebatch
     * @since windowsserver2008
     */
    static ClusterRegCloseBatch(hRegBatch, bCommit, failedCommandNumber) {
        result := DllCall("CLUSAPI.dll\ClusterRegCloseBatch", "ptr", hRegBatch, "ptr", bCommit, "int*", failedCommandNumber, "int")
        return result
    }

    /**
     * Executes or ignores the batch created by the ClusterRegCreateBatch function.
     * @param {HREGBATCH} hRegBatch The handle of the  cluster registry key opened by 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterregcreatebatch">ClusterRegCreateBatch</a>. After the completion 
     *        of <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterregclosebatch">ClusterRegCloseBatch</a>, this handle is no 
     *        longer valid and memory associated with it is freed.
     * @param {Integer} flags 
     * @param {Pointer<Int32>} failedCommandNumber If execution of the batch is not successful, the number of the command that failed is returned in the form of 
     *        a <i>failedCommandNumber</i> argument. The first command in the batch has number 0, the 
     *        second has number 1, and so on.
     * @returns {Integer} The function returns one of the following 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is not valid. This value is returned if the <i>hRegBatch</i> parameter 
     *         is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregclosebatchex
     * @since windowsserver2012
     */
    static ClusterRegCloseBatchEx(hRegBatch, flags, failedCommandNumber) {
        result := DllCall("CLUSAPI.dll\ClusterRegCloseBatchEx", "ptr", hRegBatch, "uint", flags, "int*", failedCommandNumber, "int")
        return result
    }

    /**
     * Reads a command from a batch notification.
     * @param {HREGBATCHNOTIFICATION} hBatchNotification A handle to the batch notification.
     * @param {Pointer<CLUSTER_BATCH_COMMAND>} pBatchCommand Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ns-clusapi-cluster_batch_command">CLUSTER_BATCH_COMMAND</a> structure 
     *        that will be filled with information about the command on successful return.
     * @returns {Integer} The function returns one of the following 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregbatchreadcommand
     * @since windowsserver2008
     */
    static ClusterRegBatchReadCommand(hBatchNotification, pBatchCommand) {
        result := DllCall("CLUSAPI.dll\ClusterRegBatchReadCommand", "ptr", hBatchNotification, "ptr", pBatchCommand, "int")
        return result
    }

    /**
     * Frees the memory associated with the batch notification.
     * @param {HREGBATCHNOTIFICATION} hBatchNotification A handle to the batch notification.
     * @returns {Integer} The function returns one of the following 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful. This error returns if the command is properly filled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is not valid. This error is returned if the <i>hBatchNotification</i> 
     *          parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregbatchclosenotification
     * @since windowsserver2008
     */
    static ClusterRegBatchCloseNotification(hBatchNotification) {
        result := DllCall("CLUSAPI.dll\ClusterRegBatchCloseNotification", "ptr", hBatchNotification, "int")
        return result
    }

    /**
     * Creates a subscription to a batch notification port.
     * @param {HKEY} hKey A cluster registry key. Any updates performed at this key or keys below it will be posted to a notification 
     *        port.
     * @param {Pointer<HREGBATCHPORT>} phBatchNotifyPort A handle to a batch notification port that allows subsequent reading batch notifications via the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterreggetbatchnotification">ClusterRegGetBatchNotification</a> 
     *        function.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b> (0).
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregcreatebatchnotifyport
     * @since windowsserver2008
     */
    static ClusterRegCreateBatchNotifyPort(hKey, phBatchNotifyPort) {
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegCreateBatchNotifyPort", "ptr", hKey, "ptr", phBatchNotifyPort, "int")
        return result
    }

    /**
     * Closes a subscription to a batch notification port created by the ClusterRegCreateBatchNotifyPort function.
     * @param {HREGBATCHPORT} hBatchNotifyPort A handle to the batch notification port created earlier via the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterregcreatebatchnotifyport">ClusterRegCreateBatchNotifyPort</a> 
     *        function.
     * @returns {Integer} The function returns one of the following 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregclosebatchnotifyport
     * @since windowsserver2008
     */
    static ClusterRegCloseBatchNotifyPort(hBatchNotifyPort) {
        result := DllCall("CLUSAPI.dll\ClusterRegCloseBatchNotifyPort", "ptr", hBatchNotifyPort, "int")
        return result
    }

    /**
     * Fetches the batch notification.
     * @param {HREGBATCHPORT} hBatchNotify The handle to the batch notification port opened earlier via the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterregcreatebatchnotifyport">ClusterRegCreateBatchNotifyPort</a> 
     *        function.
     * @param {Pointer<HREGBATCHNOTIFICATION>} phBatchNotification A handle to the batch notification that represents all of the changes at or below the cluster registry key of 
     *        interest that have happened since the last call to 
     *        <b>ClusterRegGetBatchNotification</b> or 
     *        since the batch notification port was opened.
     * @returns {Integer} The function returns one of the following 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * <dt>13 (0xD)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * <dt>14 (0xE)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough storage is available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GEN_FAILURE</b></dt>
     * <dt>31 (0x1F)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A device attached to the system is not functioning.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterreggetbatchnotification
     * @since windowsserver2008
     */
    static ClusterRegGetBatchNotification(hBatchNotify, phBatchNotification) {
        result := DllCall("CLUSAPI.dll\ClusterRegGetBatchNotification", "ptr", hBatchNotify, "ptr", phBatchNotification, "int")
        return result
    }

    /**
     * Creates a handle to the read batch that executes read commands on the cluster registry key.
     * @param {HKEY} hKey The handle to the opened cluster registry key. All of the operations on the batch are relative to this cluster registry key.
     * @param {Pointer<HREGREADBATCH>} phRegReadBatch A pointer to the handle of the created read batch.
     * @returns {Integer} The function returns one of the following 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough storage is available to complete this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregcreatereadbatch
     * @since windowsserver2012
     */
    static ClusterRegCreateReadBatch(hKey, phRegReadBatch) {
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := DllCall("CLUSAPI.dll\ClusterRegCreateReadBatch", "ptr", hKey, "ptr", phRegReadBatch, "int")
        return result
    }

    /**
     * Adds a read command to a batch that executes on a cluster registry key.
     * @param {HREGREADBATCH} hRegReadBatch The handle of the read batch to which a command will be added. Create a batch by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterregcreatereadbatch">ClusterRegCreateReadBatch</a> function.
     * @param {PWSTR} wzSubkeyName The name of the key relative to the cluster registry key. If this name is <b>NULL</b>, the read is performed on the cluster registry key represented in the <i>hRegReadBatch</i> parameter.
     * @param {PWSTR} wzValueName The name of the registry value to be read. If this name is <b>NULL</b>, the content of the default value is returned.
     * @returns {Integer} The function returns one of the following 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough storage is available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hRegReadBatch</i> is <b>NULL</b> or not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregreadbatchaddcommand
     * @since windowsserver2012
     */
    static ClusterRegReadBatchAddCommand(hRegReadBatch, wzSubkeyName, wzValueName) {
        wzSubkeyName := wzSubkeyName is String ? StrPtr(wzSubkeyName) : wzSubkeyName
        wzValueName := wzValueName is String ? StrPtr(wzValueName) : wzValueName

        result := DllCall("CLUSAPI.dll\ClusterRegReadBatchAddCommand", "ptr", hRegReadBatch, "ptr", wzSubkeyName, "ptr", wzValueName, "int")
        return result
    }

    /**
     * Executes a read batch and returns results from the read batch executions.
     * @param {HREGREADBATCH} hRegReadBatch The handle of the read batch. After the <b>ClusterRegCloseReadBatch</b> function completes, this handle is no longer valid, and memory associated with it is freed.
     * @param {Pointer<HREGREADBATCHREPLY>} phRegReadBatchReply A pointer to the handle of the created read batch result. You must close this handle later by calling the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterregclosereadbatchreply">ClusterRegCloseReadBatchReply</a> function.
     * @returns {Integer} The function returns one of the following 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough storage is available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hRegReadBatch</i> is <b>NULL</b> or not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregclosereadbatch
     * @since windowsserver2012
     */
    static ClusterRegCloseReadBatch(hRegReadBatch, phRegReadBatchReply) {
        result := DllCall("CLUSAPI.dll\ClusterRegCloseReadBatch", "ptr", hRegReadBatch, "ptr", phRegReadBatchReply, "int")
        return result
    }

    /**
     * Executes a read batch and returns results from the read batch executions.
     * @param {HREGREADBATCH} hRegReadBatch The handle of the read batch. After the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterregclosereadbatch">ClusterRegCloseReadBatch</a> function completes, this handle is no longer valid, and memory associated with it is freed.
     * @param {Integer} flags The flags for the operation.
     * @param {Pointer<HREGREADBATCHREPLY>} phRegReadBatchReply A pointer to the handle of the created read batch result. You must close this handle later by calling the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterregclosereadbatchreply">ClusterRegCloseReadBatchReply</a> function.
     * @returns {Integer} The function returns one of the following 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OUTOFMEMORY</b></dt>
     * <dt>14</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough storage is available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hRegReadBatch</i> is <b>NULL</b> or not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregclosereadbatchex
     * @since windowsserver2016
     */
    static ClusterRegCloseReadBatchEx(hRegReadBatch, flags, phRegReadBatchReply) {
        result := DllCall("CLUSAPI.dll\ClusterRegCloseReadBatchEx", "ptr", hRegReadBatch, "uint", flags, "ptr", phRegReadBatchReply, "int")
        return result
    }

    /**
     * Reads the next command from a read batch result.
     * @param {HREGREADBATCHREPLY} hRegReadBatchReply A handle to a read batch result that was created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterregclosereadbatch">ClusterRegCloseReadBatch</a> function.  You must close this handle later by calling the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusterregclosereadbatchreply">ClusterRegCloseReadBatchReply</a> function.
     * @param {Pointer<CLUSTER_READ_BATCH_COMMAND>} pBatchCommand A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ns-clusapi-cluster_read_batch_command">CLUSTER_READ_BATCH_COMMAND</a> structure that contains information about the read command.
     * @returns {Integer} The function returns one of the following 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hRegReadBatchReply</i> is <b>NULL</b> or not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * <dt>259</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no more information in <i>hRegReadBatchReply</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregreadbatchreplynextcommand
     * @since windowsserver2012
     */
    static ClusterRegReadBatchReplyNextCommand(hRegReadBatchReply, pBatchCommand) {
        result := DllCall("CLUSAPI.dll\ClusterRegReadBatchReplyNextCommand", "ptr", hRegReadBatchReply, "ptr", pBatchCommand, "int")
        return result
    }

    /**
     * Closes a read batch result handle and frees the memory associated with it.
     * @param {HREGREADBATCHREPLY} hRegReadBatchReply A handle to a read batch result that was created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-clusterregclosereadbatch">ClusterRegCloseReadBatch</a> function.
     * @returns {Integer} The function returns one of the following 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hRegReadBatchReply</i> is <b>NULL</b> or not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clusterregclosereadbatchreply
     * @since windowsserver2012
     */
    static ClusterRegCloseReadBatchReply(hRegReadBatchReply) {
        result := DllCall("CLUSAPI.dll\ClusterRegCloseReadBatchReply", "ptr", hRegReadBatchReply, "int")
        return result
    }

    /**
     * Updates an account access list (ACL) for a cluster.
     * @param {HCLUSTER} hCluster A handle to the cluster.
     * @param {PWSTR} szAccountSID The security identifier (SID) or the account name for the new account access entry (ACE).
     * @param {Integer} dwAccess The access rights controlled by the ACE.
     * 
     * 
     * The possible values are:
     * @param {Integer} dwControlType The  ACE type to use.
     * 
     * 
     * The possible values are:
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *       <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-clustersetaccountaccess
     * @since windowsserver2016
     */
    static ClusterSetAccountAccess(hCluster, szAccountSID, dwAccess, dwControlType) {
        szAccountSID := szAccountSID is String ? StrPtr(szAccountSID) : szAccountSID

        result := DllCall("CLUSAPI.dll\ClusterSetAccountAccess", "ptr", hCluster, "ptr", szAccountSID, "uint", dwAccess, "uint", dwControlType, "uint")
        return result
    }

    /**
     * Creates and starts a cluster.
     * @param {Pointer<CREATE_CLUSTER_CONFIG>} pConfig Address of a <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ns-clusapi-create_cluster_config">CREATE_CLUSTER_CONFIG</a> 
     *       structure containing configuration information about the cluster to be created.
     * @param {Pointer<PCLUSTER_SETUP_PROGRESS_CALLBACK>} pfnProgressCallback Address of callback function that matches the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nc-clusapi-pcluster_setup_progress_callback">PCLUSTER_SETUP_PROGRESS_CALLBACK</a> 
     *       function pointer that will be called periodically to provide progress on the cluster creation.
     * @param {Pointer<Void>} pvCallbackArg Argument for the callback function.
     * @returns {HCLUSTER} Handle to the newly created cluster or <b>NULL</b>. A non <b>NULL</b> 
     *       value does not indicate complete success (all nodes will have been added, but not all 
     *       <a href="/previous-versions/windows/desktop/mscs/ip-address">IP Address</a> or 
     *       <a href="/previous-versions/windows/desktop/mscs/network-name">Network Name</a> resources may have been created. The parameters 
     *       passed to the function pointed to by the <i>pfnProgressCallback</i> parameter should be 
     *       checked.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>NULL</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Less than a majority of nodes were successfully created. For more information about the error, call the 
     *         function <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-createcluster
     * @since windowsserver2008
     */
    static CreateCluster(pConfig, pfnProgressCallback, pvCallbackArg) {
        A_LastError := 0

        result := DllCall("CLUSAPI.dll\CreateCluster", "ptr", pConfig, "ptr", pfnProgressCallback, "ptr", pvCallbackArg, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a cluster name resource and then uses it add a cluster to a domain, even if the machines that host the cluster aren't members of the domain.
     * @param {HCLUSTER} hCluster A handle to the cluster to add the cluster name resource to.
     * @param {Pointer<CREATE_CLUSTER_NAME_ACCOUNT>} pConfig A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ns-clusapi-create_cluster_name_account">CREATE_CLUSTER_NAME_ACCOUNT</a> structure that contains the information about the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-name">cluster name</a> resource to create, and the domain credentials to use.
     * @param {Pointer<PCLUSTER_SETUP_PROGRESS_CALLBACK>} pfnProgressCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nc-clusapi-pcluster_setup_progress_callback">ClusterSetupProgressCallback</a> callback function that receives the status of updates to the cluster.
     * @param {Pointer<Void>} pvCallbackArg Callback function arguments for the <i>pfnProgressCallback</i> parameter.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>. If the operation fails, the function returns a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-createclusternameaccount
     * @since windowsserver2016
     */
    static CreateClusterNameAccount(hCluster, pConfig, pfnProgressCallback, pvCallbackArg) {
        result := DllCall("CLUSAPI.dll\CreateClusterNameAccount", "ptr", hCluster, "ptr", pConfig, "ptr", pfnProgressCallback, "ptr", pvCallbackArg, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {BOOL} bDeleteComputerObjects 
     * @returns {Integer} 
     */
    static RemoveClusterNameAccount(hCluster, bDeleteComputerObjects) {
        result := DllCall("CLUSAPI.dll\RemoveClusterNameAccount", "ptr", hCluster, "ptr", bDeleteComputerObjects, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {Pointer<REPAIR_CLUSTER_NAME_ACCOUNT_CONFIG>} pConfig 
     * @param {Pointer<PCLUSTER_SETUP_PROGRESS_CALLBACK>} pfnProgressCallback 
     * @param {Pointer<Void>} pvCallbackArg 
     * @returns {Integer} 
     */
    static RepairClusterNameAccount(hCluster, pConfig, pfnProgressCallback, pvCallbackArg) {
        result := DllCall("CLUSAPI.dll\RepairClusterNameAccount", "ptr", hCluster, "ptr", pConfig, "ptr", pfnProgressCallback, "ptr", pvCallbackArg, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} cNodes 
     * @param {Pointer<PWSTR>} ppszNodeNames 
     * @param {Pointer<Int32>} pCNOResType 
     * @returns {Integer} 
     */
    static DetermineCNOResTypeFromNodelist(cNodes, ppszNodeNames, pCNOResType) {
        result := DllCall("CLUSAPI.dll\DetermineCNOResTypeFromNodelist", "uint", cNodes, "ptr", ppszNodeNames, "int*", pCNOResType, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {Pointer<Int32>} pCNOResType 
     * @returns {Integer} 
     */
    static DetermineCNOResTypeFromCluster(hCluster, pCNOResType) {
        result := DllCall("CLUSAPI.dll\DetermineCNOResTypeFromCluster", "ptr", hCluster, "int*", pCNOResType, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} cNodes 
     * @param {Pointer<PWSTR>} ppszNodeNames 
     * @param {Pointer<Int32>} pCloudType 
     * @returns {Integer} 
     */
    static DetermineClusterCloudTypeFromNodelist(cNodes, ppszNodeNames, pCloudType) {
        result := DllCall("CLUSAPI.dll\DetermineClusterCloudTypeFromNodelist", "uint", cNodes, "ptr", ppszNodeNames, "int*", pCloudType, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {Pointer<Int32>} pCloudType 
     * @returns {Integer} 
     */
    static DetermineClusterCloudTypeFromCluster(hCluster, pCloudType) {
        result := DllCall("CLUSAPI.dll\DetermineClusterCloudTypeFromCluster", "ptr", hCluster, "int*", pCloudType, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} ppszNodeName 
     * @param {Pointer<UInt32>} NodeCloudType 
     * @returns {Integer} 
     */
    static GetNodeCloudTypeDW(ppszNodeName, NodeCloudType) {
        ppszNodeName := ppszNodeName is String ? StrPtr(ppszNodeName) : ppszNodeName

        result := DllCall("CLUSAPI.dll\GetNodeCloudTypeDW", "ptr", ppszNodeName, "uint*", NodeCloudType, "uint")
        return result
    }

    /**
     * Adds a notification type to a cluster notification port.
     * @param {HCHANGE} hChange A handle to the notification port.
     * @param {HCLUSTER} hCluster A handle to the cluster object.
     * @param {Integer} Flags A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_change_resource_type_v2">CLUSTER_CHANGE_RESOURCE_TYPE_V2</a> enumeration value that specifies the notification type to add.
     * @param {PWSTR} resTypeName A pointer to a null-terminated Unicode string that contains the name of the resource type.
     * @param {Pointer} dwNotifyKey The notification key that is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-getclusternotifyv2">GetClusterNotifyV2</a> function when the event occurs.
     * @returns {Integer} <b>ERROR_SUCCESS</b> if the operation is successful; otherwise, a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-registerclusterresourcetypenotifyv2
     * @since windowsserver2016
     */
    static RegisterClusterResourceTypeNotifyV2(hChange, hCluster, Flags, resTypeName, dwNotifyKey) {
        resTypeName := resTypeName is String ? StrPtr(resTypeName) : resTypeName

        result := DllCall("CLUSAPI.dll\RegisterClusterResourceTypeNotifyV2", "ptr", hChange, "ptr", hCluster, "int64", Flags, "ptr", resTypeName, "ptr", dwNotifyKey, "uint")
        return result
    }

    /**
     * Adds a node to an existing cluster.
     * @param {HCLUSTER} hCluster Handle to a cluster, returned by the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-opencluster">OpenCluster</a> or 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-createcluster">CreateCluster</a> function.
     * @param {PWSTR} lpszNodeName Name of the computer to add to the cluster.
     * @param {Pointer<PCLUSTER_SETUP_PROGRESS_CALLBACK>} pfnProgressCallback Optional address to a 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nc-clusapi-pcluster_setup_progress_callback">PCLUSTER_SETUP_PROGRESS_CALLBACK</a> 
     *        callback function.
     * @param {Pointer<Void>} pvCallbackArg Argument for the callback function.
     * @returns {HNODE} Handle to the new node or <b>NULL</b> to indicate that the node was not successfully added 
     *        to the cluster. For more information about the error, call the 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-addclusternode
     * @since windowsserver2008
     */
    static AddClusterNode(hCluster, lpszNodeName, pfnProgressCallback, pvCallbackArg) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName

        A_LastError := 0

        result := DllCall("CLUSAPI.dll\AddClusterNode", "ptr", hCluster, "ptr", lpszNodeName, "ptr", pfnProgressCallback, "ptr", pvCallbackArg, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {PWSTR} lpszNodeName 
     * @param {Pointer<PCLUSTER_SETUP_PROGRESS_CALLBACK>} pfnProgressCallback 
     * @param {Pointer<Void>} pvCallbackArg 
     * @param {PWSTR} lpszClusterStorageNodeDescription 
     * @param {PWSTR} lpszClusterStorageNodeLocation 
     * @returns {Integer} 
     */
    static AddClusterStorageNode(hCluster, lpszNodeName, pfnProgressCallback, pvCallbackArg, lpszClusterStorageNodeDescription, lpszClusterStorageNodeLocation) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName
        lpszClusterStorageNodeDescription := lpszClusterStorageNodeDescription is String ? StrPtr(lpszClusterStorageNodeDescription) : lpszClusterStorageNodeDescription
        lpszClusterStorageNodeLocation := lpszClusterStorageNodeLocation is String ? StrPtr(lpszClusterStorageNodeLocation) : lpszClusterStorageNodeLocation

        result := DllCall("CLUSAPI.dll\AddClusterStorageNode", "ptr", hCluster, "ptr", lpszNodeName, "ptr", pfnProgressCallback, "ptr", pvCallbackArg, "ptr", lpszClusterStorageNodeDescription, "ptr", lpszClusterStorageNodeLocation, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {PWSTR} lpszNodeName 
     * @param {Integer} dwFlags 
     * @param {Pointer<PCLUSTER_SETUP_PROGRESS_CALLBACK>} pfnProgressCallback 
     * @param {Pointer<Void>} pvCallbackArg 
     * @returns {HNODE} 
     */
    static AddClusterNodeEx(hCluster, lpszNodeName, dwFlags, pfnProgressCallback, pvCallbackArg) {
        lpszNodeName := lpszNodeName is String ? StrPtr(lpszNodeName) : lpszNodeName

        result := DllCall("CLUSAPI.dll\AddClusterNodeEx", "ptr", hCluster, "ptr", lpszNodeName, "uint", dwFlags, "ptr", pfnProgressCallback, "ptr", pvCallbackArg, "ptr")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {PWSTR} lpszClusterStorageEnclosureName 
     * @param {Integer} dwTimeout 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static RemoveClusterStorageNode(hCluster, lpszClusterStorageEnclosureName, dwTimeout, dwFlags) {
        lpszClusterStorageEnclosureName := lpszClusterStorageEnclosureName is String ? StrPtr(lpszClusterStorageEnclosureName) : lpszClusterStorageEnclosureName

        result := DllCall("CLUSAPI.dll\RemoveClusterStorageNode", "ptr", hCluster, "ptr", lpszClusterStorageEnclosureName, "uint", dwTimeout, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Removes a cluster.
     * @param {HCLUSTER} hCluster Handle to a cluster, returned by the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-opencluster">OpenCluster</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-createcluster">CreateCluster</a> function.
     * @param {Pointer<PCLUSTER_SETUP_PROGRESS_CALLBACK>} pfnProgressCallback Address of callback function that matches the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nc-clusapi-pcluster_setup_progress_callback">PCLUSTER_SETUP_PROGRESS_CALLBACK</a> 
     *       function pointer that will be called periodically to provide progress on the cluster destruction.
     * @param {Pointer<Void>} pvCallbackArg Argument for the callback function.
     * @param {BOOL} fdeleteVirtualComputerObjects If <b>TRUE</b>, then delete the virtual computer objects associated with the cluster 
     *       from the directory.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if the cluster was completely removed or a 
     *       <a href="/windows/desktop/Debug/system-error-codes">system error code</a> for the last failed operation.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-destroycluster
     * @since windowsserver2008
     */
    static DestroyCluster(hCluster, pfnProgressCallback, pvCallbackArg, fdeleteVirtualComputerObjects) {
        result := DllCall("CLUSAPI.dll\DestroyCluster", "ptr", hCluster, "ptr", pfnProgressCallback, "ptr", pvCallbackArg, "ptr", fdeleteVirtualComputerObjects, "uint")
        return result
    }

    /**
     * TBD.
     * @param {Pointer<CLUSTER_HEALTH_FAULT>} clusterHealthFault TBD
     * @returns {Integer} TBD
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-initializeclusterhealthfault
     * @since windowsserver2016
     */
    static InitializeClusterHealthFault(clusterHealthFault) {
        result := DllCall("RESUTILS.dll\InitializeClusterHealthFault", "ptr", clusterHealthFault, "uint")
        return result
    }

    /**
     * TBD.
     * @param {Pointer<CLUSTER_HEALTH_FAULT_ARRAY>} clusterHealthFaultArray TBD
     * @returns {Integer} TBD
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-initializeclusterhealthfaultarray
     * @since windowsserver2016
     */
    static InitializeClusterHealthFaultArray(clusterHealthFaultArray) {
        result := DllCall("RESUTILS.dll\InitializeClusterHealthFaultArray", "ptr", clusterHealthFaultArray, "uint")
        return result
    }

    /**
     * TBD.
     * @param {Pointer<CLUSTER_HEALTH_FAULT>} clusterHealthFault TBD
     * @returns {Integer} TBD
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-freeclusterhealthfault
     * @since windowsserver2016
     */
    static FreeClusterHealthFault(clusterHealthFault) {
        result := DllCall("RESUTILS.dll\FreeClusterHealthFault", "ptr", clusterHealthFault, "uint")
        return result
    }

    /**
     * TBD.
     * @param {Pointer<CLUSTER_HEALTH_FAULT_ARRAY>} clusterHealthFaultArray TBD
     * @returns {Integer} TBD
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-freeclusterhealthfaultarray
     * @since windowsserver2016
     */
    static FreeClusterHealthFaultArray(clusterHealthFaultArray) {
        result := DllCall("RESUTILS.dll\FreeClusterHealthFaultArray", "ptr", clusterHealthFaultArray, "uint")
        return result
    }

    /**
     * TBD.
     * @param {HCLUSTER} hCluster TBD
     * @param {Pointer<CLUSTER_HEALTH_FAULT_ARRAY>} objects TBD
     * @param {Integer} flags TBD
     * @returns {Integer} TBD
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-clusgetclusterhealthfaults
     * @since windowsserver2016
     */
    static ClusGetClusterHealthFaults(hCluster, objects, flags) {
        result := DllCall("RESUTILS.dll\ClusGetClusterHealthFaults", "ptr", hCluster, "ptr", objects, "uint", flags, "uint")
        return result
    }

    /**
     * TBD.
     * @param {HCLUSTER} hCluster TBD
     * @param {PWSTR} id TBD
     * @param {Integer} flags TBD
     * @returns {Integer} TBD
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-clusremoveclusterhealthfault
     * @since windowsserver2016
     */
    static ClusRemoveClusterHealthFault(hCluster, id, flags) {
        id := id is String ? StrPtr(id) : id

        result := DllCall("RESUTILS.dll\ClusRemoveClusterHealthFault", "ptr", hCluster, "ptr", id, "uint", flags, "uint")
        return result
    }

    /**
     * TBD.
     * @param {HCLUSTER} hCluster TBD
     * @param {Pointer<CLUSTER_HEALTH_FAULT>} failure TBD
     * @param {Integer} param2 
     * @returns {Integer} TBD
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-clusaddclusterhealthfault
     * @since windowsserver2016
     */
    static ClusAddClusterHealthFault(hCluster, failure, param2) {
        result := DllCall("RESUTILS.dll\ClusAddClusterHealthFault", "ptr", hCluster, "ptr", failure, "uint", param2, "uint")
        return result
    }

    /**
     * Starts a service. The PRESUTIL_START_RESOURCE_SERVICE type defines a pointer to this function.
     * @param {PWSTR} pszServiceName Null-terminated Unicode string containing the name of the service to start.
     * @param {Pointer<SC_HANDLE>} phServiceHandle Optional pointer to a handle in which the handle to the started service is returned. This handle must be closed either by a call to the cluster utility function  <a href="https://docs.microsoft.com/windows/desktop/api/resapi/nf-resapi-resutilstopservice">ResUtilStopService</a> or the function  <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-closeservicehandle">CloseServiceHandle</a>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NEVER_STARTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service was not started.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilstartresourceservice
     * @since windowsserver2008
     */
    static ResUtilStartResourceService(pszServiceName, phServiceHandle) {
        pszServiceName := pszServiceName is String ? StrPtr(pszServiceName) : pszServiceName

        result := DllCall("RESUTILS.dll\ResUtilStartResourceService", "ptr", pszServiceName, "ptr", phServiceHandle, "uint")
        return result
    }

    /**
     * Verifies that a named service is starting or currently running. The PRESUTIL_VERIFY_RESOURCE_SERVICE type defines a pointer to this function.
     * @param {PWSTR} pszServiceName Null-terminated Unicode string containing the name of the service to verify.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is not operational.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilverifyresourceservice
     * @since windowsserver2008
     */
    static ResUtilVerifyResourceService(pszServiceName) {
        pszServiceName := pszServiceName is String ? StrPtr(pszServiceName) : pszServiceName

        result := DllCall("RESUTILS.dll\ResUtilVerifyResourceService", "ptr", pszServiceName, "uint")
        return result
    }

    /**
     * Stops a named service. The PRESUTIL_STOP_RESOURCE_SERVICE type defines a pointer to this function.
     * @param {PWSTR} pszServiceName Null-terminated Unicode string containing the name of the service to stop.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Service did not stop after a reasonable number of retries.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilstopresourceservice
     * @since windowsserver2008
     */
    static ResUtilStopResourceService(pszServiceName) {
        pszServiceName := pszServiceName is String ? StrPtr(pszServiceName) : pszServiceName

        result := DllCall("RESUTILS.dll\ResUtilStopResourceService", "ptr", pszServiceName, "uint")
        return result
    }

    /**
     * Checks if a service identified by a handle is starting or currently running. The PRESUTIL_VERIFY_SERVICE type defines a pointer to this function.
     * @param {SC_HANDLE} hServiceHandle Handle of the service to verify.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is not operational.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilverifyservice
     * @since windowsserver2008
     */
    static ResUtilVerifyService(hServiceHandle) {
        hServiceHandle := hServiceHandle is Win32Handle ? NumGet(hServiceHandle, "ptr") : hServiceHandle

        result := DllCall("RESUTILS.dll\ResUtilVerifyService", "ptr", hServiceHandle, "uint")
        return result
    }

    /**
     * Stops a service identified by a handle. The PRESUTIL_STOP_SERVICE type defines a pointer to this function.
     * @param {SC_HANDLE} hServiceHandle Handle of the service to stop.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Service did not stop after a reasonable number of retries.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilstopservice
     * @since windowsserver2008
     */
    static ResUtilStopService(hServiceHandle) {
        hServiceHandle := hServiceHandle is Win32Handle ? NumGet(hServiceHandle, "ptr") : hServiceHandle

        result := DllCall("RESUTILS.dll\ResUtilStopService", "ptr", hServiceHandle, "uint")
        return result
    }

    /**
     * Creates every directory specified in a path, skipping directories that already exist. The PRESUTIL_CREATE_DIRECTORY_TREE type defines a pointer to this function.
     * @param {PWSTR} pszPath Pointer to a null-terminated Unicode string specifying a path. The string can end with a trailing backslash.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilcreatedirectorytree
     * @since windowsserver2008
     */
    static ResUtilCreateDirectoryTree(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := DllCall("RESUTILS.dll\ResUtilCreateDirectoryTree", "ptr", pszPath, "uint")
        return result
    }

    /**
     * Checks whether a path is syntactically valid.
     * @param {PWSTR} pszPath Pointer to the path to check.
     * @returns {BOOL} If the operation succeeds, the function returns <b>TRUE</b> and <i>pszPath</i> is valid.
     * 
     * If the operation fails, 
     * the function returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilispathvalid
     * @since windowsserver2008
     */
    static ResUtilIsPathValid(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := DllCall("RESUTILS.dll\ResUtilIsPathValid", "ptr", pszPath, "ptr")
        return result
    }

    /**
     * Enumerates the property names of a cluster object. The PRESUTIL_ENUM_PROPERTIES type defines a pointer to this function.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable Pointer to an array of  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resutil_property_item">RESUTIL_PROPERTY_ITEM</a> structures describing properties to enumerate.
     * @param {Pointer} pszOutProperties Pointer to the output buffer in which to return the names of all of the properties in multiple string format. Each property name is stored as a null-terminated Unicode string. The last property name is followed by a final null-terminating character.
     * @param {Integer} cbOutPropertiesSize Size in bytes of the output buffer pointed to by <i>pszOutProperties</i>.
     * @param {Pointer<UInt32>} pcbBytesReturned Pointer to the total number of bytes in the property list pointed to by <i>pszOutProperties</i>.
     * @param {Pointer<UInt32>} pcbRequired Number of bytes required if the output buffer is too small.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error allocating memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the output buffer is too small to hold the resulting data. The <i>pcbRequired</i> parameter points to the correct size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilenumproperties
     * @since windowsserver2008
     */
    static ResUtilEnumProperties(pPropertyTable, pszOutProperties, cbOutPropertiesSize, pcbBytesReturned, pcbRequired) {
        result := DllCall("RESUTILS.dll\ResUtilEnumProperties", "ptr", pPropertyTable, "ptr", pszOutProperties, "uint", cbOutPropertiesSize, "uint*", pcbBytesReturned, "uint*", pcbRequired, "uint")
        return result
    }

    /**
     * Retrieves the names of a cluster object's private properties. The PRESUTIL_ENUM_PRIVATE_PROPERTIES type defines a pointer to this function.
     * @param {HKEY} hkeyClusterKey Key identifying the location of the private properties in the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-database">cluster database</a>.
     * @param {Pointer} pszOutProperties Pointer to an output buffer in which to receive the names of the enumerated properties.
     * @param {Integer} cbOutPropertiesSize Size of the output buffer pointed to by <i>pszOutProperties</i>.
     * @param {Pointer<UInt32>} pcbBytesReturned Pointer to the total number of bytes returned in the output buffer.
     * @param {Pointer<UInt32>} pcbRequired Pointer to the required number of bytes if the output buffer is too small to hold all of the enumerated properties.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error allocating memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the output buffer is too small to hold the resulting data. The <i>pcbRequired</i> parameter points to the correct size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilenumprivateproperties
     * @since windowsserver2008
     */
    static ResUtilEnumPrivateProperties(hkeyClusterKey, pszOutProperties, cbOutPropertiesSize, pcbBytesReturned, pcbRequired) {
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilEnumPrivateProperties", "ptr", hkeyClusterKey, "ptr", pszOutProperties, "uint", cbOutPropertiesSize, "uint*", pcbBytesReturned, "uint*", pcbRequired, "uint")
        return result
    }

    /**
     * Retrieves properties specified by a property table from the cluster database and returns them in a property list. The PRESUTIL_GET_PROPERTIES type defines a pointer to this function.
     * @param {HKEY} hkeyClusterKey Pointer to the cluster database key that identifies the location of the properties to retrieve.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable Pointer to an array of  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resutil_property_item">RESUTIL_PROPERTY_ITEM</a> structures that describe the properties to retrieve.
     * @param {Pointer} pOutPropertyList Pointer to an output buffer in which to return the property list.
     * @param {Integer} cbOutPropertyListSize Size in bytes of the output buffer pointed to by <i>pOutPropertyList</i>.
     * @param {Pointer<UInt32>} pcbBytesReturned Pointer to the total number of bytes in the property list pointed to by <i>pOutPropertyList</i>.
     * @param {Pointer<UInt32>} pcbRequired Pointer to the number of bytes that is required if <i>pOutPropertyList</i> is too small.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer was too small to contain the resulting data. The <i>pcbRequired</i> parameter indicates the required size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error allocating memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetproperties
     * @since windowsserver2008
     */
    static ResUtilGetProperties(hkeyClusterKey, pPropertyTable, pOutPropertyList, cbOutPropertyListSize, pcbBytesReturned, pcbRequired) {
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilGetProperties", "ptr", hkeyClusterKey, "ptr", pPropertyTable, "ptr", pOutPropertyList, "uint", cbOutPropertyListSize, "uint*", pcbBytesReturned, "uint*", pcbRequired, "uint")
        return result
    }

    /**
     * Returns a property list that includes all of the default and unknown properties for a cluster object. The PRESUTIL_GET_ALL_PROPERTIES type defines a pointer to this function.
     * @param {HKEY} hkeyClusterKey Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-database">cluster database</a> key that identifies the location of the properties to retrieve.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable Pointer to an array of  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resutil_property_item">RESUTIL_PROPERTY_ITEM</a> structures that describe the properties to retrieve.
     * @param {Pointer} pOutPropertyList Pointer to an output buffer in which to return the property list.
     * @param {Integer} cbOutPropertyListSize Size in bytes of the output buffer pointed to by <i>OutBuffer</i>.
     * @param {Pointer<UInt32>} pcbBytesReturned Pointer to the total number of bytes in the property list pointed to by <i>OutBuffer</i>.
     * @param {Pointer<UInt32>} pcbRequired Pointer to the number of bytes that is required if <i>OutBuffer</i> is too small.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error allocating memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the output buffer is too small to hold the resulting data. The <i>pcbRequired</i> parameter points to the correct size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetallproperties
     * @since windowsserver2008
     */
    static ResUtilGetAllProperties(hkeyClusterKey, pPropertyTable, pOutPropertyList, cbOutPropertyListSize, pcbBytesReturned, pcbRequired) {
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilGetAllProperties", "ptr", hkeyClusterKey, "ptr", pPropertyTable, "ptr", pOutPropertyList, "uint", cbOutPropertyListSize, "uint*", pcbBytesReturned, "uint*", pcbRequired, "uint")
        return result
    }

    /**
     * Returns private properties for a cluster object. The PRESUTIL_GET_PRIVATE_PROPERTIES type defines a pointer to this function.
     * @param {HKEY} hkeyClusterKey Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-database">cluster database</a> key that identifies the location of the private properties to retrieve.
     * @param {Pointer} pOutPropertyList Pointer to an output buffer in which a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-lists">property list</a> with the names and values of the private properties is returned.
     * @param {Integer} cbOutPropertyListSize Size of the output buffer pointed to by <i>pOutPropertyList</i>.
     * @param {Pointer<UInt32>} pcbBytesReturned Pointer to the total number of bytes in the property list pointed to by <i>pOutPropertyList</i>.
     * @param {Pointer<UInt32>} pcbRequired Pointer to the number of bytes that is required if <i>pOutPropertyList</i> is too small to hold all of the private properties.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error allocating memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the output buffer is too small to hold the resulting data. The <i>pcbRequired</i> parameter points to the correct size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetprivateproperties
     * @since windowsserver2008
     */
    static ResUtilGetPrivateProperties(hkeyClusterKey, pOutPropertyList, cbOutPropertyListSize, pcbBytesReturned, pcbRequired) {
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilGetPrivateProperties", "ptr", hkeyClusterKey, "ptr", pOutPropertyList, "uint", cbOutPropertyListSize, "uint*", pcbBytesReturned, "uint*", pcbRequired, "uint")
        return result
    }

    /**
     * Returns the total number of bytes required for a specified property.
     * @param {HKEY} hkeyClusterKey <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-database">Cluster database</a> key identifying the location of the property to size.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTableItem Pointer to a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resutil_property_item">RESUTIL_PROPERTY_ITEM</a> structure describing the property to size.
     * @param {Pointer<UInt32>} pcbOutPropertyListSize Pointer to the total number of bytes required for the property value, which includes the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_value">CLUSPROP_VALUE</a> structure and the data.
     * @param {Pointer<UInt32>} pnPropertyCount Pointer to the total number of properties. This value is incremented to include this property if  <b>ResUtilGetPropertySize</b> is successful.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data type of a property specified in the property table does not match the data type of the same-named property stored in the cluster database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetpropertysize
     * @since windowsserver2008
     */
    static ResUtilGetPropertySize(hkeyClusterKey, pPropertyTableItem, pcbOutPropertyListSize, pnPropertyCount) {
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilGetPropertySize", "ptr", hkeyClusterKey, "ptr", pPropertyTableItem, "uint*", pcbOutPropertyListSize, "uint*", pnPropertyCount, "uint")
        return result
    }

    /**
     * Returns a specified property from the cluster database. The PRESUTIL_GET_PROPERTY type defines a pointer to this function.
     * @param {HKEY} hkeyClusterKey Pointer to the cluster database key identifying the location of the property to retrieve.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTableItem Pointer to a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resutil_property_item">RESUTIL_PROPERTY_ITEM</a> structure that describes the property to retrieve.
     * @param {Pointer} pOutPropertyItem Pointer to an output buffer in which to return the requested property. It is assumed that the buffer is part of a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-lists">property list</a>.
     * @param {Pointer<UInt32>} pcbOutPropertyItemSize Pointer to the size in bytes of the output buffer pointed to by <i>pOutPropertyItem</i>.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters were invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetproperty
     * @since windowsserver2008
     */
    static ResUtilGetProperty(hkeyClusterKey, pPropertyTableItem, pOutPropertyItem, pcbOutPropertyItemSize) {
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilGetProperty", "ptr", hkeyClusterKey, "ptr", pPropertyTableItem, "ptr", pOutPropertyItem, "uint*", pcbOutPropertyItemSize, "uint")
        return result
    }

    /**
     * Uses a property table to verify that a property list is correctly formatted.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable Pointer to a property table describing the properties that will be validated in the property list.
     * @param {BOOL} bAllowUnknownProperties If <b>TRUE</b>, the function ignores all properties in the property list that are not included in the property table. If <b>FALSE</b>, any property in the property list that is not included in the property table causes the function to return <b>ERROR_INVALID_PARAMETER</b>.
     * @param {Pointer} pInPropertyList Pointer to the input buffer containing the property list to validate.
     * @param {Integer} cbInPropertyListSize Size in bytes of the input buffer pointed to by <i>pInPropertyList</i>.
     * @param {Pointer<Byte>} pOutParams Pointer to a parameter block.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property list buffer is larger than reported by the <i>cbInPropertyListSize</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No property list buffer was specified, or the property list is formatted incorrectly
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property list is formatted incorrectly. If <i>bAllowUnknownProperties</i> is set to <b>FALSE</b>, the property list may contain properties that are not present in the property table.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilverifypropertytable
     * @since windowsserver2008
     */
    static ResUtilVerifyPropertyTable(pPropertyTable, bAllowUnknownProperties, pInPropertyList, cbInPropertyListSize, pOutParams) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("RESUTILS.dll\ResUtilVerifyPropertyTable", "ptr", pPropertyTable, "ptr", Reserved, "ptr", bAllowUnknownProperties, "ptr", pInPropertyList, "uint", cbInPropertyListSize, "char*", pOutParams, "uint")
        return result
    }

    /**
     * Sets properties in the cluster database based on a property list from a property table..
     * @param {HKEY} hkeyClusterKey Cluster database key identifying the location of the properties to set.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable Pointer to an array of 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resutil_property_item">RESUTIL_PROPERTY_ITEM</a> structures describing the 
     *       properties to set.
     * @param {BOOL} bAllowUnknownProperties Indicates whether <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/unknown-properties">unknown properties</a> should be 
     *       accepted. This parameter is set to <b>TRUE</b> if they should be accepted, and 
     *       <b>FALSE</b> if not.
     * @param {Pointer} pInPropertyList Pointer to the input buffer containing a property list.
     * @param {Integer} cbInPropertyListSize Size in bytes of the input buffer pointed to by <i>cbInPropertyList</i>.
     * @param {Pointer<Byte>} pOutParams Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/parameter-blocks">parameter block</a> to hold returned data. 
     *       If specified, parameters are only written if they differ from those in the input buffer.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error 
     *        codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the input buffer specified in <i>cbInPropertyListSize</i> is too 
     *         small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input buffer pointed to by <i>pInPropertyList</i> is 
     *         <b>NULL</b>, a property name is not valid, or a property value is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The syntax, format, or type of a property in the property table pointed to by 
     *         <i>pPropertyTable</i> is incorrect, or a property is 
     *         <a href="/previous-versions/windows/desktop/mscs/read-only-properties">read-only</a> and cannot be set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilsetpropertytable
     * @since windowsserver2008
     */
    static ResUtilSetPropertyTable(hkeyClusterKey, pPropertyTable, bAllowUnknownProperties, pInPropertyList, cbInPropertyListSize, pOutParams) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilSetPropertyTable", "ptr", hkeyClusterKey, "ptr", pPropertyTable, "ptr", Reserved, "ptr", bAllowUnknownProperties, "ptr", pInPropertyList, "uint", cbInPropertyListSize, "char*", pOutParams, "uint")
        return result
    }

    /**
     * Sets properties in the cluster database based on a property list from a property table.
     * @param {HKEY} hkeyClusterKey Cluster database key identifying the location of the properties to set.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable Pointer to an array of  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resutil_property_item">RESUTIL_PROPERTY_ITEM</a> structures describing the properties to set.
     * @param {Pointer<Void>} Reserved Reserved.
     * @param {BOOL} bAllowUnknownProperties Indicates whether  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/unknown-properties">unknown properties</a> should be accepted. This parameter is set to <b>TRUE</b> if they should be accepted and <b>FALSE</b> if not.
     * @param {Pointer<Void>} pInPropertyList Pointer to the input buffer containing a property list.
     * @param {Integer} cbInPropertyListSize Size in bytes of the input buffer pointed to by <i>cbInPropertyList</i>.
     * @param {BOOL} bForceWrite Forces the property values to be written to the cluster database even if the new values are identical to the existing values
     * @param {Pointer<Byte>} pOutParams Pointer to a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/parameter-blocks">parameter block</a> to hold returned data. When this is pointer is specified, only parameters that differ from those in the input buffer are written to the parameter block.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of the input buffer specified in <i>cbInPropertyListSize</i> is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input buffer pointed to by <i>pInPropertyList</i> is <b>NULL</b>, a property name is not valid, or a property value is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The syntax, format, or type of a property in the property table pointed to by <i>pPropertyTable</i> is incorrect, or a property is read-only and cannot be set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilsetpropertytableex
     * @since windowsserver2008
     */
    static ResUtilSetPropertyTableEx(hkeyClusterKey, pPropertyTable, Reserved, bAllowUnknownProperties, pInPropertyList, cbInPropertyListSize, bForceWrite, pOutParams) {
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilSetPropertyTableEx", "ptr", hkeyClusterKey, "ptr", pPropertyTable, "ptr", Reserved, "ptr", bAllowUnknownProperties, "ptr", pInPropertyList, "uint", cbInPropertyListSize, "ptr", bForceWrite, "char*", pOutParams, "uint")
        return result
    }

    /**
     * Sets properties in the cluster database from a parameter block.
     * @param {HKEY} hkeyClusterKey Cluster database key identifying the location for the properties to set.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable Pointer to an array of  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resutil_property_item">RESUTIL_PROPERTY_ITEM</a> structures describing the properties to set.
     * @param {Pointer<Void>} Reserved Reserved.
     * @param {Pointer<Byte>} pInParams Pointer to an input parameter block containing the data for the properties described in the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-tables">property table</a> pointed to by <i>pPropertyTable</i>.
     * @param {Pointer<Void>} pInPropertyList Pointer to the input buffer containing a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-lists">property list</a> or <b>NULL</b>. If <i>pInPropertyList</i> is not <b>NULL</b>, any properties listed in the property list that are not listed in the property table are also set in the cluster database.
     * @param {Integer} cbInPropertyListSize Size in bytes of the input buffer pointed to by <i>pInPropertyList</i>.
     * @param {Pointer<Byte>} pOutParams Pointer to a parameter block to receive data copied from the <i>pInParams</i> parameter.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The syntax, format, or type of a property in the property table pointed to by <i>pPropertyTable</i> is incorrect, or a property is read-only and cannot be updated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters were invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilsetpropertyparameterblock
     * @since windowsserver2008
     */
    static ResUtilSetPropertyParameterBlock(hkeyClusterKey, pPropertyTable, Reserved, pInParams, pInPropertyList, cbInPropertyListSize, pOutParams) {
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilSetPropertyParameterBlock", "ptr", hkeyClusterKey, "ptr", pPropertyTable, "ptr", Reserved, "char*", pInParams, "ptr", pInPropertyList, "uint", cbInPropertyListSize, "char*", pOutParams, "uint")
        return result
    }

    /**
     * Sets properties in the cluster database from a parameter block.
     * @param {HKEY} hkeyClusterKey Cluster database key identifying the location for the properties to set.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable Pointer to an array of  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resutil_property_item">RESUTIL_PROPERTY_ITEM</a> structures describing the properties to set.
     * @param {Pointer<Void>} Reserved Reserved.
     * @param {Pointer<Byte>} pInParams Pointer to an input parameter block containing the data for the properties described in the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-tables">property table</a> pointed to by <i>pPropertyTable</i>.
     * @param {Pointer<Void>} pInPropertyList Pointer to the input buffer containing a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-lists">property list</a> or <b>NULL</b>. If <i>pInPropertyList</i> is not <b>NULL</b>, any properties listed in the property list that are not listed in the property table are also set in the cluster database.
     * @param {Integer} cbInPropertyListSize Size in bytes of the input buffer pointed to by <i>pInPropertyList</i>.
     * @param {BOOL} bForceWrite Forces the property values to be written to the cluster database even if the new values are identical to the existing values
     * @param {Pointer<Byte>} pOutParams Pointer to a parameter block to receive data copied from the <i>pInParams</i> parameter.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The syntax, format, or type of a property in the property table pointed to by <i>pPropertyTable</i> is incorrect, or a property is  <a href="/previous-versions/windows/desktop/mscs/read-only-properties">read-only</a> and cannot be updated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters were invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilsetpropertyparameterblockex
     * @since windowsserver2008
     */
    static ResUtilSetPropertyParameterBlockEx(hkeyClusterKey, pPropertyTable, Reserved, pInParams, pInPropertyList, cbInPropertyListSize, bForceWrite, pOutParams) {
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilSetPropertyParameterBlockEx", "ptr", hkeyClusterKey, "ptr", pPropertyTable, "ptr", Reserved, "char*", pInParams, "ptr", pInPropertyList, "uint", cbInPropertyListSize, "ptr", bForceWrite, "char*", pOutParams, "uint")
        return result
    }

    /**
     * Stores a cluster object's unknown properties in the cluster database.
     * @param {HKEY} hkeyClusterKey <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-database">Cluster database</a> key identifying the location of the properties to set.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable Pointer to a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-tables">property table</a> specifying properties that should NOT be set by this function.
     * @param {Pointer} pInPropertyList Pointer to a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-lists">property list</a>. Any properties that appear in this list and that do NOT appear in <i>pInPropertyList</i> are set.
     * @param {Integer} cbInPropertyListSize Pointer to the size in bytes of the input buffer pointed to by <i>pInPropertyList</i>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilsetunknownproperties
     * @since windowsserver2008
     */
    static ResUtilSetUnknownProperties(hkeyClusterKey, pPropertyTable, pInPropertyList, cbInPropertyListSize) {
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilSetUnknownProperties", "ptr", hkeyClusterKey, "ptr", pPropertyTable, "ptr", pInPropertyList, "uint", cbInPropertyListSize, "uint")
        return result
    }

    /**
     * Retrieves properties specified by a property table from the cluster database and returns them in a parameter block.
     * @param {HKEY} hkeyClusterKey Pointer to the cluster database key that identifies the location of the properties to retrieve.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable Pointer to an array of  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resutil_property_item">RESUTIL_PROPERTY_ITEM</a> structures that describes the properties to process.
     * @param {Pointer<Byte>} pOutParams Pointer to the output parameter block to fill.
     * @param {BOOL} bCheckForRequiredProperties Specifies whether an error should be generated if required properties are missing.
     * @param {Pointer<PWSTR>} pszNameOfPropInError Address of the string pointer in which to return the name of the error generated by a missing required property. The <i>ppszNameOfPropInError</i> property is optional.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error allocating memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetpropertiestoparameterblock
     * @since windowsserver2008
     */
    static ResUtilGetPropertiesToParameterBlock(hkeyClusterKey, pPropertyTable, pOutParams, bCheckForRequiredProperties, pszNameOfPropInError) {
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilGetPropertiesToParameterBlock", "ptr", hkeyClusterKey, "ptr", pPropertyTable, "char*", pOutParams, "ptr", bCheckForRequiredProperties, "ptr", pszNameOfPropInError, "uint")
        return result
    }

    /**
     * Constructs a property list from a property table and a parameter block.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable Pointer to a property table describing the properties that will be included in the resulting property list.
     * @param {Pointer} pOutPropertyList Pointer to an output buffer that receives the property list.
     * @param {Pointer<UInt32>} pcbOutPropertyListSize Pointer to the size of the output buffer in bytes.
     * @param {Pointer<Byte>} pInParams Pointer to the parameter block in which the property values are stored.
     * @param {Pointer<UInt32>} pcbBytesReturned If the function returns <b>ERROR_SUCCESS</b>, <i>pcbBytesReturned</i> points to the actual byte size of the property list pointed to by <i>pOutPropertyList</i>. If the function does not return <b>ERROR_SUCCESS</b>, <i>pcbBytesReturned</i> points to a value of zero.
     * @param {Pointer<UInt32>} pcbRequired If the function returns <b>ERROR_MORE_DATA</b>, <i>pcbRequired</i> points to the byte size required to contain the property list. If the function does not return <b>ERROR_MORE_DATA</b>, <i>pcbBytesReturned</i> points to a value of zero.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error 
     *        codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The output buffer is too small to contain the resulting property list.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error allocating memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilpropertylistfromparameterblock
     * @since windowsserver2008
     */
    static ResUtilPropertyListFromParameterBlock(pPropertyTable, pOutPropertyList, pcbOutPropertyListSize, pInParams, pcbBytesReturned, pcbRequired) {
        result := DllCall("RESUTILS.dll\ResUtilPropertyListFromParameterBlock", "ptr", pPropertyTable, "ptr", pOutPropertyList, "uint*", pcbOutPropertyListSize, "char*", pInParams, "uint*", pcbBytesReturned, "uint*", pcbRequired, "uint")
        return result
    }

    /**
     * Performs a member-wise copy of the data from one parameter block to another.
     * @param {Pointer<Byte>} pOutParams Pointer to the duplicated parameter block.
     * @param {Pointer<Byte>} pInParams Pointer to the original parameter block.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable Pointer to an array of  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resutil_property_item">RESUTIL_PROPERTY_ITEM</a> structures describing properties in the original parameter block.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutildupparameterblock
     * @since windowsserver2008
     */
    static ResUtilDupParameterBlock(pOutParams, pInParams, pPropertyTable) {
        result := DllCall("RESUTILS.dll\ResUtilDupParameterBlock", "char*", pOutParams, "char*", pInParams, "ptr", pPropertyTable, "uint")
        return result
    }

    /**
     * Deallocates memory that has been allocated for a parameter block by ResUtilDupParameterBlock.
     * @remarks
     * 
     * The  <b>ResUtilFreeParameterBlock</b> utility function deallocates any memory allocated to each member of <i>pOutParams</i>, subject to the following limitations:
     * 
     * <ul>
     * <li>It will only deallocate memory for members referenced in the <i>pPropertyTable</i> input parameter.</li>
     * <li>It will not deallocate memory that is pointed to by any member of <i>pInParams</i>.</li>
     * </ul>
     * Do not use this function with parameter blocks that have not been allocated with  <a href="https://docs.microsoft.com/windows/desktop/api/resapi/nf-resapi-resutildupparameterblock">ResUtilDupParameterBlock</a>.
     * 
     * 
     * @param {Pointer<Byte>} pOutParams Pointer to the parameter block to deallocate.
     * @param {Pointer<Byte>} pInParams Pointer to the parameter block to use as a reference.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable Pointer to an array of  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resutil_property_item">RESUTIL_PROPERTY_ITEM</a> structures describing the properties in the input parameter block.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilfreeparameterblock
     * @since windowsserver2008
     */
    static ResUtilFreeParameterBlock(pOutParams, pInParams, pPropertyTable) {
        DllCall("RESUTILS.dll\ResUtilFreeParameterBlock", "char*", pOutParams, "char*", pInParams, "ptr", pPropertyTable)
    }

    /**
     * Retrieves a set of unknown properties from the cluster database and appends them to the end of a property list.
     * @param {HKEY} hkeyClusterKey Pointer to the cluster database key that identifies the location for the properties to read.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable Pointer to a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-tables">property table</a> describing the common and private properties of an object. Any properties found in the cluster database that are not in this property table are added to the property list.
     * @param {Pointer<Void>} pOutPropertyList Pointer to a buffer in which to receive the returned properties. On input, the buffer can contain an existing property list, or it can be empty. On output, the retrieved properties will be appended to the end of the existing list, or, if the buffer is empty, will return as a new property list.
     * @param {Integer} pcbOutPropertyListSize Total byte size of the buffer pointed to by <i>pOutPropertyList</i>. The size of the buffer must be large enough to contain the existing property list and the property list to be returned.
     * @param {Pointer<UInt32>} pcbBytesReturned On input, pointer to the byte size of the property list contained by the pOutPropertyList buffer. On output, pointer to the total number of bytes in the property list pointed to by <i>pOutPropertyList</i>.
     * @param {Pointer<UInt32>} pcbRequired On output, points to the total number of bytes required to hold the returned property list. If the <i>pOutPropertyList</i> buffer was too small, it can be reallocated to the required size.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error allocating memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutiladdunknownproperties
     * @since windowsserver2008
     */
    static ResUtilAddUnknownProperties(hkeyClusterKey, pPropertyTable, pOutPropertyList, pcbOutPropertyListSize, pcbBytesReturned, pcbRequired) {
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilAddUnknownProperties", "ptr", hkeyClusterKey, "ptr", pPropertyTable, "ptr", pOutPropertyList, "uint", pcbOutPropertyListSize, "uint*", pcbBytesReturned, "uint*", pcbRequired, "uint")
        return result
    }

    /**
     * Sets the private properties of a cluster object.
     * @param {HKEY} hkeyClusterKey <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-database">Cluster database</a> key identifying the location of the properties to set.
     * @param {Pointer} pInPropertyList Pointer to an input buffer containing a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/property-lists">property list</a> with the names and values of the properties to set.
     * @param {Integer} cbInPropertyListSize Pointer to the size in bytes of the input buffer pointed to by <i>pInPropertyList</i>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_ARGUMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the input parameters were invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was a problem with the length of a property's data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input buffer pointed to by <i>pInPropertyList</i> was NULL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The syntax of a property name was invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilsetprivatepropertylist
     * @since windowsserver2008
     */
    static ResUtilSetPrivatePropertyList(hkeyClusterKey, pInPropertyList, cbInPropertyListSize) {
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilSetPrivatePropertyList", "ptr", hkeyClusterKey, "ptr", pInPropertyList, "uint", cbInPropertyListSize, "uint")
        return result
    }

    /**
     * Verifies that a property list is correctly formatted.
     * @param {Pointer} pInPropertyList Pointer to an input buffer containing the property list to verify.
     * @param {Integer} cbInPropertyListSize Size of the input buffer pointed to by <i>pInPropertyList</i>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilverifyprivatepropertylist
     * @since windowsserver2008
     */
    static ResUtilVerifyPrivatePropertyList(pInPropertyList, cbInPropertyListSize) {
        result := DllCall("RESUTILS.dll\ResUtilVerifyPrivatePropertyList", "ptr", pInPropertyList, "uint", cbInPropertyListSize, "uint")
        return result
    }

    /**
     * Duplicates a null-terminated Unicode string.
     * @param {PWSTR} pszInString Pointer to the string to duplicate.
     * @returns {PWSTR} If the operation succeeds, the function returns a pointer to a buffer containing the duplicate string.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information, call the function  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutildupstring
     * @since windowsserver2008
     */
    static ResUtilDupString(pszInString) {
        pszInString := pszInString is String ? StrPtr(pszInString) : pszInString

        A_LastError := 0

        result := DllCall("RESUTILS.dll\ResUtilDupString", "ptr", pszInString, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns a binary value from the cluster database.
     * @param {HKEY} hkeyClusterKey Key in the cluster database that identifies the location of the value to retrieve.
     * @param {PWSTR} pszValueName Pointer to a null-terminated Unicode string containing the name of the value to retrieve.
     * @param {Pointer<Byte>} ppbOutValue Address of the pointer to the retrieved value.
     * @param {Pointer<UInt32>} pcbOutValueSize Pointer to a <b>DWORD</b> in which the size in bytes of the buffer pointed to by <i>ppbOutValue</i> is returned.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error allocating memory for the value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetbinaryvalue
     * @since windowsserver2008
     */
    static ResUtilGetBinaryValue(hkeyClusterKey, pszValueName, ppbOutValue, pcbOutValueSize) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilGetBinaryValue", "ptr", hkeyClusterKey, "ptr", pszValueName, "char*", ppbOutValue, "uint*", pcbOutValueSize, "uint")
        return result
    }

    /**
     * Returns a string value from the cluster database.
     * @param {HKEY} hkeyClusterKey Key identifying the location of the value in the cluster database.
     * @param {PWSTR} pszValueName A null-terminated Unicode string containing the name of the value to retrieve.
     * @returns {PWSTR} If the operation succeeds, 
     * the function returns a pointer to a buffer containing the string value.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information, call the function  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetszvalue
     * @since windowsserver2008
     */
    static ResUtilGetSzValue(hkeyClusterKey, pszValueName) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        A_LastError := 0

        result := DllCall("RESUTILS.dll\ResUtilGetSzValue", "ptr", hkeyClusterKey, "ptr", pszValueName, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns a numeric value from the cluster database.
     * @param {HKEY} hkeyClusterKey Key identifying the location of the numeric value in the cluster database.
     * @param {PWSTR} pszValueName Pointer to a null-terminated Unicode string containing the name of the value to retrieve.
     * @param {Pointer<UInt32>} pdwOutValue Pointer to the retrieved value.
     * @param {Integer} dwDefaultValue Value to return if the value pointed to by <i>pszValueName</i> is not found.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value pointed to by <i>ValueName</i> is not a numeric value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetdwordvalue
     * @since windowsserver2008
     */
    static ResUtilGetDwordValue(hkeyClusterKey, pszValueName, pdwOutValue, dwDefaultValue) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilGetDwordValue", "ptr", hkeyClusterKey, "ptr", pszValueName, "uint*", pdwOutValue, "uint", dwDefaultValue, "uint")
        return result
    }

    /**
     * TBD.
     * @param {HKEY} hkeyClusterKey TBD
     * @param {PWSTR} pszValueName TBD
     * @param {Pointer<UInt64>} pqwOutValue TBD
     * @param {Integer} qwDefaultValue TBD
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetqwordvalue
     * @since windowsserver2008
     */
    static ResUtilGetQwordValue(hkeyClusterKey, pszValueName, pqwOutValue, qwDefaultValue) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilGetQwordValue", "ptr", hkeyClusterKey, "ptr", pszValueName, "uint*", pqwOutValue, "uint", qwDefaultValue, "uint")
        return result
    }

    /**
     * Sets a binary value in the cluster database.
     * @param {HKEY} hkeyClusterKey Key identifying the location of the binary value in the cluster database.
     * @param {PWSTR} pszValueName A null-terminated Unicode string containing the name of the value to update.
     * @param {Pointer} pbNewValue Pointer to the new binary value.
     * @param {Integer} cbNewValueSize Size of the new binary value.
     * @param {Pointer} ppbOutValue Address of a pointer to the new binary value.
     * @param {Pointer<UInt32>} pcbOutValueSize Pointer to a <b>DWORD</b> in which the size in bytes of the value pointed to by <i>ppbOutValue</i> is returned.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilsetbinaryvalue
     * @since windowsserver2008
     */
    static ResUtilSetBinaryValue(hkeyClusterKey, pszValueName, pbNewValue, cbNewValueSize, ppbOutValue, pcbOutValueSize) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilSetBinaryValue", "ptr", hkeyClusterKey, "ptr", pszValueName, "ptr", pbNewValue, "uint", cbNewValueSize, "ptr", ppbOutValue, "uint*", pcbOutValueSize, "uint")
        return result
    }

    /**
     * Sets a string value in the cluster database. The PRESUTIL_SET_SZ_VALUE type defines a pointer to this function.
     * @param {HKEY} hkeyClusterKey Key identifying the location of the string value in the cluster database.
     * @param {PWSTR} pszValueName Null-terminated Unicode string containing the name of the value to update.
     * @param {PWSTR} pszNewValue Pointer to the new string value.
     * @param {Pointer<PWSTR>} ppszOutString Pointer to a string pointer that receives a copy of the updated value. If used, callers must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> on *<i>ppszOutValue</i>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while attempting to allocate memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilsetszvalue
     * @since windowsserver2008
     */
    static ResUtilSetSzValue(hkeyClusterKey, pszValueName, pszNewValue, ppszOutString) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName
        pszNewValue := pszNewValue is String ? StrPtr(pszNewValue) : pszNewValue
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilSetSzValue", "ptr", hkeyClusterKey, "ptr", pszValueName, "ptr", pszNewValue, "ptr", ppszOutString, "uint")
        return result
    }

    /**
     * Sets an expandable string value in the cluster database. The PRESUTIL_SET_EXPAND_SZ_VALUE type defines a pointer to this function.
     * @param {HKEY} hkeyClusterKey Key identifying the location of the expandable string value in the cluster database.
     * @param {PWSTR} pszValueName null-terminated Unicode string containing the name of the value to update.
     * @param {PWSTR} pszNewValue Pointer to the new expandable string value.
     * @param {Pointer<PWSTR>} ppszOutString Pointer to a string pointer that receives a copy of the updated value. If used, callers must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> on *<i>ppszOutValue</i>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while attempting to allocate memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilsetexpandszvalue
     * @since windowsserver2008
     */
    static ResUtilSetExpandSzValue(hkeyClusterKey, pszValueName, pszNewValue, ppszOutString) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName
        pszNewValue := pszNewValue is String ? StrPtr(pszNewValue) : pszNewValue
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilSetExpandSzValue", "ptr", hkeyClusterKey, "ptr", pszValueName, "ptr", pszNewValue, "ptr", ppszOutString, "uint")
        return result
    }

    /**
     * Sets a multiple string value in the cluster database. The PRESUTIL_SET_MULTI_SZ_VALUE type defines a pointer to this function.
     * @param {HKEY} hkeyClusterKey Key identifying the location of the multiple string value in the cluster database.
     * @param {PWSTR} pszValueName Null-terminated Unicode string containing the name of the value to update.
     * @param {Pointer} pszNewValue Pointer to the new multiple string value.
     * @param {Integer} cbNewValueSize Size of the new value.
     * @param {Pointer<PWSTR>} ppszOutValue Pointer to a string pointer that receives a copy of the updated value. If used, callers must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> on *<i>ppszOutValue</i>.
     * @param {Pointer<UInt32>} pcbOutValueSize Pointer that receives the size of the new value.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred while attempting to allocate memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilsetmultiszvalue
     * @since windowsserver2008
     */
    static ResUtilSetMultiSzValue(hkeyClusterKey, pszValueName, pszNewValue, cbNewValueSize, ppszOutValue, pcbOutValueSize) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilSetMultiSzValue", "ptr", hkeyClusterKey, "ptr", pszValueName, "ptr", pszNewValue, "uint", cbNewValueSize, "ptr", ppszOutValue, "uint*", pcbOutValueSize, "uint")
        return result
    }

    /**
     * Sets a numeric value in the cluster database. The PRESUTIL_SET_DWORD_VALUE type defines a pointer to this function.
     * @param {HKEY} hkeyClusterKey Key identifying the location of the numeric value in the cluster database.
     * @param {PWSTR} pszValueName A null-terminated Unicode string containing the name of the value to update.
     * @param {Integer} dwNewValue New <b>DWORD</b> value.
     * @param {Pointer<UInt32>} pdwOutValue Optional. Pointer to where the updated value should be copied.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilsetdwordvalue
     * @since windowsserver2008
     */
    static ResUtilSetDwordValue(hkeyClusterKey, pszValueName, dwNewValue, pdwOutValue) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilSetDwordValue", "ptr", hkeyClusterKey, "ptr", pszValueName, "uint", dwNewValue, "uint*", pdwOutValue, "uint")
        return result
    }

    /**
     * TBD. The PRESUTIL_SET_QWORD_VALUE type defines a pointer to this function.
     * @param {HKEY} hkeyClusterKey 
     * @param {PWSTR} pszValueName 
     * @param {Integer} qwNewValue 
     * @param {Pointer<UInt64>} pqwOutValue 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilsetqwordvalue
     * @since windowsserver2008
     */
    static ResUtilSetQwordValue(hkeyClusterKey, pszValueName, qwNewValue, pqwOutValue) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilSetQwordValue", "ptr", hkeyClusterKey, "ptr", pszValueName, "uint", qwNewValue, "uint*", pqwOutValue, "uint")
        return result
    }

    /**
     * Sets a value in the cluster database.
     * @param {HKEY} hkeyClusterKey A key that identifies the location of the value in the cluster database.
     * @param {PWSTR} valueName A Null-terminated Unicode string that contains the name of the value to update.
     * @param {Integer} valueType A flag that indicates the type of the value to update.
     * @param {Pointer} valueData A pointer to the new data for the value.
     * @param {Integer} valueSize The size of the new value, in bytes.
     * @param {Integer} flags The flags that specify settings for the operation.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if the operation succeeds; otherwise, returns a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilsetvalueex
     * @since windowsserver2012
     */
    static ResUtilSetValueEx(hkeyClusterKey, valueName, valueType, valueData, valueSize, flags) {
        valueName := valueName is String ? StrPtr(valueName) : valueName
        hkeyClusterKey := hkeyClusterKey is Win32Handle ? NumGet(hkeyClusterKey, "ptr") : hkeyClusterKey

        result := DllCall("RESUTILS.dll\ResUtilSetValueEx", "ptr", hkeyClusterKey, "ptr", valueName, "uint", valueType, "ptr", valueData, "uint", valueSize, "uint", flags, "uint")
        return result
    }

    /**
     * Retrieves a binary property from a property list and advances a pointer to the next property in the list. The PRESUTIL_GET_BINARY_PROPERTY type defines a pointer to this function.
     * @param {Pointer<Byte>} ppbOutValue Address of a pointer in which the binary value from the property list will be returned.
     * @param {Pointer<UInt32>} pcbOutValueSize Pointer to the size of the output value.
     * @param {Pointer<CLUSPROP_BINARY>} pValueStruct Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_binary">CLUSPROP_BINARY</a> structure specifying 
     *       the binary value to retrieve from the property list.
     * @param {Pointer} pbOldValue Pointer to the previous value of the property.
     * @param {Integer} cbOldValueSize Pointer to the length of the previous value of the property.
     * @param {Pointer} ppPropertyList Address of the pointer to the property list buffer containing the binary property. This pointer will be 
     *       advanced to the beginning of the next property.
     * @param {Pointer<UInt32>} pcbPropertyListSize Pointer to the size of the property list buffer. The size will be decremented to account for the advance of 
     *       the <i>ppPropertyList</i> pointer.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error 
     *        code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data is formatted incorrectly.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetbinaryproperty
     * @since windowsserver2008
     */
    static ResUtilGetBinaryProperty(ppbOutValue, pcbOutValueSize, pValueStruct, pbOldValue, cbOldValueSize, ppPropertyList, pcbPropertyListSize) {
        result := DllCall("RESUTILS.dll\ResUtilGetBinaryProperty", "char*", ppbOutValue, "uint*", pcbOutValueSize, "ptr", pValueStruct, "ptr", pbOldValue, "uint", cbOldValueSize, "ptr", ppPropertyList, "uint*", pcbPropertyListSize, "uint")
        return result
    }

    /**
     * Retrieves a string property from a property list and advances a pointer to the next property in the list. The PRESUTIL_GET_SZ_PROPERTY type defines a pointer to this function.
     * @param {Pointer<PWSTR>} ppszOutValue Address of a pointer in which the string value from the property list will be returned.
     * @param {Pointer<CLUSPROP_SZ>} pValueStruct Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa368390(v=vs.85)">CLUSPROP_SZ</a> structure specifying the 
     *       string value to retrieve from the property list.
     * @param {PWSTR} pszOldValue Pointer to the previous value of the property.
     * @param {Pointer} ppPropertyList Address of the pointer to the property list buffer containing the string property. This pointer will be 
     *       advanced to the beginning of the next property.
     * @param {Pointer<UInt32>} pcbPropertyListSize Pointer to the size of the property list buffer. The size will be decremented to account for the advance of 
     *       the <i>ppPropertyList</i> pointer.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error 
     *        code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data is formatted incorrectly.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetszproperty
     * @since windowsserver2008
     */
    static ResUtilGetSzProperty(ppszOutValue, pValueStruct, pszOldValue, ppPropertyList, pcbPropertyListSize) {
        pszOldValue := pszOldValue is String ? StrPtr(pszOldValue) : pszOldValue

        result := DllCall("RESUTILS.dll\ResUtilGetSzProperty", "ptr", ppszOutValue, "ptr", pValueStruct, "ptr", pszOldValue, "ptr", ppPropertyList, "uint*", pcbPropertyListSize, "uint")
        return result
    }

    /**
     * Retrieves a multiple string property from a property list and advances a pointer to the next property in the list. The PRESUTIL_GET_MULTI_SZ_PROPERTY type defines a pointer to this function.
     * @param {Pointer<PWSTR>} ppszOutValue Address of a pointer in which the multiple string value from the property list will be returned.
     * @param {Pointer<UInt32>} pcbOutValueSize Pointer to the size of the output value.
     * @param {Pointer<CLUSPROP_SZ>} pValueStruct Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clusprop_sz">CLUSPROP_MULTI_SZ</a> structure 
     *       specifying the multiple string value to retrieve from the property list.
     * @param {Pointer} pszOldValue Pointer to the previous value of the property.
     * @param {Integer} cbOldValueSize Pointer to the length of the previous value of the property.
     * @param {Pointer} ppPropertyList Address of the pointer to the property list buffer containing the multiple string property. This pointer 
     *       will be advanced to the beginning of the next property.
     * @param {Pointer<UInt32>} pcbPropertyListSize Pointer to the size of the property list buffer. The size will be decremented to account for the advance of 
     *       the <i>ppPropertyList</i> pointer.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *       <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error 
     *       code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data is formatted incorrectly.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetmultiszproperty
     * @since windowsserver2008
     */
    static ResUtilGetMultiSzProperty(ppszOutValue, pcbOutValueSize, pValueStruct, pszOldValue, cbOldValueSize, ppPropertyList, pcbPropertyListSize) {
        result := DllCall("RESUTILS.dll\ResUtilGetMultiSzProperty", "ptr", ppszOutValue, "uint*", pcbOutValueSize, "ptr", pValueStruct, "ptr", pszOldValue, "uint", cbOldValueSize, "ptr", ppPropertyList, "uint*", pcbPropertyListSize, "uint")
        return result
    }

    /**
     * Retrieves a DWORD property from a property list and advances a pointer to the next property in the list. The PRESUTIL_GET_DWORD_PROPERTY type defines a pointer to this function.
     * @param {Pointer<UInt32>} pdwOutValue Address of a pointer in which the <b>DWORD</b> value from the property list will be 
     *       returned.
     * @param {Pointer<CLUSPROP_DWORD>} pValueStruct Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa368375(v=vs.85)">CLUSPROP_DWORD</a> structure specifying 
     *       the <b>DWORD</b> value to retrieve from the property list.
     * @param {Integer} dwOldValue Specifies the previous value of the property.
     * @param {Integer} dwMinimum Specifies the minimum value allowed for the property.
     * @param {Integer} dwMaximum Specifies the maximum value allowed for the property.
     * @param {Pointer<Byte>} ppPropertyList Address of the pointer to the property list buffer containing the <b>DWORD</b> 
     *       property. This pointer will be advanced to the beginning of the next property.
     * @param {Pointer<UInt32>} pcbPropertyListSize Pointer to the size of the property list buffer. The size will be decremented to account for the advance of 
     *       the <i>ppPropertyList</i> pointer.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error 
     *        code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data is formatted incorrectly.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetdwordproperty
     * @since windowsserver2008
     */
    static ResUtilGetDwordProperty(pdwOutValue, pValueStruct, dwOldValue, dwMinimum, dwMaximum, ppPropertyList, pcbPropertyListSize) {
        result := DllCall("RESUTILS.dll\ResUtilGetDwordProperty", "uint*", pdwOutValue, "ptr", pValueStruct, "uint", dwOldValue, "uint", dwMinimum, "uint", dwMaximum, "char*", ppPropertyList, "uint*", pcbPropertyListSize, "uint")
        return result
    }

    /**
     * TBD. The PRESUTIL_GET_LONG_PROPERTY type defines a pointer to this function.
     * @param {Pointer<Int32>} plOutValue TBD
     * @param {Pointer<CLUSPROP_LONG>} pValueStruct TBD
     * @param {Integer} lOldValue TBD
     * @param {Integer} lMinimum TBD
     * @param {Integer} lMaximum TBD
     * @param {Pointer<Byte>} ppPropertyList TBD
     * @param {Pointer<UInt32>} pcbPropertyListSize TBD
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetlongproperty
     * @since windowsserver2008
     */
    static ResUtilGetLongProperty(plOutValue, pValueStruct, lOldValue, lMinimum, lMaximum, ppPropertyList, pcbPropertyListSize) {
        result := DllCall("RESUTILS.dll\ResUtilGetLongProperty", "int*", plOutValue, "ptr", pValueStruct, "int", lOldValue, "int", lMinimum, "int", lMaximum, "char*", ppPropertyList, "uint*", pcbPropertyListSize, "uint")
        return result
    }

    /**
     * TBD. The PRESUTIL_GET_FILETIME_PROPERTY type defines a pointer to this function.
     * @param {Pointer<FILETIME>} pftOutValue 
     * @param {Pointer<CLUSPROP_FILETIME>} pValueStruct 
     * @param {FILETIME} ftOldValue 
     * @param {FILETIME} ftMinimum 
     * @param {FILETIME} ftMaximum 
     * @param {Pointer<Byte>} ppPropertyList 
     * @param {Pointer<UInt32>} pcbPropertyListSize 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetfiletimeproperty
     * @since windowsserver2008
     */
    static ResUtilGetFileTimeProperty(pftOutValue, pValueStruct, ftOldValue, ftMinimum, ftMaximum, ppPropertyList, pcbPropertyListSize) {
        result := DllCall("RESUTILS.dll\ResUtilGetFileTimeProperty", "ptr", pftOutValue, "ptr", pValueStruct, "ptr", ftOldValue, "ptr", ftMinimum, "ptr", ftMaximum, "char*", ppPropertyList, "uint*", pcbPropertyListSize, "uint")
        return result
    }

    /**
     * Adjusts environment data for a resource so that the resource uses a cluster network name to identify its location.
     * @param {HRESOURCE} hResource Handle to a resource that depends on a Network Name resource.
     * @returns {Pointer<Void>} If the operations succeeds, the function returns a pointer to the environment block.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetenvironmentwithnetname
     * @since windowsserver2008
     */
    static ResUtilGetEnvironmentWithNetName(hResource) {
        A_LastError := 0

        result := DllCall("RESUTILS.dll\ResUtilGetEnvironmentWithNetName", "ptr", hResource, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Destroys the environment variable block created with ResUtilGetEnvironmentWithNetName. The PRESUTIL_FREE_ENVIRONMENT type defines a pointer to this function.
     * @param {Pointer<Void>} lpEnvironment Pointer to the environment variable block returned from  <a href="https://docs.microsoft.com/windows/desktop/api/resapi/nf-resapi-resutilgetenvironmentwithnetname">ResUtilGetEnvironmentWithNetName</a>.
     * @returns {Integer} This function has no return values.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilfreeenvironment
     * @since windowsserver2008
     */
    static ResUtilFreeEnvironment(lpEnvironment) {
        result := DllCall("RESUTILS.dll\ResUtilFreeEnvironment", "ptr", lpEnvironment, "uint")
        return result
    }

    /**
     * Expands strings containing unexpanded references to environment variables. The PRESUTIL_EXPAND_ENVIRONMENT_STRINGS type defines a pointer to this function.
     * @param {PWSTR} pszSrc Pointer to a null-terminated Unicode string containing unexpanded references to environment variables (an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/e-gly">expandable string</a>).
     * @returns {PWSTR} If the operation succeeds, the function returns a pointer to the expanded string (REG_EXPAND_SZ). The function allocates the necessary memory with <a href="/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a>. To prevent memory leaks, be sure to release the memory with <a href="/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>.
     * 
     * If the operation fails, the function returns <b>NULL</b>.
     *      For more information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilexpandenvironmentstrings
     * @since windowsserver2008
     */
    static ResUtilExpandEnvironmentStrings(pszSrc) {
        pszSrc := pszSrc is String ? StrPtr(pszSrc) : pszSrc

        A_LastError := 0

        result := DllCall("RESUTILS.dll\ResUtilExpandEnvironmentStrings", "ptr", pszSrc, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adjusts the environment data for a service so that the service uses a cluster network name to identify its location. This function must be called from a resource DLL. The PRESUTIL_SET_RESOURCE_SERVICE_ENVIRONMENT type defines a pointer to this function.
     * @param {PWSTR} pszServiceName Pointer a null-terminated Unicode string containing the name of the service.
     * @param {HRESOURCE} hResource Resource handle for the service obtained from  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-openclusterresource">OpenClusterResource</a>.
     * @param {Pointer<PLOG_EVENT_ROUTINE>} pfnLogEvent Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plog_event_routine">LogEvent</a> entry point function of the resource DLL managing the service.
     * @param {Pointer} hResourceHandle Resource handle required by the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plog_event_routine">LogEvent</a> entry point function. Use the handle passed to the DLL in the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-popen_routine">Open</a> entry point function.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilsetresourceserviceenvironment
     * @since windowsserver2008
     */
    static ResUtilSetResourceServiceEnvironment(pszServiceName, hResource, pfnLogEvent, hResourceHandle) {
        pszServiceName := pszServiceName is String ? StrPtr(pszServiceName) : pszServiceName

        result := DllCall("RESUTILS.dll\ResUtilSetResourceServiceEnvironment", "ptr", pszServiceName, "ptr", hResource, "ptr", pfnLogEvent, "ptr", hResourceHandle, "uint")
        return result
    }

    /**
     * Removes the environment data from a service. This function must be called from a resource DLL. The PRESUTIL_REMOVE_RESOURCE_SERVICE_ENVIRONMENT type defines a pointer to this function.
     * @param {PWSTR} pszServiceName Pointer  to a null-terminated Unicode string  that contains the name of the service.
     * @param {Pointer<PLOG_EVENT_ROUTINE>} pfnLogEvent Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plog_event_routine">LogEvent</a> entry point function of the resource DLL  that manages  the service.
     * @param {Pointer} hResourceHandle Resource handle  that  the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plog_event_routine">LogEvent</a> entry point function  requires. Use the handle passed to the DLL in the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-popen_routine">Open</a> entry point function.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilremoveresourceserviceenvironment
     * @since windowsserver2008
     */
    static ResUtilRemoveResourceServiceEnvironment(pszServiceName, pfnLogEvent, hResourceHandle) {
        pszServiceName := pszServiceName is String ? StrPtr(pszServiceName) : pszServiceName

        result := DllCall("RESUTILS.dll\ResUtilRemoveResourceServiceEnvironment", "ptr", pszServiceName, "ptr", pfnLogEvent, "ptr", hResourceHandle, "uint")
        return result
    }

    /**
     * Adjusts the start parameters of a specified service so that it will operate correctly as a cluster resource. It must be called from a resource DLL. The PRESUTIL_SET_RESOURCE_SERVICE_START_PARAMETERS type defines a pointer to this function.
     * @param {PWSTR} pszServiceName Pointer to a null-terminated Unicode string specifying the name of the service.
     * @param {SC_HANDLE} schSCMHandle Handle to the Service Control Manager (SCM) or <b>NULL</b>. If <b>NULL</b>, the function will attempt to open a handle to the SCM.
     * @param {Pointer<SC_HANDLE>} phService On input, a <b>NULL</b> service handle. On output, handle to the specified service if the call was successful, otherwise <b>NULL</b>.
     * @param {Pointer<PLOG_EVENT_ROUTINE>} pfnLogEvent Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plog_event_routine">LogEvent</a> entry point function of the resource DLL managing the service.
     * @param {Pointer} hResourceHandle Resource handle required by the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plog_event_routine">LogEvent</a> entry point function. Use the handle passed to the DLL in the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-popen_routine">Open</a> entry point function.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilsetresourceservicestartparameters
     * @since windowsserver2008
     */
    static ResUtilSetResourceServiceStartParameters(pszServiceName, schSCMHandle, phService, pfnLogEvent, hResourceHandle) {
        pszServiceName := pszServiceName is String ? StrPtr(pszServiceName) : pszServiceName
        schSCMHandle := schSCMHandle is Win32Handle ? NumGet(schSCMHandle, "ptr") : schSCMHandle

        result := DllCall("RESUTILS.dll\ResUtilSetResourceServiceStartParameters", "ptr", pszServiceName, "ptr", schSCMHandle, "ptr", phService, "ptr", pfnLogEvent, "ptr", hResourceHandle, "uint")
        return result
    }

    /**
     * Locates a string property in a property list. The PRESUTIL_FIND_SZ_PROPERTY type defines a pointer to this function.
     * @param {Pointer} pPropertyList Pointer to the property list in which to locate the value.
     * @param {Integer} cbPropertyListSize Size in bytes of the data included in <i>pPropertyList</i>.
     * @param {PWSTR} pszPropertyName Pointer to a null-terminated Unicode string containing the name of the value to locate.
     * @param {Pointer<PWSTR>} pszPropertyValue Pointer to a <b>WCHAR</b> pointer to a buffer (allocated by the function) containing a copy of the property value. You must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> (on *<i>pszPropertyValue</i>) to free the allocated memory. If no value is required, pass <b>NULL</b> for this parameter.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property list is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not allocate a buffer in which to return the property value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified property could not be located in the property list.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilfindszproperty
     * @since windowsserver2008
     */
    static ResUtilFindSzProperty(pPropertyList, cbPropertyListSize, pszPropertyName, pszPropertyValue) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := DllCall("RESUTILS.dll\ResUtilFindSzProperty", "ptr", pPropertyList, "uint", cbPropertyListSize, "ptr", pszPropertyName, "ptr", pszPropertyValue, "uint")
        return result
    }

    /**
     * Locates an expandable string property in a property list. The PRESUTIL_FIND_EXPAND_SZ_PROPERTY type defines a pointer to this function.
     * @param {Pointer} pPropertyList Pointer to the property list in which to locate the value.
     * @param {Integer} cbPropertyListSize Size in bytes of the data included in <i>pPropertyList</i>.
     * @param {PWSTR} pszPropertyName Pointer to a null-terminated Unicode string containing the name of the value to locate.
     * @param {Pointer<PWSTR>} pszPropertyValue Pointer to a <b>WCHAR</b> pointer to a buffer (allocated by the function) containing a copy of the property value. You must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> (on *<i>pszPropertyValue</i>) to free the allocated memory. If no value is required, pass <b>NULL</b> for this parameter.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property list is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not allocate a buffer in which to return the property value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified property could not be located in the property list.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilfindexpandszproperty
     * @since windowsserver2008
     */
    static ResUtilFindExpandSzProperty(pPropertyList, cbPropertyListSize, pszPropertyName, pszPropertyValue) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := DllCall("RESUTILS.dll\ResUtilFindExpandSzProperty", "ptr", pPropertyList, "uint", cbPropertyListSize, "ptr", pszPropertyName, "ptr", pszPropertyValue, "uint")
        return result
    }

    /**
     * Locates an expanded string property value in a property list. The PRESUTIL_FIND_EXPANDED_SZ_PROPERTY type defines a pointer to this function.
     * @param {Pointer} pPropertyList Pointer to the property list in which to locate the value.
     * @param {Integer} cbPropertyListSize Size in bytes of the data included in <i>pPropertyList</i>.
     * @param {PWSTR} pszPropertyName Pointer to a null-terminated Unicode string containing the name of the value to locate.
     * @param {Pointer<PWSTR>} pszPropertyValue Pointer to a <b>WCHAR</b> pointer to a buffer (allocated by the function) containing a copy of the property value. You must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> (on *<i>pszPropertyValue</i>) to free the allocated memory. If no value is required, pass <b>NULL</b> for this parameter.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property list is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not allocate a buffer in which to return the property value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified property could not be located in the property list.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilfindexpandedszproperty
     * @since windowsserver2008
     */
    static ResUtilFindExpandedSzProperty(pPropertyList, cbPropertyListSize, pszPropertyName, pszPropertyValue) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := DllCall("RESUTILS.dll\ResUtilFindExpandedSzProperty", "ptr", pPropertyList, "uint", cbPropertyListSize, "ptr", pszPropertyName, "ptr", pszPropertyValue, "uint")
        return result
    }

    /**
     * Locates an unsigned long property value in a property list. The PRESUTIL_FIND_DWORD_PROPERTY type defines a pointer to this function.
     * @param {Pointer} pPropertyList Pointer to the property list in which to locate the value.
     * @param {Integer} cbPropertyListSize Size in bytes of the data included in <i>pPropertyList</i>.
     * @param {PWSTR} pszPropertyName Pointer to a null-terminated Unicode string containing the name of the value to locate.
     * @param {Pointer<UInt32>} pdwPropertyValue Pointer to the actual value of the data stored in the property list buffer.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data is in an incorrect format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property could not be located in the property list.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilfinddwordproperty
     * @since windowsserver2008
     */
    static ResUtilFindDwordProperty(pPropertyList, cbPropertyListSize, pszPropertyName, pdwPropertyValue) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := DllCall("RESUTILS.dll\ResUtilFindDwordProperty", "ptr", pPropertyList, "uint", cbPropertyListSize, "ptr", pszPropertyName, "uint*", pdwPropertyValue, "uint")
        return result
    }

    /**
     * Locates a specified binary property in a property list and can also return the value of the property. The PRESUTIL_FIND_BINARY_PROPERTY type defines a pointer to this function.
     * @param {Pointer} pPropertyList Pointer to the property list in which to locate the value.
     * @param {Integer} cbPropertyListSize Size, in bytes, of the property list specified by <i>pPropertyList</i>.
     * @param {PWSTR} pszPropertyName Pointer to a null-terminated Unicode string containing the name of the property to locate.
     * @param {Pointer<Byte>} pbPropertyValue Pointer to a <b>BYTE</b> pointer to a buffer (allocated by the function) containing a copy of the property value. You must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> (on *<i>pbPropertyValue</i>) to free the allocated memory. If no value is required, pass <b>NULL</b> for this parameter.
     * @param {Pointer<UInt32>} pcbPropertyValueSize Pointer to the size, in bytes, of the value returned. If no size is required, pass <b>NULL</b> for this parameter.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property list is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not allocate a buffer in which to return the property value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified property could not be located in the property list.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilfindbinaryproperty
     * @since windowsserver2008
     */
    static ResUtilFindBinaryProperty(pPropertyList, cbPropertyListSize, pszPropertyName, pbPropertyValue, pcbPropertyValueSize) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := DllCall("RESUTILS.dll\ResUtilFindBinaryProperty", "ptr", pPropertyList, "uint", cbPropertyListSize, "ptr", pszPropertyName, "char*", pbPropertyValue, "uint*", pcbPropertyValueSize, "uint")
        return result
    }

    /**
     * Locates a multiple string property in a property list. The PRESUTIL_FIND_MULTI_SZ_PROPERTY type defines a pointer to this function.
     * @param {Pointer} pPropertyList Pointer to the property list in which to locate the value.
     * @param {Integer} cbPropertyListSize Size in bytes of the data included in <i>pPropertyList</i>.
     * @param {PWSTR} pszPropertyName Pointer to a null-terminated Unicode string containing the name of the value to locate.
     * @param {Pointer<PWSTR>} pszPropertyValue Pointer to a <b>WCHAR</b> pointer to a buffer (allocated by the function) containing a copy of the property value. You must call <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> (on *<i>pbPropertyValue</i>) to free the allocated memory. If no value is required, pass <b>NULL</b> for this parameter.
     * @param {Pointer<UInt32>} pcbPropertyValueSize Pointer to the size, in bytes, of the value returned. If no size is required, pass <b>NULL</b> for this parameter.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property list is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function could not allocate a buffer in which to return the property value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified property could not be located in the property list.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilfindmultiszproperty
     * @since windowsserver2008
     */
    static ResUtilFindMultiSzProperty(pPropertyList, cbPropertyListSize, pszPropertyName, pszPropertyValue, pcbPropertyValueSize) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := DllCall("RESUTILS.dll\ResUtilFindMultiSzProperty", "ptr", pPropertyList, "uint", cbPropertyListSize, "ptr", pszPropertyName, "ptr", pszPropertyValue, "uint*", pcbPropertyValueSize, "uint")
        return result
    }

    /**
     * Locates a signed long property value in a property list. The PRESUTIL_FIND_LONG_PROPERTY type defines a pointer to this function.
     * @param {Pointer} pPropertyList Pointer to the property list in which to locate the value.
     * @param {Integer} cbPropertyListSize Size in bytes of the data included in <i>pPropertyList</i>.
     * @param {PWSTR} pszPropertyName Pointer to a null-terminated Unicode string containing the name of the value to locate.
     * @param {Pointer<Int32>} plPropertyValue Pointer to the actual value of the data stored in the property list buffer.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data is in an incorrect format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property could not be located in the property list.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilfindlongproperty
     * @since windowsserver2008
     */
    static ResUtilFindLongProperty(pPropertyList, cbPropertyListSize, pszPropertyName, plPropertyValue) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := DllCall("RESUTILS.dll\ResUtilFindLongProperty", "ptr", pPropertyList, "uint", cbPropertyListSize, "ptr", pszPropertyName, "int*", plPropertyValue, "uint")
        return result
    }

    /**
     * Gets a large integer property value from a property list. The PRESUTIL_FIND_ULARGEINTEGER_PROPERTY type defines a pointer to this function.
     * @param {Pointer} pPropertyList A pointer to the property list.
     * @param {Integer} cbPropertyListSize The size of the data in <i>pPropertyList</i>, in bytes.
     * @param {PWSTR} pszPropertyName The name of the property.
     * @param {Pointer<UInt64>} plPropertyValue The value of the property.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following is a possible error 
     *        code.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilfindulargeintegerproperty
     * @since windowsserver2016
     */
    static ResUtilFindULargeIntegerProperty(pPropertyList, cbPropertyListSize, pszPropertyName, plPropertyValue) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := DllCall("RESUTILS.dll\ResUtilFindULargeIntegerProperty", "ptr", pPropertyList, "uint", cbPropertyListSize, "ptr", pszPropertyName, "uint*", plPropertyValue, "uint")
        return result
    }

    /**
     * TBD. The PRESUTIL_FIND_FILETIME_PROPERTY type defines a pointer to this function.
     * @param {Pointer} pPropertyList 
     * @param {Integer} cbPropertyListSize 
     * @param {PWSTR} pszPropertyName 
     * @param {Pointer<FILETIME>} pftPropertyValue 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilfindfiletimeproperty
     * @since windowsserver2008
     */
    static ResUtilFindFileTimeProperty(pPropertyList, cbPropertyListSize, pszPropertyName, pftPropertyValue) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName

        result := DllCall("RESUTILS.dll\ResUtilFindFileTimeProperty", "ptr", pPropertyList, "uint", cbPropertyListSize, "ptr", pszPropertyName, "ptr", pftPropertyValue, "uint")
        return result
    }

    /**
     * Creates a worker thread. The PCLUSAPI_CLUS_WORKER_CREATE type defines a pointer to this function.
     * @param {Pointer<CLUS_WORKER>} lpWorker Pointer to a 
     * zero-initialized <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-clus_worker">CLUS_WORKER</a> structure that on return is filled in with a handle to the created thread and a flag that indicates whether the handle should be terminated. The caller should never need to refer to or change the members of this structure.
     * @param {Pointer<PWORKER_START_ROUTINE>} lpStartAddress Pointer to the address of a function that should be called by the worker thread.
     * @param {Pointer<Void>} lpParameter A parameter to pass to the function whose address is pointed to by <i>lpStartAddress</i>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-clusworkercreate
     * @since windowsserver2008
     */
    static ClusWorkerCreate(lpWorker, lpStartAddress, lpParameter) {
        result := DllCall("RESUTILS.dll\ClusWorkerCreate", "ptr", lpWorker, "ptr", lpStartAddress, "ptr", lpParameter, "uint")
        return result
    }

    /**
     * Determines whether a worker thread should exit as soon as possible. The PCLUSAPIClusWorkerCheckTerminate type defines a pointer to this function.
     * @param {Pointer<CLUS_WORKER>} lpWorker Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-clus_worker">CLUS_WORKER</a> structure describing the 
     *        thread to check.
     * @returns {BOOL} <b>ClusWorkerCheckTerminate</b> returns one of 
     *        the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The thread should terminate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The thread should not terminate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-clusworkercheckterminate
     * @since windowsserver2008
     */
    static ClusWorkerCheckTerminate(lpWorker) {
        result := DllCall("RESUTILS.dll\ClusWorkerCheckTerminate", "ptr", lpWorker, "ptr")
        return result
    }

    /**
     * Waits for a worker thread to terminate up to the specified timeout.
     * @remarks
     * 
     * This function has no return values.
     * 
     * The **ClusWorkerTerminate** utility function checks the *hThread* and *Terminate* members of the **CLUS_WORKER** structure pointed to by *lpWorker*. If *hThread* is not NULL and *Terminate* is set to FALSE, indicating that this is your first call to **ClusWorkerTerminate**, the function waits for the thread to exit before returning. Otherwise, if you have called **ClusWorkerTerminate** previously, indicated by *Terminate* being set to TRUE, the function may return before the thread has terminated.
     * 
     * 
     * @param {Pointer<CLUS_WORKER>} lpWorker Pointer to a [CLUS_WORKER](ns-resapi-clus_worker.md) structure describing the thread to terminate.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-clusworkerterminate
     */
    static ClusWorkerTerminate(lpWorker) {
        DllCall("RESUTILS.dll\ClusWorkerTerminate", "ptr", lpWorker)
    }

    /**
     * Waits for a worker thread to terminate up to the specified timeout.
     * @param {Pointer<CLUS_WORKER>} ClusWorker Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-clus_worker">CLUS_WORKER</a> structure describing the 
     *        worker thread to terminate.
     * @param {Integer} TimeoutInMilliseconds The timeout in milliseconds.
     * @param {BOOL} WaitOnly If set <b>TRUE</b>, the function will wait for up to specified timeout without signaling the thread to terminate; otherwise it will signal the thread to terminate before waiting for the thread.
     * @returns {Integer} Returns a system error code on failure.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All worker threads are terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The worker thread is not terminated within the specified timeout.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-clusworkerterminateex
     * @since windowsserver2016
     */
    static ClusWorkerTerminateEx(ClusWorker, TimeoutInMilliseconds, WaitOnly) {
        result := DllCall("RESUTILS.dll\ClusWorkerTerminateEx", "ptr", ClusWorker, "uint", TimeoutInMilliseconds, "ptr", WaitOnly, "uint")
        return result
    }

    /**
     * Waits for multiple worker threads to terminate up to the specified timeout.
     * @param {Pointer<CLUS_WORKER>} ClusWorkers Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-clus_worker">CLUS_WORKER</a> structures describing the 
     *        threads to terminate.
     * @param {Pointer} ClusWorkersCount The number of structures in the <i>ClusWorkers</i> parameter.
     * @param {Integer} TimeoutInMilliseconds The timeout in milliseconds.
     * @param {BOOL} WaitOnly If set <b>TRUE</b>, the function will wait for up to specified timeout without signaling the thread to terminate; otherwise it will signal the thread to terminate before waiting for the thread.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All worker threads are terminated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one worker thread is not terminated within the specified timeout.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a> on failure.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-clusworkersterminate
     * @since windowsserver2016
     */
    static ClusWorkersTerminate(ClusWorkers, ClusWorkersCount, TimeoutInMilliseconds, WaitOnly) {
        result := DllCall("RESUTILS.dll\ClusWorkersTerminate", "ptr", ClusWorkers, "ptr", ClusWorkersCount, "uint", TimeoutInMilliseconds, "ptr", WaitOnly, "uint")
        return result
    }

    /**
     * Tests whether two resource handles represent the same resource. The PRESUTIL_RESOURCES_EQUAL type defines a pointer to this function.
     * @param {HRESOURCE} hSelf Handle to one of the resources.
     * @param {HRESOURCE} hResource Handle to the other resource.
     * @returns {BOOL} If the resources are equal, the function returns <b>TRUE</b>.
     * 
     * If the resources are not equal, 
     * the function returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilresourcesequal
     * @since windowsserver2008
     */
    static ResUtilResourcesEqual(hSelf, hResource) {
        result := DllCall("RESUTILS.dll\ResUtilResourcesEqual", "ptr", hSelf, "ptr", hResource, "ptr")
        return result
    }

    /**
     * Tests whether a resource type matches the resource type name of a specified resource. The PRESUTIL_RESOURCE_TYPES_EQUAL type defines a pointer to this function.
     * @param {PWSTR} lpszResourceTypeName Pointer to the resource type name to test.
     * @param {HRESOURCE} hResource Handle of the resource to test.
     * @returns {BOOL} If the resource types are equal, the function returns <b>TRUE</b>.
     * 
     * If the resource types are not equal, 
     * the function returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilresourcetypesequal
     * @since windowsserver2008
     */
    static ResUtilResourceTypesEqual(lpszResourceTypeName, hResource) {
        lpszResourceTypeName := lpszResourceTypeName is String ? StrPtr(lpszResourceTypeName) : lpszResourceTypeName

        result := DllCall("RESUTILS.dll\ResUtilResourceTypesEqual", "ptr", lpszResourceTypeName, "ptr", hResource, "ptr")
        return result
    }

    /**
     * Tests whether the resource class of a specified resource is equal to a specified resource class. The PRESUTIL_IS_RESOURCE_CLASS_EQUAL type defines a pointer to this function.
     * @param {Pointer<CLUS_RESOURCE_CLASS_INFO>} prci Pointer to a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clus_resource_class_info">CLUS_RESOURCE_CLASS_INFO</a> structure describing the resource class.
     * @param {HRESOURCE} hResource Handle to the resource whose class is to be compared to <i>prci</i>.
     * @returns {BOOL} If the resource classes are equal, the function returns <b>TRUE</b>.
     * 
     * If the resource classes are not equal, 
     * the function returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilisresourceclassequal
     * @since windowsserver2008
     */
    static ResUtilIsResourceClassEqual(prci, hResource) {
        result := DllCall("RESUTILS.dll\ResUtilIsResourceClassEqual", "ptr", prci, "ptr", hResource, "ptr")
        return result
    }

    /**
     * Enumerates all of the resources in the local cluster and initiates a user-defined operation for each resource. The PRESUTIL_ENUM_RESOURCES type defines a pointer to this function.
     * @param {HRESOURCE} hSelf Optional handle to a cluster resource. The callback function is not invoked for a resource identified by 
     *        <i>hSelf</i>.
     * @param {PWSTR} lpszResTypeName Optional pointer to a name of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-types">resource type</a> that 
     *        narrows the scope of resources to enumerate. If <i>lpszResTypeName</i> is specified, only 
     *        resources of the specified type are enumerated.
     * @param {Pointer<LPRESOURCE_CALLBACK>} pResCallBack Pointer to a user-defined function which will be called for each enumerated resource. This function must 
     *        conform to the definition of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-lpresource_callback">ResourceCallback</a> 
     *        callback function (note that parameter names are not part of the definition; they have been added here for 
     *        clarity):
     * 
     * <pre class="syntax" xml:space="preserve"><code>DWORD (*LPRESOURCE_CALLBACK)( 
     *   HRESOURCE hSelf, 
     *   HRESOURCE hEnum, 
     *   PVOID pParameter 
     * );</code></pre>
     * @param {Pointer<Void>} pParameter A generic buffer that allows you to pass any kind of data to the callback function. 
     *        <b>ResUtilEnumResources</b> does not use this 
     *        parameter at all, it merely passes the pointer to the callback function. Whether you can pass 
     *        <b>NULL</b> for the parameter depends on how the callback function is implemented.
     * @returns {Integer} If the operation succeeds or if <i>pResCallBack</i> returns 
     *        <b>ERROR_NO_MORE_ITEMS</b>, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function immediately halts the enumeration and returns the value returned by the 
     *        callback function.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilenumresources
     * @since windowsserver2008
     */
    static ResUtilEnumResources(hSelf, lpszResTypeName, pResCallBack, pParameter) {
        lpszResTypeName := lpszResTypeName is String ? StrPtr(lpszResTypeName) : lpszResTypeName

        result := DllCall("RESUTILS.dll\ResUtilEnumResources", "ptr", hSelf, "ptr", lpszResTypeName, "ptr", pResCallBack, "ptr", pParameter, "uint")
        return result
    }

    /**
     * Enumerates all of the resources in a specified cluster and initiates a user-defined operation for each resource. The PRESUTIL_ENUM_RESOURCES_EX type defines a pointer to this function.
     * @param {HCLUSTER} hCluster A handle to the cluster that contains  the resources to enumerate.
     * @param {HRESOURCE} hSelf An optional handle to a cluster resource. The callback function is not invoked for a resource that is  identified by 
     *        <i>hSelf</i>.
     * @param {PWSTR} lpszResTypeName An optional pointer to a name of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-types">resource type</a> that 
     *        narrows the scope of resources to enumerate. If <i>lpszResTypeName</i> is specified, only 
     *        resources of the specified type are enumerated.
     * @param {Pointer<LPRESOURCE_CALLBACK_EX>} pResCallBack A pointer to a user-defined function that    is called for each enumerated resource. This function must 
     *        conform to the definition of the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-lpresource_callback_ex">ResourceCallbackEx</a> callback function.  Note 
     *        that parameter names are not part of the definition; they have been added here for clarity.
     * 
     * <pre class="syntax" xml:space="preserve"><code>DWORD (*LPRESOURCE_CALLBACK_EX)( 
     *   HCLUSTER hCluster,
     *   HRESOURCE hSelf, 
     *   HRESOURCE hEnum, 
     *   PVOID pParameter 
     * );</code></pre>
     * @param {Pointer<Void>} pParameter A generic buffer that  enables you to pass any kind of data to the callback function. 
     *        <b>ResUtilEnumResourcesEx</b> does not use this 
     *        parameter at all; it merely passes the pointer to the callback function. Whether  you can pass 
     *        <b>NULL</b> for the parameter depends on how the callback function is implemented.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function immediately halts the enumeration and returns the value that is returned by the 
     *        callback function.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilenumresourcesex
     * @since windowsserver2008
     */
    static ResUtilEnumResourcesEx(hCluster, hSelf, lpszResTypeName, pResCallBack, pParameter) {
        lpszResTypeName := lpszResTypeName is String ? StrPtr(lpszResTypeName) : lpszResTypeName

        result := DllCall("RESUTILS.dll\ResUtilEnumResourcesEx", "ptr", hCluster, "ptr", hSelf, "ptr", lpszResTypeName, "ptr", pResCallBack, "ptr", pParameter, "uint")
        return result
    }

    /**
     * Enumerates the dependencies of a specified resource and returns a handle to a dependency of a specified type. The PRESUTIL_GET_RESOURCE_DEPENDENCY type defines a pointer to this function.
     * @param {HANDLE} hSelf Handle to the dependent resource. This resource depends on one or more resources.
     * @param {PWSTR} lpszResourceType Null-terminated Unicode string specifying the resource type of the dependency to return.
     * @returns {HRESOURCE} If the operation succeeds, 
     * the function returns a handle to one of the resources on which the resource specified by <i>hSelf</i> depends. The caller is responsible for closing the handle by calling  <a href="/windows/desktop/api/clusapi/nf-clusapi-closeclusterresource">CloseClusterResource</a>.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information, call the   <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetresourcedependency
     * @since windowsserver2008
     */
    static ResUtilGetResourceDependency(hSelf, lpszResourceType) {
        lpszResourceType := lpszResourceType is String ? StrPtr(lpszResourceType) : lpszResourceType
        hSelf := hSelf is Win32Handle ? NumGet(hSelf, "ptr") : hSelf

        A_LastError := 0

        result := DllCall("RESUTILS.dll\ResUtilGetResourceDependency", "ptr", hSelf, "ptr", lpszResourceType, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the dependencies of a specified resource in a specified cluster and returns a handle to a dependency of a specified type. The PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_NAME type defines a pointer to this function.
     * @param {HCLUSTER} hCluster Handle to the cluster to which the resource belongs.
     * @param {HANDLE} hSelf Handle to the dependent resource. This resource depends on one or more resources.
     * @param {PWSTR} lpszResourceType NULL-terminated Unicode string specifying the resource type of the dependency to return.
     * @param {BOOL} bRecurse Determines the scope of the search. If <b>TRUE</b>, the function checks the entire dependency tree under the dependent resource. If <b>FALSE</b>, the function checks only the resources on which the dependent resource directly depends.
     * @returns {HRESOURCE} If the operation succeeds, the function returns a handle to one of the resources on which the resource specified by <i>hSelf</i> depends. The caller is responsible for closing the handle by calling  <a href="/windows/desktop/api/clusapi/nf-clusapi-closeclusterresource">CloseClusterResource</a>.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information, call the   <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>NULL</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information, call the function  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetresourcedependencybyname
     * @since windowsserver2008
     */
    static ResUtilGetResourceDependencyByName(hCluster, hSelf, lpszResourceType, bRecurse) {
        lpszResourceType := lpszResourceType is String ? StrPtr(lpszResourceType) : lpszResourceType
        hSelf := hSelf is Win32Handle ? NumGet(hSelf, "ptr") : hSelf

        A_LastError := 0

        result := DllCall("RESUTILS.dll\ResUtilGetResourceDependencyByName", "ptr", hCluster, "ptr", hSelf, "ptr", lpszResourceType, "ptr", bRecurse, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the dependencies of a specified resource in a specified cluster and returns a handle to a dependency that matches a specified resource class. The PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_CLASS type defines a pointer to this function.
     * @param {HCLUSTER} hCluster Handle to the cluster to which the resource belongs.
     * @param {HANDLE} hSelf Handle to the dependent resource. This resource depends on one or more resources.
     * @param {Pointer<CLUS_RESOURCE_CLASS_INFO>} prci Pointer to a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clus_resource_class_info">CLUS_RESOURCE_CLASS_INFO</a> structure describing the resource class of the dependency to return.
     * @param {BOOL} bRecurse Determines the scope of the search. If <b>TRUE</b>, the function checks the entire dependency tree under the dependent resource. If <b>FALSE</b>, the function checks only the resources on which the dependent resource directly depends.
     * @returns {HRESOURCE} If the operation succeeds, 
     * the function returns a handle to one of the resources on which the resource specified by <i>hSelf</i> depends. The caller is responsible for closing the handle by calling  <a href="/windows/desktop/api/clusapi/nf-clusapi-closeclusterresource">CloseClusterResource</a>.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information, call the   <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetresourcedependencybyclass
     * @since windowsserver2008
     */
    static ResUtilGetResourceDependencyByClass(hCluster, hSelf, prci, bRecurse) {
        hSelf := hSelf is Win32Handle ? NumGet(hSelf, "ptr") : hSelf

        A_LastError := 0

        result := DllCall("RESUTILS.dll\ResUtilGetResourceDependencyByClass", "ptr", hCluster, "ptr", hSelf, "ptr", prci, "ptr", bRecurse, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the dependencies of a specified resource in the local cluster and returns a handle to a dependency of a specified resource type. The PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY type defines a pointer to this function.
     * @param {PWSTR} lpszResourceName Null-terminated Unicode string specifying the name of the dependent resource. This resource depends on one or more resources.
     * @param {PWSTR} lpszResourceType Null-terminated Unicode string specifying the resource type of the dependency to return.
     * @returns {HRESOURCE} If the operation succeeds, 
     * the function returns a handle to one of the resources on which the resource specified by <i>lpszResourceName</i> depends. The caller is responsible for closing the handle by calling  <a href="/windows/desktop/api/clusapi/nf-clusapi-closeclusterresource">CloseClusterResource</a>.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information, call the function  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetresourcenamedependency
     * @since windowsserver2008
     */
    static ResUtilGetResourceNameDependency(lpszResourceName, lpszResourceType) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName
        lpszResourceType := lpszResourceType is String ? StrPtr(lpszResourceType) : lpszResourceType

        A_LastError := 0

        result := DllCall("RESUTILS.dll\ResUtilGetResourceNameDependency", "ptr", lpszResourceName, "ptr", lpszResourceType, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the private properties of the first IP Address dependency found for a specified resource. The PRESUTIL_GET_RESOURCE_DEPENDENTIP_ADDRESS_PROPS type defines a pointer to this function.
     * @param {HRESOURCE} hResource Handle to the resource to query for dependencies.
     * @param {PWSTR} pszAddress Output buffer for returning the value of the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-addresses-address">Address</a> private property.
     * @param {Pointer<UInt32>} pcchAddress On input, specifies the size of the <i>pszAddress</i> buffer as a count of 
     *       <b>WCHAR</b>s. On output, specifies the size of the resulting data as a count of 
     *       <b>WCHAR</b>s that includes the terminating <b>NULL</b>.
     * @param {PWSTR} pszSubnetMask Output buffer for returning the value of the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-addresses-subnetmask">SubnetMask</a> private property.
     * @param {Pointer<UInt32>} pcchSubnetMask On input, specifies the size of the <i>pszSubnetMask</i> buffer as a count of 
     *       <b>WCHAR</b>s. On output, specifies the size of the resulting data as a count of 
     *       <b>WCHAR</b>s that includes the terminating <b>NULL</b>.
     * @param {PWSTR} pszNetwork Output buffer for returning the value of the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/ip-addresses-network">Network</a> private property.
     * @param {Pointer<UInt32>} pcchNetwork On input, specifies the size of the <i>pszNetwork</i> buffer as a count of 
     *       <b>WCHAR</b>s. On output, specifies the size of the resulting data as a count of 
     *       <b>WCHAR</b>s that includes the terminating <b>NULL</b>.
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2008:  </b>This parameter is named <i>pcch</i> prior to Windows Server 2012.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b> (0).
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error 
     *        codes.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * <dt>259 (0x103)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No IP Address dependency was found in the specified resource's list of dependencies.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RESOURCE_NOT_PRESENT</b></dt>
     * <dt>4316 (0x10DC)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No IP Address dependency was found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * <dt>234 (0xEA)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size of one of the buffers was too small to hold the resulting data.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetresourcedependentipaddressprops
     * @since windowsserver2008
     */
    static ResUtilGetResourceDependentIPAddressProps(hResource, pszAddress, pcchAddress, pszSubnetMask, pcchSubnetMask, pszNetwork, pcchNetwork) {
        pszAddress := pszAddress is String ? StrPtr(pszAddress) : pszAddress
        pszSubnetMask := pszSubnetMask is String ? StrPtr(pszSubnetMask) : pszSubnetMask
        pszNetwork := pszNetwork is String ? StrPtr(pszNetwork) : pszNetwork

        result := DllCall("RESUTILS.dll\ResUtilGetResourceDependentIPAddressProps", "ptr", hResource, "ptr", pszAddress, "uint*", pcchAddress, "ptr", pszSubnetMask, "uint*", pcchSubnetMask, "ptr", pszNetwork, "uint*", pcchNetwork, "uint")
        return result
    }

    /**
     * Retrieves the drive letter associated with a Physical Disk dependency of a resource. The PRESUTIL_FIND_DEPENDENT_DISK_RESOURCE_DRIVE_LETTER type defines a pointer to this function.
     * @param {HCLUSTER} hCluster Cluster handle.
     * @param {HRESOURCE} hResource Handle to the resource to query for dependencies.
     * @param {PWSTR} pszDriveLetter Buffer in which to store the drive letter.
     * @param {Pointer<UInt32>} pcchDriveLetter On input, specifies the size of the <i>pszDriveLetter</i> buffer as a count of 
     *        <b>WCHAR</b>s. On output, specifies the size of the resulting data as a count of 
     *        <b>WCHAR</b>s that includes the terminating <b>NULL</b>.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b> (0).
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. The following are possible error 
     *        codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No Physical Disk dependency was found in the specified resource's list of dependencies.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_RESOURCE_NOT_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No drive letter could be returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer passed in was too small. The <i>pcchDriveLetter</i> parameter specifies the 
     *          required size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilfinddependentdiskresourcedriveletter
     * @since windowsserver2008
     */
    static ResUtilFindDependentDiskResourceDriveLetter(hCluster, hResource, pszDriveLetter, pcchDriveLetter) {
        pszDriveLetter := pszDriveLetter is String ? StrPtr(pszDriveLetter) : pszDriveLetter

        A_LastError := 0

        result := DllCall("RESUTILS.dll\ResUtilFindDependentDiskResourceDriveLetter", "ptr", hCluster, "ptr", hResource, "ptr", pszDriveLetter, "uint*", pcchDriveLetter, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Attempts to terminate the process of a service being managed as a cluster resource by a resource DLL. The PRESUTIL_TERMINATE_SERVICE_PROCESS_FROM_RES_DLL type defines a pointer to this function.
     * @param {Integer} dwServicePid The process ID of the service process to terminate.
     * @param {BOOL} bOffline Indicates whether the resource is being taken offline or is being terminated. Specify 
     *        <b>TRUE</b> if calling from the Offline entry point or from a worker thread created to take 
     *        the resource offline. Otherwise specify <b>FALSE</b> and the function will assume you are 
     *        terminating the resource.
     * @param {Pointer<UInt32>} pdwResourceState Optional pointer to a <b>DWORD</b> which returns the resulting state of the resource, 
     *        which will be either <b>ClusterResourceFailed</b> or 
     *        <b>ClusterResourceOffline</b> (for a complete list of resource states see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-getclusterresourcestate">GetClusterResourceState</a>). Pass 
     *        <b>NULL</b> if you don't need this information.
     * @param {Pointer<PLOG_EVENT_ROUTINE>} pfnLogEvent Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plog_event_routine">LogEvent</a> function used by your resource 
     *        DLL. This pointer is passed to your resource DLL in the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pstartup_routine">Startup</a> entry point.
     * @param {Pointer} hResourceHandle The Resource Monitor's handle to the resource. This handle is passed to your resource DLL in the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-popen_routine">Open</a> entry point and must be saved as part of the resource's 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/instance-data">instance data</a>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the 
     *        operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * 
     * Note that 
     *        <b>ResUtilTerminateServiceProcessFromResDll</b> 
     *        uses <i>pfnLogEvent</i> and <i>hResourceHandle</i> to write to your 
     *        resource DLL's event log, which may help troubleshoot failures.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilterminateserviceprocessfromresdll
     * @since windowsserver2008
     */
    static ResUtilTerminateServiceProcessFromResDll(dwServicePid, bOffline, pdwResourceState, pfnLogEvent, hResourceHandle) {
        result := DllCall("RESUTILS.dll\ResUtilTerminateServiceProcessFromResDll", "uint", dwServicePid, "ptr", bOffline, "uint*", pdwResourceState, "ptr", pfnLogEvent, "ptr", hResourceHandle, "uint")
        return result
    }

    /**
     * Returns a property format list describing the format of a specified set of properties. The PRESUTIL_GET_PROPERTY_FORMATS type defines a pointer to this function.
     * @param {Pointer<RESUTIL_PROPERTY_ITEM>} pPropertyTable Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resutil_property_item">RESUTIL_PROPERTY_ITEM</a> property 
     *        table specifying the properties whose formats are to be retrieved.
     * @param {Pointer} pOutPropertyFormatList On input, pointer to a buffer. On a successful return, pointer to a property format list describing the 
     *        format of each property specified by <i>pPropertyTable</i>.
     * @param {Integer} cbPropertyFormatListSize Specifies the allocated size (in bytes) of the buffer pointed to by 
     *        <i>pOutPropertyFormatList</i>.
     * @param {Pointer<UInt32>} pcbBytesReturned Pointer to the actual size (in bytes) of the property format list that results from the operation.
     * @param {Pointer<UInt32>} pcbRequired If the buffer pointed to by the <i>pOutPropertyFormatList</i> parameter is too small to 
     *        hold the resulting data, <i>pcbRequired</i> points to the required buffer size (in 
     *        bytes).
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if the operation was successful.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetpropertyformats
     * @since windowsserver2008
     */
    static ResUtilGetPropertyFormats(pPropertyTable, pOutPropertyFormatList, cbPropertyFormatListSize, pcbBytesReturned, pcbRequired) {
        result := DllCall("RESUTILS.dll\ResUtilGetPropertyFormats", "ptr", pPropertyTable, "ptr", pOutPropertyFormatList, "uint", cbPropertyFormatListSize, "uint*", pcbBytesReturned, "uint*", pcbRequired, "uint")
        return result
    }

    /**
     * Returns handles to the core Network Name, IP Address and quorum resources. The PRESUTIL_GET_CORE_CLUSTER_RESOURCES type defines a pointer to this function.
     * @param {HCLUSTER} hCluster Cluster handle (see <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-opencluster">OpenCluster</a>).
     * @param {Pointer<HRESOURCE>} phClusterNameResource Pointer to a resource handle to the core 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-name">Network Name</a> resource for the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>, which stores the cluster name.
     * @param {Pointer<HRESOURCE>} phClusterIPAddressResource Not used.
     * @param {Pointer<HRESOURCE>} phClusterQuorumResource Pointer to a resource handle to the cluster's 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/quorum-resource">quorum resource</a>.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetcoreclusterresources
     * @since windowsserver2008
     */
    static ResUtilGetCoreClusterResources(hCluster, phClusterNameResource, phClusterIPAddressResource, phClusterQuorumResource) {
        result := DllCall("RESUTILS.dll\ResUtilGetCoreClusterResources", "ptr", hCluster, "ptr", phClusterNameResource, "ptr", phClusterIPAddressResource, "ptr", phClusterQuorumResource, "uint")
        return result
    }

    /**
     * Returns the name of a resource. The PRESUTIL_GET_RESOURCE_NAME type defines a pointer to this function.
     * @param {HRESOURCE} hResource Resource handle (see 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-openclusterresource">OpenClusterResource</a>).
     * @param {PWSTR} pszResourceName Pointer to a buffer that receives the resource name.
     * @param {Pointer<UInt32>} pcchResourceNameInOut On input, specifies the size of the buffer pointed to by <i>pszResourceName</i>, in wide 
     *       characters. On output, specifies the actual size of the resource name returned as a count of wide 
     *       characters.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetresourcename
     * @since windowsserver2008
     */
    static ResUtilGetResourceName(hResource, pszResourceName, pcchResourceNameInOut) {
        pszResourceName := pszResourceName is String ? StrPtr(pszResourceName) : pszResourceName

        result := DllCall("RESUTILS.dll\ResUtilGetResourceName", "ptr", hResource, "ptr", pszResourceName, "uint*", pcchResourceNameInOut, "uint")
        return result
    }

    /**
     * Determines whether or not a specific role has been assigned to a cluster.
     * @param {HCLUSTER} hCluster The handle of the queried cluster.
     * @param {Integer} eClusterRole The role the cluster was queried about.  The possible values for this parameter are enumerators from the <a href="https://docs.microsoft.com/windows/desktop/api/resapi/ne-resapi-cluster_role">CLUSTER_ROLE</a> enumeration.  The following values are valid.
     * @returns {Integer} The possible return values for this function are enumerators from the  <a href="/windows/desktop/api/resapi/ne-resapi-cluster_role_state">CLUSTER_ROLE_STATE</a> enumeration.  The following values are valid.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterRoleUnknown</b></dt>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * It is unknown whether or not the role is clustered.  If this value is returned then an error has occurred.  For more information call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterRoleClustered</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The role is clustered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ClusterRoleUnclustered</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The role is not clustered.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetclusterrolestate
     * @since windowsserver2008
     */
    static ResUtilGetClusterRoleState(hCluster, eClusterRole) {
        A_LastError := 0

        result := DllCall("RESUTILS.dll\ResUtilGetClusterRoleState", "ptr", hCluster, "int", eClusterRole, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether a path is on a cluster shared volume.
     * @param {PWSTR} lpszPathName A pointer to the input path string.
     * @returns {BOOL} <b>TRUE</b> if the path is on a CSV and this function is called from a domain account, or if the path is on a CSV that is owned by a local cluster node; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-clusterispathonsharedvolume
     * @since windowsserver2008
     */
    static ClusterIsPathOnSharedVolume(lpszPathName) {
        lpszPathName := lpszPathName is String ? StrPtr(lpszPathName) : lpszPathName

        result := DllCall("RESUTILS.dll\ClusterIsPathOnSharedVolume", "ptr", lpszPathName, "ptr")
        return result
    }

    /**
     * ClusterGetVolumePathName may be altered or unavailable. Instead, use GetVolumePathName.
     * @param {PWSTR} lpszFileName A pointer to the input path string. Both absolute and relative file and directory names, for example 
     *        "..", are acceptable in this path.
     * 
     * If you specify a relative directory or file name without a volume qualifier, 
     *        <b>ClusterGetVolumePathName</b> returns the drive letter of the 
     *        current volume.
     * 
     * If this parameter is an empty string, "", the function fails but the last error is set to 
     *        <b>ERROR_SUCCESS</b>.
     * @param {PWSTR} lpszVolumePathName A pointer to a string that receives the volume mount point for the input path.
     * @param {Integer} cchBufferLength The length of the output buffer, in <b>WCHARs</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-clustergetvolumepathname
     * @since windowsserver2008
     */
    static ClusterGetVolumePathName(lpszFileName, lpszVolumePathName, cchBufferLength) {
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName
        lpszVolumePathName := lpszVolumePathName is String ? StrPtr(lpszVolumePathName) : lpszVolumePathName

        A_LastError := 0

        result := DllCall("RESUTILS.dll\ClusterGetVolumePathName", "ptr", lpszFileName, "ptr", lpszVolumePathName, "uint", cchBufferLength, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * ClusterGetVolumeNameForVolumeMountPoint may be altered or unavailable. Instead, use GetVolumeNameForVolumeMountPoint.
     * @param {PWSTR} lpszVolumeMountPoint A pointer to a string that contains the path of a mounted folder (for example, "Y:\MountX\") or a drive 
     *       letter (for example, "X:\"). The string must end with a trailing backslash (\\).
     * @param {PWSTR} lpszVolumeName A pointer to a string that receives the volume <b>GUID</b> path. This path is of the form 
     *       "\\?\Volume{<i>GUID</i>}\" where <i>GUID</i> is a 
     *       <b>GUID</b> that identifies the volume. If there is more than one volume 
     *       <b>GUID</b> path for the volume, only the first one in the mount manager's cache is 
     *       returned. The string returned is in the format required for 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addtosnapshotset">IVssBackupComponents::AddToSnapshotSet</a> 
     *       and 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-isvolumesupported">IVssBackupComponents::IsVolumeSupported</a>.
     * @param {Integer} cchBufferLength The length of the output buffer, in <b>WCHARs</b>. A reasonable size for the buffer 
     *       to accommodate the largest possible volume <b>GUID</b> path is 51 characters.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the input CSV is not locally mounted 
     *        the call will fail with an <b>ERROR_CSV_VOLUME_NOT_LOCAL</b> (5951) error.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-clustergetvolumenameforvolumemountpoint
     * @since windowsserver2008
     */
    static ClusterGetVolumeNameForVolumeMountPoint(lpszVolumeMountPoint, lpszVolumeName, cchBufferLength) {
        lpszVolumeMountPoint := lpszVolumeMountPoint is String ? StrPtr(lpszVolumeMountPoint) : lpszVolumeMountPoint
        lpszVolumeName := lpszVolumeName is String ? StrPtr(lpszVolumeName) : lpszVolumeName

        A_LastError := 0

        result := DllCall("RESUTILS.dll\ClusterGetVolumeNameForVolumeMountPoint", "ptr", lpszVolumeMountPoint, "ptr", lpszVolumeName, "uint", cchBufferLength, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * ClusterPrepareSharedVolumeForBackup may be altered or unavailable.
     * @param {PWSTR} lpszFileName Path to a directory or file on a cluster shared volume.
     * @param {PWSTR} lpszVolumePathName Address of buffer that will receive the CSV reparse point.
     * @param {Pointer<UInt32>} lpcchVolumePathName Address of a <b>DWORD</b> that on input contains the size of the buffer (in 
     *       <b>WCHAR</b> characters) pointed to by the <i>lpszVolumePathName</i> 
     *       parameter and on output contains the size of the string written to that buffer. If size on input is not large 
     *       enough then the function will fail and return <b>ERROR_MORE_DATA</b> and set the 
     *       <b>DWORD</b> to the required size.
     * @param {PWSTR} lpszVolumeName Address of buffer that will receive the volume GUID path for the CSV.
     * @param {Pointer<UInt32>} lpcchVolumeName Address of a <b>DWORD</b> that on input contains the size of the buffer (in 
     *       <b>WCHAR</b> characters) pointed to by the <i>lpszVolumeName</i> 
     *       parameter and on output contains the size of the string written to that buffer. If size on input is not large 
     *       enough then the function will fail and return <b>ERROR_MORE_DATA</b> and set the 
     *       <b>DWORD</b> to the required size.
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-clusterpreparesharedvolumeforbackup
     * @since windowsserver2008
     */
    static ClusterPrepareSharedVolumeForBackup(lpszFileName, lpszVolumePathName, lpcchVolumePathName, lpszVolumeName, lpcchVolumeName) {
        lpszFileName := lpszFileName is String ? StrPtr(lpszFileName) : lpszFileName
        lpszVolumePathName := lpszVolumePathName is String ? StrPtr(lpszVolumePathName) : lpszVolumePathName
        lpszVolumeName := lpszVolumeName is String ? StrPtr(lpszVolumeName) : lpszVolumeName

        result := DllCall("RESUTILS.dll\ClusterPrepareSharedVolumeForBackup", "ptr", lpszFileName, "ptr", lpszVolumePathName, "uint*", lpcchVolumePathName, "ptr", lpszVolumeName, "uint*", lpcchVolumeName, "uint")
        return result
    }

    /**
     * Clears the backup state for the cluster shared volume.
     * @param {PWSTR} lpszVolumePathName Path to a file on a CSV. If the path is not a CSV path, 
     *       <b>ClusterClearBackupStateForSharedVolume</b> 
     *       will return <b>ERROR_INVALID_PARAMETER</b> (87).
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b> (0).
     * 
     * If the function fails, it returns one of the 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-clusterclearbackupstateforsharedvolume
     * @since windowsserver2008
     */
    static ClusterClearBackupStateForSharedVolume(lpszVolumePathName) {
        lpszVolumePathName := lpszVolumePathName is String ? StrPtr(lpszVolumePathName) : lpszVolumePathName

        result := DllCall("RESUTILS.dll\ClusterClearBackupStateForSharedVolume", "ptr", lpszVolumePathName, "uint")
        return result
    }

    /**
     * Adjusts the start parameters of a specified service so that it operates correctly as a cluster resource. It must be called from a resource DLL. The PRESUTIL_SET_RESOURCE_SERVICE_START_PARAMETERS_EX type defines a pointer to this function.
     * @param {PWSTR} pszServiceName A pointer to a null-terminated Unicode string that specifies  the name of the service.
     * @param {SC_HANDLE} schSCMHandle A handle to the Service Control Manager (SCM) or <b>NULL</b>. If <b>NULL</b>, the function  attempts to open a handle to the SCM.
     * @param {Pointer<SC_HANDLE>} phService On input, a <b>NULL</b> service handle. On output, handle to the specified service if the call was successful; otherwise <b>NULL</b>.
     * @param {Integer} dwDesiredAccess The requested access privileges. This  might  be any combination of <b>GENERIC_READ</b> (0x80000000), <b>GENERIC_ALL</b> (0x10000000), or <b>MAXIMUM_ALLOWED</b> (0x02000000). If this value is zero (0),  an undefined error might  be returned. Using <b>GENERIC_ALL</b> is the same as calling <a href="https://docs.microsoft.com/windows/desktop/api/resapi/nf-resapi-resutilsetresourceservicestartparameters">ResUtilSetResourceServiceStartParameters</a>.
     * @param {Pointer<PLOG_EVENT_ROUTINE>} pfnLogEvent A pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plog_event_routine">LogEvent</a> entry point function of the resource DLL that manages  the service.
     * @param {Pointer} hResourceHandle A resource handle that is required by the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plog_event_routine">LogEvent</a> entry point function. Use the handle that is passed to the DLL in the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-popen_routine">Open</a> entry point function.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilsetresourceservicestartparametersex
     * @since windowsserver2012
     */
    static ResUtilSetResourceServiceStartParametersEx(pszServiceName, schSCMHandle, phService, dwDesiredAccess, pfnLogEvent, hResourceHandle) {
        pszServiceName := pszServiceName is String ? StrPtr(pszServiceName) : pszServiceName
        schSCMHandle := schSCMHandle is Win32Handle ? NumGet(schSCMHandle, "ptr") : schSCMHandle

        result := DllCall("RESUTILS.dll\ResUtilSetResourceServiceStartParametersEx", "ptr", pszServiceName, "ptr", schSCMHandle, "ptr", phService, "uint", dwDesiredAccess, "ptr", pfnLogEvent, "ptr", hResourceHandle, "uint")
        return result
    }

    /**
     * Enumerates all of the resources in a specified cluster and initiates a user-defined operation for each resource. The PRESUTIL_ENUM_RESOURCES_EX2 type defines a pointer to this function.
     * @param {HCLUSTER} hCluster A handle to the cluster that contains the resources to enumerate.
     * @param {HRESOURCE} hSelf An optional handle to a cluster resource. The callback function is not invoked for a resource identified by 
     *        <i>hSelf</i>.
     * @param {PWSTR} lpszResTypeName An optional pointer to a name of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-types">resource type</a> that 
     *        narrows the scope of resources to enumerate. If <i>lpszResTypeName</i> is specified, only 
     *        resources of the specified type are enumerated.
     * @param {Pointer<LPRESOURCE_CALLBACK_EX>} pResCallBack A pointer to a user-defined function which will be called for each enumerated resource. This function must 
     *        conform to the definition of the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-lpresource_callback_ex">ResourceCallbackEx</a> callback function (note 
     *        that parameter names are not part of the definition; they have been added here for clarity):
     * 
     * <pre class="syntax" xml:space="preserve"><code>DWORD (*LPRESOURCE_CALLBACK_EX)( 
     *   HCLUSTER hCluster,
     *   HRESOURCE hSelf, 
     *   HRESOURCE hEnum, 
     *   PVOID pParameter 
     * );</code></pre>
     * @param {Pointer<Void>} pParameter A generic buffer that allows you to pass any kind of data to the callback function. 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/resapi/nf-resapi-resutilenumresourcesex">ResUtilEnumResourcesEx</a> does not use this 
     *        parameter at all, it merely passes the pointer to the callback function. Whether or not you can pass 
     *        <b>NULL</b> for the parameter depends on how the callback function is implemented.
     * @param {Integer} dwDesiredAccess The requested access privileges. This may be any combination of <b>GENERIC_READ</b> (0x80000000), <b>GENERIC_ALL</b> (0x10000000), or M<b>AXIMUM_ALLOWED</b> (0x02000000). If this value is zero (0), an undefined error may be returned. Using <b>GENERIC_ALL</b> is the same as calling <a href="https://docs.microsoft.com/windows/desktop/api/resapi/nf-resapi-resutilenumresourcesex">ResUtilEnumResourcesEx</a>.
     * @returns {Integer} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function immediately halts the enumeration and returns the value returned by the 
     *        callback function.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilenumresourcesex2
     * @since windowsserver2012
     */
    static ResUtilEnumResourcesEx2(hCluster, hSelf, lpszResTypeName, pResCallBack, pParameter, dwDesiredAccess) {
        lpszResTypeName := lpszResTypeName is String ? StrPtr(lpszResTypeName) : lpszResTypeName

        result := DllCall("RESUTILS.dll\ResUtilEnumResourcesEx2", "ptr", hCluster, "ptr", hSelf, "ptr", lpszResTypeName, "ptr", pResCallBack, "ptr", pParameter, "uint", dwDesiredAccess, "uint")
        return result
    }

    /**
     * Enumerates the dependencies of a specified resource and returns a handle to a dependency of a specified type. The PRESUTIL_GET_RESOURCE_DEPENDENCY_EX type defines a pointer to this function.
     * @param {HANDLE} hSelf A handle to the dependent resource.
     * @param {PWSTR} lpszResourceType A null-terminated Unicode string that specifies the resource type of the dependency to return.
     * @param {Integer} dwDesiredAccess The requested access privileges. This  might be any combination of <b>GENERIC_READ</b> (0x80000000), <b>GENERIC_ALL</b> (0x10000000), or <b>MAXIMUM_ALLOWED</b> (0x02000000). If this value is zero (0), an undefined error  might be returned. Using <b>GENERIC_ALL</b> is the same as calling <a href="https://docs.microsoft.com/windows/desktop/api/resapi/nf-resapi-resutilgetresourcedependency">ResUtilGetResourceDependency</a>.
     * @returns {HRESOURCE} If the operation succeeds, 
     * the function returns a handle to one of the resources on which the resource that is   specified by <i>hSelf</i> depends. The caller is responsible for closing the handle by calling 
     * the <a href="/windows/desktop/api/clusapi/nf-clusapi-closeclusterresource">CloseClusterResource</a> function.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information, call the   <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetresourcedependencyex
     * @since windowsserver2012
     */
    static ResUtilGetResourceDependencyEx(hSelf, lpszResourceType, dwDesiredAccess) {
        lpszResourceType := lpszResourceType is String ? StrPtr(lpszResourceType) : lpszResourceType
        hSelf := hSelf is Win32Handle ? NumGet(hSelf, "ptr") : hSelf

        A_LastError := 0

        result := DllCall("RESUTILS.dll\ResUtilGetResourceDependencyEx", "ptr", hSelf, "ptr", lpszResourceType, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the dependencies of a specified resource in a specified cluster and returns a handle to a dependency of a specified type. The PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_NAME_EX type defines a pointer to this function.
     * @param {HCLUSTER} hCluster A handle to the cluster to which the resource belongs.
     * @param {HANDLE} hSelf A handle to the dependent resource. This resource depends on one or more resources.
     * @param {PWSTR} lpszResourceType A null-terminated Unicode string that specifies  the resource type of the dependency to return.
     * @param {BOOL} bRecurse Determines the scope of the search. If <b>TRUE</b>, the function checks the entire dependency tree under the dependent resource. If <b>FALSE</b>, the function checks only the resources on which the dependent resource directly depends.
     * @param {Integer} dwDesiredAccess The requested access privileges. This  might be any combination of <b>GENERIC_READ</b> (0x80000000), <b>GENERIC_ALL</b> (0x10000000), or <b>MAXIMUM_ALLOWED</b> (0x02000000). If this value is zero (0), an undefined error  might be returned. Using <b>GENERIC_ALL</b> is the same as calling <a href="https://docs.microsoft.com/windows/desktop/api/resapi/nf-resapi-resutilgetresourcedependencybyname">ResUtilGetResourceDependencyByName</a>.
     * @returns {HRESOURCE} If the operation succeeds, the function returns a handle to one of the resources on which the resource that is specified by <i>hSelf</i> depends. The caller is responsible for closing the handle by calling  <a href="/windows/desktop/api/clusapi/nf-clusapi-closeclusterresource">CloseClusterResource</a>.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information, call the   <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESOURCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>NULL</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was not successful. For more information, call the function  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetresourcedependencybynameex
     * @since windowsserver2012
     */
    static ResUtilGetResourceDependencyByNameEx(hCluster, hSelf, lpszResourceType, bRecurse, dwDesiredAccess) {
        lpszResourceType := lpszResourceType is String ? StrPtr(lpszResourceType) : lpszResourceType
        hSelf := hSelf is Win32Handle ? NumGet(hSelf, "ptr") : hSelf

        A_LastError := 0

        result := DllCall("RESUTILS.dll\ResUtilGetResourceDependencyByNameEx", "ptr", hCluster, "ptr", hSelf, "ptr", lpszResourceType, "ptr", bRecurse, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the dependencies of a specified resource in a specified cluster and returns a handle to a dependency that matches a specified resource class. The PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_CLASS_EX type defines a pointer to this function.
     * @param {HCLUSTER} hCluster A handle to the cluster to which the resource belongs.
     * @param {HANDLE} hSelf A handle to the dependent resource. This resource depends on one or more resources.
     * @param {Pointer<CLUS_RESOURCE_CLASS_INFO>} prci A pointer to a  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-clus_resource_class_info">PCLUS_RESOURCE_CLASS_INFO</a> structure that describes  the resource class of the dependency to return.
     * @param {BOOL} bRecurse Determines the scope of the search. If <b>TRUE</b>, the function checks the entire dependency tree under the dependent resource. If <b>FALSE</b>, the function checks only the resources on which the dependent resource directly depends.
     * @param {Integer} dwDesiredAccess The requested access privileges. This  might be any combination of <b>GENERIC_READ</b> (0x80000000), <b>GENERIC_ALL</b> (0x10000000), or <b>MAXIMUM_ALLOWED</b> (0x02000000). If this value is zero (0), an undefined error  might be returned. Using <b>GENERIC_ALL</b> is the same as calling <a href="https://docs.microsoft.com/windows/desktop/api/resapi/nf-resapi-resutilgetresourcedependencybyclass">ResUtilGetResourceDependencyByClass</a>.
     * @returns {HRESOURCE} If the operation succeeds, 
     * the function returns a handle to one of the resources on which the resource that is specified by <i>hSelf</i> depends. The caller is responsible for closing the handle by calling  <a href="/windows/desktop/api/clusapi/nf-clusapi-closeclusterresource">CloseClusterResource</a>.
     * 
     * If the operation fails, the function returns <b>NULL</b>. For more information, call the   <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetresourcedependencybyclassex
     * @since windowsserver2012
     */
    static ResUtilGetResourceDependencyByClassEx(hCluster, hSelf, prci, bRecurse, dwDesiredAccess) {
        hSelf := hSelf is Win32Handle ? NumGet(hSelf, "ptr") : hSelf

        A_LastError := 0

        result := DllCall("RESUTILS.dll\ResUtilGetResourceDependencyByClassEx", "ptr", hCluster, "ptr", hSelf, "ptr", prci, "ptr", bRecurse, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the dependencies of a specified resource in the local cluster and returns a handle to a dependency of a specified resource type. The PRESUTIL_GET_RESOURCE_NAME_DEPENDENCY_EX type defines a pointer to this function.
     * @param {PWSTR} lpszResourceName A null-terminated Unicode string that specifies  the name of the dependent resource. This resource depends on one or more resources.
     * @param {PWSTR} lpszResourceType A null-terminated Unicode string that specifies  the resource type of the dependency to return.
     * @param {Integer} dwDesiredAccess The requested access privileges. This  might be any combination of <b>GENERIC_READ</b> (0x80000000), <b>GENERIC_ALL</b> (0x10000000), or <b>MAXIMUM_ALLOWED</b> (0x02000000). If this value is zero (0), an undefined error  might be returned. Using <b>GENERIC_ALL</b> is the same as calling <a href="https://docs.microsoft.com/windows/desktop/api/resapi/nf-resapi-resutilgetresourcenamedependency">ResUtilGetResourceNameDependency</a>.
     * @returns {HRESOURCE} If the operation succeeds, 
     * the function returns a handle to one of the resources on which the resource that is  specified by <i>lpszResourceName</i> depends. The caller is responsible for closing the handle by calling  <a href="/windows/desktop/api/clusapi/nf-clusapi-closeclusterresource">CloseClusterResource</a>.
     * 
     * If the operation fails, 
     * the function returns <b>NULL</b>. For more information, call the function  <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetresourcenamedependencyex
     * @since windowsserver2012
     */
    static ResUtilGetResourceNameDependencyEx(lpszResourceName, lpszResourceType, dwDesiredAccess) {
        lpszResourceName := lpszResourceName is String ? StrPtr(lpszResourceName) : lpszResourceName
        lpszResourceType := lpszResourceType is String ? StrPtr(lpszResourceType) : lpszResourceType

        A_LastError := 0

        result := DllCall("RESUTILS.dll\ResUtilGetResourceNameDependencyEx", "ptr", lpszResourceName, "ptr", lpszResourceType, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns handles to the core,  Network Name, IP Address, and quorum resources. The PRESUTIL_GET_CORE_CLUSTER_RESOURCES_EX type defines a pointer to this function.
     * @param {HCLUSTER} hClusterIn The cluster handle (see <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-opencluster">OpenCluster</a>).
     * @param {Pointer<HRESOURCE>} phClusterNameResourceOut A pointer to a resource handle to the core 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-name">Network Name</a> resource for the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>, which stores the cluster name.
     * @param {Pointer<HRESOURCE>} phClusterQuorumResourceOut Not used.
     * @param {Integer} dwDesiredAccess The requested access privileges. This  might be any combination of <b>GENERIC_READ</b> (0x80000000), <b>GENERIC_ALL</b> (0x10000000), or M<b>AXIMUM_ALLOWED</b> (0x02000000). If this value is zero (0), an undefined error  might be returned. Using <b>GENERIC_ALL</b> is the same as calling <a href="https://docs.microsoft.com/windows/desktop/api/resapi/nf-resapi-resutilgetcoreclusterresources">ResUtilGetCoreClusterResources</a>.
     * @returns {Integer} If the operations succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns a 
     *        <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilgetcoreclusterresourcesex
     * @since windowsserver2012
     */
    static ResUtilGetCoreClusterResourcesEx(hClusterIn, phClusterNameResourceOut, phClusterQuorumResourceOut, dwDesiredAccess) {
        result := DllCall("RESUTILS.dll\ResUtilGetCoreClusterResourcesEx", "ptr", hClusterIn, "ptr", phClusterNameResourceOut, "ptr", phClusterQuorumResourceOut, "uint", dwDesiredAccess, "uint")
        return result
    }

    /**
     * Opens a handle to a Cryptographic Service Provider (CSP) in order to manage the encryption of Checkpointing data for a cluster resource. The POPEN_CLUSTER_CRYPT_PROVIDER type defines a pointer to this function.
     * @param {PWSTR} lpszResource A pointer to a null-terminated Unicode string that contains the name of the cluster resource that is associated with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/checkpointing">Checkpointing</a> data.
     * @param {Pointer<SByte>} lpszProvider A pointer to a null-terminated Unicode string that contains the name of the CSP.
     * @param {Integer} dwType A bitmask that specifies the CSP type.
     * @param {Integer} dwFlags The flags that specify the settings for the operation. This parameter can be set to the default value "0", or <b>CLUS_CREATE_CRYPT_CONTAINER_NOT_FOUND</b> (0x0001).
     * @returns {HCLUSCRYPTPROVIDER} If the operation completes successfully, this function returns a <a href="/previous-versions/windows/desktop/legacy/dn823545(v=vs.85)">HCLUSCRYPTPROVIDER</a> structure containing a handle to the CSP.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-openclustercryptprovider
     * @since windowsserver2012
     */
    static OpenClusterCryptProvider(lpszResource, lpszProvider, dwType, dwFlags) {
        lpszResource := lpszResource is String ? StrPtr(lpszResource) : lpszResource

        result := DllCall("RESUTILS.dll\OpenClusterCryptProvider", "ptr", lpszResource, "char*", lpszProvider, "uint", dwType, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpszResource 
     * @param {PWSTR} lpszKeyname 
     * @param {Pointer<SByte>} lpszProvider 
     * @param {Integer} dwType 
     * @param {Integer} dwFlags 
     * @returns {HCLUSCRYPTPROVIDER} 
     */
    static OpenClusterCryptProviderEx(lpszResource, lpszKeyname, lpszProvider, dwType, dwFlags) {
        lpszResource := lpszResource is String ? StrPtr(lpszResource) : lpszResource
        lpszKeyname := lpszKeyname is String ? StrPtr(lpszKeyname) : lpszKeyname

        result := DllCall("RESUTILS.dll\OpenClusterCryptProviderEx", "ptr", lpszResource, "ptr", lpszKeyname, "char*", lpszProvider, "uint", dwType, "uint", dwFlags, "ptr")
        return result
    }

    /**
     * Closes a handle to a Cryptographic Service Provider (CSP). The PCLOSE_CLUSTER_CRYPT_PROVIDER type defines a pointer to this function.
     * @param {HCLUSCRYPTPROVIDER} hClusCryptProvider A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dn823545(v=vs.85)">HCLUSCRYPTPROVIDER</a> structure that contains a handle to a CSP.
     * @returns {Integer} If the operation completes successfully, this function returns <b>ERROR_SUCCESS</b>; otherwise, it returns a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-closeclustercryptprovider
     * @since windowsserver2012
     */
    static CloseClusterCryptProvider(hClusCryptProvider) {
        result := DllCall("RESUTILS.dll\CloseClusterCryptProvider", "ptr", hClusCryptProvider, "uint")
        return result
    }

    /**
     * Encrypts Checkpointing data for a Cryptographic Service Provider (CSP).
     * @param {HCLUSCRYPTPROVIDER} hClusCryptProvider A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dn823545(v=vs.85)">HCLUSCRYPTPROVIDER</a> structure that contains a handle to the CSP.
     * @param {Pointer<Byte>} pData A pointer to the data to encrypt.
     * @param {Integer} cbData The total number of bytes in the data pointed to by the <i>pDta</i> parameter.
     * @param {Pointer<Byte>} ppData A pointer to a buffer that receives the encrypted data.
     * @param {Pointer<UInt32>} pcbData The total number of bytes in the data pointed to by the <i>pcbData</i> parameter.
     * @returns {Integer} If the operation completes successfully, this function returns <b>ERROR_SUCCESS</b>; otherwise, it returns a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-clusterencrypt
     * @since windowsserver2012
     */
    static ClusterEncrypt(hClusCryptProvider, pData, cbData, ppData, pcbData) {
        result := DllCall("RESUTILS.dll\ClusterEncrypt", "ptr", hClusCryptProvider, "char*", pData, "uint", cbData, "char*", ppData, "uint*", pcbData, "uint")
        return result
    }

    /**
     * Decrypts Checkpointing data for a Cryptographic Service Provider (CSP).
     * @param {HCLUSCRYPTPROVIDER} hClusCryptProvider A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dn823545(v=vs.85)">HCLUSCRYPTPROVIDER</a> structure that contains a handle to the CSP.
     * @param {Pointer<Byte>} pCryptInput A pointer to the data to decrypt.
     * @param {Integer} cbCryptInput The total number of bytes in the data pointed to by the <i>pCryptInput</i> parameter.
     * @param {Pointer<Byte>} ppCryptOutput A pointer to a buffer that receives the decrypted data.
     * @param {Pointer<UInt32>} pcbCryptOutput The total number of bytes in the data pointed to by the <i>ppCryptOutput</i> parameter.
     * @returns {Integer} If the operation completes successfully, this function returns <b>ERROR_SUCCESS</b>; otherwise, it returns a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-clusterdecrypt
     * @since windowsserver2012
     */
    static ClusterDecrypt(hClusCryptProvider, pCryptInput, cbCryptInput, ppCryptOutput, pcbCryptOutput) {
        result := DllCall("RESUTILS.dll\ClusterDecrypt", "ptr", hClusCryptProvider, "char*", pCryptInput, "uint", cbCryptInput, "char*", ppCryptOutput, "uint*", pcbCryptOutput, "uint")
        return result
    }

    /**
     * TBD.
     * @param {Pointer<Void>} pCryptInfo TBD
     * @returns {Integer} If the operation completes successfully, this function returns <b>ERROR_SUCCESS</b>; otherwise, it returns a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-freeclustercrypt
     * @since windowsserver2012
     */
    static FreeClusterCrypt(pCryptInfo) {
        result := DllCall("RESUTILS.dll\FreeClusterCrypt", "ptr", pCryptInfo, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Integer} reason 
     * @param {Pointer<UInt32>} pResult 
     * @returns {Integer} 
     */
    static ResUtilVerifyShutdownSafe(flags, reason, pResult) {
        result := DllCall("RESUTILS.dll\ResUtilVerifyShutdownSafe", "uint", flags, "uint", reason, "uint*", pResult, "uint")
        return result
    }

    /**
     * Compares two Paxos tags and indicates whether they have the same values.
     * @param {Pointer<PaxosTagCStruct>} left The <a href="https://docs.microsoft.com/windows/desktop/api/resapi/ns-resapi-paxostagcstruct">PaxosTagCStruct</a> structure that represents the first Paxos tag to use in the comparison.
     * @param {Pointer<PaxosTagCStruct>} right The <a href="https://docs.microsoft.com/windows/desktop/api/resapi/ns-resapi-paxostagcstruct">PaxosTagCStruct</a> structure that represents the second  Paxos tag to use in the comparison.
     * @returns {BOOL} <b>TRUE</b> if the Paxos tags have the same values; otherwise <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilpaxoscomparer
     * @since windowsserver2016
     */
    static ResUtilPaxosComparer(left, right) {
        result := DllCall("RESUTILS.dll\ResUtilPaxosComparer", "ptr", left, "ptr", right, "ptr")
        return result
    }

    /**
     * Indicates whether a specified Paxos tag contains older cluster configuration information than another specified Paxos tag.
     * @param {Pointer<PaxosTagCStruct>} left The <a href="https://docs.microsoft.com/windows/desktop/api/resapi/ns-resapi-paxostagcstruct">PaxosTagCStruct</a> structure that represents the first Paxos tag to use in the comparison.
     * @param {Pointer<PaxosTagCStruct>} right The <a href="https://docs.microsoft.com/windows/desktop/api/resapi/ns-resapi-paxostagcstruct">PaxosTagCStruct</a> structure that represents the 2nd  Paxos tag to use in the comparison.
     * @returns {BOOL} <b>TRUE</b> if the cluster configuration of the first Paxos tag is older than the that of the second Paxos tag; otherwise <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//resapi/nf-resapi-resutilleftpaxosislessthanright
     * @since windowsserver2016
     */
    static ResUtilLeftPaxosIsLessThanRight(left, right) {
        result := DllCall("RESUTILS.dll\ResUtilLeftPaxosIsLessThanRight", "ptr", left, "ptr", right, "ptr")
        return result
    }

    /**
     * 
     * @param {HKEY} key 
     * @param {PWSTR} keyName 
     * @param {BOOL} treatNoKeyAsError 
     * @returns {Integer} 
     */
    static ResUtilsDeleteKeyTree(key, keyName, treatNoKeyAsError) {
        keyName := keyName is String ? StrPtr(keyName) : keyName
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := DllCall("RESUTILS.dll\ResUtilsDeleteKeyTree", "ptr", key, "ptr", keyName, "ptr", treatNoKeyAsError, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} hSelf 
     * @param {HGROUP} hGroup 
     * @param {Pointer<BOOL>} pEqual 
     * @returns {Integer} 
     */
    static ResUtilGroupsEqual(hSelf, hGroup, pEqual) {
        result := DllCall("RESUTILS.dll\ResUtilGroupsEqual", "ptr", hSelf, "ptr", hGroup, "ptr", pEqual, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {HGROUP} hSelf 
     * @param {Pointer<LPGROUP_CALLBACK_EX>} pResCallBack 
     * @param {Pointer<Void>} pParameter 
     * @returns {Integer} 
     */
    static ResUtilEnumGroups(hCluster, hSelf, pResCallBack, pParameter) {
        result := DllCall("RESUTILS.dll\ResUtilEnumGroups", "ptr", hCluster, "ptr", hSelf, "ptr", pResCallBack, "ptr", pParameter, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {HGROUP} hSelf 
     * @param {Integer} groupType 
     * @param {Pointer<LPGROUP_CALLBACK_EX>} pResCallBack 
     * @param {Pointer<Void>} pParameter 
     * @returns {Integer} 
     */
    static ResUtilEnumGroupsEx(hCluster, hSelf, groupType, pResCallBack, pParameter) {
        result := DllCall("RESUTILS.dll\ResUtilEnumGroupsEx", "ptr", hCluster, "ptr", hSelf, "int", groupType, "ptr", pResCallBack, "ptr", pParameter, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} group 
     * @param {Pointer<HGROUP>} copy 
     * @returns {Integer} 
     */
    static ResUtilDupGroup(group, copy) {
        result := DllCall("RESUTILS.dll\ResUtilDupGroup", "ptr", group, "ptr", copy, "uint")
        return result
    }

    /**
     * 
     * @param {HGROUP} hGroup 
     * @param {Pointer<Int32>} groupType 
     * @returns {Integer} 
     */
    static ResUtilGetClusterGroupType(hGroup, groupType) {
        result := DllCall("RESUTILS.dll\ResUtilGetClusterGroupType", "ptr", hGroup, "int*", groupType, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @returns {HGROUP} 
     */
    static ResUtilGetCoreGroup(hCluster) {
        result := DllCall("RESUTILS.dll\ResUtilGetCoreGroup", "ptr", hCluster, "ptr")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} hSelf 
     * @param {Integer} enumType 
     * @param {Pointer<LPRESOURCE_CALLBACK_EX>} pResCallBack 
     * @param {Pointer<Void>} pParameter 
     * @returns {Integer} 
     */
    static ResUtilResourceDepEnum(hSelf, enumType, pResCallBack, pParameter) {
        result := DllCall("RESUTILS.dll\ResUtilResourceDepEnum", "ptr", hSelf, "uint", enumType, "ptr", pResCallBack, "ptr", pParameter, "uint")
        return result
    }

    /**
     * 
     * @param {HRESOURCE} group 
     * @param {Pointer<HRESOURCE>} copy 
     * @returns {Integer} 
     */
    static ResUtilDupResource(group, copy) {
        result := DllCall("RESUTILS.dll\ResUtilDupResource", "ptr", group, "ptr", copy, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {Pointer<Guid>} guid 
     * @returns {Integer} 
     */
    static ResUtilGetClusterId(hCluster, guid) {
        result := DllCall("RESUTILS.dll\ResUtilGetClusterId", "ptr", hCluster, "ptr", guid, "uint")
        return result
    }

    /**
     * 
     * @param {HCLUSTER} hCluster 
     * @param {Pointer<LPNODE_CALLBACK>} pNodeCallBack 
     * @param {Pointer<Void>} pParameter 
     * @returns {Integer} 
     */
    static ResUtilNodeEnum(hCluster, pNodeCallBack, pParameter) {
        result := DllCall("RESUTILS.dll\ResUtilNodeEnum", "ptr", hCluster, "ptr", pNodeCallBack, "ptr", pParameter, "uint")
        return result
    }

    /**
     * Registers the AppInstance ID for a process.
     * @param {HANDLE} ProcessHandle A process handle for the current process or a remote process to be tagged with the 
     *       <i>AppInstanceId</i>. To tag a remote process, the handle must have 
     *       <b>PROCESS_TERMINATE</b> access to that process.
     * @param {Pointer<Guid>} AppInstanceId The application instance ID, which is a <b>GUID</b>.
     * @param {BOOL} ChildrenInheritAppInstance <b>TRUE</b> to tag the child processes spawned by the process specified by 
     *        <i>ProcessHandle</i>; otherwise, <b>FALSE</b>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CCF Filter failed to allocate the proper cache objects to fulfill this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current process that's trying to tag the process specified by 
     *         <i>ProcessHandle</i> doesn't have <b>PROCESS_TERMINATE</b> 
     *         access to that process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>ProcessHandle</i> is not a handle to a process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CCF mini-filter is not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OBJECT_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another <i>AppInstance</i><b>GUID</b> is provided for the same 
     *         process, which means that the 
     *         <a href="/windows/desktop/api/smbclnt/nf-smbclnt-registerappinstance">RegisterAppInstance</a> function was called twice 
     *         or the application was registered twice.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//smbclnt/nf-smbclnt-registerappinstance
     * @since windowsserver2012
     */
    static RegisterAppInstance(ProcessHandle, AppInstanceId, ChildrenInheritAppInstance) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        result := DllCall("NTLANMAN.dll\RegisterAppInstance", "ptr", ProcessHandle, "ptr", AppInstanceId, "ptr", ChildrenInheritAppInstance, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} AppInstanceId 
     * @param {Integer} InstanceVersionHigh 
     * @param {Integer} InstanceVersionLow 
     * @returns {Integer} 
     */
    static RegisterAppInstanceVersion(AppInstanceId, InstanceVersionHigh, InstanceVersionLow) {
        result := DllCall("NTLANMAN.dll\RegisterAppInstanceVersion", "ptr", AppInstanceId, "uint", InstanceVersionHigh, "uint", InstanceVersionLow, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} AppInstanceId 
     * @param {Pointer<UInt64>} InstanceVersionHigh 
     * @param {Pointer<UInt64>} InstanceVersionLow 
     * @param {Pointer<NTSTATUS>} VersionStatus 
     * @returns {Integer} 
     */
    static QueryAppInstanceVersion(AppInstanceId, InstanceVersionHigh, InstanceVersionLow, VersionStatus) {
        result := DllCall("NTLANMAN.dll\QueryAppInstanceVersion", "ptr", AppInstanceId, "uint*", InstanceVersionHigh, "uint*", InstanceVersionLow, "ptr", VersionStatus, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static ResetAllAppInstanceVersions() {
        result := DllCall("NTLANMAN.dll\ResetAllAppInstanceVersions", "uint")
        return result
    }

    /**
     * Sets the flags that affect connections from the application instance.
     * @param {HANDLE} ProcessHandle A process handle for the current process or a remote process to be tagged with the 
     *       application instance. To tag a remote process, the handle must have 
     *       <b>PROCESS_TERMINATE</b> access to that process.
     * @param {Integer} Mask A bitmask that indicates the flags that are modified by the <i>Flags</i> parameter.
     * @param {Integer} Flags New values of the flags.
     * @returns {Integer} Returns "0" if the operation is successful; otherwise, one of the following error codes is returned:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CCF filter failed to allocate the                  cache objects for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current process that's trying to tag the process specified by 
     *         <i>ProcessHandle</i> doesn't have <b>PROCESS_TERMINATE</b> 
     *         access to that process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CCF mini-filter was                  not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//smbclnt/nf-smbclnt-setappinstancecsvflags
     * @since windowsserver2016
     */
    static SetAppInstanceCsvFlags(ProcessHandle, Mask, Flags) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        result := DllCall("NTLANMAN.dll\SetAppInstanceCsvFlags", "ptr", ProcessHandle, "uint", Mask, "uint", Flags, "uint")
        return result
    }

;@endregion Methods
}
