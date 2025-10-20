#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for storing per-file similarity data and performing similarity lookups.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-isimilaritytraitstable
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class ISimilarityTraitsTable extends IUnknown{
    /**
     * The interface identifier for ISimilarityTraitsTable
     * @type {Guid}
     */
    static IID => Guid("{96236a7e-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for SimilarityTraitsTable
     * @type {Guid}
     */
    static CLSID => Guid("{96236a8f-9dbc-11da-9e3f-0011114ae311}")

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
     * @param {Pointer<Int32>} isNew 
     * @returns {HRESULT} 
     */
    CreateTable(path, truncate, securityDescriptor, isNew) {
        path := path is String ? StrPtr(path) : path

        result := ComCall(3, this, "ptr", path, "int", truncate, "char*", securityDescriptor, "int*", isNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISimilarityTraitsMapping>} mapping 
     * @param {BOOL} truncate 
     * @param {Pointer<Int32>} isNew 
     * @returns {HRESULT} 
     */
    CreateTableIndirect(mapping, truncate, isNew) {
        result := ComCall(4, this, "ptr", mapping, "int", truncate, "int*", isNew, "int")
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
     * @param {Pointer<SimilarityData>} data 
     * @param {Integer} fileIndex 
     * @returns {HRESULT} 
     */
    Append(data, fileIndex) {
        result := ComCall(6, this, "ptr", data, "uint", fileIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SimilarityData>} similarityData 
     * @param {Integer} numberOfMatchesRequired 
     * @param {Pointer<FindSimilarFileIndexResults>} findSimilarFileIndexResults 
     * @param {Integer} resultsSize 
     * @param {Pointer<UInt32>} resultsUsed 
     * @returns {HRESULT} 
     */
    FindSimilarFileIndex(similarityData, numberOfMatchesRequired, findSimilarFileIndexResults, resultsSize, resultsUsed) {
        result := ComCall(7, this, "ptr", similarityData, "ushort", numberOfMatchesRequired, "ptr", findSimilarFileIndexResults, "uint", resultsSize, "uint*", resultsUsed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISimilarityTableDumpState>} similarityTableDumpState 
     * @returns {HRESULT} 
     */
    BeginDump(similarityTableDumpState) {
        result := ComCall(8, this, "ptr", similarityTableDumpState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} fileIndex 
     * @returns {HRESULT} 
     */
    GetLastIndex(fileIndex) {
        result := ComCall(9, this, "uint*", fileIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
