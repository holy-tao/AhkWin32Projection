#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method for retrieving information from the similarity traits list that was returned by the ISimilarityTraitsTable::BeginDump method.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-isimilaritytabledumpstate
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class ISimilarityTableDumpState extends IUnknown{
    /**
     * The interface identifier for ISimilarityTableDumpState
     * @type {Guid}
     */
    static IID => Guid("{96236a7b-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for SimilarityTableDumpState
     * @type {Guid}
     */
    static CLSID => Guid("{96236a8e-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} resultsSize 
     * @param {Pointer<UInt32>} resultsUsed 
     * @param {Pointer<BOOL>} eof 
     * @param {Pointer<SimilarityDumpData>} results 
     * @returns {HRESULT} 
     */
    GetNextData(resultsSize, resultsUsed, eof, results) {
        result := ComCall(3, this, "uint", resultsSize, "uint*", resultsUsed, "ptr", eof, "ptr", results, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
