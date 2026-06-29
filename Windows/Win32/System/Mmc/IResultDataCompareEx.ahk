#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\RDCOMPARE.ahk" { RDCOMPARE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows primary snap-ins to compare both scope and result items that are displayed in a sorted order in the result pane.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iresultdatacompareex
 * @namespace Windows.Win32.System.Mmc
 */
export default struct IResultDataCompareEx extends IUnknown {
    /**
     * The interface identifier for IResultDataCompareEx
     * @type {Guid}
     */
    static IID := Guid("{96933476-0251-11d3-aeb0-00c04f8ecd78}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IResultDataCompareEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Compare : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IResultDataCompareEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides a way for a primary snap-in to compare items for the purpose of sorting the scope and result items that it inserts in the result pane.
     * @remarks
     * Compare provides a mechanism for determining the sort order of scope and result item objects appearing in the result pane. The built-in sort provided by MMC only uses the C run-time library's string-compare function to compare the data. If this interface is implemented, it is used for all comparisons.
     * 
     * The comparison should be based on an ascending sort order. If the user toggles the standard result view header, the console complements the compare results, which results in a descending sort order.
     * 
     * The 
     * IResultDataCompareEx interface is not called for virtual list sorting. This is because the snap-in maintains all the item data storage for a virtual list, the snap-in must sort the items itself. A snap-in must implement the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-iresultownerdata">IResultOwnerData</a> interface to provide sorting for virtual lists.
     * @param {Pointer<RDCOMPARE>} prdc A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-rdcompare">RDCOMPARE</a> structure that holds information about the items being compared and which column in the result pane list view is being sorted.
     * @returns {Integer} The snap-in should set pnResult to the result of the comparison:
     * 
     * <ul>
     * <li>Any negative integer if item 1 &lt; item 2</li>
     * <li>Zero (0) if item 1 == item 2</li>
     * <li>Any positive integer if item 1 &gt; item 2</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdatacompareex-compare
     */
    Compare(prdc) {
        result := ComCall(3, this, RDCOMPARE.Ptr, prdc, "int*", &pnResult := 0, "HRESULT")
        return pnResult
    }

    Query(iid) {
        if (IResultDataCompareEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Compare := CallbackCreate(GetMethod(implObj, "Compare"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Compare)
    }
}
