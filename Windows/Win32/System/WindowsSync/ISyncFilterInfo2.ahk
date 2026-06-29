#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISyncFilterInfo.ahk" { ISyncFilterInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents additional information about a filter that can be used to control which changes are included in an ISyncChangeBatch object.
 * @remarks
 * <b>ISyncFilterInfo2</b> can obtained by calling <b>QueryInterface</b> on an <b>ISyncFilterInfo</b> object or an object derived from <b>ISyncFilterInfo</b>, such as an <b>IChangeUnitListFilterInfo</b> object.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isyncfilterinfo2
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncFilterInfo2 extends ISyncFilterInfo {
    /**
     * The interface identifier for ISyncFilterInfo2
     * @type {Guid}
     */
    static IID := Guid("{19b394ba-e3d0-468c-934d-321968b2ab34}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncFilterInfo2 interfaces
    */
    struct Vtbl extends ISyncFilterInfo.Vtbl {
        GetFlags : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncFilterInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the flags that specify additional information about the filter information object.
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
     * @param {Pointer<Integer>} pdwFlags Gets the flags that specify additional information about the filter information object. This will be one of the <b>SYNC_FILTER_INFO_FLAG</b> values (See Remarks).
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncfilterinfo2-getflags
     */
    GetFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncFilterInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFlags := CallbackCreate(GetMethod(implObj, "GetFlags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFlags)
    }
}
