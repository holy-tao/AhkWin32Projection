#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SimilarityData.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for enabling the signature generator to generate similarity data and for retrieving the similarity data after it is generated.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-irdcsimilaritygenerator
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class IRdcSimilarityGenerator extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableSimilarity", "Results"]

    /**
     * Enables the signature generator to generate similarity data.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdcsimilaritygenerator-enablesimilarity
     */
    EnableSimilarity() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the similarity data that was generated for a file by the signature generator.
     * @returns {SimilarityData} A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydata">SimilarityData</a> structure that will receive the similarity data.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdcsimilaritygenerator-results
     */
    Results() {
        similarityData := SimilarityData()
        result := ComCall(4, this, "ptr", similarityData, "HRESULT")
        return similarityData
    }
}
