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
     * 
     * @param {Pointer<RDCOMPARE>} prdc 
     * @param {Pointer<Integer>} pnResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdatacompareex-compare
     */
    Compare(prdc, pnResult) {
        result := ComCall(3, this, "ptr", prdc, "int*", pnResult, "HRESULT")
        return result
    }
}
