#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncFilterInfo.ahk" { ISyncFilterInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents a filter that can be used to control which change units are included for items in an ISyncChangeBatch object.
 * @remarks
 * If a provider filters the contents of a change batch that it creates, it must create a filtered <b>ISyncChangeBatch</b> object instead of a standard change batch object. The filtered change batch object contains an <b>IChangeUnitListFilterInfo</b> object that describes how the contents of the change batch were filtered.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-ichangeunitlistfilterinfo
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IChangeUnitListFilterInfo extends ISyncFilterInfo {
    /**
     * The interface identifier for IChangeUnitListFilterInfo
     * @type {Guid}
     */
    static IID := Guid("{f2837671-0bdf-43fa-b502-232375fb50c2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IChangeUnitListFilterInfo interfaces
    */
    struct Vtbl extends ISyncFilterInfo.Vtbl {
        Initialize           : IntPtr
        GetChangeUnitIdCount : IntPtr
        GetChangeUnitId      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IChangeUnitListFilterInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes a new instance of the IChangeUnitListFilterInfo class that contains the specified array of change unit IDs.
     * @remarks
     * An <b>IChangeUnitListFilterInfo</b> object can be reused. Calling <b>Initialize</b> more than one time frees any previously contained array of change unit IDs and replaces it with the array that is specified by <i>ppbChangeUnitIds</i>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeunitlistfilterinfo-initialize
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeunitlistfilterinfo-getchangeunitidcount
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ichangeunitlistfilterinfo-getchangeunitid
     */
    GetChangeUnitId(dwChangeUnitIdIndex, pbChangeUnitId, pcbIdSize) {
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", dwChangeUnitIdIndex, pbChangeUnitIdMarshal, pbChangeUnitId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IChangeUnitListFilterInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetChangeUnitIdCount := CallbackCreate(GetMethod(implObj, "GetChangeUnitIdCount"), flags, 2)
        this.vtbl.GetChangeUnitId := CallbackCreate(GetMethod(implObj, "GetChangeUnitId"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetChangeUnitIdCount)
        CallbackFree(this.vtbl.GetChangeUnitId)
    }
}
