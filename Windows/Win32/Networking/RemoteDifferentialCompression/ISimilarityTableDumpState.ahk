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
     * Retrieves one or more SimilarityDumpData structures from the similarity traits list that was returned by the ISimilarityTraitsTable::BeginDump method.
     * @param {Integer} resultsSize The number of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydumpdata">SimilarityDumpData</a> structures that can be stored in the buffer that the <i>results</i> parameter points to.
     * @param {Pointer<Integer>} resultsUsed A pointer to a variable that receives the number of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydumpdata">SimilarityDumpData</a> structures that were returned in the buffer that the <i>results</i> parameter points to.
     * @param {Pointer<BOOL>} eof A pointer to a variable that receives <b>TRUE</b> if the end of the file is reached; otherwise, <b>FALSE</b>.
     * @param {Pointer<SimilarityDumpData>} results A pointer to a buffer that receives the <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydumpdata">SimilarityDumpData</a> structures.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytabledumpstate-getnextdata
     */
    GetNextData(resultsSize, resultsUsed, eof, results) {
        resultsUsedMarshal := resultsUsed is VarRef ? "uint*" : "ptr"
        eofMarshal := eof is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", resultsSize, resultsUsedMarshal, resultsUsed, eofMarshal, eof, "ptr", results, "HRESULT")
        return result
    }
}
