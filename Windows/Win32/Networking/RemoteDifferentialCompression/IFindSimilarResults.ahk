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
     * 
     * @param {Pointer<UInt32>} size 
     * @returns {HRESULT} 
     */
    GetSize(size) {
        result := ComCall(3, this, "uint*", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} numTraitsMatched 
     * @param {Pointer<SimilarityFileId>} similarityFileId 
     * @returns {HRESULT} 
     */
    GetNextFileId(numTraitsMatched, similarityFileId) {
        result := ComCall(4, this, "uint*", numTraitsMatched, "ptr", similarityFileId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
