#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains the names of the standard cluster roles.
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ne-resapi-cluster_role
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_ROLE{

    /**
     * The DHCP cluster role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleDHCP => 0

    /**
     * The Distributed Transaction Coordinator (MSDTC) role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleDTC => 1

    /**
     * The file share role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleFileServer => 2

    /**
     * The Generic Application role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleGenericApplication => 3

    /**
     * The Generic Script role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleGenericScript => 4

    /**
     * The Generic Service role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleGenericService => 5

    /**
     * The Microsoft Internet Storage Name Service (iSNS) role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleISCSINameServer => 6

    /**
     * The Microsoft Message Queue role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleMSMQ => 7

    /**
     * The Network File System (NFS) Share role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleNFS => 8

    /**
     * The Print Spooler cluster role.
     * @type {Integer (Int32)}
     */
    static ClusterRolePrintServer => 9

    /**
     * The specialized File Share role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleStandAloneNamespaceServer => 10

    /**
     * The Volume Shadow Copy Service Task role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleVolumeShadowCopyServiceTask => 11

    /**
     * The WINS Service role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleWINS => 12

    /**
     * The Task Scheduler role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleTaskScheduler => 13

    /**
     * The network file system role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleNetworkFileSystem => 14

    /**
     * The Distributed File System (DFS) replicated folder role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleDFSReplicatedFolder => 15

    /**
     * The Distributed File System (DFS) role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleDistributedFileSystem => 16

    /**
     * The Distributed Network Name role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleDistributedNetworkName => 17

    /**
     * The file share role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleFileShare => 18

    /**
     * The file share witness role
     * @type {Integer (Int32)}
     */
    static ClusterRoleFileShareWitness => 19

    /**
     * The hard disk role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleHardDisk => 20

    /**
     * The IP address role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleIPAddress => 21

    /**
     * The IPV6 address role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleIPV6Address => 22

    /**
     * The IPV6 tunnel address role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleIPV6TunnelAddress => 23

    /**
     * The ISCSI Target Server role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleISCSITargetServer => 24

    /**
     * The Network Name role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleNetworkName => 25

    /**
     * The physical disk role.
     * @type {Integer (Int32)}
     */
    static ClusterRolePhysicalDisk => 26

    /**
     * The Scale-Out (SODA) File Server role
     * @type {Integer (Int32)}
     */
    static ClusterRoleSODAFileServer => 27

    /**
     * The storage pool role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleStoragePool => 28

    /**
     * The virtual machine role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleVirtualMachine => 29

    /**
     * The virtual machine configuration role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleVirtualMachineConfiguration => 30

    /**
     * The virtual machine replica broker role.
     * @type {Integer (Int32)}
     */
    static ClusterRoleVirtualMachineReplicaBroker => 31

    /**
     * @type {Integer (Int32)}
     */
    static ClusterRoleKeyValueStore => 32
}
