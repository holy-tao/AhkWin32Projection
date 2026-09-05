#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VDS_OBJECT_TYPE enumeration (vdshwprv.h) defines the set of valid types of a VDS object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsproviderprivate-getobject">IVdsProviderPrivate::GetObject</a> 
 *     and <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getobject">IVdsService::GetObject</a> methods pass a <b>VDS_OBJECT_TYPE</b> 
 *     value as an argument to indicate an object type.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_OBJECT_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_OBJECT_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_object_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_OBJECT_TYPE extends Win32Enum {

    /**
     * This value is reserved.
     * Native name: VDS_OT_UNKNOWN
     * @type {Integer (Int32)}
     */
    static OT_UNKNOWN => 0

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/provider-object">provider</a>.
     * Native name: VDS_OT_PROVIDER
     * @type {Integer (Int32)}
     */
    static OT_PROVIDER => 1

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/pack-object">disk pack</a>.
     * Native name: VDS_OT_PACK
     * @type {Integer (Int32)}
     */
    static OT_PACK => 10

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/volume-object">volume</a>.
     * Native name: VDS_OT_VOLUME
     * @type {Integer (Int32)}
     */
    static OT_VOLUME => 11

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/volume-plex-object">volume plex</a>.
     * Native name: VDS_OT_VOLUME_PLEX
     * @type {Integer (Int32)}
     */
    static OT_VOLUME_PLEX => 12

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/disk-object">disk</a>.
     * Native name: VDS_OT_DISK
     * @type {Integer (Int32)}
     */
    static OT_DISK => 13

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/subsystem-object">subsystem</a>.
     * Native name: VDS_OT_SUB_SYSTEM
     * @type {Integer (Int32)}
     */
    static OT_SUB_SYSTEM => 30

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/controller-object">controller</a>.
     * Native name: VDS_OT_CONTROLLER
     * @type {Integer (Int32)}
     */
    static OT_CONTROLLER => 31

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/drive-object">drive</a>.
     * Native name: VDS_OT_DRIVE
     * @type {Integer (Int32)}
     */
    static OT_DRIVE => 32

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/lun-object">LUN</a>.
     * Native name: VDS_OT_LUN
     * @type {Integer (Int32)}
     */
    static OT_LUN => 33

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/lun-plex-object">LUN plex</a>.
     * Native name: VDS_OT_LUN_PLEX
     * @type {Integer (Int32)}
     */
    static OT_LUN_PLEX => 34

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/controller-port-object">controller port</a>.
     * Native name: VDS_OT_PORT
     * @type {Integer (Int32)}
     */
    static OT_PORT => 35

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/VDS/portal-object">iSCSI portal</a>.
     * Native name: VDS_OT_PORTAL
     * @type {Integer (Int32)}
     */
    static OT_PORTAL => 36

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/VDS/target-object">iSCSI target</a>.
     * Native name: VDS_OT_TARGET
     * @type {Integer (Int32)}
     */
    static OT_TARGET => 37

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/VDS/portal-group-object">iSCSI portal group</a>.
     * Native name: VDS_OT_PORTAL_GROUP
     * @type {Integer (Int32)}
     */
    static OT_PORTAL_GROUP => 38

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/storage-pool-object">storage pool</a>.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * Native name: VDS_OT_STORAGE_POOL
     * @type {Integer (Int32)}
     */
    static OT_STORAGE_POOL => 39

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/VDS/startup-and-service-objects">HBA port</a>.
     * Native name: VDS_OT_HBAPORT
     * @type {Integer (Int32)}
     */
    static OT_HBAPORT => 90

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/VDS/startup-and-service-objects">iSCSI initiator adapter</a>.
     * Native name: VDS_OT_INIT_ADAPTER
     * @type {Integer (Int32)}
     */
    static OT_INIT_ADAPTER => 91

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/VDS/startup-and-service-objects">iSCSI initiator portal</a>.
     * Native name: VDS_OT_INIT_PORTAL
     * @type {Integer (Int32)}
     */
    static OT_INIT_PORTAL => 92

    /**
     * This value is reserved.
     * Native name: VDS_OT_ASYNC
     * @type {Integer (Int32)}
     */
    static OT_ASYNC => 100

    /**
     * This value is reserved.
     * Native name: VDS_OT_ENUM
     * @type {Integer (Int32)}
     */
    static OT_ENUM => 101

    /**
     * The object is a virtual disk.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * Native name: VDS_OT_VDISK
     * @type {Integer (Int32)}
     */
    static OT_VDISK => 200

    /**
     * This value is reserved.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * Native name: VDS_OT_OPEN_VDISK
     * @type {Integer (Int32)}
     */
    static OT_OPEN_VDISK => 201
}
