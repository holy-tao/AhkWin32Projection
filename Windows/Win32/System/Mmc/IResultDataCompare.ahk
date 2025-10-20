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
     * 
     * @param {LPARAM} lUserParam 
     * @param {Pointer} cookieA 
     * @param {Pointer} cookieB 
     * @param {Pointer<Integer>} pnResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdatacompare-compare
     */
    Compare(lUserParam, cookieA, cookieB, pnResult) {
        result := ComCall(3, this, "ptr", lUserParam, "ptr", cookieA, "ptr", cookieB, "int*", pnResult, "HRESULT")
        return result
    }
}
