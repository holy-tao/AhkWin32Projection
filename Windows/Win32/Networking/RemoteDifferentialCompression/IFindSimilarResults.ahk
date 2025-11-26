#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for retrieving information from the file list returned by the ISimilarity::FindSimilarFileId method.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-ifindsimilarresults
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class IFindSimilarResults extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFindSimilarResults
     * @type {Guid}
     */
    static IID => Guid("{96236a81-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for FindSimilarResults
     * @type {Guid}
     */
    static CLSID => Guid("{96236a93-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSize", "GetNextFileId"]

    /**
     * Retrieves the number of entries in the file list that was returned by the ISimilarity::FindSimilarFileId method.
     * @returns {Integer} A pointer to a variable that receives the number of entries in the file list.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-ifindsimilarresults-getsize
     */
    GetSize() {
        result := ComCall(3, this, "uint*", &size := 0, "HRESULT")
        return size
    }

    /**
     * Retrieves the next valid similarity file ID in the file list that was returned by the ISimilarity::FindSimilarFileId method.
     * @param {Pointer<Integer>} numTraitsMatched A pointer to a variable that receives the number of traits that were matched.
     * @param {Pointer<SimilarityFileId>} similarityFileId A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similarityfileid">SimilarityFileId</a> structure that contains the similarity file ID of the matching file.
     * @returns {HRESULT} Returns <b>S_OK</b> on success, or an error <b>HRESULT</b> on failure.
     * 
     * This method can also return the following error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-ifindsimilarresults-getnextfileid
     */
    GetNextFileId(numTraitsMatched, similarityFileId) {
        numTraitsMatchedMarshal := numTraitsMatched is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, numTraitsMatchedMarshal, numTraitsMatched, "ptr", similarityFileId, "HRESULT")
        return result
    }
}
