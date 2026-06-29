#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows primary snap-ins to compare result items that are displayed in a sorted order in the result pane.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iresultdatacompare
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IResultDataCompare extends IUnknown {
    /**
     * The interface identifier for IResultDataCompare
     * @type {Guid}
     */
    static IID := Guid("{e8315a52-7a1a-11d0-a2d2-00c04fd909dd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IResultDataCompare interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Compare : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IResultDataCompare.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides a way for a primary snap-in to compare cookies for the purpose of sorting the result items that it inserts in the result pane.
     * @remarks
     * Compare provides a mechanism for determining the sort order of result item objects appearing in the result pane. The built-in sort provided by MMC only uses the C run-time library string-compare function to compare the data. If this interface is implemented, it is used for all comparisons.
     * 
     * The comparison should be based on an ascending sort order. If the user toggles the standard result view header, the console complements the compare results, which results in a descending sort order.
     * 
     * This 
     * IResultDataCompare interface is not called for virtual list sorting. Because the snap-in maintains all the item data storage for a virtual list, the snap-in must sort the items itself. A snap-in must implement the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iresultownerdata">IResultOwnerData</a> interface to provide sorting for virtual lists.
     * @param {LPARAM} lUserParam A value that specifies user-provided information that is passed into 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iresultdata-sort">IResultData::Sort</a>. MMC does not interpret this parameter.
     * @param {Pointer} cookieA The unique identifier of the first result item object to be compared as part of the sorting operation.
     * @param {Pointer} cookieB The unique identifier of the second result item object to be compared as part of the sorting operation.
     * @param {Pointer<Integer>} pnResult As an in parameter, the argument contains the column that is sorted. As an out parameter, the value of the argument should be:
     * 
     * <ul>
     * <li>-1 if item 1 &lt; item 2</li>
     * <li>zero (0) if item 1 == item 2</li>
     * <li>1 if item 1 &gt; item 2</li>
     * </ul>
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdatacompare-compare
     */
    Compare(lUserParam, cookieA, cookieB, pnResult) {
        pnResultMarshal := pnResult is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, LPARAM, lUserParam, "ptr", cookieA, "ptr", cookieB, pnResultMarshal, pnResult, "HRESULT")
        return result
    }

    Query(iid) {
        if (IResultDataCompare.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Compare := CallbackCreate(GetMethod(implObj, "Compare"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Compare)
    }
}
