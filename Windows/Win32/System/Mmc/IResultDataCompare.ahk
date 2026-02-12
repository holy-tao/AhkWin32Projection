#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Allows primary snap-ins to compare result items that are displayed in a sorted order in the result pane.
 * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nn-mmc-iresultdatacompare
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IResultDataCompare extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResultDataCompare
     * @type {Guid}
     */
    static IID => Guid("{e8315a52-7a1a-11d0-a2d2-00c04fd909dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Compare"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/mmc/nf-mmc-iresultdatacompare-compare
     */
    Compare(lUserParam, cookieA, cookieB, pnResult) {
        lUserParam := lUserParam is Win32Handle ? NumGet(lUserParam, "ptr") : lUserParam

        pnResultMarshal := pnResult is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", lUserParam, "ptr", cookieA, "ptr", cookieB, pnResultMarshal, pnResult, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
