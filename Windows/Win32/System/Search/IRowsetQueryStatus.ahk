#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetQueryStatus extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pdwStatus) {
        result := ComCall(3, this, "uint*", pdwStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStatus 
     * @param {Pointer<UInt32>} pcFilteredDocuments 
     * @param {Pointer<UInt32>} pcDocumentsToFilter 
     * @param {Pointer<UIntPtr>} pdwRatioFinishedDenominator 
     * @param {Pointer<UIntPtr>} pdwRatioFinishedNumerator 
     * @param {Pointer} cbBmk 
     * @param {Pointer<Byte>} pBmk 
     * @param {Pointer<UIntPtr>} piRowBmk 
     * @param {Pointer<UIntPtr>} pcRowsTotal 
     * @returns {HRESULT} 
     */
    GetStatusEx(pdwStatus, pcFilteredDocuments, pcDocumentsToFilter, pdwRatioFinishedDenominator, pdwRatioFinishedNumerator, cbBmk, pBmk, piRowBmk, pcRowsTotal) {
        result := ComCall(4, this, "uint*", pdwStatus, "uint*", pcFilteredDocuments, "uint*", pcDocumentsToFilter, "ptr*", pdwRatioFinishedDenominator, "ptr*", pdwRatioFinishedNumerator, "ptr", cbBmk, "char*", pBmk, "ptr*", piRowBmk, "ptr*", pcRowsTotal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
