#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISimilarityTableDumpState.ahk
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
     * Creates or opens a similarity traits table.
     * @param {PWSTR} path A pointer to a null-terminated string that specifies the name of the file that will contain the similarity traits table. The alternate stream name ":Traits" will be appended to the end of this file name. For more information, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">Naming a File</a>.
     * @param {BOOL} truncate <b>TRUE</b> if a new similarity traits table should always be created or truncated. If <b>FALSE</b> is specified and the table exists and is valid, it may be used; otherwise, if the table is not valid or does not exist, the existing table is overwritten.
     * @param {Pointer<Integer>} securityDescriptor A pointer to a  security descriptor to use when opening the file. If this parameter is <b>NULL</b>, the file is assigned a default security descriptor. The access control lists (ACL) in the file's default security descriptor are inherited from the file's parent directory. For more information, see the <i>lpSecurityAttributes</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.
     * @returns {Integer} A pointer to a variable that receives an  <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdccreatedtables">RdcCreatedTables</a> enumeration value that describes the state of the similarity traits table. If a new table is created, this variable receives <b>RDCTABLE_New</b>. If an existing table is used, this variable receives <b>RDCTABLE_Existing</b>. If this method fails, this variable receives <b>RDCTABLE_InvalidOrUnknown</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitstable-createtable
     */
    CreateTable(path, truncate, securityDescriptor) {
        path := path is String ? StrPtr(path) : path

        securityDescriptorMarshal := securityDescriptor is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", path, "int", truncate, securityDescriptorMarshal, securityDescriptor, "int*", &isNew := 0, "HRESULT")
        return isNew
    }

    /**
     * Creates or opens a similarity traits table using the RDC application's implementation of the ISimilarityTraitsMapping interface.
     * @param {ISimilarityTraitsMapping} mapping An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-isimilaritytraitsmapping">ISimilarityTraitsMapping</a> interface pointer initialized to write the similarity traits table to the file.
     * @param {BOOL} truncate <b>TRUE</b> if a new similarity traits table should always be created or truncated. If <b>FALSE</b> is specified and the table exists and is valid, it may be used; otherwise, if the table is not valid or does not exist, the existing table is overwritten.
     * @returns {Integer} A pointer to a variable that receives an  <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdccreatedtables">RdcCreatedTables</a> enumeration value that describes the state of the similarity traits table. If a new table is created, this variable receives <b>RDCTABLE_New</b>. If an existing table is used, this variable receives <b>RDCTABLE_Existing</b>. If this method fails, this variable receives <b>RDCTABLE_InvalidOrUnknown</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitstable-createtableindirect
     */
    CreateTableIndirect(mapping, truncate) {
        result := ComCall(4, this, "ptr", mapping, "int", truncate, "int*", &isNew := 0, "HRESULT")
        return isNew
    }

    /**
     * Closes a similarity traits table.
     * @param {BOOL} isValid <b>FALSE</b> if the similarity traits table should be deleted when it is closed; otherwise, <b>TRUE</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitstable-closetable
     */
    CloseTable(isValid) {
        result := ComCall(5, this, "int", isValid, "HRESULT")
        return result
    }

    /**
     * Adds a SimilarityData structure to the similarity traits table.
     * @param {Pointer<SimilarityData>} data The <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydata">SimilarityData</a> structure to be added to the similarity traits table.
     * @param {Integer} fileIndex The index in the similarity traits table where the <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydata">SimilarityData</a> structure is to be inserted.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitstable-append
     */
    Append(data, fileIndex) {
        result := ComCall(6, this, "ptr", data, "uint", fileIndex, "HRESULT")
        return result
    }

    /**
     * Returns a list of files that are similar to a given file. The results in the list are sorted in order of similarity, beginning with the most similar file.
     * @param {Pointer<SimilarityData>} similarityData A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydata">SimilarityData</a> structure that contains similarity information for the file.
     * @param {Integer} numberOfMatchesRequired TBD
     * @param {Pointer<FindSimilarFileIndexResults>} findSimilarFileIndexResults A pointer to a buffer that receives an array of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-findsimilarfileindexresults">FindSimilarFileIndexResults</a> structures that contain the requested information.
     * @param {Integer} resultsSize The number of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-findsimilarfileindexresults">FindSimilarFileIndexResults</a> structures that can be stored in the buffer that the <i>findSimilarFileIndexResults</i> parameter points to.
     * @param {Pointer<Integer>} resultsUsed The number of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-findsimilarfileindexresults">FindSimilarFileIndexResults</a> structures that were returned in the buffer that the <i>findSimilarFileIndexResults</i> parameter points to.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitstable-findsimilarfileindex
     */
    FindSimilarFileIndex(similarityData, numberOfMatchesRequired, findSimilarFileIndexResults, resultsSize, resultsUsed) {
        resultsUsedMarshal := resultsUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", similarityData, "ushort", numberOfMatchesRequired, "ptr", findSimilarFileIndexResults, "uint", resultsSize, resultsUsedMarshal, resultsUsed, "HRESULT")
        return result
    }

    /**
     * Retrieves similarity data from the similarity traits table.
     * @returns {ISimilarityTableDumpState} An optional pointer to a location that will receive the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-isimilaritytabledumpstate">ISimilarityTableDumpState</a> interface pointer. The caller must release this interface when it is no longer needed.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitstable-begindump
     */
    BeginDump() {
        result := ComCall(8, this, "ptr*", &similarityTableDumpState := 0, "HRESULT")
        return ISimilarityTableDumpState(similarityTableDumpState)
    }

    /**
     * Retrieves the index of the last entry that was stored in the similarity traits table.
     * @returns {Integer} A pointer to a variable that receives the index of the last entry.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-isimilaritytraitstable-getlastindex
     */
    GetLastIndex() {
        result := ComCall(9, this, "uint*", &fileIndex := 0, "HRESULT")
        return fileIndex
    }
}
