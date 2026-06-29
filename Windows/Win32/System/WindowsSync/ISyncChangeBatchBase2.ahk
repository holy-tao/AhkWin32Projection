#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SYNC_SERIALIZATION_VERSION.ahk" { SYNC_SERIALIZATION_VERSION }
#Import ".\ISyncChangeBatchBase.ahk" { ISyncChangeBatchBase }

/**
 * Represents additional capabilities of an ISyncChangeBatchBase object.
 * @remarks
 * An <b>ISyncChangeBatchBase2</b> object can be obtained by passing <b>IID_ISyncChangeBatchBase2</b> to the <b>QueryInterface</b> method of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchangebatchbase">ISyncChangeBatchBase</a> object.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isyncchangebatchbase2
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncChangeBatchBase2 extends ISyncChangeBatchBase {
    /**
     * The interface identifier for ISyncChangeBatchBase2
     * @type {Guid}
     */
    static IID := Guid("{6fdb596a-d755-4584-bd0c-c0c23a548fbf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncChangeBatchBase2 interfaces
    */
    struct Vtbl extends ISyncChangeBatchBase.Vtbl {
        SerializeWithOptions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncChangeBatchBase2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Serializes the change batch object data to a byte array, based on the specified version and serialization options.
     * @remarks
     * The following table describes the flags that specify information about an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncfilterinfo">ISyncFilterInfo</a> object.
     * 
     * <table>
     * <tr>
     * <th>SYNC_FILTER_INFO_FLAG value</th>
     * <th>Description </th>
     * </tr>
     * <tr>
     * <td><b>SYNC_FILTER_INFO_FLAG_ITEM_LIST</b></td>
     * <td>This flag indicates that the set of items synchronized is restricted by an item filter.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>SYNC_FILTER_INFO_FLAG_CHANGE_UNIT_LIST</b></td>
     * <td>An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-ichangeunitlistfilterinfo">IChangeUnitListFilterInfo</a> object specifies that changes apply only to a subset of the change units that are defined for the scope.
     * </td>
     * </tr>
     * </table>
     * @param {SYNC_SERIALIZATION_VERSION} targetFormatVersion The serialized change batch is compatible with this version.
     * @param {Integer} dwFlags Reserved. Must be zero.
     * @param {Pointer<Integer>} pbBuffer The serialized change batch object data is serialized to this buffer.
     * @param {Pointer<Integer>} pdwSerializedSize The number of bytes in <i>pbBuffer</i>. Returns either the number of bytes that are required to serialize the change batch data when <i>pbBuffer</i> is too small, or the number of bytes written.
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
     * <i>dwFlags</i> is not zero, or the version that is specified by <i>targetFormatVersion</i> is incompatible with the change batch object data.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pBuffer</i> is too small. In this situation, the required number of bytes is returned in <i>pdwSerializedSize</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The change batch contains a group that was started but not ended.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_INVALID_VERSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>targetFormatVersion</i> is higher than the version of the object, or the object contains elements that are not compatible with <i>targetFormatVersion</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchbase2-serializewithoptions
     */
    SerializeWithOptions(targetFormatVersion, dwFlags, pbBuffer, pdwSerializedSize) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pdwSerializedSizeMarshal := pdwSerializedSize is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, SYNC_SERIALIZATION_VERSION, targetFormatVersion, "uint", dwFlags, pbBufferMarshal, pbBuffer, pdwSerializedSizeMarshal, pdwSerializedSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncChangeBatchBase2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SerializeWithOptions := CallbackCreate(GetMethod(implObj, "SerializeWithOptions"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SerializeWithOptions)
    }
}
