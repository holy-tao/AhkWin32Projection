#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains the names of the standard cluster roles.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ne-resapi-cluster_role
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_ROLE extends Win32Enum {

    /**
     * The DHCP cluster role.
     * Native name: ClusterRoleDHCP
     * @type {Integer (Int32)}
     */
    static RoleDHCP => 0

    /**
     * The Distributed Transaction Coordinator (MSDTC) role.
     * Native name: ClusterRoleDTC
     * @type {Integer (Int32)}
     */
    static RoleDTC => 1

    /**
     * The file share role.
     * Native name: ClusterRoleFileServer
     * @type {Integer (Int32)}
     */
    static FileServer => 2

    /**
     * The Generic Application role.
     * Native name: ClusterRoleGenericApplication
     * @type {Integer (Int32)}
     */
    static GenericApplication => 3

    /**
     * The Generic Script role.
     * Native name: ClusterRoleGenericScript
     * @type {Integer (Int32)}
     */
    static GenericScript => 4

    /**
     * The Generic Service role.
     * Native name: ClusterRoleGenericService
     * @type {Integer (Int32)}
     */
    static GenericService => 5

    /**
     * The Microsoft Internet Storage Name Service (iSNS) role.
     * Native name: ClusterRoleISCSINameServer
     * @type {Integer (Int32)}
     */
    static RoleISCSINameServer => 6

    /**
     * The Microsoft Message Queue role.
     * Native name: ClusterRoleMSMQ
     * @type {Integer (Int32)}
     */
    static RoleMSMQ => 7

    /**
     * The Network File System (NFS) Share role.
     * Native name: ClusterRoleNFS
     * @type {Integer (Int32)}
     */
    static RoleNFS => 8

    /**
     * The Print Spooler cluster role.
     * Native name: ClusterRolePrintServer
     * @type {Integer (Int32)}
     */
    static PrintServer => 9

    /**
     * The specialized File Share role.
     * Native name: ClusterRoleStandAloneNamespaceServer
     * @type {Integer (Int32)}
     */
    static StandAloneNamespaceServer => 10

    /**
     * The Volume Shadow Copy Service Task role.
     * Native name: ClusterRoleVolumeShadowCopyServiceTask
     * @type {Integer (Int32)}
     */
    static VolumeShadowCopyServiceTask => 11

    /**
     * The WINS Service role.
     * Native name: ClusterRoleWINS
     * @type {Integer (Int32)}
     */
    static RoleWINS => 12

    /**
     * The Task Scheduler role.
     * Native name: ClusterRoleTaskScheduler
     * @type {Integer (Int32)}
     */
    static TaskScheduler => 13

    /**
     * The network file system role.
     * Native name: ClusterRoleNetworkFileSystem
     * @type {Integer (Int32)}
     */
    static NetworkFileSystem => 14

    /**
     * The Distributed File System (DFS) replicated folder role.
     * Native name: ClusterRoleDFSReplicatedFolder
     * @type {Integer (Int32)}
     */
    static RoleDFSReplicatedFolder => 15

    /**
     * The Distributed File System (DFS) role.
     * Native name: ClusterRoleDistributedFileSystem
     * @type {Integer (Int32)}
     */
    static DistributedFileSystem => 16

    /**
     * The Distributed Network Name role.
     * Native name: ClusterRoleDistributedNetworkName
     * @type {Integer (Int32)}
     */
    static DistributedNetworkName => 17

    /**
     * The file share role.
     * Native name: ClusterRoleFileShare
     * @type {Integer (Int32)}
     */
    static FileShare => 18

    /**
     * The file share witness role
     * Native name: ClusterRoleFileShareWitness
     * @type {Integer (Int32)}
     */
    static FileShareWitness => 19

    /**
     * The hard disk role.
     * Native name: ClusterRoleHardDisk
     * @type {Integer (Int32)}
     */
    static HardDisk => 20

    /**
     * The IP address role.
     * Native name: ClusterRoleIPAddress
     * @type {Integer (Int32)}
     */
    static RoleIPAddress => 21

    /**
     * The IPV6 address role.
     * Native name: ClusterRoleIPV6Address
     * @type {Integer (Int32)}
     */
    static RoleIPV6Address => 22

    /**
     * The IPV6 tunnel address role.
     * Native name: ClusterRoleIPV6TunnelAddress
     * @type {Integer (Int32)}
     */
    static RoleIPV6TunnelAddress => 23

    /**
     * The ISCSI Target Server role.
     * Native name: ClusterRoleISCSITargetServer
     * @type {Integer (Int32)}
     */
    static RoleISCSITargetServer => 24

    /**
     * The Network Name role.
     * Native name: ClusterRoleNetworkName
     * @type {Integer (Int32)}
     */
    static NetworkName => 25

    /**
     * The physical disk role.
     * Native name: ClusterRolePhysicalDisk
     * @type {Integer (Int32)}
     */
    static PhysicalDisk => 26

    /**
     * The Scale-Out (SODA) File Server role
     * Native name: ClusterRoleSODAFileServer
     * @type {Integer (Int32)}
     */
    static RoleSODAFileServer => 27

    /**
     * The storage pool role.
     * Native name: ClusterRoleStoragePool
     * @type {Integer (Int32)}
     */
    static StoragePool => 28

    /**
     * The virtual machine role.
     * Native name: ClusterRoleVirtualMachine
     * @type {Integer (Int32)}
     */
    static VirtualMachine => 29

    /**
     * The virtual machine configuration role.
     * Native name: ClusterRoleVirtualMachineConfiguration
     * @type {Integer (Int32)}
     */
    static VirtualMachineConfiguration => 30

    /**
     * The virtual machine replica broker role.
     * Native name: ClusterRoleVirtualMachineReplicaBroker
     * @type {Integer (Int32)}
     */
    static VirtualMachineReplicaBroker => 31

    /**
     * Native name: ClusterRoleKeyValueStore
     * @type {Integer (Int32)}
     */
    static KeyValueStore => 32
}
