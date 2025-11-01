#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetQueryStatus extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetQueryStatus
     * @type {Guid}
     */
    static IID => Guid("{a7ac77ed-f8d7-11ce-a798-0020f8008024}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus", "GetStatusEx"]

    /**
     * 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pdwStatus) {
        result := ComCall(3, this, "uint*", pdwStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStatus 
     * @param {Pointer<Integer>} pcFilteredDocuments 
     * @param {Pointer<Integer>} pcDocumentsToFilter 
     * @param {Pointer<Pointer>} pdwRatioFinishedDenominator 
     * @param {Pointer<Pointer>} pdwRatioFinishedNumerator 
     * @param {Pointer} cbBmk 
     * @param {Pointer<Integer>} pBmk 
     * @param {Pointer<Pointer>} piRowBmk 
     * @param {Pointer<Pointer>} pcRowsTotal 
     * @returns {HRESULT} 
     */
    GetStatusEx(pdwStatus, pcFilteredDocuments, pcDocumentsToFilter, pdwRatioFinishedDenominator, pdwRatioFinishedNumerator, cbBmk, pBmk, piRowBmk, pcRowsTotal) {
        result := ComCall(4, this, "uint*", pdwStatus, "uint*", pcFilteredDocuments, "uint*", pcDocumentsToFilter, "ptr*", pdwRatioFinishedDenominator, "ptr*", pdwRatioFinishedNumerator, "ptr", cbBmk, "char*", pBmk, "ptr*", piRowBmk, "ptr*", pcRowsTotal, "HRESULT")
        return result
    }
}
