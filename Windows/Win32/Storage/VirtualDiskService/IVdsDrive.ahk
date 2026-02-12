#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_DRIVE_PROP.ahk
#Include .\IVdsSubSystem.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVdsDrive interface (vds.h) provides methods for performing query and configuration operations on a drive.
 * @see https://learn.microsoft.com/windows/win32/api//content/vds/nn-vds-ivdsdrive
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsDrive extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsDrive
     * @type {Guid}
     */
    static IID => Guid("{ff24efa4-aade-4b6b-898b-eaa6a20887c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetSubSystem", "QueryExtents", "SetFlags", "ClearFlags", "SetStatus"]

    /**
     * The IVdsDrive::GetProperties method (vds.h) returns the properties of a drive object.
     * @returns {VDS_DRIVE_PROP} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_drive_prop">VDS_DRIVE_PROP</a> structure 
     *       allocated and passed in by the caller. VDS allocates memory for the 
     *       <b>pwszFriendlyName</b> and <b>pwszIdentification</b> member strings. 
     *       Callers must free the strings by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsdrive-getproperties
     */
    GetProperties() {
        pDriveProp := VDS_DRIVE_PROP()
        result := ComCall(3, this, "ptr", pDriveProp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDriveProp
    }

    /**
     * The IVdsDrive::GetSubSystem method (vds.h) returns the subsystem to which the drive belongs.
     * @returns {IVdsSubSystem} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdssubsystem">IVdsSubSystem</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsdrive-getsubsystem
     */
    GetSubSystem() {
        result := ComCall(4, this, "ptr*", &ppSubSystem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVdsSubSystem(ppSubSystem)
    }

    /**
     * The IVdsDrive::QueryExtents method (vds.h) returns an array of the extents on a drive, including both allocated and unallocated extents.
     * @remarks
     * A drive can contribute extents to any number of LUNs, and these LUNs can be unmasked to any number of different
     *     computers on the network. Use the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslunplex-queryextents">IVdsLunPlex::QueryExtents</a> method to see all 
     *     the extents of a LUN plex.
     * 
     * The <b>LunId</b> member of each 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_drive_extent">VDS_DRIVE_EXTENT</a> structure specifies the GUID for the LUN to which each allocated extent contributes. Consequently, you can use 
     *      the result of this method to determine the number of LUNs to which the drive contributes by counting the number 
     *      of distinct <b>LunId</b> values returned in <i>ppExtentArray</i>.
     * @param {Pointer<Pointer<VDS_DRIVE_EXTENT>>} ppExtentArray A pointer to the  array of <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_drive_extent">VDS_DRIVE_EXTENT</a> structures passed in by the caller. Callers must free this array by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Integer>} plNumberOfExtents A pointer to the number of drive extents returned in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_drive_extent">VDS_DRIVE_EXTENT</a> structure.
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
     * The extents information was returned successfully. For a drive without extents, the array is empty, the value 
     *         of <i>plNumberOfExtents</i> is set to 0, and the value of 
     *         <i>ppExtentArray</i> is set to <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This return value signals a software or communication problem inside a provider that caches information about 
     *         the array. Use the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method
     *         followed by the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> 
     *         method to restore the cache.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_DELETED</b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drive object no longer exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_STATUS_FAILED</b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drive is in a failed state, and is unable to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress; this operation cannot proceed until the previous operation or operations 
     *         are complete.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_NOT_SUPPORTED</b></dt>
     * <dt>0x80042400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The subsystem does not support this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsdrive-queryextents
     */
    QueryExtents(ppExtentArray, plNumberOfExtents) {
        ppExtentArrayMarshal := ppExtentArray is VarRef ? "ptr*" : "ptr"
        plNumberOfExtentsMarshal := plNumberOfExtents is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, ppExtentArrayMarshal, ppExtentArray, plNumberOfExtentsMarshal, plNumberOfExtents, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IVdsDrive::SetFlags method (vds.h) sets flags of a drive object.
     * @param {Integer} ulFlags Flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_drive_flag">VDS_DRIVE_FLAG</a>. Callers can set the <b>VDS_DRF_HOTSPARE</b> flag.
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
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This return value signals a software or communication problem inside a provider that caches information about the array. Use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method followed by the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> method to restore the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_DELETED</b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *   
     * The drive object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_STATUS_FAILED</b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drive is in a failed state, and is unable to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress; this operation cannot proceed until the previous operation or operations are complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_NOT_SUPPORTED</b></dt>
     * <dt>0x80042400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation or combination of parameters is not supported by this provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsdrive-setflags
     */
    SetFlags(ulFlags) {
        result := ComCall(6, this, "uint", ulFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IVdsDrive::ClearFlags method (vds.h) clears the flags of a drive object.
     * @remarks
     * Use <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsdrive-setflags">IVdsDrive::SetFlags</a> to set drive flags and <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsdrive-getproperties">IVdsDrive::GetProperties</a> to get currently set flags.
     * @param {Integer} ulFlags The flags enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_drive_flag">VDS_DRIVE_FLAG</a>. Callers can clear the <b>VDS_DRF_HOTSPARE</b> flag.
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
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This return value signals a software or communication problem inside a provider that caches information about the array. Use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method followed by the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> method to restore the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_DELETED</b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The controller object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_STATUS_FAILED</b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drive is in a failed state, and is unable to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress; this operation cannot proceed until the previous operation or operations are complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_NOT_SUPPORTED</b></dt>
     * <dt>0x80042400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation or combination of parameters is not supported by this provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsdrive-clearflags
     */
    ClearFlags(ulFlags) {
        result := ComCall(7, this, "uint", ulFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IVdsDrive::SetStatus method (vds.h) sets the status of the drive to the specified value.
     * @remarks
     * Implementers are responsible for performing any necessary operations to get the status to the specified state. 
     *     For example, if the caller passes in <b>VDS_DRS_OFFLINE</b> as the drive status, you might 
     *     need to first clear the cache.
     * @param {Integer} status_ Values enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_drive_status">VDS_DRIVE_STATUS</a>. Callers can 
     *       pass in a subset of the possible enumeration values. Passing in <b>VDS_DRS_UNKNOWN</b> 
     *       returns <b>E_INVALIDARG</b>.
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
     * <dt><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></dt>
     * <dt>0x8004241FL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This return value signals a software or communication problem inside a provider that caches information about 
     *         the array. Use the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> 
     *         method followed by the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> 
     *         method to restore the cache.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_DELETED</b></dt>
     * <dt>0x8004240BL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drive object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_STATUS_FAILED</b></dt>
     * <dt>0x80042431L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The drive is in a failed state, and is unable to perform the requested operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></dt>
     * <dt>0x80042404L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress; this operation cannot proceed until the previous operation or operations 
     *         are complete.
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_NOT_SUPPORTED</b></dt>
     * <dt>0x80042400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation or combination of parameters is not supported by this provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsdrive-setstatus
     */
    SetStatus(status_) {
        result := ComCall(8, this, "int", status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
