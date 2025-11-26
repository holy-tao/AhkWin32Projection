#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFindSimilarResults.ahk
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
     * Creates or opens a similarity traits table and a similarity file ID table.
     * @param {PWSTR} path A pointer to a null-terminated string that specifies the name of the file that will contain the tables. The similarity traits table and the similarity file ID table will be created in two alternate file streams of this file. For more information, see the <i>path</i> parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-isimilarityfileidtable-createtable">ISimilarityFileIdTable::CreateTable</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-isimilaritytraitstable-createtable">ISimilarityTraitsTable::CreateTable</a> methods.
     * @param {BOOL} truncate <b>TRUE</b> if a new similarity traits table and a new similarity file ID table should always be created or truncated. If <b>FALSE</b> is specified and these tables exist and are valid, they may be used; otherwise, if one of the tables is not valid or does not exist, any existing tables are overwritten.
     * @param {Pointer<Integer>} securityDescriptor A pointer to a  security descriptor to use when opening the file. If this parameter is <b>NULL</b>, the file is assigned a default security descriptor. The access control lists (ACL) in the file's default security descriptor are inherited from the file's parent directory. For more information, see the <i>lpSecurityAttributes</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.
     * @param {Integer} recordSize The size, in bytes, of each file ID to be stored in the similarity file id table. All similarity file IDs must be the same size. The valid range is from <b>SimilarityFileIdMinSize</b> to <b>SimilarityFileIdMaxSize</b>. If existing tables are being opened, the value of this parameter must match the file ID size of the existing similarity file ID table. Otherwise, the existing tables are assumed to be not valid and will be overwritten.
     * @returns {Integer} A pointer to  a variable that receives an  <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdccreatedtables">RdcCreatedTables</a> enumeration value that describes the state of the tables. If new tables are created, this variable receives <b>RDCTABLE_New</b>. If existing tables are used, this variable receives <b>RDCTABLE_Existing</b>. If this method fails, this variable receives <b>RDCTABLE_InvalidOrUnknown</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilarity-createtable
     */
    CreateTable(path, truncate, securityDescriptor, recordSize) {
        path := path is String ? StrPtr(path) : path

        securityDescriptorMarshal := securityDescriptor is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", path, "int", truncate, securityDescriptorMarshal, securityDescriptor, "uint", recordSize, "int*", &isNew := 0, "HRESULT")
        return isNew
    }

    /**
     * Creates or opens a similarity traits table and a similarity file ID table using the RDC application's implementations of the ISimilarityTraitsMapping and IRdcFileWriter interfaces.
     * @param {ISimilarityTraitsMapping} mapping An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-isimilaritytraitsmapping">ISimilarityTraitsMapping</a> interface pointer initialized to write the similarity traits table to the file.
     * @param {IRdcFileWriter} fileIdFile An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-irdcfilewriter">IRdcFileWriter</a> interface pointer initialized to 
     *       write the file ID table to the file.
     * @param {BOOL} truncate <b>TRUE</b> if a new similarity traits table and a new similarity file ID table should always be created or truncated. If <b>FALSE</b> is specified and these tables exist and are valid, they may be used; otherwise, if one of the tables is not valid or does not exist, any existing tables are overwritten.
     * @param {Integer} recordSize The size, in bytes, of each file ID to be stored in the similarity file ID table. All similarity file IDs must be the same size. The valid range is from <b>SimilarityFileIdMinSize</b> to <b>SimilarityFileIdMaxSize</b>. If existing tables are being opened, the value of this parameter must match the file ID size of the existing similarity file ID table. Otherwise, the existing tables are assumed to be not valid and will be overwritten.
     * @returns {Integer} A pointer to  a variable that receives an  <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdccreatedtables">RdcCreatedTables</a> enumeration value that describes the state of the tables. If new tables are created, this variable receives <b>RDCTABLE_New</b>. If existing tables are used, this variable receives <b>RDCTABLE_Existing</b>. If this method fails, this variable receives <b>RDCTABLE_InvalidOrUnknown</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilarity-createtableindirect
     */
    CreateTableIndirect(mapping, fileIdFile, truncate, recordSize) {
        result := ComCall(4, this, "ptr", mapping, "ptr", fileIdFile, "int", truncate, "uint", recordSize, "int*", &isNew := 0, "HRESULT")
        return isNew
    }

    /**
     * Closes the tables in a similarity file.
     * @param {BOOL} isValid <b>FALSE</b> if the similarity traits table and  similarity file ID table should be deleted when they are closed; otherwise, <b>TRUE</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilarity-closetable
     */
    CloseTable(isValid) {
        result := ComCall(5, this, "int", isValid, "HRESULT")
        return result
    }

    /**
     * Adds the file ID and similarity data information to the tables in the similarity file.
     * @param {Pointer<SimilarityFileId>} similarityFileId A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similarityfileid">SimilarityFileId</a> structure to be added to the similarity file ID table.
     * @param {Pointer<SimilarityData>} similarityData A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydata">SimilarityData</a> structure to be added to the similarity traits table.
     * @returns {HRESULT} Returns <b>S_OK</b> on success, or an error <b>HRESULT</b> on failure.
     * 
     * This method can also return the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilarity-append
     */
    Append(similarityFileId, similarityData) {
        result := ComCall(6, this, "ptr", similarityFileId, "ptr", similarityData, "HRESULT")
        return result
    }

    /**
     * Returns a list of files that are similar to a given file.
     * @param {Pointer<SimilarityData>} similarityData A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydata">SimilarityData</a> structure that contains similarity information for the file.
     * @param {Integer} numberOfMatchesRequired TBD
     * @param {Integer} resultsSize The number of file IDs that can be stored in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-ifindsimilarresults">IFindSimilarResults</a> object that the <i>findSimilarResults</i> parameter points to.
     * @returns {IFindSimilarResults} A pointer to a location that will receive the returned  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-ifindsimilarresults">IFindSimilarResults</a> interface pointer. The caller must release this interface when it is no longer needed.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilarity-findsimilarfileid
     */
    FindSimilarFileId(similarityData, numberOfMatchesRequired, resultsSize) {
        result := ComCall(7, this, "ptr", similarityData, "ushort", numberOfMatchesRequired, "uint", resultsSize, "ptr*", &findSimilarResults := 0, "HRESULT")
        return IFindSimilarResults(findSimilarResults)
    }

    /**
     * Creates copies of an existing similarity traits table and an existing similarity file ID table, swaps the internal pointers, and deletes the existing tables.
     * @param {ISimilarity} newSimilarityTables An optional pointer to a temporary <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-isimilarity">ISimilarity</a> object that is used to create temporary copies of the tables. Before calling the <b>CopyAndSwap</b> method, the caller must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-isimilarity-createtable">CreateTable</a> method to create the temporary tables. On return, the caller must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-isimilarity-closetable">CloseTable</a> method to close the temporary tables.
     * @param {ISimilarityReportProgress} reportProgress An optional pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-isimilarityreportprogress">ISimilarityReportProgress</a> object that will receive information on the progress of the copy-and-swap operation and allow the application to stop the copy operation. The caller must release this interface when it is no longer needed.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilarity-copyandswap
     */
    CopyAndSwap(newSimilarityTables, reportProgress) {
        result := ComCall(8, this, "ptr", newSimilarityTables, "ptr", reportProgress, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of records that are stored in the similarity file ID table in a similarity file.
     * @returns {Integer} A pointer to a variable that receives the number of records.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilarity-getrecordcount
     */
    GetRecordCount() {
        result := ComCall(9, this, "uint*", &recordCount := 0, "HRESULT")
        return recordCount
    }
}
