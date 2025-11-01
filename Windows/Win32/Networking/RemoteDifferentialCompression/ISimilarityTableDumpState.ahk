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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNextData"]

    /**
     * 
     * @param {Integer} resultsSize 
     * @param {Pointer<Integer>} resultsUsed 
     * @param {Pointer<BOOL>} eof 
     * @param {Pointer<SimilarityDumpData>} results 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytabledumpstate-getnextdata
     */
    GetNextData(resultsSize, resultsUsed, eof, results) {
        resultsUsedMarshal := resultsUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", resultsSize, resultsUsedMarshal, resultsUsed, "ptr", eof, "ptr", results, "HRESULT")
        return result
    }
}
