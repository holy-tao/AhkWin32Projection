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
     * 
     * @param {PWSTR} path 
     * @param {BOOL} truncate 
     * @param {Pointer<Byte>} securityDescriptor 
     * @param {Integer} recordSize 
     * @param {Pointer<Int32>} isNew 
     * @returns {HRESULT} 
     */
    CreateTable(path, truncate, securityDescriptor, recordSize, isNew) {
        path := path is String ? StrPtr(path) : path

        result := ComCall(3, this, "ptr", path, "int", truncate, "char*", securityDescriptor, "uint", recordSize, "int*", isNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISimilarityTraitsMapping>} mapping 
     * @param {Pointer<IRdcFileWriter>} fileIdFile 
     * @param {BOOL} truncate 
     * @param {Integer} recordSize 
     * @param {Pointer<Int32>} isNew 
     * @returns {HRESULT} 
     */
    CreateTableIndirect(mapping, fileIdFile, truncate, recordSize, isNew) {
        result := ComCall(4, this, "ptr", mapping, "ptr", fileIdFile, "int", truncate, "uint", recordSize, "int*", isNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} isValid 
     * @returns {HRESULT} 
     */
    CloseTable(isValid) {
        result := ComCall(5, this, "int", isValid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SimilarityFileId>} similarityFileId 
     * @param {Pointer<SimilarityData>} similarityData 
     * @returns {HRESULT} 
     */
    Append(similarityFileId, similarityData) {
        result := ComCall(6, this, "ptr", similarityFileId, "ptr", similarityData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SimilarityData>} similarityData 
     * @param {Integer} numberOfMatchesRequired 
     * @param {Integer} resultsSize 
     * @param {Pointer<IFindSimilarResults>} findSimilarResults 
     * @returns {HRESULT} 
     */
    FindSimilarFileId(similarityData, numberOfMatchesRequired, resultsSize, findSimilarResults) {
        result := ComCall(7, this, "ptr", similarityData, "ushort", numberOfMatchesRequired, "uint", resultsSize, "ptr", findSimilarResults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISimilarity>} newSimilarityTables 
     * @param {Pointer<ISimilarityReportProgress>} reportProgress 
     * @returns {HRESULT} 
     */
    CopyAndSwap(newSimilarityTables, reportProgress) {
        result := ComCall(8, this, "ptr", newSimilarityTables, "ptr", reportProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} recordCount 
     * @returns {HRESULT} 
     */
    GetRecordCount(recordCount) {
        result := ComCall(9, this, "uint*", recordCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
