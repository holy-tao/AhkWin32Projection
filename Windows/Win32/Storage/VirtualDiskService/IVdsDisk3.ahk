#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VDS_DISK_PROP2.ahk" { VDS_DISK_PROP2 }
#Import ".\VDS_DISK_FREE_EXTENT.ahk" { VDS_DISK_FREE_EXTENT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a method to retrieve property information for a disk, including the disk's location path.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsdisk3
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsDisk3 extends IUnknown {
    /**
     * The interface identifier for IVdsDisk3
     * @type {Guid}
     */
    static IID := Guid("{8f4b2f5d-ec15-4357-992f-473ef10975b9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsDisk3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperties2   : IntPtr
        QueryFreeExtents : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsDisk3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns property information for a disk. This method is identical to the IVdsDisk::GetProperties method, except that it returns a VDS_DISK_PROP2 structure instead of a VDS_DISK_PROP structure.
     * @remarks
     * In the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop2">VDS_DISK_PROP2</a> structure that is returned in the <i>pDiskProperties</i> parameter, the <b>pwszDiskAddress</b> member   is optional and can be <b>NULL</b> if no value is available. Callers of this method must check whether this member is <b>NULL</b>.
     * 
     * For Hyper-V, the  <b>pwszLocationPath</b> member is <b>NULL</b>, because the virtual controller does not return the location path.
     * @returns {VDS_DISK_PROP2} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop2">VDS_DISK_PROP2</a> structure 
     *       allocated and passed in by the caller. VDS allocates memory for the <b>pwszDiskAddress</b>, 
     *       <b>pwszName</b>, <b>pwszFriendlyName</b>, 
     *       <b>pwszAdaptorName</b>, <b>pwszDevicePath</b>, and <b>pwszLocationPath</b> member strings. 
     *       Callers must free the strings by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdisk3-getproperties2
     */
    GetProperties2() {
        pDiskProperties := VDS_DISK_PROP2()
        result := ComCall(3, this, VDS_DISK_PROP2.Ptr, pDiskProperties, "HRESULT")
        return pDiskProperties
    }

    /**
     * Returns the free extents on the disk and aligns them to the specified alignment size.
     * @param {Integer} ulAlign The alignment size, in bytes. This value must be a multiple of the disk sector size. If this parameter is zero, the default alignment value for the volume is used. The default alignment depends on the size of the disk where the volume is located. All partitions and volumes are aligned using the values under the following registry key:
     * 
     * <b>HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vds\Alignment</b>
     * 
     * If this registry key is not set, the default alignment is 1 MB if the disk is 4 GB or larger, or 64 KB if the disk is smaller than 4 GB.
     * @param {Pointer<Pointer<VDS_DISK_FREE_EXTENT>>} ppFreeExtentArray The address of a pointer variable that receives an  
     *       array of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_free_extent">VDS_DISK_FREE_EXTENT</a> structures, one for each free extent. 
     *       Callers must free this array by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function. If there are no free extents, the pointer is set to <b>NULL</b> on output and does not need to be freed.
     * @param {Pointer<Integer>} plNumberOfFreeExtents A pointer to a variable  that receives the total number of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_free_extent">VDS_DISK_FREE_EXTENT</a> structures. If there are no free extents, the pointer is set to <b>NULL</b> on output and does not need to be freed.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
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
     * The free extent information was returned successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no free extents on the disk.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ALIGN_NOT_SECTOR_SIZE_MULTIPLE</b></dt>
     * <dt>0x80042554L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The alignment value that is specified in the <i>ulAlign</i> parameter is not a multiple of the disk sector size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdisk3-queryfreeextents
     */
    QueryFreeExtents(ulAlign, ppFreeExtentArray, plNumberOfFreeExtents) {
        ppFreeExtentArrayMarshal := ppFreeExtentArray is VarRef ? "ptr*" : "ptr"
        plNumberOfFreeExtentsMarshal := plNumberOfFreeExtents is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "uint", ulAlign, ppFreeExtentArrayMarshal, ppFreeExtentArray, plNumberOfFreeExtentsMarshal, plNumberOfFreeExtents, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsDisk3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperties2 := CallbackCreate(GetMethod(implObj, "GetProperties2"), flags, 2)
        this.vtbl.QueryFreeExtents := CallbackCreate(GetMethod(implObj, "QueryFreeExtents"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperties2)
        CallbackFree(this.vtbl.QueryFreeExtents)
    }
}
