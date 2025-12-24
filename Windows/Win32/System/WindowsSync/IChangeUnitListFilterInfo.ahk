#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncFilterInfo.ahk

/**
 * Represents a filter that can be used to control which change units are included for items in an ISyncChangeBatch object.
 * @remarks
 * 
 * If a provider filters the contents of a change batch that it creates, it must create a filtered <b>ISyncChangeBatch</b> object instead of a standard change batch object. The filtered change batch object contains an <b>IChangeUnitListFilterInfo</b> object that describes how the contents of the change batch were filtered.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ichangeunitlistfilterinfo
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IChangeUnitListFilterInfo extends ISyncFilterInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChangeUnitListFilterInfo
     * @type {Guid}
     */
    static IID => Guid("{f2837671-0bdf-43fa-b502-232375fb50c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetChangeUnitIdCount", "GetChangeUnitId"]

    /**
     * Initializes a new instance of the IChangeUnitListFilterInfo class that contains the specified array of change unit IDs.
     * @param {Pointer<Pointer<Integer>>} ppbChangeUnitIds The array of change unit IDs that indicate which change units are included by this filter.
     * @param {Integer} dwChangeUnitCount The number of change unit IDs that are contained in <i>ppbChangeUnitIds</i>.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwChangeUnitCount</i> is 0, or any ID that is contained in <i>ppbChangeUnitIds</i> is not valid.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ichangeunitlistfilterinfo-initialize
     */
    Initialize(ppbChangeUnitIds, dwChangeUnitCount) {
        ppbChangeUnitIdsMarshal := ppbChangeUnitIds is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, ppbChangeUnitIdsMarshal, ppbChangeUnitIds, "uint", dwChangeUnitCount, "HRESULT")
        return result
    }

    /**
     * Gets the number of change unit IDs that define the filter.
     * @param {Pointer<Integer>} pdwChangeUnitIdCount Returns the number of change unit IDs that define the filter.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ichangeunitlistfilterinfo-getchangeunitidcount
     */
    GetChangeUnitIdCount(pdwChangeUnitIdCount) {
        pdwChangeUnitIdCountMarshal := pdwChangeUnitIdCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwChangeUnitIdCountMarshal, pdwChangeUnitIdCount, "HRESULT")
        return result
    }

    /**
     * Gets the change unit ID that is stored at the specified index in the array of change unit IDs that define the filter.
     * @param {Integer} dwChangeUnitIdIndex The index of the change unit ID to look up.
     * @param {Pointer<Integer>} pbChangeUnitId Returns the change unit ID that is stored at the index that is specified by <i>dwChangeUnitIdIndex</i>.
     * @param {Pointer<Integer>} pcbIdSize Specifies the number of bytes in <i>pbChangeUnitId</i>. Returns the number of bytes that are required to retrieve the ID when <i>pbChangeUnitId</i> is too small, or the number of bytes written.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No filter is defined, or  <i>dwChangeUnitIdIndex</i> is larger than the number of change unit IDs that are stored in this object.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pbChangeUnitId</i> is too small. In this case, the required number of bytes is returned in <i>pcbIdSize</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_ID_FORMAT_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The change unit ID to be returned is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ichangeunitlistfilterinfo-getchangeunitid
     */
    GetChangeUnitId(dwChangeUnitIdIndex, pbChangeUnitId, pcbIdSize) {
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", dwChangeUnitIdIndex, pbChangeUnitIdMarshal, pbChangeUnitId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }
}
