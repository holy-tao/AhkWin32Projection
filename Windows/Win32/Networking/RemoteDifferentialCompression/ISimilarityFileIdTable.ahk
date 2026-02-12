#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SimilarityFileId.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for storing and retrieving similarity file ID information.
 * @see https://learn.microsoft.com/windows/win32/api//content/msrdc/nn-msrdc-isimilarityfileidtable
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class ISimilarityFileIdTable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISimilarityFileIdTable
     * @type {Guid}
     */
    static IID => Guid("{96236a7f-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for SimilarityFileIdTable
     * @type {Guid}
     */
    static CLSID => Guid("{96236a90-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTable", "CreateTableIndirect", "CloseTable", "Append", "Lookup", "Invalidate", "GetRecordCount"]

    /**
     * Creates or opens a similarity file ID table.
     * @remarks
     * If an existing table is being opened, the table must be valid, and the value of the <i>recordSize</i> parameter must match  the record size of the existing table.  Otherwise, the existing table is overwritten, even if <b>FALSE</b> is specified for the <i>truncate</i> parameter.
     * @param {PWSTR} path_ A pointer to a null-terminated string that specifies the name of the file that will contain the similarity file ID table. The alternate stream name ":FileId" will be appended to the end of this file name. For more information, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-file">Naming a File</a>.
     * @param {BOOL} truncate <b>TRUE</b> if a new similarity file ID table should always be created or truncated. If <b>FALSE</b> is specified and the table exists and is valid, it may be used; otherwise, if the table is not valid or does not exist, the existing table is overwritten.
     * @param {Pointer<Integer>} securityDescriptor_ A pointer to a  security descriptor to use when opening the file. If this parameter is <b>NULL</b>, the file is assigned a default security descriptor. The access control lists (ACL) in the file's default security descriptor are inherited from the file's parent directory. For more information, see the <i>lpSecurityAttributes</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.
     * @param {Integer} recordSize The size, in bytes, of the file IDs that will be stored in the similarity file ID table. All file IDs must be the same size. The valid range is from <b>SimilarityFileIdMinSize</b> to <b>SimilarityFileIdMaxSize</b>. If an existing similarity file ID table is being opened, the value of this parameter must match the file ID size of the existing table. Otherwise, the existing table is assumed to be not valid and will be overwritten.
     * @returns {Integer} A pointer to a variable that receives an  <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdccreatedtables">RdcCreatedTables</a> enumeration value that describes the state of the similarity file ID table. If a new table is created, this variable receives <b>RDCTABLE_New</b>. If an existing table is used, this variable receives <b>RDCTABLE_Existing</b>. If this method fails, this variable receives <b>RDCTABLE_InvalidOrUnknown</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/msrdc/nf-msrdc-isimilarityfileidtable-createtable
     */
    CreateTable(path_, truncate, securityDescriptor_, recordSize) {
        path_ := path_ is String ? StrPtr(path_) : path_

        securityDescriptor_Marshal := securityDescriptor_ is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", path_, "int", truncate, securityDescriptor_Marshal, securityDescriptor_, "uint", recordSize, "int*", &isNew := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isNew
    }

    /**
     * Creates or opens a similarity file ID table using the RDC application's implementation of the IRdcFileWriter interface.
     * @remarks
     * If an existing table is being opened, the table must be valid, and the value of the <i>recordSize</i> parameter must match  the record size of the existing table.  Otherwise, the existing table is overwritten, even if <b>FALSE</b> is specified for the <i>truncate</i> parameter.
     * @param {IRdcFileWriter} fileIdFile An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-irdcfilewriter">IRdcFileWriter</a> interface pointer initialized to 
     *       write the file ID table to the file.
     * @param {BOOL} truncate <b>TRUE</b> if a new similarity file ID table should always be created or truncated. If <b>FALSE</b> is specified and the table exists and is valid, it may be used; otherwise, if the table is not valid or does not exist, the existing table is overwritten.
     * @param {Integer} recordSize The size, in bytes, of the file IDs that will be stored in the similarity file ID table. All file IDs must be the same size. The valid range is from <b>SimilarityFileIdMinSize</b> to <b>SimilarityFileIdMaxSize</b>. If an existing similarity file ID table is being opened, the value of this parameter must match the file ID size of the existing table. Otherwise, the existing table is assumed to be not valid and will be overwritten.
     * @returns {Integer} A pointer to a variable that receives an  <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdccreatedtables">RdcCreatedTables</a> enumeration value that describes the state of the similarity file ID table. If a new table is created, this variable receives <b>RDCTABLE_New</b>. If an existing table is used, this variable receives <b>RDCTABLE_Existing</b>. If this method fails, this variable receives <b>RDCTABLE_InvalidOrUnknown</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/msrdc/nf-msrdc-isimilarityfileidtable-createtableindirect
     */
    CreateTableIndirect(fileIdFile, truncate, recordSize) {
        result := ComCall(4, this, "ptr", fileIdFile, "int", truncate, "uint", recordSize, "int*", &isNew := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isNew
    }

    /**
     * Closes a similarity file ID table.
     * @remarks
     * If <b>FALSE</b> is specified for the <i>isValid</i> parameter, only the table is deleted; the similarity file is not deleted. The caller is responsible for deleting the similarity file.
     * 
     * When the <b>CloseTable</b> method returns, the table is always closed, even if this method returns an error code.
     * @param {BOOL} isValid <b>FALSE</b> if the similarity file ID table should be deleted when it is closed; otherwise, <b>TRUE</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/msrdc/nf-msrdc-isimilarityfileidtable-closetable
     */
    CloseTable(isValid) {
        result := ComCall(5, this, "int", isValid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds the file ID to the similarity file ID table.
     * @remarks
     * If the <b>Append</b> method fails, the similarity file ID table is marked as corrupted and must be rebuilt.
     * @param {Pointer<SimilarityFileId>} similarityFileId_ The file ID to be added to the similarity file ID table.
     * @returns {Integer} A pointer to a variable that receives the file index for the file ID's entry in the similarity file ID table.
     * @see https://learn.microsoft.com/windows/win32/api//content/msrdc/nf-msrdc-isimilarityfileidtable-append
     */
    Append(similarityFileId_) {
        result := ComCall(6, this, "ptr", similarityFileId_, "uint*", &similarityFileIndex := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return similarityFileIndex
    }

    /**
     * Retrieves the file ID that corresponds to a given file index in the similarity file ID table.
     * @param {Integer} similarityFileIndex The file index that was previously returned for the file ID by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-isimilarityfileidtable-append">ISimilarityFileIdTable::Append</a> method.
     * @returns {SimilarityFileId} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msrdc/nf-msrdc-isimilarityfileidtable-lookup
     */
    Lookup(similarityFileIndex) {
        similarityFileId_ := SimilarityFileId()
        result := ComCall(7, this, "uint", similarityFileIndex, "ptr", similarityFileId_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return similarityFileId_
    }

    /**
     * Marks a file ID as not valid in the similarity file ID table.
     * @remarks
     * The file ID is marked as not valid by setting the contents of the corresponding  <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similarityfileid">SimilarityFileId</a> structure to all zeros. A file ID that is marked as not valid will not be included in the results that are returned by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-isimilarity-findsimilarfileid">ISimilarity::FindSimilarFileId</a> method.
     * @param {Integer} similarityFileIndex The index of the file ID's entry in the similarity file ID table.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/msrdc/nf-msrdc-isimilarityfileidtable-invalidate
     */
    Invalidate(similarityFileIndex) {
        result := ComCall(8, this, "uint", similarityFileIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the number of records that are stored in a similarity file ID table.
     * @returns {Integer} A pointer to a variable that receives the number of records.
     * @see https://learn.microsoft.com/windows/win32/api//content/msrdc/nf-msrdc-isimilarityfileidtable-getrecordcount
     */
    GetRecordCount() {
        result := ComCall(9, this, "uint*", &recordCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return recordCount
    }
}
