#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_DISK_PROP.ahk
#Include .\IVdsPack.ahk
#Include .\VDS_LUN_INFORMATION.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to query and configure basic and dynamic disks.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsdisk
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsDisk extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsDisk
     * @type {Guid}
     */
    static IID => Guid("{07e5c822-f00c-47a1-8fce-b244da56fd06}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetPack", "GetIdentificationData", "QueryExtents", "ConvertStyle", "SetFlags", "ClearFlags"]

    /**
     * Returns property information for a disk.
     * @returns {VDS_DISK_PROP} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_prop">VDS_DISK_PROP</a> structure 
     *       allocated and passed in by the caller. VDS allocates memory for the <b>pwszDiskAddress</b>, 
     *       <b>pwszName</b>, <b>pwszFriendlyName</b>, 
     *       <b>pwszAdaptorName</b>, and <b>pwszDevicePath</b> member strings. 
     *       Callers must free the strings by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsdisk-getproperties
     */
    GetProperties() {
        pDiskProperties := VDS_DISK_PROP()
        result := ComCall(3, this, "ptr", pDiskProperties, "HRESULT")
        return pDiskProperties
    }

    /**
     * Returns the disk pack to which the current disk is a member.
     * @returns {IVdsPack} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdspack">IVdsPack</a> interface pointer, which VDS initializes on return. Callers must release the interface when the operation is complete.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsdisk-getpack
     */
    GetPack() {
        result := ComCall(4, this, "ptr*", &ppPack := 0, "HRESULT")
        return IVdsPack(ppPack)
    }

    /**
     * Retrieves information that uniquely identifies a disk.
     * @returns {VDS_LUN_INFORMATION} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a>structure allocated and passed in by the caller. VDS allocates memory for the <b>m_szVendorId</b>, 
     *       <b>m_szProductId</b>, <b>m_szProductRevision</b>, 
     *       and <b>m_szSerialNumber</b> member strings, as well as the <b>m_pbPort</b> and   <b>m_pbAddress</b> member strings of each element in the array of <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_interconnect">VDS_INTERCONNECT</a> structures. 
     *       Callers must free the strings by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsdisk-getidentificationdata
     */
    GetIdentificationData() {
        pLunInfo := VDS_LUN_INFORMATION()
        result := ComCall(5, this, "ptr", pLunInfo, "HRESULT")
        return pLunInfo
    }

    /**
     * Returns the details of all the extents on a disk.
     * @param {Pointer<Pointer<VDS_DISK_EXTENT>>} ppExtentArray A pointer variable that receives an  
     *       array of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_disk_extent">VDS_DISK_EXTENT</a> structures. 
     *       Callers must free this array by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Integer>} plNumberOfExtents The address of a type <b>LONG</b> representing the total number of extents.
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
     * The extent information was returned successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PACK_OFFLINE</b></dt>
     * <dt>0x80042444L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pack to which the disk belongs is inaccessible.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsdisk-queryextents
     */
    QueryExtents(ppExtentArray, plNumberOfExtents) {
        ppExtentArrayMarshal := ppExtentArray is VarRef ? "ptr*" : "ptr"
        plNumberOfExtentsMarshal := plNumberOfExtents is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, ppExtentArrayMarshal, ppExtentArray, plNumberOfExtentsMarshal, plNumberOfExtents, "HRESULT")
        return result
    }

    /**
     * Converts the partition style of an empty disk from one style to another.
     * @param {Integer} NewStyle The partition styles enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_partition_style">VDS_PARTITION_STYLE</a>.
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
     * The conversion completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INVALID_OPERATION</b></dt>
     * <dt>0x80042415L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The disk style cannot be converted, as is the case for 1394 or USB disks and unallocated disks.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsdisk-convertstyle
     */
    ConvertStyle(NewStyle) {
        result := ComCall(7, this, "int", NewStyle, "HRESULT")
        return result
    }

    /**
     * Sets the flags of a disk object.
     * @param {Integer} ulFlags A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_disk_flag">VDS_DISK_FLAG</a> enumeration values specifying the flags to be set. Only the <b>VDS_DF_READ_ONLY</b> flag can be set using this method. All other flags are set or cleared by the VDS service.
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
     * The flag was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_DISK_NOT_INITIALIZED</b></dt>
     * <dt>0x80042417L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag cannot be set on an uninitialized disk.
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
     * The method is not supported. Neither the basic provider nor the current dynamic provider support this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsdisk-setflags
     */
    SetFlags(ulFlags) {
        result := ComCall(8, this, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * Clears the flags of a disk object.
     * @param {Integer} ulFlags A bitmask of <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_disk_flag">VDS_DISK_FLAG</a> enumeration values specifying the flags to be cleared. Only the <b>VDS_DF_READ_ONLY</b> flag can be cleared using this method. All other flags are set or cleared by the VDS service.
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
     * The flag was cleared successfully.
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
     * The flag is not supported. Neither the basic provider nor the dynamic provider support this flag.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsdisk-clearflags
     */
    ClearFlags(ulFlags) {
        result := ComCall(9, this, "uint", ulFlags, "HRESULT")
        return result
    }
}
