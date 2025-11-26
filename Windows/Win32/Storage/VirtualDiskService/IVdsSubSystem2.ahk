#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_SUB_SYSTEM_PROP2.ahk
#Include .\IVdsDrive.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing query and configuration operations on a subsystem using the VDS_HINTS2 and VDS_SUB_SYSTEM_PROP2 structures.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdssubsystem2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsSubSystem2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsSubSystem2
     * @type {Guid}
     */
    static IID => Guid("{be666735-7800-4a77-9d9c-40f85b87e292}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties2", "GetDrive2", "CreateLun2", "QueryMaxLunCreateSize2"]

    /**
     * Returns the properties of a subsystem. This method is identical to the IVdsSubSystem::GetProperties method, except that it returns a VDS_SUB_SYSTEM_PROP2 structure instead of a VDS_SUB_SYSTEM_PROP structure.
     * @returns {VDS_SUB_SYSTEM_PROP2} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop2">VDS_SUB_SYSTEM_PROP2</a> 
     *       structure allocated and passed in by the caller. VDS allocates memory for the 
     *       <b>pwszFriendlyName</b> and <b>pwszIdentification</b> member strings. 
     *       Callers must free the strings by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdssubsystem2-getproperties2
     */
    GetProperties2() {
        pSubSystemProp2 := VDS_SUB_SYSTEM_PROP2()
        result := ComCall(3, this, "ptr", pSubSystemProp2, "HRESULT")
        return pSubSystemProp2
    }

    /**
     * Returns the specified drive. This method is identical to the IVdsSubSystem::GetDrive method, except that it includes the enclosure number as a parameter.
     * @param {Integer} sBusNumber The number of the bus to which the drive is connected.
     * @param {Integer} sSlotNumber The number of the slot the drive occupies.
     * @param {Integer} ulEnclosureNumber The number of the enclosure that contains the drive. This parameter corresponds to the <b>ulEnclosureNumber</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_drive_prop2">VDS_DRIVE_PROP2</a> structure.
     * @returns {IVdsDrive} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsdrive">IVdsDrive</a> interface pointer. Callers 
     *       must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdssubsystem2-getdrive2
     */
    GetDrive2(sBusNumber, sSlotNumber, ulEnclosureNumber) {
        result := ComCall(4, this, "short", sBusNumber, "short", sSlotNumber, "uint", ulEnclosureNumber, "ptr*", &ppDrive := 0, "HRESULT")
        return IVdsDrive(ppDrive)
    }

    /**
     * Creates a LUN. This method is identical to the IVdsSubSystem::CreateLun method, except that automagic hints are provided using a VDS_HINTS2 structure instead of a VDS_HINTS structure.
     * @param {Integer} type A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_type">VDS_LUN_TYPE</a> enumeration value that specifies the LUN type. The new 
     *       LUN can be an automagic type or a specific RAID type, but not both. If the caller specifies an automagic type, one or more automagic hints should be specified in the <i>pHints</i> parameter. 
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
     * @param {Pointer<Guid>} pDriveIdArray A pointer to an array that contains a <a href="https://docs.microsoft.com/windows/desktop/VDS/vds-data-types">VDS_OBJECT_ID</a> for each of the drives to be used to create the LUN. By specifying a non-<b>NULL</b> value for this parameter, the caller is requesting that the provider use all of the drives, in the order provided, using all of the extents on one drive before moving on to the 
     *       next, and stopping when the LUN has reached the requested size. 
     *       
     * 
     * Alternatively, the caller can direct the provider to select the drives automatically by passing 
     *        <b>NULL</b> in this parameter and 0 in <i>lNumberOfDrives</i>. (Pass 
     *        <b>NULL</b> if and only if <i>lNumberOfDrives</i> is 0.)
     * 
     * If the <i>type</i> parameter specifies an automagic type, this parameter should be <b>NULL</b>.
     * @param {Integer} lNumberOfDrives The number of drives specified in <i>pDriveIdArray</i>. If the caller passes 0, the 
     *       provider selects the drives.
     *       
     * 
     * If the <i>type</i> parameter specifies an automagic type, this parameter should be 0.
     * 
     * After the LUN is created, the caller can determine which drives are in use by calling the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslunplex-queryextents">IVdsLunPlex::QueryExtents</a> method.
     * @param {PWSTR} pwszUnmaskingList A list specifying the computers to be granted access the LUN. The list is a 
     *       semicolon-delimited, <b>NULL</b>-terminated, human-readable string. 
     * 
     * If the value is "*", all computers that have an HBA port attached to the storage subsystem are to be granted access to the LUN. If the value is "", no computers are to be granted access to the LUN.<div class="alert"><b>Note</b>  In practice, if the value is "*", most hardware providers only grant the ports and initiators on the local computer access to the LUN.</div>
     * <div> </div>
     * 
     * 
     * If "*" or "" is specified, no other value can be specified.
     * 
     * For Fibre Channel networks and serial attached SCSI (SAS) networks, each entry is a 64-bit World-Wide Name (WWN) of each port to which the LUN is unmasked, 
     *        formatted as a hexadecimal string (16 characters long), most significant byte first. For 
     *        example, a WWN address of 01:23:45:67:89:AB:CD:EF is represented as "0123456789ABCDEF". For more information, see the T10 specifications for <a href="https://t10.org/drafts.htm#FibreChannel">Fibre Channel</a> and <a href="https://t10.org/drafts.htm#SCSI3_SAS">SAS</a>.
     * 
     * For iSCSI networks, each entry is an iSCSI qualified name (IQN) of each initiator to which the LUN is unmasked. A LUN unmasked 
     *        to a particular initiator is considered to be associated with that initiator.
     * 
     * <div class="alert"><b>Note</b>  The unmasking list can contain the same WWN or IQN more than once. The caller is not expected to remove 
     *        duplicates from the list or to validate the format of the WWN or IQN.</div>
     * <div> </div>
     * After the LUN is created, the caller can determine the actual unmasking list by calling the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun-getproperties">IVdsLun::GetProperties</a> method.
     * @param {Pointer<VDS_HINTS2>} pHints2 Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints2">VDS_HINTS2</a> structure that specifies the hints to be used in creating the LUN. The provider is not required to apply the hints to the LUN. The hints specified in the <b>VDS_HINTS2</b> structure are only a request to the provider.
     * 
     * After the LUN is created, the caller can determine the hints that the provider applied by calling the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun2-queryhints2">IVdsLun2::QueryHints2</a>  method.
     * 
     * If the <i>type</i> parameter specifies a non-automagic type, this parameter should be <b>NULL</b>.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, 
     *       which VDS initializes on return. Callers must release the interface. Use this interface to cancel, wait for, or 
     *       query the status of the operation.
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> is called on the returned interface pointer and a success HRESULT value is returned, 
     *       the interfaces returned in the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> 
     *       structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdssubsystem2-createlun2
     */
    CreateLun2(type, ullSizeInBytes, pDriveIdArray, lNumberOfDrives, pwszUnmaskingList, pHints2) {
        pwszUnmaskingList := pwszUnmaskingList is String ? StrPtr(pwszUnmaskingList) : pwszUnmaskingList

        result := ComCall(5, this, "int", type, "uint", ullSizeInBytes, "ptr", pDriveIdArray, "int", lNumberOfDrives, "ptr", pwszUnmaskingList, "ptr", pHints2, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Returns the size of the maximum LUN that can be created using the specified LUN type and hints.
     * @param {Integer} type A <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_type">VDS_LUN_TYPE</a> enumeration value that specifies the LUN type.
     * @param {Pointer<Guid>} pDriveIdArray A pointer to an array containing a <b>VDS_OBJECT_ID</b> for each of the drives to be 
     *       used in the LUN creation. The provider should attempt to use the drives in the order provided. This parameter 
     *       can be <b>NULL</b> if the <i>lNumberOfDrives</i> parameter is zero, in which 
     *       case the provider should automatically select drives.
     * @param {Integer} lNumberOfDrives The number of entries in the <i>pDriveIdArray</i> array. This parameter is optional and can be zero.
     * @param {Pointer<VDS_HINTS2>} pHints2 A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_hints2">VDS_HINTS2</a> structure used for creating the LUN. The 
     *       hints always take lower priority than parameters listed before. This parameter is required and cannot be <b>NULL</b>.
     * @returns {Integer} A pointer to a buffer containing the maximum size of the LUN in bytes. This parameter is required and cannot be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdssubsystem2-querymaxluncreatesize2
     */
    QueryMaxLunCreateSize2(type, pDriveIdArray, lNumberOfDrives, pHints2) {
        result := ComCall(6, this, "int", type, "ptr", pDriveIdArray, "int", lNumberOfDrives, "ptr", pHints2, "uint*", &pullMaxLunSize := 0, "HRESULT")
        return pullMaxLunSize
    }
}
