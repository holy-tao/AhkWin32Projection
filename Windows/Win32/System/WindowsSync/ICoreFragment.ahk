#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IClockVector.ahk" { IClockVector }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents knowledge of all items in the scope for a specific set of change units.
 * @remarks
 * An <b>ISyncKnowledge2</b> object contains one or more <b>ICoreFragment</b> objects, each of which contains knowledge that applies to a specific set of change units. Typically, one of the <b>ICoreFragment</b> objects contains no change unit IDs. The knowledge that is contained in the <b>ICoreFragment</b> object that contains no change unit IDs applies to all change unit IDs that are not otherwise contained in another <b>ICoreFragment</b> object.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-icorefragment
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ICoreFragment extends IUnknown {
    /**
     * The interface identifier for ICoreFragment
     * @type {Guid}
     */
    static IID := Guid("{613b2ab5-b304-47d9-9c31-ce6c54401a15}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICoreFragment interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NextColumn     : IntPtr
        NextRange      : IntPtr
        Reset          : IntPtr
        GetColumnCount : IntPtr
        GetRangeCount  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICoreFragment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the next change unit ID in the set of change unit IDs that this knowledge fragment applies to.
     * @remarks
     * An <b>ISyncKnowledge2</b> object contains one or more <b>ICoreFragment</b> objects, each of which contains knowledge that applies to a specific set of columns. Typically, one of the <b>ICoreFragment</b> objects contains no columns, and its knowledge applies to all of the change units that are not specified in any other fragment. In this situation, <b>NextColumn</b> always returns <b>S_FALSE</b>.
     * @param {Pointer<Integer>} pChangeUnitId Returns the next change unit ID in the set.
     * @param {Pointer<Integer>} pChangeUnitIdSize Specifies the number of bytes in <i>pChangeUnitId</i>. Returns the number of bytes written, or the number of bytes that are required to retrieve the ID when <i>pChangeUnitId</i> is too small.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more change unit IDs to enumerate.
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
     * The change unit ID is a variable-length ID and <i>pChangeUnitIdSize</i> is <b>NULL</b>.
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
     * <i>pChangeUnitId</i> is too small. In this situation, the required number of bytes is returned in <i>pChangeUnitIdSize</i>.
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
     * The knowledge object contained within this object has changed since this object was created.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-icorefragment-nextcolumn
     */
    NextColumn(pChangeUnitId, pChangeUnitIdSize) {
        pChangeUnitIdMarshal := pChangeUnitId is VarRef ? "char*" : "ptr"
        pChangeUnitIdSizeMarshal := pChangeUnitIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pChangeUnitIdMarshal, pChangeUnitId, pChangeUnitIdSizeMarshal, pChangeUnitIdSize, "HRESULT")
        return result
    }

    /**
     * Returns the next range that is contained in this knowledge fragment, and the clock vector that defines what is known about the items in the range.
     * @remarks
     * The value that is returned in <i>pItemId</i> is the closed lower bound on the range of item IDs that are associated with the clock vector that is returned in <i>piClockVector</i>. The value of <i>pItemId</i> also defines the open upper bound of the previous range, so the open upper bound of the current range can be obtained by calling <b>NextRange</b> again. If there are no more ranges to enumerate, the range contains all items that have IDs greater than or equal to <i>pItemId</i>.
     * @param {Pointer<Integer>} pItemId Returns the closed lower bound of item IDs in this range. This value is also the open upper bound of item IDs in the previous range when it is not the first in the range set.
     * @param {Pointer<Integer>} pItemIdSize Specifies the number of bytes in <i>pItemId</i>. Returns the number of bytes written, or the number of bytes that are required to retrieve the ID when <i>pItemId</i> is too small.
     * @returns {IClockVector} Returns the clock vector that defines what is known about the items in the range.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-icorefragment-nextrange
     */
    NextRange(pItemId, pItemIdSize) {
        pItemIdMarshal := pItemId is VarRef ? "char*" : "ptr"
        pItemIdSizeMarshal := pItemIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pItemIdMarshal, pItemId, pItemIdSizeMarshal, pItemIdSize, "ptr*", &piClockVector := 0, "HRESULT")
        return IClockVector(piClockVector)
    }

    /**
     * Resets both the column and range enumerators to the beginning of their respective sets.
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
     * <dt><b>SYNC_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The knowledge object contained in this object has changed since this object was created.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-icorefragment-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Gets the number of columns that are contained in this knowledge fragment.
     * @remarks
     * An <b>ISyncKnowledge2</b> object contains one or more <b>ICoreFragment</b> objects. Each object contains knowledge that applies to a specific set of columns. A column is represented as a change unit. Typically, one of the <b>ICoreFragment</b> objects contains no columns. When an <b>ICoreFragment</b> object contains no columns, its knowledge applies to all of the change units that are not specified in any other fragment.
     * @param {Pointer<Integer>} pColumnCount Returns the number of columns that are contained in this knowledge fragment.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-icorefragment-getcolumncount
     */
    GetColumnCount(pColumnCount) {
        pColumnCountMarshal := pColumnCount is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pColumnCountMarshal, pColumnCount, "HRESULT")
        return result
    }

    /**
     * Gets the number of ranges that are contained in this knowledge fragment.
     * @remarks
     * An <b>ICoreFragment</b> object contains one or more ranges. Each range specifies a set of item IDs and a clock vector that defines what is known about the items in the range.
     * @param {Pointer<Integer>} pRangeCount Returns the number of ranges that are contained in this knowledge fragment.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-icorefragment-getrangecount
     */
    GetRangeCount(pRangeCount) {
        pRangeCountMarshal := pRangeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pRangeCountMarshal, pRangeCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICoreFragment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NextColumn := CallbackCreate(GetMethod(implObj, "NextColumn"), flags, 3)
        this.vtbl.NextRange := CallbackCreate(GetMethod(implObj, "NextRange"), flags, 4)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.GetColumnCount := CallbackCreate(GetMethod(implObj, "GetColumnCount"), flags, 2)
        this.vtbl.GetRangeCount := CallbackCreate(GetMethod(implObj, "GetRangeCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NextColumn)
        CallbackFree(this.vtbl.NextRange)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.GetColumnCount)
        CallbackFree(this.vtbl.GetRangeCount)
    }
}
