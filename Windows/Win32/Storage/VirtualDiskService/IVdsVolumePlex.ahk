#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_VOLUME_PLEX_PROP.ahk
#Include .\IVdsVolume.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for maintaining volume plexes.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvolumeplex
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVolumePlex extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsVolumePlex
     * @type {Guid}
     */
    static IID => Guid("{4daa0135-e1d1-40f1-aaa5-3cc1e53221c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetVolume", "QueryExtents", "Repair"]

    /**
     * Returns the property details of the current volume plex.
     * @returns {VDS_VOLUME_PLEX_PROP} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_plex_prop">VDS_VOLUME_PLEX_PROP</a>structure allocated and passed in by the caller.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumeplex-getproperties
     */
    GetProperties() {
        pPlexProperties := VDS_VOLUME_PLEX_PROP()
        result := ComCall(3, this, "ptr", pPlexProperties, "HRESULT")
        return pPlexProperties
    }

    /**
     * Returns the volume to which the current plex is a member.
     * @returns {IVdsVolume} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsvolume">IVdsVolume</a>interface pointer. The caller must release the pointer.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumeplex-getvolume
     */
    GetVolume() {
        result := ComCall(4, this, "ptr*", &ppVolume := 0, "HRESULT")
        return IVdsVolume(ppVolume)
    }

    /**
     * Returns all extents for the current plex.
     * @param {Pointer<Pointer<VDS_DISK_EXTENT>>} ppExtentArray A pointer to the array of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_extent">VDS_DISK_EXTENT</a> structures passed in by the caller. Callers must free this array by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Integer>} plNumberOfExtents A pointer to a buffer containing the number of extents.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumeplex-queryextents
     */
    QueryExtents(ppExtentArray, plNumberOfExtents) {
        ppExtentArrayMarshal := ppExtentArray is VarRef ? "ptr*" : "ptr"
        plNumberOfExtentsMarshal := plNumberOfExtents is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, ppExtentArrayMarshal, ppExtentArray, plNumberOfExtentsMarshal, plNumberOfExtents, "HRESULT")
        return result
    }

    /**
     * Repairs a fault-tolerant volume plex by moving bad members to good disks.
     * @param {Pointer<VDS_INPUT_DISK>} pInputDiskArray Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_input_disk">VDS_INPUT_DISK</a> structures, 
     *       one structure for each disk.
     *       
     * 
     * <div class="alert"><b>Note</b>  Include only the required members of this structure (<b>diskId</b> and 
     *        <b>ullSize</b>).</div>
     * <div> </div>
     * <b>Windows Server 2003:  </b>only volumes that are striped with parity (RAID-5) can be repaired with this method, and only one new disk can 
     *         be passed to this method at a time.
     * @param {Integer} lNumberOfDisks The total number of disks in the volume.
     * @returns {IVdsAsync} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdsasync">IVdsAsync</a> interface pointer, which VDS 
     *       initializes on return. Callers must release the interface. Use this pointer to cancel, wait for, or query the 
     *       status of the operation.
     * 
     * If you call <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsasync-wait">IVdsAsync::Wait</a> on this method and a success HRESULT value is returned, you 
     *       must release the interfaces returned in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_async_output">VDS_ASYNC_OUTPUT</a> structure by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on each interface pointer. However, if <b>Wait</b> returns a failure HRESULT value, or if the <i>pHrResult</i> parameter of <b>Wait</b> receives a failure HRESULT value, the interface pointers in the <b>VDS_ASYNC_OUTPUT</b> structure are <b>NULL</b> and do not need to be released. You can test for success or failure HRESULT values by using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-succeeded">SUCCEEDED</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-failed">FAILED</a> macros defined in Winerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvolumeplex-repair
     */
    Repair(pInputDiskArray, lNumberOfDisks) {
        result := ComCall(6, this, "ptr", pInputDiskArray, "int", lNumberOfDisks, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }
}
