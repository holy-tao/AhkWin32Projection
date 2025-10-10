#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of cluster group to create.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-clusgroup_type
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSGROUP_TYPE{

    /**
     * A core cluster group.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeCoreCluster => 1

    /**
     * An available storage cluster group.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeAvailableStorage => 2

    /**
     * A temporary cluster group.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeTemporary => 3

    /**
     * A shared volume.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeSharedVolume => 4

    /**
     * A storage pool.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeStoragePool => 5

    /**
     * A file server.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeFileServer => 100

    /**
     * A print server.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypePrintServer => 101

    /**
     * A Dynamic Host Configuration Protocol (DHCP) server.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeDhcpServer => 102

    /**
     * A Distributed Transaction Coordinator (DTC) service.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeDtc => 103

    /**
     * An Microsoft Message Queuing (MSMQ) service.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeMsmq => 104

    /**
     * A Windows Internet Name Service (WINS).
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeWins => 105

    /**
     * A standalone Distributed File System (DFS).
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeStandAloneDfs => 106

    /**
     * A generic application.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeGenericApplication => 107

    /**
     * A generic service.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeGenericService => 108

    /**
     * A generic script.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeGenericScript => 109

    /**
     * An  Internet Small Computer System Interface (iSCSI) name service.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeIScsiNameService => 110

    /**
     * A virtual machine.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeVirtualMachine => 111

    /**
     * A Terminal Services  Session  Broker.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeTsSessionBroker => 112

    /**
     * An iSCSI target.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeIScsiTarget => 113

    /**
     * A Scale-Out File Server.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeScaleoutFileServer => 114

    /**
     * A virtual machine  replica broker.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeVMReplicaBroker => 115

    /**
     * A task scheduler.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeTaskScheduler => 116

    /**
     * A cluster update agent.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeClusterUpdateAgent => 117

    /**
     * A cluster on a scale-out file server.
 * 
 * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member is not supported until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeScaleoutCluster => 118

    /**
     * A storage replica.
 * 
 * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member is not supported until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeStorageReplica => 119

    /**
     * A virtual machine replica coordinator.
 * 
 * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member is not supported until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeVMReplicaCoordinator => 120

    /**
     * A cross-cluster orchestrator.
 * 
 * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This member is not supported until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeCrossClusterOrchestrator => 121

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeInfrastructureFileServer => 122

    /**
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeCoreSddc => 123

    /**
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeUserManager => 124

    /**
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeKeyValueStoreManager => 125

    /**
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeHcsVirtualMachine => 126

    /**
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeMetaVirtualMachine => 127

    /**
     * An unknown cluster group type.
     * @type {Integer (Int32)}
     */
    static ClusGroupTypeUnknown => 9999
}
