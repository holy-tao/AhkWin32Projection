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
     * 
     * @param {Pointer<Integer>} size 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-ifindsimilarresults-getsize
     */
    GetSize(size) {
        result := ComCall(3, this, "uint*", size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} numTraitsMatched 
     * @param {Pointer<SimilarityFileId>} similarityFileId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-ifindsimilarresults-getnextfileid
     */
    GetNextFileId(numTraitsMatched, similarityFileId) {
        result := ComCall(4, this, "uint*", numTraitsMatched, "ptr", similarityFileId, "HRESULT")
        return result
    }
}
