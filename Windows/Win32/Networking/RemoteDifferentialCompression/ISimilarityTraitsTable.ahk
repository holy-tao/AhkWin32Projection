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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTable", "CreateTableIndirect", "CloseTable", "Append", "FindSimilarFileIndex", "BeginDump", "GetLastIndex"]

    /**
     * 
     * @param {PWSTR} path 
     * @param {BOOL} truncate 
     * @param {Pointer<Integer>} securityDescriptor 
     * @param {Pointer<Integer>} isNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitstable-createtable
     */
    CreateTable(path, truncate, securityDescriptor, isNew) {
        path := path is String ? StrPtr(path) : path

        securityDescriptorMarshal := securityDescriptor is VarRef ? "char*" : "ptr"
        isNewMarshal := isNew is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", path, "int", truncate, securityDescriptorMarshal, securityDescriptor, isNewMarshal, isNew, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISimilarityTraitsMapping} mapping 
     * @param {BOOL} truncate 
     * @param {Pointer<Integer>} isNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitstable-createtableindirect
     */
    CreateTableIndirect(mapping, truncate, isNew) {
        isNewMarshal := isNew is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", mapping, "int", truncate, isNewMarshal, isNew, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} isValid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitstable-closetable
     */
    CloseTable(isValid) {
        result := ComCall(5, this, "int", isValid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SimilarityData>} data 
     * @param {Integer} fileIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitstable-append
     */
    Append(data, fileIndex) {
        result := ComCall(6, this, "ptr", data, "uint", fileIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SimilarityData>} similarityData 
     * @param {Integer} numberOfMatchesRequired 
     * @param {Pointer<FindSimilarFileIndexResults>} findSimilarFileIndexResults 
     * @param {Integer} resultsSize 
     * @param {Pointer<Integer>} resultsUsed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitstable-findsimilarfileindex
     */
    FindSimilarFileIndex(similarityData, numberOfMatchesRequired, findSimilarFileIndexResults, resultsSize, resultsUsed) {
        resultsUsedMarshal := resultsUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", similarityData, "ushort", numberOfMatchesRequired, "ptr", findSimilarFileIndexResults, "uint", resultsSize, resultsUsedMarshal, resultsUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISimilarityTableDumpState>} similarityTableDumpState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitstable-begindump
     */
    BeginDump(similarityTableDumpState) {
        result := ComCall(8, this, "ptr*", similarityTableDumpState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} fileIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitstable-getlastindex
     */
    GetLastIndex(fileIndex) {
        fileIndexMarshal := fileIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, fileIndexMarshal, fileIndex, "HRESULT")
        return result
    }
}
