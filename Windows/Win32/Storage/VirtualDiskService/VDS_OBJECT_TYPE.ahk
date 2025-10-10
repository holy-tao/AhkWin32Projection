#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of valid types of a VDS object.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsproviderprivate-getobject">IVdsProviderPrivate::GetObject</a> 
  *     and <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsservice-getobject">IVdsService::GetObject</a> methods pass a <b>VDS_OBJECT_TYPE</b> 
  *     value as an argument to indicate an object type.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_OBJECT_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_OBJECT_TYPE</b> enumeration constant.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_object_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_OBJECT_TYPE{

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_OT_UNKNOWN => 0

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/provider-object">provider</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_PROVIDER => 1

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/pack-object">disk pack</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_PACK => 10

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/volume-object">volume</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_VOLUME => 11

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/volume-plex-object">volume plex</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_VOLUME_PLEX => 12

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/disk-object">disk</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_DISK => 13

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/subsystem-object">subsystem</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_SUB_SYSTEM => 30

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/controller-object">controller</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_CONTROLLER => 31

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/drive-object">drive</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_DRIVE => 32

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/lun-object">LUN</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_LUN => 33

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/lun-plex-object">LUN plex</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_LUN_PLEX => 34

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/controller-port-object">controller port</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_PORT => 35

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/VDS/portal-object">iSCSI portal</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_PORTAL => 36

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/VDS/target-object">iSCSI target</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_TARGET => 37

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/VDS/portal-group-object">iSCSI portal group</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_PORTAL_GROUP => 38

    /**
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/VDS/storage-pool-object">storage pool</a>.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDS_OT_STORAGE_POOL => 39

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/VDS/startup-and-service-objects">HBA port</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_HBAPORT => 90

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/VDS/startup-and-service-objects">iSCSI initiator adapter</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_INIT_ADAPTER => 91

    /**
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/VDS/startup-and-service-objects">iSCSI initiator portal</a>.
     * @type {Integer (Int32)}
     */
    static VDS_OT_INIT_PORTAL => 92

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_OT_ASYNC => 100

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_OT_ENUM => 101

    /**
     * The object is a virtual disk.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDS_OT_VDISK => 200

    /**
     * This value is reserved.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDS_OT_OPEN_VDISK => 201
}
