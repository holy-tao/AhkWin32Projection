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
     * 
     * @param {LPARAM} lUserParam 
     * @param {Pointer} cookieA 
     * @param {Pointer} cookieB 
     * @param {Pointer<Int32>} pnResult 
     * @returns {HRESULT} 
     */
    Compare(lUserParam, cookieA, cookieB, pnResult) {
        result := ComCall(3, this, "ptr", lUserParam, "ptr", cookieA, "ptr", cookieB, "int*", pnResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
