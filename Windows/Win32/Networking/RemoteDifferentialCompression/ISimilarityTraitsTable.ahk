#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISimilarityTableDumpState.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for storing per-file similarity data and performing similarity lookups.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/nn-msrdc-isimilaritytraitstable
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
     * Creates or opens a similarity traits table.
     * @remarks
     * If an existing similarity traits table is being opened, the table must be valid.  Otherwise, the existing table is overwritten, even if <b>FALSE</b> is specified for the <i>truncate</i> parameter.
     * @param {PWSTR} _path 
     * @param {BOOL} truncate <b>TRUE</b> if a new similarity traits table should always be created or truncated. If <b>FALSE</b> is specified and the table exists and is valid, it may be used; otherwise, if the table is not valid or does not exist, the existing table is overwritten.
     * @param {Pointer<Integer>} _securityDescriptor 
     * @returns {Integer} A pointer to a variable that receives an  <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdccreatedtables">RdcCreatedTables</a> enumeration value that describes the state of the similarity traits table. If a new table is created, this variable receives <b>RDCTABLE_New</b>. If an existing table is used, this variable receives <b>RDCTABLE_Existing</b>. If this method fails, this variable receives <b>RDCTABLE_InvalidOrUnknown</b>.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitstable-createtable
     */
    CreateTable(_path, truncate, _securityDescriptor) {
        _path := _path is String ? StrPtr(_path) : _path

        _securityDescriptorMarshal := _securityDescriptor is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", _path, "int", truncate, _securityDescriptorMarshal, _securityDescriptor, "int*", &isNew := 0, "HRESULT")
        return isNew
    }

    /**
     * Creates or opens a similarity traits table using the RDC application's implementation of the ISimilarityTraitsMapping interface.
     * @remarks
     * If an existing similarity traits table is being opened, the table must be valid.  Otherwise, the existing table is overwritten, even if <b>FALSE</b> is specified for the <i>truncate</i> parameter.
     * @param {ISimilarityTraitsMapping} mapping An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-isimilaritytraitsmapping">ISimilarityTraitsMapping</a> interface pointer initialized to write the similarity traits table to the file.
     * @param {BOOL} truncate <b>TRUE</b> if a new similarity traits table should always be created or truncated. If <b>FALSE</b> is specified and the table exists and is valid, it may be used; otherwise, if the table is not valid or does not exist, the existing table is overwritten.
     * @returns {Integer} A pointer to a variable that receives an  <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdccreatedtables">RdcCreatedTables</a> enumeration value that describes the state of the similarity traits table. If a new table is created, this variable receives <b>RDCTABLE_New</b>. If an existing table is used, this variable receives <b>RDCTABLE_Existing</b>. If this method fails, this variable receives <b>RDCTABLE_InvalidOrUnknown</b>.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitstable-createtableindirect
     */
    CreateTableIndirect(mapping, truncate) {
        result := ComCall(4, this, "ptr", mapping, "int", truncate, "int*", &isNew := 0, "HRESULT")
        return isNew
    }

    /**
     * Closes a similarity traits table.
     * @remarks
     * If <b>FALSE</b> is specified for the <i>isValid</i> parameter, only the table is deleted; the similarity file is not deleted. The caller is responsible for deleting the similarity file.
     * 
     * When the <b>CloseTable</b> method returns, the table is always closed, even if this method returns an error code.
     * @param {BOOL} isValid <b>FALSE</b> if the similarity traits table should be deleted when it is closed; otherwise, <b>TRUE</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitstable-closetable
     */
    CloseTable(isValid) {
        result := ComCall(5, this, "int", isValid, "HRESULT")
        return result
    }

    /**
     * Adds a SimilarityData structure to the similarity traits table.
     * @remarks
     * The application must supply <i>fileIndex</i> values that are greater than zero and are always increasing. Otherwise, this method returns the <b>E_INVALIDARG</b> error code.
     * @param {Pointer<SimilarityData>} data The <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydata">SimilarityData</a> structure to be added to the similarity traits table.
     * @param {Integer} fileIndex The index in the similarity traits table where the <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydata">SimilarityData</a> structure is to be inserted.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitstable-append
     */
    Append(data, fileIndex) {
        result := ComCall(6, this, "ptr", data, "uint", fileIndex, "HRESULT")
        return result
    }

    /**
     * Returns a list of files that are similar to a given file. The results in the list are sorted in order of similarity, beginning with the most similar file.
     * @remarks
     * The list of files that is returned in the <i>findSimilarFileIndexResults</i> parameter may include files that have been deleted.
     * @param {Pointer<SimilarityData>} _similarityData 
     * @param {Integer} numberOfMatchesRequired TBD
     * @param {Pointer<FindSimilarFileIndexResults>} _findSimilarFileIndexResults 
     * @param {Integer} resultsSize The number of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-findsimilarfileindexresults">FindSimilarFileIndexResults</a> structures that can be stored in the buffer that the <i>findSimilarFileIndexResults</i> parameter points to.
     * @param {Pointer<Integer>} resultsUsed The number of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-findsimilarfileindexresults">FindSimilarFileIndexResults</a> structures that were returned in the buffer that the <i>findSimilarFileIndexResults</i> parameter points to.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitstable-findsimilarfileindex
     */
    FindSimilarFileIndex(_similarityData, numberOfMatchesRequired, _findSimilarFileIndexResults, resultsSize, resultsUsed) {
        resultsUsedMarshal := resultsUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", _similarityData, "ushort", numberOfMatchesRequired, "ptr", _findSimilarFileIndexResults, "uint", resultsSize, resultsUsedMarshal, resultsUsed, "HRESULT")
        return result
    }

    /**
     * Retrieves similarity data from the similarity traits table.
     * @remarks
     * The <b>BeginDump</b> method is used for debugging and garbage collection. It returns an interface pointer to an iterator object that allows the application to efficiently dump all of the entries in the similarity traits table.
     * @returns {ISimilarityTableDumpState} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitstable-begindump
     */
    BeginDump() {
        result := ComCall(8, this, "ptr*", &_similarityTableDumpState := 0, "HRESULT")
        return ISimilarityTableDumpState(_similarityTableDumpState)
    }

    /**
     * Retrieves the index of the last entry that was stored in the similarity traits table.
     * @returns {Integer} A pointer to a variable that receives the index of the last entry.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitstable-getlastindex
     */
    GetLastIndex() {
        result := ComCall(9, this, "uint*", &fileIndex := 0, "HRESULT")
        return fileIndex
    }
}
