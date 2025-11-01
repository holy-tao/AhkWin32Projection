#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for storing and retrieving similarity file ID information.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-isimilarityfileidtable
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
     * 
     * @param {PWSTR} path 
     * @param {BOOL} truncate 
     * @param {Pointer<Integer>} securityDescriptor 
     * @param {Integer} recordSize 
     * @param {Pointer<Integer>} isNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilarityfileidtable-createtable
     */
    CreateTable(path, truncate, securityDescriptor, recordSize, isNew) {
        path := path is String ? StrPtr(path) : path

        securityDescriptorMarshal := securityDescriptor is VarRef ? "char*" : "ptr"
        isNewMarshal := isNew is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", path, "int", truncate, securityDescriptorMarshal, securityDescriptor, "uint", recordSize, isNewMarshal, isNew, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRdcFileWriter} fileIdFile 
     * @param {BOOL} truncate 
     * @param {Integer} recordSize 
     * @param {Pointer<Integer>} isNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilarityfileidtable-createtableindirect
     */
    CreateTableIndirect(fileIdFile, truncate, recordSize, isNew) {
        isNewMarshal := isNew is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", fileIdFile, "int", truncate, "uint", recordSize, isNewMarshal, isNew, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} isValid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilarityfileidtable-closetable
     */
    CloseTable(isValid) {
        result := ComCall(5, this, "int", isValid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SimilarityFileId>} similarityFileId 
     * @param {Pointer<Integer>} similarityFileIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilarityfileidtable-append
     */
    Append(similarityFileId, similarityFileIndex) {
        similarityFileIndexMarshal := similarityFileIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", similarityFileId, similarityFileIndexMarshal, similarityFileIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} similarityFileIndex 
     * @param {Pointer<SimilarityFileId>} similarityFileId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilarityfileidtable-lookup
     */
    Lookup(similarityFileIndex, similarityFileId) {
        result := ComCall(7, this, "uint", similarityFileIndex, "ptr", similarityFileId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} similarityFileIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilarityfileidtable-invalidate
     */
    Invalidate(similarityFileIndex) {
        result := ComCall(8, this, "uint", similarityFileIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} recordCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilarityfileidtable-getrecordcount
     */
    GetRecordCount(recordCount) {
        recordCountMarshal := recordCount is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, recordCountMarshal, recordCount, "HRESULT")
        return result
    }
}
