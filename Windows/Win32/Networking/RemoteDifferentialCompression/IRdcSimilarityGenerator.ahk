#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for enabling the signature generator to generate similarity data and for retrieving the similarity data after it is generated.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-irdcsimilaritygenerator
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class IRdcSimilarityGenerator extends IUnknown{
    /**
     * The interface identifier for IRdcSimilarityGenerator
     * @type {Guid}
     */
    static IID => Guid("{96236a80-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcSimilarityGenerator
     * @type {Guid}
     */
    static CLSID => Guid("{96236a92-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    EnableSimilarity() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SimilarityData>} similarityData 
     * @returns {HRESULT} 
     */
    Results(similarityData) {
        result := ComCall(4, this, "ptr", similarityData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
