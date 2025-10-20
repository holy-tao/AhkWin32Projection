#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for storing and retrieving per-file similarity data and file IDs in a similarity file.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-isimilarity
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class ISimilarity extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISimilarity
     * @type {Guid}
     */
    static IID => Guid("{96236a83-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for Similarity
     * @type {Guid}
     */
    static CLSID => Guid("{96236a91-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTable", "CreateTableIndirect", "CloseTable", "Append", "FindSimilarFileId", "CopyAndSwap", "GetRecordCount"]

    /**
     * 
     * @param {PWSTR} path 
     * @param {BOOL} truncate 
     * @param {Pointer<Integer>} securityDescriptor 
     * @param {Integer} recordSize 
     * @param {Pointer<Integer>} isNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilarity-createtable
     */
    CreateTable(path, truncate, securityDescriptor, recordSize, isNew) {
        path := path is String ? StrPtr(path) : path

        result := ComCall(3, this, "ptr", path, "int", truncate, "char*", securityDescriptor, "uint", recordSize, "int*", isNew, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISimilarityTraitsMapping} mapping 
     * @param {IRdcFileWriter} fileIdFile 
     * @param {BOOL} truncate 
     * @param {Integer} recordSize 
     * @param {Pointer<Integer>} isNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilarity-createtableindirect
     */
    CreateTableIndirect(mapping, fileIdFile, truncate, recordSize, isNew) {
        result := ComCall(4, this, "ptr", mapping, "ptr", fileIdFile, "int", truncate, "uint", recordSize, "int*", isNew, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} isValid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilarity-closetable
     */
    CloseTable(isValid) {
        result := ComCall(5, this, "int", isValid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SimilarityFileId>} similarityFileId 
     * @param {Pointer<SimilarityData>} similarityData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilarity-append
     */
    Append(similarityFileId, similarityData) {
        result := ComCall(6, this, "ptr", similarityFileId, "ptr", similarityData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SimilarityData>} similarityData 
     * @param {Integer} numberOfMatchesRequired 
     * @param {Integer} resultsSize 
     * @param {Pointer<IFindSimilarResults>} findSimilarResults 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilarity-findsimilarfileid
     */
    FindSimilarFileId(similarityData, numberOfMatchesRequired, resultsSize, findSimilarResults) {
        result := ComCall(7, this, "ptr", similarityData, "ushort", numberOfMatchesRequired, "uint", resultsSize, "ptr*", findSimilarResults, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISimilarity} newSimilarityTables 
     * @param {ISimilarityReportProgress} reportProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilarity-copyandswap
     */
    CopyAndSwap(newSimilarityTables, reportProgress) {
        result := ComCall(8, this, "ptr", newSimilarityTables, "ptr", reportProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} recordCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilarity-getrecordcount
     */
    GetRecordCount(recordCount) {
        result := ComCall(9, this, "uint*", recordCount, "HRESULT")
        return result
    }
}
