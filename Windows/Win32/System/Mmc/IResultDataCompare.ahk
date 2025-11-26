#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Allows primary snap-ins to compare result items that are displayed in a sorted order in the result pane.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iresultdatacompare
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
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdatacompare-compare
     */
    Compare(lUserParam, cookieA, cookieB, pnResult) {
        pnResultMarshal := pnResult is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", lUserParam, "ptr", cookieA, "ptr", cookieB, pnResultMarshal, pnResult, "HRESULT")
        return result
    }
}
