#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method to change partition types.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsadvanceddisk2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsAdvancedDisk2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsAdvancedDisk2
     * @type {Guid}
     */
    static IID => Guid("{9723f420-9355-42de-ab66-e31bb15beeac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ChangePartitionType"]

    /**
     * Changes the partition type on the disk at a specified byte offset.
     * @param {Integer} ullOffset Byte offset of the partition from the beginning of the disk.  This offset must be the offset of the start of a partition.
     * @param {BOOL} bForce Boolean value that indicates whether change will be forced.
     * @param {Pointer<CHANGE_PARTITION_TYPE_PARAMETERS>} para Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-change_partition_type_parameters">CHANGE_PARTITION_TYPE_PARAMETERS</a> structure that contains the partition type that the partition at the location specified by the <i>ullOffset</i> parameter will be changed to.
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
     * The partition type was changed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_DEVICE_IN_USE</b></dt>
     * <dt>0x80042413L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The partition is in use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INTERNAL_ERROR</b></dt>
     * <dt>0x80042448L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error occurred. Check the event log for more details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INVALID_PARTITION_TYPE</b></dt>
     * <dt>0x80042565L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified partition type is not valid for this operation.
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
     * The changing of the partition type on dynamic disks is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_OBJECT_NOT_FOUND</b></dt>
     * <dt>0x80042405L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The partition does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PARTITION_LDM</b></dt>
     * <dt>0x8004258DL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation is not supported on LDM partitions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PARTITION_MSR</b></dt>
     * <dt>0x8004258CL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation is not supported on MSR partitions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_PARTITION_STYLE_MISMATCH</b></dt>
     * <dt>0x80042571L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified partition style does not match that of the disk.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsadvanceddisk2-changepartitiontype
     */
    ChangePartitionType(ullOffset, bForce, para) {
        result := ComCall(3, this, "uint", ullOffset, "int", bForce, "ptr", para, "HRESULT")
        return result
    }
}
