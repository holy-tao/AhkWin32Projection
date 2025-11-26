#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Allows primary snap-ins to compare both scope and result items that are displayed in a sorted order in the result pane.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iresultdatacompareex
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IResultDataCompareEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResultDataCompareEx
     * @type {Guid}
     */
    static IID => Guid("{96933476-0251-11d3-aeb0-00c04f8ecd78}")

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
     * Provides a way for a primary snap-in to compare items for the purpose of sorting the scope and result items that it inserts in the result pane.
     * @param {Pointer<RDCOMPARE>} prdc A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-rdcompare">RDCOMPARE</a> structure that holds information about the items being compared and which column in the result pane list view is being sorted.
     * @returns {Integer} The snap-in should set pnResult to the result of the comparison:
     * 
     * <ul>
     * <li>Any negative integer if item 1 &lt; item 2</li>
     * <li>Zero (0) if item 1 == item 2</li>
     * <li>Any positive integer if item 1 &gt; item 2</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdatacompareex-compare
     */
    Compare(prdc) {
        result := ComCall(3, this, "ptr", prdc, "int*", &pnResult := 0, "HRESULT")
        return pnResult
    }
}
