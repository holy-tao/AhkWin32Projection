#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSCTL_RESOURCE_CODES enumeration (msclus.h) enumerates resource control codes.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-clusctl_resource_codes
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSCTL_RESOURCE_CODES extends Win32Enum {

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-unknown">CLUSCTL_RESOURCE_UNKNOWN</a>.
     * Native name: CLUSCTL_RESOURCE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 16777216

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-characteristics">CLUSCTL_RESOURCE_GET_CHARACTERISTICS</a>.
     * Native name: CLUSCTL_RESOURCE_GET_CHARACTERISTICS
     * @type {Integer (Int32)}
     */
    static GET_CHARACTERISTICS => 16777221

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-flags">CLUSCTL_RESOURCE_GET_FLAGS</a>.
     * Native name: CLUSCTL_RESOURCE_GET_FLAGS
     * @type {Integer (Int32)}
     */
    static GET_FLAGS => 16777225

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-class-info">CLUSCTL_RESOURCE_GET_CLASS_INFO</a>.
     * Native name: CLUSCTL_RESOURCE_GET_CLASS_INFO
     * @type {Integer (Int32)}
     */
    static GET_CLASS_INFO => 16777229

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-required-dependencies">CLUSCTL_RESOURCE_GET_REQUIRED_DEPENDENCIES</a>.
     * Native name: CLUSCTL_RESOURCE_GET_REQUIRED_DEPENDENCIES
     * @type {Integer (Int32)}
     */
    static GET_REQUIRED_DEPENDENCIES => 16777233

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-name">CLUSCTL_RESOURCE_GET_NAME</a>.
     * Native name: CLUSCTL_RESOURCE_GET_NAME
     * @type {Integer (Int32)}
     */
    static GET_NAME => 16777257

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-id">CLUSCTL_RESOURCE_GET_ID</a>.
     * Native name: CLUSCTL_RESOURCE_GET_ID
     * @type {Integer (Int32)}
     */
    static GET_ID => 16777273

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-resource-type">CLUSCTL_RESOURCE_GET_RESOURCE_TYPE</a>.
     * Native name: CLUSCTL_RESOURCE_GET_RESOURCE_TYPE
     * @type {Integer (Int32)}
     */
    static GET_RESOURCE_TYPE => 16777261

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-enum-common-properties">CLUSCTL_RESOURCE_ENUM_COMMON_PROPERTIES</a>.
     * Native name: CLUSCTL_RESOURCE_ENUM_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static ENUM_COMMON_PROPERTIES => 16777297

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-ro-common-properties">CLUSCTL_RESOURCE_GET_RO_COMMON_PROPERTIES</a>.
     * Native name: CLUSCTL_RESOURCE_GET_RO_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_RO_COMMON_PROPERTIES => 16777301

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-common-properties">CLUSCTL_RESOURCE_GET_COMMON_PROPERTIES</a>.
     * Native name: CLUSCTL_RESOURCE_GET_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_COMMON_PROPERTIES => 16777305

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-common-properties">CLUSCTL_RESOURCE_SET_COMMON_PROPERTIES</a>.
     * Native name: CLUSCTL_RESOURCE_SET_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static SET_COMMON_PROPERTIES => 20971614

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-validate-common-properties">CLUSCTL_RESOURCE_VALIDATE_COMMON_PROPERTIES</a>.
     * Native name: CLUSCTL_RESOURCE_VALIDATE_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static VALIDATE_COMMON_PROPERTIES => 16777313

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-common-property-fmts">CLUSCTL_RESOURCE_GET_COMMON_PROPERTY_FMTS</a>.
     * Native name: CLUSCTL_RESOURCE_GET_COMMON_PROPERTY_FMTS
     * @type {Integer (Int32)}
     */
    static GET_COMMON_PROPERTY_FMTS => 16777317

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-enum-private-properties">CLUSCTL_RESOURCE_ENUM_PRIVATE_PROPERTIES</a>.
     * Native name: CLUSCTL_RESOURCE_ENUM_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static ENUM_PRIVATE_PROPERTIES => 16777337

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-ro-private-properties">CLUSCTL_RESOURCE_GET_RO_PRIVATE_PROPERTIES</a>.
     * Native name: CLUSCTL_RESOURCE_GET_RO_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_RO_PRIVATE_PROPERTIES => 16777341

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-private-properties">CLUSCTL_RESOURCE_GET_PRIVATE_PROPERTIES</a>.
     * Native name: CLUSCTL_RESOURCE_GET_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_PRIVATE_PROPERTIES => 16777345

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-private-properties">CLUSCTL_RESOURCE_SET_PRIVATE_PROPERTIES</a>.
     * Native name: CLUSCTL_RESOURCE_SET_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static SET_PRIVATE_PROPERTIES => 20971654

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-validate-private-properties">CLUSCTL_RESOURCE_VALIDATE_PRIVATE_PROPERTIES</a>.
     * Native name: CLUSCTL_RESOURCE_VALIDATE_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static VALIDATE_PRIVATE_PROPERTIES => 16777353

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-private-property-fmts">CLUSCTL_RESOURCE_GET_PRIVATE_PROPERTY_FMTS</a>.
     * Native name: CLUSCTL_RESOURCE_GET_PRIVATE_PROPERTY_FMTS
     * @type {Integer (Int32)}
     */
    static GET_PRIVATE_PROPERTY_FMTS => 16777357

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-registry-checkpoint">CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT</a>.
     * Native name: CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT
     * @type {Integer (Int32)}
     */
    static ADD_REGISTRY_CHECKPOINT => 20971682

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-delete-registry-checkpoint">CLUSCTL_RESOURCE_DELETE_REGISTRY_CHECKPOINT</a>.
     * Native name: CLUSCTL_RESOURCE_DELETE_REGISTRY_CHECKPOINT
     * @type {Integer (Int32)}
     */
    static DELETE_REGISTRY_CHECKPOINT => 20971686

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-registry-checkpoints">CLUSCTL_RESOURCE_GET_REGISTRY_CHECKPOINTS</a>.
     * Native name: CLUSCTL_RESOURCE_GET_REGISTRY_CHECKPOINTS
     * @type {Integer (Int32)}
     */
    static GET_REGISTRY_CHECKPOINTS => 16777385

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-crypto-checkpoint">CLUSCTL_RESOURCE_ADD_CRYPTO_CHECKPOINT</a>.
     * Native name: CLUSCTL_RESOURCE_ADD_CRYPTO_CHECKPOINT
     * @type {Integer (Int32)}
     */
    static ADD_CRYPTO_CHECKPOINT => 20971694

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-delete-crypto-checkpoint">CLUSCTL_RESOURCE_DELETE_CRYPTO_CHECKPOINT</a>.
     * Native name: CLUSCTL_RESOURCE_DELETE_CRYPTO_CHECKPOINT
     * @type {Integer (Int32)}
     */
    static DELETE_CRYPTO_CHECKPOINT => 20971698

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-crypto-checkpoint-ex">CLUSCTL_RESOURCE_ADD_CRYPTO_CHECKPOINT_EX</a>.
     * 
     * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available before Windows Server 2012 R2.
     * Native name: CLUSCTL_RESOURCE_ADD_CRYPTO_CHECKPOINT_EX
     * @type {Integer (Int32)}
     */
    static ADD_CRYPTO_CHECKPOINT_EX => 20972246

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-crypto-checkpoints">CLUSCTL_RESOURCE_GET_CRYPTO_CHECKPOINTS</a>.
     * Native name: CLUSCTL_RESOURCE_GET_CRYPTO_CHECKPOINTS
     * @type {Integer (Int32)}
     */
    static GET_CRYPTO_CHECKPOINTS => 16777397

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-loadbal-process-list">CLUSCTL_RESOURCE_GET_LOADBAL_PROCESS_LIST</a>.
     * Native name: CLUSCTL_RESOURCE_GET_LOADBAL_PROCESS_LIST
     * @type {Integer (Int32)}
     */
    static GET_LOADBAL_PROCESS_LIST => 16777417

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-network-name">CLUSCTL_RESOURCE_GET_NETWORK_NAME</a>.
     * Native name: CLUSCTL_RESOURCE_GET_NETWORK_NAME
     * @type {Integer (Int32)}
     */
    static GET_NETWORK_NAME => 16777577

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-get-virtual-server-token">CLUSCTL_RESOURCE_NETNAME_GET_VIRTUAL_SERVER_TOKEN</a>.
     * Native name: CLUSCTL_RESOURCE_NETNAME_GET_VIRTUAL_SERVER_TOKEN
     * @type {Integer (Int32)}
     */
    static NETNAME_GET_VIRTUAL_SERVER_TOKEN => 16777581

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-set-pwd-info">CLUSCTL_RESOURCE_NETNAME_SET_PWD_INFO</a>.
     * Native name: CLUSCTL_RESOURCE_NETNAME_SET_PWD_INFO
     * @type {Integer (Int32)}
     */
    static NETNAME_SET_PWD_INFO => 16777594

    /**
     * Native name: CLUSCTL_RESOURCE_NETNAME_SET_PWD_INFOEX
     * @type {Integer (Int32)}
     */
    static NETNAME_SET_PWD_INFOEX => 16778010

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-delete-co">CLUSCTL_RESOURCE_NETNAME_DELETE_CO</a>.
     * Native name: CLUSCTL_RESOURCE_NETNAME_DELETE_CO
     * @type {Integer (Int32)}
     */
    static NETNAME_DELETE_CO => 16777598

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-validate-vco">CLUSCTL_RESOURCE_NETNAME_VALIDATE_VCO</a>.
     * Native name: CLUSCTL_RESOURCE_NETNAME_VALIDATE_VCO
     * @type {Integer (Int32)}
     */
    static NETNAME_VALIDATE_VCO => 16777601

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-reset-vco">CLUSCTL_RESOURCE_NETNAME_RESET_VCO</a>.
     * Native name: CLUSCTL_RESOURCE_NETNAME_RESET_VCO
     * @type {Integer (Int32)}
     */
    static NETNAME_RESET_VCO => 16777605

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-repair-vco">CLUSCTL_RESOURCE_NETNAME_REPAIR_VCO</a>
     * Native name: CLUSCTL_RESOURCE_NETNAME_REPAIR_VCO
     * @type {Integer (Int32)}
     */
    static NETNAME_REPAIR_VCO => 16777613

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-register-dns-records">CLUSCTL_RESOURCE_NETNAME_REGISTER_DNS_RECORDS</a>.
     * Native name: CLUSCTL_RESOURCE_NETNAME_REGISTER_DNS_RECORDS
     * @type {Integer (Int32)}
     */
    static NETNAME_REGISTER_DNS_RECORDS => 16777586

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-dns-name">CLUSCTL_RESOURCE_GET_DNS_NAME</a>.
     * Native name: CLUSCTL_RESOURCE_GET_DNS_NAME
     * @type {Integer (Int32)}
     */
    static GET_DNS_NAME => 16777589

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-disk-info">CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO</a>.
     * Native name: CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_DISK_INFO => 16777617

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-disk-number-info">CLUSCTL_RESOURCE_STORAGE_GET_DISK_NUMBER_INFO</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not supported before Windows Server 2016.
     * Native name: CLUSCTL_RESOURCE_STORAGE_GET_DISK_NUMBER_INFO
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_DISK_NUMBER_INFO => 16777633

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-is-path-valid">CLUSCTL_RESOURCE_STORAGE_IS_PATH_VALID</a>.
     * Native name: CLUSCTL_RESOURCE_STORAGE_IS_PATH_VALID
     * @type {Integer (Int32)}
     */
    static STORAGE_IS_PATH_VALID => 16777625

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-query-delete">CLUSCTL_RESOURCE_QUERY_DELETE</a>.
     * Native name: CLUSCTL_RESOURCE_QUERY_DELETE
     * @type {Integer (Int32)}
     */
    static QUERY_DELETE => 16777657

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-upgrade-dll">CLUSCTL_RESOURCE_UPGRADE_DLL</a>.
     * Native name: CLUSCTL_RESOURCE_UPGRADE_DLL
     * @type {Integer (Int32)}
     */
    static UPGRADE_DLL => 20971706

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-ipaddress-renew-lease">CLUSCTL_RESOURCE_IPADDRESS_RENEW_LEASE</a>.
     * Native name: CLUSCTL_RESOURCE_IPADDRESS_RENEW_LEASE
     * @type {Integer (Int32)}
     */
    static IPADDRESS_RENEW_LEASE => 20971966

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-ipaddress-release-lease">CLUSCTL_RESOURCE_IPADDRESS_RELEASE_LEASE</a>.
     * Native name: CLUSCTL_RESOURCE_IPADDRESS_RELEASE_LEASE
     * @type {Integer (Int32)}
     */
    static IPADDRESS_RELEASE_LEASE => 20971970

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-registry-checkpoint-64bit">CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT_64BIT</a>.
     * Native name: CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT_64BIT
     * @type {Integer (Int32)}
     */
    static ADD_REGISTRY_CHECKPOINT_64BIT => 20971710

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-registry-checkpoint-32bit">CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT_32BIT</a>.
     * Native name: CLUSCTL_RESOURCE_ADD_REGISTRY_CHECKPOINT_32BIT
     * @type {Integer (Int32)}
     */
    static ADD_REGISTRY_CHECKPOINT_32BIT => 20971714

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-query-maintenance-mode">CLUSCTL_RESOURCE_QUERY_MAINTENANCE_MODE</a>.
     * Native name: CLUSCTL_RESOURCE_QUERY_MAINTENANCE_MODE
     * @type {Integer (Int32)}
     */
    static QUERY_MAINTENANCE_MODE => 16777697

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-maintenance-mode">CLUSCTL_RESOURCE_SET_MAINTENANCE_MODE</a>.
     * Native name: CLUSCTL_RESOURCE_SET_MAINTENANCE_MODE
     * @type {Integer (Int32)}
     */
    static SET_MAINTENANCE_MODE => 20972006

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-set-driveletter">CLUSCTL_RESOURCE_STORAGE_SET_DRIVELETTER</a>.
     * Native name: CLUSCTL_RESOURCE_STORAGE_SET_DRIVELETTER
     * @type {Integer (Int32)}
     */
    static STORAGE_SET_DRIVELETTER => 20972010

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-disk-info-ex">CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO_EX</a>.
     * Native name: CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO_EX
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_DISK_INFO_EX => 16777713

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-disk-info-ex2">CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO_EX2</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not supported before Windows Server 2016.
     * Native name: CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO_EX2
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_DISK_INFO_EX2 => 16777721

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-mountpoints">CLUSCTL_RESOURCE_STORAGE_GET_MOUNTPOINTS</a>.
     * Native name: CLUSCTL_RESOURCE_STORAGE_GET_MOUNTPOINTS
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_MOUNTPOINTS => 16777745

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-dirty">CLUSCTL_RESOURCE_STORAGE_GET_DIRTY</a>.
     * Native name: CLUSCTL_RESOURCE_STORAGE_GET_DIRTY
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_DIRTY => 16777753

    /**
     * Not supported.
     * Native name: CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_INFO
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_SHARED_VOLUME_INFO => 16777765

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-csv-maintenance-mode">CLUSCTL_RESOURCE_SET_CSV_MAINTENANCE_MODE</a>.
     * Native name: CLUSCTL_RESOURCE_SET_CSV_MAINTENANCE_MODE
     * @type {Integer (Int32)}
     */
    static SET_CSV_MAINTENANCE_MODE => 20972182

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-enable-shared-volume-directio">CLUSCTL_RESOURCE_ENABLE_SHARED_VOLUME_DIRECTIO</a>.
     * Native name: CLUSCTL_RESOURCE_ENABLE_SHARED_VOLUME_DIRECTIO
     * @type {Integer (Int32)}
     */
    static ENABLE_SHARED_VOLUME_DIRECTIO => 20972170

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-disable-shared-volume-directio">CLUSCTL_RESOURCE_DISABLE_SHARED_VOLUME_DIRECTIO</a>.
     * Native name: CLUSCTL_RESOURCE_DISABLE_SHARED_VOLUME_DIRECTIO
     * @type {Integer (Int32)}
     */
    static DISABLE_SHARED_VOLUME_DIRECTIO => 20972174

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-shared-volume-backup-mode">CLUSCTL_RESOURCE_SET_SHARED_VOLUME_BACKUP_MODE</a>.
     * Native name: CLUSCTL_RESOURCE_SET_SHARED_VOLUME_BACKUP_MODE
     * @type {Integer (Int32)}
     */
    static SET_SHARED_VOLUME_BACKUP_MODE => 20972186

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-shared-volume-partition-names">CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_PARTITION_NAMES</a>.
     * Native name: CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_PARTITION_NAMES
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_SHARED_VOLUME_PARTITION_NAMES => 16777885

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-failure-info">CLUSCTL_RESOURCE_GET_FAILURE_INFO</a>.
     * Native name: CLUSCTL_RESOURCE_GET_FAILURE_INFO
     * @type {Integer (Int32)}
     */
    static GET_FAILURE_INFO => 16777241

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-diskid">CLUSCTL_RESOURCE_STORAGE_GET_DISKID</a>.
     * Native name: CLUSCTL_RESOURCE_STORAGE_GET_DISKID
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_DISKID => 16777733

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-get-shared-volume-states">CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_STATES</a>.
     * Native name: CLUSCTL_RESOURCE_STORAGE_GET_SHARED_VOLUME_STATES
     * @type {Integer (Int32)}
     */
    static STORAGE_GET_SHARED_VOLUME_STATES => 20972194

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-storage-is-shared-volume">CLUSCTL_RESOURCE_STORAGE_IS_SHARED_VOLUME</a>.
     * Native name: CLUSCTL_RESOURCE_STORAGE_IS_SHARED_VOLUME
     * @type {Integer (Int32)}
     */
    static STORAGE_IS_SHARED_VOLUME => 16777893

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-is-quorum-blocked">CLUSCTL_RESOURCE_IS_QUORUM_BLOCKED</a>.
     * Native name: CLUSCTL_RESOURCE_IS_QUORUM_BLOCKED
     * @type {Integer (Int32)}
     */
    static IS_QUORUM_BLOCKED => 16777905

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-pool-get-drive-info">CLUSCTL_RESOURCE_POOL_GET_DRIVE_INFO</a>.
     * Native name: CLUSCTL_RESOURCE_POOL_GET_DRIVE_INFO
     * @type {Integer (Int32)}
     */
    static POOL_GET_DRIVE_INFO => 16777909

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-rlua-get-virtual-server-token">CLUSCTL_RESOURCE_RLUA_GET_VIRTUAL_SERVER_TOKEN</a>.
     * 
     * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not supported before Windows Server 2012 R2.
     * Native name: CLUSCTL_RESOURCE_RLUA_GET_VIRTUAL_SERVER_TOKEN
     * @type {Integer (Int32)}
     */
    static RLUA_GET_VIRTUAL_SERVER_TOKEN => 16777581

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-rlua-set-pwd-info">CLUSCTL_RESOURCE_RLUA_SET_PWD_INFO</a>.
     * 
     * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not supported before Windows Server 2012 R2.
     * Native name: CLUSCTL_RESOURCE_RLUA_SET_PWD_INFO
     * @type {Integer (Int32)}
     */
    static RLUA_SET_PWD_INFO => 16777594

    /**
     * Native name: CLUSCTL_RESOURCE_RLUA_SET_PWD_INFOEX
     * @type {Integer (Int32)}
     */
    static RLUA_SET_PWD_INFOEX => 16778010

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-delete">CLUSCTL_RESOURCE_DELETE</a>.
     * Native name: CLUSCTL_RESOURCE_DELETE
     * @type {Integer (Int32)}
     */
    static DELETE => 22020102

    /**
     * Native name: CLUSCTL_RESOURCE_UNDELETE
     * @type {Integer (Int32)}
     */
    static UNDELETE => 22020230

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-install-node">CLUSCTL_RESOURCE_INSTALL_NODE</a>.
     * Native name: CLUSCTL_RESOURCE_INSTALL_NODE
     * @type {Integer (Int32)}
     */
    static INSTALL_NODE => 22020106

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-evict-node">CLUSCTL_RESOURCE_EVICT_NODE</a>.
     * Native name: CLUSCTL_RESOURCE_EVICT_NODE
     * @type {Integer (Int32)}
     */
    static EVICT_NODE => 22020110

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-dependency">CLUSCTL_RESOURCE_ADD_DEPENDENCY</a>.
     * Native name: CLUSCTL_RESOURCE_ADD_DEPENDENCY
     * @type {Integer (Int32)}
     */
    static ADD_DEPENDENCY => 22020114

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-remove-dependency">CLUSCTL_RESOURCE_REMOVE_DEPENDENCY</a>.
     * Native name: CLUSCTL_RESOURCE_REMOVE_DEPENDENCY
     * @type {Integer (Int32)}
     */
    static REMOVE_DEPENDENCY => 22020118

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-add-owner">CLUSCTL_RESOURCE_ADD_OWNER</a>.
     * Native name: CLUSCTL_RESOURCE_ADD_OWNER
     * @type {Integer (Int32)}
     */
    static ADD_OWNER => 22020122

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-remove-owner">CLUSCTL_RESOURCE_REMOVE_OWNER</a>.
     * Native name: CLUSCTL_RESOURCE_REMOVE_OWNER
     * @type {Integer (Int32)}
     */
    static REMOVE_OWNER => 22020126

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-set-name">CLUSCTL_RESOURCE_SET_NAME</a>.
     * Native name: CLUSCTL_RESOURCE_SET_NAME
     * @type {Integer (Int32)}
     */
    static SET_NAME => 22020134

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-cluster-name-changed">CLUSCTL_RESOURCE_CLUSTER_NAME_CHANGED</a>.
     * Native name: CLUSCTL_RESOURCE_CLUSTER_NAME_CHANGED
     * @type {Integer (Int32)}
     */
    static CLUSTER_NAME_CHANGED => 22020138

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-cluster-version-changed">CLUSCTL_RESOURCE_CLUSTER_VERSION_CHANGED</a>.
     * Native name: CLUSCTL_RESOURCE_CLUSTER_VERSION_CHANGED
     * @type {Integer (Int32)}
     */
    static CLUSTER_VERSION_CHANGED => 22020142

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-force-quorum">CLUSCTL_RESOURCE_FORCE_QUORUM</a>.
     * Native name: CLUSCTL_RESOURCE_FORCE_QUORUM
     * @type {Integer (Int32)}
     */
    static FORCE_QUORUM => 22020166

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-initialize">CLUSCTL_RESOURCE_INITIALIZE</a>.
     * Native name: CLUSCTL_RESOURCE_INITIALIZE
     * @type {Integer (Int32)}
     */
    static INITIALIZE => 22020170

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-state-change-reason">CLUSCTL_RESOURCE_STATE_CHANGE_REASON</a>.
     * Native name: CLUSCTL_RESOURCE_STATE_CHANGE_REASON
     * @type {Integer (Int32)}
     */
    static STATE_CHANGE_REASON => 22020174

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-provider-state-change">CLUSCTL_RESOURCE_PROVIDER_STATE_CHANGE</a>.
     * Native name: CLUSCTL_RESOURCE_PROVIDER_STATE_CHANGE
     * @type {Integer (Int32)}
     */
    static PROVIDER_STATE_CHANGE => 22020178

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-leaving-group">CLUSCTL_RESOURCE_LEAVING_GROUP</a>.
     * Native name: CLUSCTL_RESOURCE_LEAVING_GROUP
     * @type {Integer (Int32)}
     */
    static LEAVING_GROUP => 22020182

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-joining-group">CLUSCTL_RESOURCE_JOINING_GROUP</a>.
     * Native name: CLUSCTL_RESOURCE_JOINING_GROUP
     * @type {Integer (Int32)}
     */
    static JOINING_GROUP => 22020186

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fswitness-get-epoch-info">CLUSCTL_RESOURCE_FSWITNESS_GET_EPOCH_INFO</a>.
     * Native name: CLUSCTL_RESOURCE_FSWITNESS_GET_EPOCH_INFO
     * @type {Integer (Int32)}
     */
    static FSWITNESS_GET_EPOCH_INFO => 17825885

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fswitness-set-epoch-info">CLUSCTL_RESOURCE_FSWITNESS_SET_EPOCH_INFO</a>.
     * Native name: CLUSCTL_RESOURCE_FSWITNESS_SET_EPOCH_INFO
     * @type {Integer (Int32)}
     */
    static FSWITNESS_SET_EPOCH_INFO => 22020194

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-fswitness-release-lock">CLUSCTL_RESOURCE_FSWITNESS_RELEASE_LOCK</a>.
     * Native name: CLUSCTL_RESOURCE_FSWITNESS_RELEASE_LOCK
     * @type {Integer (Int32)}
     */
    static FSWITNESS_RELEASE_LOCK => 22020198

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-netname-creds-notifycam">CLUSCTL_RESOURCE_NETNAME_CREDS_NOTIFYCAM</a>.
     * Native name: CLUSCTL_RESOURCE_NETNAME_CREDS_NOTIFYCAM
     * @type {Integer (Int32)}
     */
    static NETNAME_CREDS_NOTIFYCAM => 22020202

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-operation-context">CLUSCTL_RESOURCE_GET_OPERATION_CONTEXT</a>.
     * Native name: CLUSCTL_RESOURCE_GET_OPERATION_CONTEXT
     * @type {Integer (Int32)}
     */
    static GET_OPERATION_CONTEXT => 17834217

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-rw-modify-noop">CLUSCTL_RESOURCE_RW_MODIFY_NOOP</a>.
     * Native name: CLUSCTL_RESOURCE_RW_MODIFY_NOOP
     * @type {Integer (Int32)}
     */
    static RW_MODIFY_NOOP => 20972206

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-notify-quorum-status">CLUSCTL_RESOURCE_NOTIFY_QUORUM_STATUS</a>.
     * Native name: CLUSCTL_RESOURCE_NOTIFY_QUORUM_STATUS
     * @type {Integer (Int32)}
     */
    static NOTIFY_QUORUM_STATUS => 22020222

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-notify-owner-change">CLUSCTL_RESOURCE_NOTIFY_OWNER_CHANGE</a>.
     * 
     * <b>Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not supported before Windows Server 2012 R2.
     * Native name: CLUSCTL_RESOURCE_NOTIFY_OWNER_CHANGE
     * @type {Integer (Int32)}
     */
    static NOTIFY_OWNER_CHANGE => 22028578

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-validate-change-group">CLUSCTL_RESOURCE_VALIDATE_CHANGE_GROUP</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not supported before Windows Server 2016.
     * Native name: CLUSCTL_RESOURCE_VALIDATE_CHANGE_GROUP
     * @type {Integer (Int32)}
     */
    static VALIDATE_CHANGE_GROUP => 17834277

    /**
     * Native name: CLUSCTL_RESOURCE_STORAGE_RENAME_SHARED_VOLUME
     * @type {Integer (Int32)}
     */
    static STORAGE_RENAME_SHARED_VOLUME => 16788950

    /**
     * Native name: CLUSCTL_RESOURCE_STORAGE_RENAME_SHARED_VOLUME_GUID
     * @type {Integer (Int32)}
     */
    static STORAGE_RENAME_SHARED_VOLUME_GUID => 16788954

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cloud-witness-resource-update-token">CLUSCTL_CLOUD_WITNESS_RESOURCE_UPDATE_TOKEN</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not supported before Windows Server 2016.
     * Native name: CLUSCTL_CLOUD_WITNESS_RESOURCE_UPDATE_TOKEN
     * @type {Integer (Int32)}
     */
    static CLOUD_WITNESS_RESOURCE_UPDATE_TOKEN => 20979942

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-cloud-witness-resource-update-key">CLUSCTL_CLOUD_WITNESS_RESOURCE_UPDATE_KEY</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not supported before Windows Server 2016.
     * Native name: CLUSCTL_CLOUD_WITNESS_RESOURCE_UPDATE_KEY
     * @type {Integer (Int32)}
     */
    static CLOUD_WITNESS_RESOURCE_UPDATE_KEY => 20979958

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-prepare-upgrade">CLUSCTL_RESOURCE_PREPARE_UPGRADE</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not supported before Windows Server 2016.
     * Native name: CLUSCTL_RESOURCE_PREPARE_UPGRADE
     * @type {Integer (Int32)}
     */
    static PREPARE_UPGRADE => 20979946

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-upgrade-completed">CLUSCTL_RESOURCE_UPGRADE_COMPLETED</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not supported before Windows Server 2016.
     * Native name: CLUSCTL_RESOURCE_UPGRADE_COMPLETED
     * @type {Integer (Int32)}
     */
    static UPGRADE_COMPLETED => 20979950

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-resource-get-state-change-time">CLUSCTL_RESOURCE_GET_STATE_CHANGE_TIME</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not supported before Windows Server 2016.
     * Native name: CLUSCTL_RESOURCE_GET_STATE_CHANGE_TIME
     * @type {Integer (Int32)}
     */
    static GET_STATE_CHANGE_TIME => 16788829

    /**
     * Native name: CLUSCTL_RESOURCE_GET_INFRASTRUCTURE_SOFS_BUFFER
     * @type {Integer (Int32)}
     */
    static GET_INFRASTRUCTURE_SOFS_BUFFER => 16788873

    /**
     * Native name: CLUSCTL_RESOURCE_SET_INFRASTRUCTURE_SOFS_BUFFER
     * @type {Integer (Int32)}
     */
    static SET_INFRASTRUCTURE_SOFS_BUFFER => 20983182

    /**
     * Native name: CLUSCTL_RESOURCE_SCALEOUT_COMMAND
     * @type {Integer (Int32)}
     */
    static SCALEOUT_COMMAND => 20983190

    /**
     * Native name: CLUSCTL_RESOURCE_SCALEOUT_CONTROL
     * @type {Integer (Int32)}
     */
    static SCALEOUT_CONTROL => 20983194

    /**
     * Native name: CLUSCTL_RESOURCE_SCALEOUT_GET_CLUSTERS
     * @type {Integer (Int32)}
     */
    static SCALEOUT_GET_CLUSTERS => 20983197

    /**
     * Native name: CLUSCTL_RESOURCE_CHECK_DRAIN_VETO
     * @type {Integer (Int32)}
     */
    static CHECK_DRAIN_VETO => 17834285

    /**
     * Native name: CLUSCTL_RESOURCE_NOTIFY_DRAIN_COMPLETE
     * @type {Integer (Int32)}
     */
    static NOTIFY_DRAIN_COMPLETE => 17834289

    /**
     * Native name: CLUSCTL_RESOURCE_GET_NODES_IN_FD
     * @type {Integer (Int32)}
     */
    static GET_NODES_IN_FD => 16788961
}
