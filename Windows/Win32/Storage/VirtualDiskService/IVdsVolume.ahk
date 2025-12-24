#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_VOLUME_PROP.ahk
#Include .\IVdsPack.ahk
#Include .\IEnumVdsObject.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to manage volumes.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvolume
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVolume extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsVolume
     * @type {Guid}
     */
    static IID => Guid("{88306bb2-e71f-478c-86a2-79da200a0f11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetPack", "QueryPlexes", "Extend", "Shrink", "AddPlex", "BreakPlex", "RemovePlex", "Delete", "SetFlags", "ClearFlags"]

    /**
     * Returns property details of the current volume.
     * @returns {VDS_VOLUME_PROP} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop">VDS_VOLUME_PROP</a> structure 
     *       allocated and passed in by the caller. VDS allocates memory for the <b>pwszName</b> member 
     *       string. Callers must free the string by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolume-getproperties
     */
    GetProperties() {
        pVolumeProperties := VDS_VOLUME_PROP()
        result := ComCall(3, this, "ptr", pVolumeProperties, "HRESULT")
        return pVolumeProperties
    }

    /**
     * Retrieves the pack to which the volume is a member.
     * @returns {IVdsPack} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdspack">IVdsPack</a> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolume-getpack
     */
    GetPack() {
        result := ComCall(4, this, "ptr*", &ppPack := 0, "HRESULT")
        return IVdsPack(ppPack)
    }

    /**
     * Returns an object that enumerates the plexes of the volume.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the plexes  as <a href="https://docs.microsoft.com/windows/desktop/VDS/volume-plex-object">volume plex objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the volume  plex objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolume-queryplexes
     */
    QueryPlexes() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Expands the size of the current volume by adding disk extents to each member of each plex.
     * @param {Pointer<VDS_INPUT_DISK>} pInputDiskArray Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_input_disk">VDS_INPUT_DISK</a> structures; 
     *       one structure for each disk.
     *       
     * 
     * <div class="alert"><b>Note</b>  Callers should not use a default member index in conjunction with the 
     *        <b>Extend</b> method, unless the volume has only one 
     *        plex with only one member.</div>
     * <div> </div>
     * @param {Integer} lNumberOfDisks The total number of disks in the volume. Callers can pass zero when the volume plexes contain enough space to 
     *       extend the volume; <i>pInputDiskArray</i> must be <b>NULL</b>.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, which VDS 
     *       initializes on return. Callers must release the interface. Use this pointer to cancel, wait for, or query the 
     *       status of the operation. If you call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> method on this interface and a success HRESULT value is returned, you must 
     *       release the interfaces returned in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer.
     *      However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolume-extend
     */
    Extend(pInputDiskArray, lNumberOfDisks) {
        result := ComCall(6, this, "ptr", pInputDiskArray, "int", lNumberOfDisks, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Reduces the size of the volume and all plexes, and returns the released extents to free space.
     * @param {Integer} ullNumberOfBytesToRemove The size of the reduction in bytes.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer. VDS 
     *       initializes the interface on return. Callers must release the interface. Use this interface to cancel, wait for, 
     *       or query the status of the operation. If 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> is called and a success HRESULT value is returned, the interfaces returned in 
     *       the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure must be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolume-shrink
     */
    Shrink(ullNumberOfBytesToRemove) {
        result := ComCall(7, this, "uint", ullNumberOfBytesToRemove, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Adds a volume as a plex to the current volume.
     * @param {Guid} VolumeId The GUID of the volume to be added as a plex.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, which VDS 
     *       initializes on return. Callers must release the interface. Use this pointer to cancel, wait for, or query the 
     *       status of the operation.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolume-addplex
     */
    AddPlex(VolumeId) {
        result := ComCall(8, this, "ptr", VolumeId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Removes a specified plex from the current volume.
     * @param {Guid} plexId The GUID of the plex to be broken.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, 
     *       which VDS initializes on return. Callers must release the interface. Use this pointer to cancel, wait for, or 
     *       query the status of the operation.
     * 
     * If you call <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> on this method and a success HRESULT value is returned, 
     *       you must release the interfaces returned in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolume-breakplex
     */
    BreakPlex(plexId) {
        result := ComCall(9, this, "ptr", plexId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Removes one or more specified plexes from the current volume, releasing the extents.
     * @param {Guid} plexId The GUID of the plex to be removed.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, which VDS 
     *       initializes on return. Callers must release the interface. Use this pointer to cancel, wait for, or query the 
     *       status of the operation.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolume-removeplex
     */
    RemovePlex(plexId) {
        result := ComCall(10, this, "ptr", plexId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * Deletes the volume and all plexes, releasing the extents.
     * @param {BOOL} bForce If <b>TRUE</b>, VDS deletes the volume even if it is  in use; otherwise, the volume is not deleted if it is in use.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The plexes were deleted successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolume-delete
     */
    Delete(bForce) {
        result := ComCall(11, this, "int", bForce, "HRESULT")
        return result
    }

    /**
     * Sets the volume flags.
     * @param {Integer} ulFlags The flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_flag">VDS_VOLUME_FLAG</a>. Callers 
     *       can set the following flags: 
     * 
     * * `VDS_VF_LBN_REMAP_ENABLED`
     * * `VDS_VF_HIDDEN`
     * * `VDS_VF_READONLY`
     * * `VDS_VF_NO_DEFAULT_DRIVE_LETTER`
     * * `VDS_VF_INSTALLABLE`
     * * `VDS_VF_SHADOW_COPY`
     * @param {BOOL} bRevertOnClose If <b>TRUE</b>, the flags are temporarily set. VDS resets each 
     *       flag to the previous state when the caller releases the last reference to the volume object, calls 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolume-clearflags">IVdsVolume::ClearFlags</a>, or dismounts the volume, 
     *       except when the flag is set on the entire disk (see the table in the Remarks section for details). When the flag 
     *       is set on the entire disk, the 
     *       <b>IVdsVolume::ClearFlags</b> method must be called to 
     *       reset the flags.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flags are set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_LBN_REMAP_ENABLED_FLAG</b></dt>
     * <dt>0x80042456L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider does not support the <b>VDS_VF_LBN REMAP_ENABLED</b> volume 
     *         flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_NO_DRIVELETTER_FLAG</b></dt>
     * <dt>0x80042457L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider does not support the <b>VDS_VF_NO DRIVELETTER</b> volume flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_REVERT_ON_CLOSE</b></dt>
     * <dt>0x80042458L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>bRevertOnClose</i> should only be set to true if either the 
     *         <b>VDS_VF_HIDDEN</b> or <b>VDS_VF_READONLY</b> volume flag is 
     *         set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_REVERT_ON_CLOSE_SET</b></dt>
     * <dt>0x80042459L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some volume flags are set to true already. You must clear these flags first, then call this method and 
     *         set the <i>bRevertOnClose</i> parameter to true again. The 
     *         <b>VDS_E_INVALID_OPERATION</b> return value can also indicate this condition.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolume-setflags
     */
    SetFlags(ulFlags, bRevertOnClose) {
        result := ComCall(12, this, "uint", ulFlags, "int", bRevertOnClose, "HRESULT")
        return result
    }

    /**
     * Clears the volume flags.
     * @param {Integer} ulFlags The flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_volume_flag">VDS_VOLUME_FLAG</a>. Callers can clear the following flags: 
     * 
     * <b>VDS_VF_LBN_REMAP_ENABLED</b>
     * <b>VDS_VF_HIDDEN</b>
     * <b>VDS_VF_READONLY</b>
     * <b>VDS_VF_NO_DEFAULT_DRIVE_LETTER</b>
     * <b>VDS_VF_INSTALLABLE</b>
     * <b>VDS_VF_SHADOW_COPY</b>
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flags were cleared successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_REVERT_ON_CLOSE_MISMATCH</b></dt>
     * <dt>0x80042462L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flags to be cleared do not match the flags set previously with the <a href="/windows/desktop/api/vds/nf-vds-ivdsvolume-setflags">SetFlags</a> method  and <i>bRevertOnClose</i> is set to <b>TRUE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolume-clearflags
     */
    ClearFlags(ulFlags) {
        result := ComCall(13, this, "uint", ulFlags, "HRESULT")
        return result
    }
}
