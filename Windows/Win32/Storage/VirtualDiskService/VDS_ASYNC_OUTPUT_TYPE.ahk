#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of operations that objects can process.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure includes a <b>VDS_ASYNC_OUTPUT_TYPE</b> 
  *     value as a member to indicate an operation type.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_ASYNC_OUTPUT_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_ASYNC_OUTPUT_TYPE</b> enumeration constant.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_async_output_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_ASYNC_OUTPUT_TYPE{

    /**
     * The value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_UNKNOWN => 0

    /**
     * The operation returns the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer for the newly 
 *       created <a href="https://docs.microsoft.com/windows/desktop/VDS/volume-object">volume object</a>. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdspack-createvolume">IVdsPack::CreateVolume</a> method.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_CREATEVOLUME => 1

    /**
     * The operation expands the size of the current volume by adding disk extents to each member of each plex. 
 *       For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-extend">IVdsVolume::Extend</a> method.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_EXTENDVOLUME => 2

    /**
     * The operation reduces the size of the volume and all plexes and returns the released extents to free 
 *       space. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-shrink">IVdsVolume::Shrink</a> method.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_SHRINKVOLUME => 3

    /**
     * The operation adds a volume as a plex to the current volume. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-addplex">IVdsVolume::AddPlex</a> method.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_ADDVOLUMEPLEX => 4

    /**
     * The operation returns the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer for the 
 *       hidden <a href="https://docs.microsoft.com/windows/desktop/VDS/volume-object">volume object</a>. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-breakplex">IVdsVolume::BreakPlex</a> method.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_BREAKVOLUMEPLEX => 5

    /**
     * The operation removes one or more specified plexes from the current volume, releasing the extents. For 
 *       operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-removeplex">IVdsVolume::RemovePlex</a> method.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_REMOVEVOLUMEPLEX => 6

    /**
     * The operation repairs a fault-tolerant volume plex by moving bad members to good disks. For operation 
 *       details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumeplex-repair">IVdsVolumePlex::Repair</a> method.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_REPAIRVOLUMEPLEX => 7

    /**
     * The operation returns a failing or failed pack to a healthy state, if possible. For operation details, see 
 *       the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdspack-recover">IVdsPack::Recover</a> method.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_RECOVERPACK => 8

    /**
     * This value is reserved for future use.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_REPLACEDISK => 9

    /**
     * The operation creates a new partition on a basic disk. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-createpartition">IVdsAdvancedDisk::CreatePartition</a> 
 *       method.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_CREATEPARTITION => 10

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-clean">IVdsAdvancedDisk::Clean</a>
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_CLEAN => 11

    /**
     * The operation returns the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer for the newly 
 *       created <a href="https://docs.microsoft.com/windows/desktop/VDS/lun-object">LUN object</a>. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem-createlun">IVdsSubSystem::CreateLun</a> method.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_CREATELUN => 50

    /**
     * The operation adds a LUN to the target LUN as a new plex. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-addplex">IVdsLun::AddPlex</a> method.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_ADDLUNPLEX => 52

    /**
     * The operation returns the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer for the 
 *       removed <a href="https://docs.microsoft.com/windows/desktop/VDS/lun-object">LUN object</a>. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-removeplex">IVdsLun::RemovePlex</a> method.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_REMOVELUNPLEX => 53

    /**
     * The operation extends a LUN by a specified number of bytes. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-extend">IVdsLun::Extend</a> method.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_EXTENDLUN => 54

    /**
     * The operation shrinks a LUN by a specified number of bytes. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-shrink">IVdsLun::Shrink</a> method.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_SHRINKLUN => 55

    /**
     * The operation starts a recovery operation on a LUN. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-recover">IVdsLun::Recover</a> method.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_RECOVERLUN => 56

    /**
     * The operation logs in to a target. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsiscsiinitiatoradapter-logintotarget">IVdsIscsiInitiatorAdapter::LoginToTarget</a> 
 *       method.
 * 
 * <b>Windows Server 2003:  </b>This flag is not supported before Windows Server 2003 R2.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_LOGINTOTARGET => 60

    /**
     * The operation logs out from a target. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsiscsiinitiatoradapter-logoutfromtarget">IVdsIscsiInitiatorAdapter::LogoutFromTarget</a> 
 *       method.
 * 
 * <b>Windows Server 2003:  </b>This flag is not supported before Windows Server 2003 R2.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_LOGOUTFROMTARGET => 61

    /**
     * The operation returns the  <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer 
 *       for the newly created target object. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystemiscsi-createtarget">IVdsSubSystemIscsi::CreateTarget</a> method.
 * 
 * <b>Windows Server 2003:  </b>This flag is not supported before Windows Server 2003 R2.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_CREATETARGET => 62

    /**
     * The operation returns the  <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer 
 *       for the newly created portal group object. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsiscsitarget-createportalgroup">IVdsIscsiTarget::CreatePortalGroup</a> method.
 * 
 * <b>Windows Server 2003:  </b>This flag is not supported before Windows Server 2003 R2.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_CREATEPORTALGROUP => 63

    /**
     * The operation deletes a target. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsiscsitarget-delete">IVdsIscsiTarget::Delete</a> method.
 * 
 * <b>Windows Server 2003:  </b>This flag is not supported before Windows Server 2003 R2.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_DELETETARGET => 64

    /**
     * The operation adds a portal to a portal group. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-addportal">IVdsIscsiPortalGroup::AddPortal</a> method.
 * 
 * <b>Windows Server 2003:  </b>This flag is not supported before Windows Server 2003 R2.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_ADDPORTAL => 65

    /**
     * The operation removes a portal from a portal group. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-removeportal">IVdsIscsiPortalGroup::RemovePortal</a> method.
 * 
 * <b>Windows Server 2003:  </b>This flag is not supported before Windows Server 2003 R2.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_REMOVEPORTAL => 66

    /**
     * The operation deletes a portal group. For operation details, see the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsiscsiportalgroup-delete">IVdsIscsiPortalGroup::Delete</a> method.
 * 
 * <b>Windows Server 2003:  </b>This flag is not supported before Windows Server 2003 R2.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_DELETEPORTALGROUP => 67

    /**
     * The operation formats a volume. For operation details, see the
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumemf-format">IVdsVolumeMF::Format</a> method.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_FORMAT => 101

    /**
     * The operation creates a virtual disk. For operation details, see the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvdprovider-createvdisk">IVdsVdProvider::CreateVDisk</a> method.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_CREATE_VDISK => 200

    /**
     * The operation attaches a virtual disk. For operation details, see the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsopenvdisk-attach">IVdsOpenVDisk::Attach</a> method.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_ATTACH_VDISK => 201

    /**
     * The operation compacts a virtual disk to reduce the physical size of the backing file. For operation details, see the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsopenvdisk-compact">IVdsOpenVDisk::Compact</a> method.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_COMPACT_VDISK => 202

    /**
     * The operation merges a child virtual disk with its parents in the differencing chain. For operation details, see the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsopenvdisk-merge">IVdsOpenVDisk::Merge</a> method.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_MERGE_VDISK => 203

    /**
     * The operation increases the size of a virtual disk to the maximum available on a fixed-size or expandable disk. For operation details, see the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsopenvdisk-expand">IVdsOpenVDisk::Expand</a> method.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>Not supported.
     * @type {Integer (Int32)}
     */
    static VDS_ASYNCOUT_EXPAND_VDISK => 204
}
