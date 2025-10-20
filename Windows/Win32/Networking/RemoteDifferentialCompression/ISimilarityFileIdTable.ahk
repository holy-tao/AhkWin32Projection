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
     * @param {Pointer<IRdcFileWriter>} fileIdFile 
     * @param {BOOL} truncate 
     * @param {Integer} recordSize 
     * @param {Pointer<Int32>} isNew 
     * @returns {HRESULT} 
     */
    CreateTableIndirect(fileIdFile, truncate, recordSize, isNew) {
        result := ComCall(4, this, "ptr", fileIdFile, "int", truncate, "uint", recordSize, "int*", isNew, "int")
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
     * @param {Pointer<UInt32>} similarityFileIndex 
     * @returns {HRESULT} 
     */
    Append(similarityFileId, similarityFileIndex) {
        result := ComCall(6, this, "ptr", similarityFileId, "uint*", similarityFileIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} similarityFileIndex 
     * @param {Pointer<SimilarityFileId>} similarityFileId 
     * @returns {HRESULT} 
     */
    Lookup(similarityFileIndex, similarityFileId) {
        result := ComCall(7, this, "uint", similarityFileIndex, "ptr", similarityFileId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} similarityFileIndex 
     * @returns {HRESULT} 
     */
    Invalidate(similarityFileIndex) {
        result := ComCall(8, this, "uint", similarityFileIndex, "int")
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
