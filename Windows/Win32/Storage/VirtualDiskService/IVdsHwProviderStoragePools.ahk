#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumVdsObject.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVdsHwProviderStoragePools interface (vdshwprv.h) provides methods to create LUNs in a storage pool and enumerate the storage pools managed by a hardware provider.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdshwproviderstoragepools
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsHwProviderStoragePools extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsHwProviderStoragePools
     * @type {Guid}
     */
    static IID => Guid("{d5b5937a-f188-4c79-b86c-11c920ad11b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryStoragePools", "CreateLunInStoragePool", "QueryMaxLunCreateSizeInStoragePool"]

    /**
     * The IVdsHwProviderStoragePools::QueryStoragePools (vdshwprv.h) method returns an IEnumVdsObject enumeration object containing a list of the storage pools managed by the hardware provider.
     * @remarks
     * If the hardware provider does not manage any storage pools, this method returns an empty enumeration object.
     * 
     * If a non-<b>NULL</b> value is specified in the <i>pPoolAttributes</i> parameter, this method returns only storage pools that satisfy all of the attributes that are specified in the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_pool_attributes">VDS_POOL_ATTRIBUTES</a> structure. If any  minimum and maximum attributes are specified, the storage pools that are returned must match these attributes exactly. The hint attributes are used as hints to further filter the storage pools that satisfy all the specified attributes. If a specified attribute does not apply to any of the storage pools, this method returns S_OK with an empty enumeration object.
     * @param {Integer} ulFlags A bitmask of one or more <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_storage_pool_type">VDS_STORAGE_POOL_TYPE</a> flags that specify the types of storage pools to be queried. One of the flags must be either VDS_SPT_CONCRETE or VDS_SPT_PRIMORDIAL. The default value of this parameter is zero. A value of zero means that all storage pools should be queried.
     * @param {Integer} ullRemainingFreeSpace The minimum amount of free space, in bytes, that each storage pool must contain. The default value for this parameter is zero. A value of zero means that the storage pools can contain any amount of free space.
     * @param {Pointer<VDS_POOL_ATTRIBUTES>} pPoolAttributes A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_pool_attributes">VDS_POOL_ATTRIBUTES</a> structure that specifies the attribute values that the returned storage pools must have. The default value for this parameter is <b>NULL</b>. A value of <b>NULL</b> means that the storage pools can have any attribute values.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface 
     *       pointer that can be used to enumerate the storage pools. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the storage pool  objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     *      This parameter is required and cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdshwproviderstoragepools-querystoragepools
     */
    QueryStoragePools(ulFlags, ullRemainingFreeSpace, pPoolAttributes) {
        result := ComCall(3, this, "uint", ulFlags, "uint", ullRemainingFreeSpace, "ptr", pPoolAttributes, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * The IVdsHwProviderStoragePools::CreateLunInStoragePool (vdshwprv.h) method creates a LUN in a storage pool.
     * @remarks
     * By choosing appropriate values for the <i>type</i> and <i>pHints2</i> parameters, the caller can specify the attributes of the LUN wholly, partially, or minimally. The provider can 
     *     automatically include unspecified attributes, based on the automagic hints specified in the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints2">VDS_HINTS2</a> structure that the <i>pHints2</i> parameter points to.
     * 
     * <b>Notes to implementers:  </b>The provider must return an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer in the <i>ppAsync</i> parameter, even if the call to this method does not initiate an asynchronous operation.
     * 
     * The list of WWNs and IQNs in the <i>pwszUnmaskingList</i> parameter may contain duplicate names. It is the provider's responsibility to validate all names in the list and remove duplicates if necessary.
     * 
     * In response to the <b>CreateLunInStoragePool</b> method and 
     *     before unmasking the new LUN to any host, the provider should fill the first and last megabytes with zeros, 
     *     leaving the LUN uninitialized.
     * 
     * There is a subtle difference between the <b>E_INVALIDARG</b> and 
     *     <b>VDS_E_NOT_SUPPORTED</b> return values. Providers are not expected to implement every feature that the VDS 
     *     API can present to a client. For example, the 
     *     <b>CreateLunInStoragePool</b> method exposes the ability to 
     *     create many different types of LUNs (for example, simple, mirror, striped, and parity). However, providers are not required to support all 
     *     types of LUNs. If the caller specifies a value for the <i>type</i> parameter that is not a valid <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_type">VDS_LUN_TYPE</a> enumeration value, the provider should return <b>E_INVALIDARG</b>. If the caller specifies a valid <i>type</i> value that the provider does not support, the provider should return VDS_E_NOT_SUPPORTED.
     * @param {Integer} type A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_type">VDS_LUN_TYPE</a> enumeration value that specifies the type of LUN to be created. The new 
     *       LUN can be an automagic type or a specific RAID type, but not both. If the caller specifies an automagic type, one or more automagic hints should be specified in the <i>pHints2</i> parameter. 
     * 
     * The interface pointer for the new 
     *       <a href="https://docs.microsoft.com/windows/desktop/VDS/lun-object">LUN object</a> can be retrieved by calling the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> method on the interface pointer returned in the 
     *       <i>ppAsync</i> parameter. The 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure returned by <b>Wait</b>  contains the 
     *       LUN object interface pointer in the <b>cl.pLunUnk</b> member.
     * @param {Integer} ullSizeInBytes The size, in bytes, of the new LUN. The provider can round the size up or down to meet alignment 
     *       requirements or other restrictions. (In most cases, the provider rounds up, ensuring that, with rare 
     *       exceptions, the LUN is at least as large as requested.) 
     *       
     * 
     * After the LUN is created, the caller can determine the actual size of the LUN by calling the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-getproperties">IVdsLun::GetProperties</a> method.
     * @param {Guid} StoragePoolId A <a href="https://docs.microsoft.com/windows/desktop/VDS/vds-data-types">VDS_OBJECT_ID</a> value that identifies the storage pool where the LUN is to be created. This parameter is required and cannot be GUID_NULL.
     * @param {PWSTR} pwszUnmaskingList A list specifying the computers to be granted access the LUN. The list is a 
     *       semicolon-delimited, <b>NULL</b>-terminated, human-readable string.
     * 
     *  If the value is "*", all computers that have an HBA port attached to the storage subsystem are to be granted access to the LUN. If the value is "", no computers are to be granted access to the LUN.<div class="alert"><b>Note</b>  In practice, if the value is "*", most hardware providers only grant the ports and initiators on the local computer access to the LUN.</div>
     * <div> </div>
     * 
     * 
     * If "*" or "" is specified, no other value can be specified.
     * 
     * For Fibre Channel networks and serial attached SCSI (SAS) networks, each entry is a 64-bit World-Wide Name (WWN) of each port to which the LUN is unmasked, 
     *        formatted as a hexadecimal string (16 characters long), most significant byte first. For 
     *        example, a WWN address of 01:23:45:67:89:AB:CD:EF is represented as "0123456789ABCDEF". For more information, see the T10 specifications for <a href="https://t10.org/drafts.htm#FibreChannel">Fibre Channel</a> and <a href="https://t10.org/drafts.htm#SCSI3_SAS">SAS</a>.
     * 
     * For iSCSI networks, each entry is an iSCSI-qualified name (IQN) of each initiator to which the LUN is unmasked. A LUN unmasked 
     *        to a particular initiator is considered to be associated with that initiator.
     * 
     * <div class="alert"><b>Note</b>  The unmasking list can contain the same WWN or IQN more than once. The caller is not expected to remove 
     *        duplicates from the list or to validate the format of the WWN or IQN.</div>
     * <div> </div>
     * After the LUN is created, the caller can determine the actual unmasking list by calling the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-getproperties">IVdsLun::GetProperties</a> method.
     * @param {Pointer<VDS_HINTS2>} pHints2 A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints2">VDS_HINTS2</a> structure that specifies the hints to be used in creating the LUN. The provider is not required to apply the hints to the LUN. The hints specified in the <b>VDS_HINTS2</b> structure are only a request to the provider.
     * 
     * After the LUN is created, the caller can determine the hints that the provider applied by calling the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun2-queryhints2">IVdsLun2::QueryHints2</a> method.
     * 
     * If the <i>type</i> parameter specifies a non-automagic type, this parameter should be <b>NULL</b>.
     * @returns {IVdsAsync} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface that upon successful completion receives the <b>IVdsAsync</b> interface to monitor and control this operation.  Callers must release the interface received when they are done with it.  If the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> method is called on the interface and a success HRESULT value is returned, the interfaces returned in the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdshwproviderstoragepools-createluninstoragepool
     */
    CreateLunInStoragePool(type, ullSizeInBytes, StoragePoolId, pwszUnmaskingList, pHints2) {
        pwszUnmaskingList := pwszUnmaskingList is String ? StrPtr(pwszUnmaskingList) : pwszUnmaskingList

        result := ComCall(4, this, "int", type, "uint", ullSizeInBytes, "ptr", StoragePoolId, "ptr", pwszUnmaskingList, "ptr", pHints2, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * The IVdsHwProviderStoragePools::QueryMaxLunCreateSizeInStoragePool (vdshwprv.h) method returns the maximum size of the LUN that can be created in the storage pool based on the specified LUN type and hints.
     * @param {Integer} type A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_type">VDS_LUN_TYPE</a> enumeration value that specifies the LUN type. This parameter is required and must be a valid LUN type.
     * @param {Guid} StoragePoolId A VDS_OBJECT_ID (GUID) value that identifies the storage pools to be used to create the new LUN. This parameter is required and cannot be GUID_NULL.
     * @param {Pointer<VDS_HINTS2>} pHints2 A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints2">VDS_HINTS2</a> structure that contains hints to be used in creating the LUN.
     * @returns {Integer} The address of a ULONGLONG value that receives the maximum LUN size, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdshwproviderstoragepools-querymaxluncreatesizeinstoragepool
     */
    QueryMaxLunCreateSizeInStoragePool(type, StoragePoolId, pHints2) {
        result := ComCall(5, this, "int", type, "ptr", StoragePoolId, "ptr", pHints2, "uint*", &pullMaxLunSize := 0, "HRESULT")
        return pullMaxLunSize
    }
}
