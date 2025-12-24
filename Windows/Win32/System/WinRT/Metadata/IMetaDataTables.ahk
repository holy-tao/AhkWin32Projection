#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Provides methods for the storage and retrieval of metadata information in tables.
 * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nn-rometadataapi-imetadatatables
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataTables extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMetaDataTables
     * @type {Guid}
     */
    static IID => Guid("{d8f579ab-402d-4b8e-82d9-5d63b1065c68}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStringHeapSize", "GetBlobHeapSize", "GetGuidHeapSize", "GetUserStringHeapSize", "GetNumTables", "GetTableIndex", "GetTableInfo", "GetColumnInfo", "GetCodedTokenInfo", "GetRow", "GetColumn", "GetString", "GetBlob", "GetGuid", "GetUserString", "GetNextString", "GetNextBlob", "GetNextGuid", "GetNextUserString"]

    /**
     * Gets the size, in bytes, of the string heap.
     * @param {Pointer<Integer>} pcbStrings A pointer to the size, in bytes, of the string heap.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getstringheapsize
     */
    GetStringHeapSize(pcbStrings) {
        pcbStringsMarshal := pcbStrings is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcbStringsMarshal, pcbStrings, "HRESULT")
        return result
    }

    /**
     * A pointer to a pointer to the binary data retrieved.
     * @param {Pointer<Integer>} pcbBlobs A pointer to the size, in bytes, of the BLOB heap.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getblobheapsize
     */
    GetBlobHeapSize(pcbBlobs) {
        pcbBlobsMarshal := pcbBlobs is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pcbBlobsMarshal, pcbBlobs, "HRESULT")
        return result
    }

    /**
     * Gets the size, in bytes, of the GUID heap.
     * @param {Pointer<Integer>} pcbGuids A pointer to the size, in bytes, of the GUID heap.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getguidheapsize
     */
    GetGuidHeapSize(pcbGuids) {
        pcbGuidsMarshal := pcbGuids is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pcbGuidsMarshal, pcbGuids, "HRESULT")
        return result
    }

    /**
     * Gets the size, in bytes, of the user string heap.
     * @param {Pointer<Integer>} pcbBlobs 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getuserstringheapsize
     */
    GetUserStringHeapSize(pcbBlobs) {
        pcbBlobsMarshal := pcbBlobs is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pcbBlobsMarshal, pcbBlobs, "HRESULT")
        return result
    }

    /**
     * Gets the number of tables in the scope of the current IMetaDataTables instance.
     * @param {Pointer<Integer>} pcTables A pointer to the number of tables in the current instance scope.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getnumtables
     */
    GetNumTables(pcTables) {
        pcTablesMarshal := pcTables is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pcTablesMarshal, pcTables, "HRESULT")
        return result
    }

    /**
     * Gets the index for the table referenced by the specified token.
     * @param {Integer} token The token that references the table.
     * @param {Pointer<Integer>} pixTbl A pointer to the returned index for the referenced table.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-gettableindex
     */
    GetTableIndex(token, pixTbl) {
        pixTblMarshal := pixTbl is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", token, pixTblMarshal, pixTbl, "HRESULT")
        return result
    }

    /**
     * Gets the name, row size, number of rows, number of columns, and key column index of the specified table.
     * @param {Integer} ixTbl The identifier of the table whose properties to return.
     * @param {Pointer<Integer>} pcbRow A pointer to the size, in bytes, of a table row.
     * @param {Pointer<Integer>} pcRows A pointer to the number of rows in the table.
     * @param {Pointer<Integer>} pcCols A pointer to the number of columns in the table.
     * @param {Pointer<Integer>} piKey A pointer to the index of the key column, or -1 if the table has no key column.
     * @param {Pointer<Pointer<Integer>>} ppName A pointer to a pointer to the table name.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-gettableinfo
     */
    GetTableInfo(ixTbl, pcbRow, pcRows, pcCols, piKey, ppName) {
        pcbRowMarshal := pcbRow is VarRef ? "uint*" : "ptr"
        pcRowsMarshal := pcRows is VarRef ? "uint*" : "ptr"
        pcColsMarshal := pcCols is VarRef ? "uint*" : "ptr"
        piKeyMarshal := piKey is VarRef ? "uint*" : "ptr"
        ppNameMarshal := ppName is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "uint", ixTbl, pcbRowMarshal, pcbRow, pcRowsMarshal, pcRows, pcColsMarshal, pcCols, piKeyMarshal, piKey, ppNameMarshal, ppName, "HRESULT")
        return result
    }

    /**
     * Gets data about the specified column in the specified table.
     * @param {Integer} ixTbl The index of the desired table.
     * @param {Integer} ixCol The index of the desired column.
     * @param {Pointer<Integer>} poCol A pointer to the offset of the column in the row.
     * @param {Pointer<Integer>} pcbCol A pointer to the size, in bytes, of the column.
     * @param {Pointer<Integer>} pType A pointer to the type of the values in the column.
     * @param {Pointer<Pointer<Integer>>} ppName A pointer to a pointer to the column name.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getcolumninfo
     */
    GetColumnInfo(ixTbl, ixCol, poCol, pcbCol, pType, ppName) {
        poColMarshal := poCol is VarRef ? "uint*" : "ptr"
        pcbColMarshal := pcbCol is VarRef ? "uint*" : "ptr"
        pTypeMarshal := pType is VarRef ? "uint*" : "ptr"
        ppNameMarshal := ppName is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "uint", ixTbl, "uint", ixCol, poColMarshal, poCol, pcbColMarshal, pcbCol, pTypeMarshal, pType, ppNameMarshal, ppName, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to an array of tokens associated with the specified row index.
     * @param {Integer} ixCdTkn The kind of coded token to return.
     * @param {Pointer<Integer>} pcTokens A pointer to the length of <i>ppTokens</i>.
     * @param {Pointer<Pointer<Integer>>} ppTokens A pointer to a pointer to an array that contains the list of returned tokens.
     * @param {Pointer<Pointer<Integer>>} ppName A pointer to a pointer to the name of the token at <i>ixCdTkn</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getcodedtokeninfo
     */
    GetCodedTokenInfo(ixCdTkn, pcTokens, ppTokens, ppName) {
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"
        ppTokensMarshal := ppTokens is VarRef ? "ptr*" : "ptr"
        ppNameMarshal := ppName is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "uint", ixCdTkn, pcTokensMarshal, pcTokens, ppTokensMarshal, ppTokens, ppNameMarshal, ppName, "HRESULT")
        return result
    }

    /**
     * Gets the row at the specified row index, in the table at the specified table index.
     * @param {Integer} ixTbl The index of the table from which the row will be retrieved.
     * @param {Integer} rid The index of the row to get.
     * @param {Pointer<Pointer<Void>>} ppRow A pointer to a pointer to the row.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getrow
     */
    GetRow(ixTbl, rid, ppRow) {
        ppRowMarshal := ppRow is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, "uint", ixTbl, "uint", rid, ppRowMarshal, ppRow, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the value contained in the cell of the specified column and row in the given table.
     * @param {Integer} ixTbl The index of the table.
     * @param {Integer} ixCol The index of the column in the table.
     * @param {Integer} rid The index of the row in the table.
     * @param {Pointer<Integer>} pVal A pointer to the value in the cell.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getcolumn
     */
    GetColumn(ixTbl, ixCol, rid, pVal) {
        pValMarshal := pVal is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", ixTbl, "uint", ixCol, "uint", rid, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * Gets the string at the specified index from the table column in the current reference scope.
     * @param {Integer} ixString The index at which to start to search for the next value.
     * @param {Pointer<Pointer<Integer>>} ppString A pointer to a pointer to the returned string value.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getstring
     */
    GetString(ixString, ppString) {
        ppStringMarshal := ppString is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, "uint", ixString, ppStringMarshal, ppString, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the binary large object (BLOB) at the specified column index.
     * @param {Integer} ixBlob The memory address from which to get <i>ppData</i>.
     * @param {Pointer<Integer>} pcbData A pointer to the size, in bytes, of <i>ppData</i>.
     * @param {Pointer<Pointer<Void>>} ppData A pointer to a pointer to the binary data retrieved.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getblob
     */
    GetBlob(ixBlob, pcbData, ppData) {
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"

        result := ComCall(15, this, "uint", ixBlob, pcbDataMarshal, pcbData, ppDataMarshal, ppData, "HRESULT")
        return result
    }

    /**
     * Gets a GUID from the row at the specified index.
     * @param {Integer} ixGuid The index of the row from which to get the GUID.
     * @param {Pointer<Pointer<Guid>>} ppGUID A pointer to a pointer to the GUID.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getguid
     */
    GetGuid(ixGuid, ppGUID) {
        ppGUIDMarshal := ppGUID is VarRef ? "ptr*" : "ptr"

        result := ComCall(16, this, "uint", ixGuid, ppGUIDMarshal, ppGUID, "HRESULT")
        return result
    }

    /**
     * Gets the hard-coded string at the specified index in the string column in the current scope.
     * @param {Integer} ixUserString The index value from which the hard-coded string will be retrieved.
     * @param {Pointer<Integer>} pcbData A pointer to the size of <i>ppData</i>.
     * @param {Pointer<Pointer<Void>>} ppData A pointer to a pointer to the returned string.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getuserstring
     */
    GetUserString(ixUserString, pcbData, ppData) {
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, "uint", ixUserString, pcbDataMarshal, pcbData, ppDataMarshal, ppData, "HRESULT")
        return result
    }

    /**
     * Gets the index of the next string in the current table column.
     * @param {Integer} ixString The index value from a string table column.
     * @param {Pointer<Integer>} pNext A pointer to the index of the next string in the column.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getnextstring
     */
    GetNextString(ixString, pNext) {
        pNextMarshal := pNext is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "uint", ixString, pNextMarshal, pNext, "HRESULT")
        return result
    }

    /**
     * Gets the index of the next binary large object (BLOB) in the table.
     * @param {Integer} ixBlob The index, as returned from a column of BLOBs.
     * @param {Pointer<Integer>} pNext A pointer to the index of the next BLOB.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getnextblob
     */
    GetNextBlob(ixBlob, pNext) {
        pNextMarshal := pNext is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "uint", ixBlob, pNextMarshal, pNext, "HRESULT")
        return result
    }

    /**
     * Gets the index of the next GUID value in the current table column.
     * @param {Integer} ixGuid The index value from a GUID table column.
     * @param {Pointer<Integer>} pNext A pointer to the index of the next GUID value.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getnextguid
     */
    GetNextGuid(ixGuid, pNext) {
        pNextMarshal := pNext is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "uint", ixGuid, pNextMarshal, pNext, "HRESULT")
        return result
    }

    /**
     * Gets the index of the row that contains the next hard-coded string in the current table column.
     * @param {Integer} ixUserString An index value from the current string column.
     * @param {Pointer<Integer>} pNext A pointer to the row index of the next string in the column.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables-getnextuserstring
     */
    GetNextUserString(ixUserString, pNext) {
        pNextMarshal := pNext is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "uint", ixUserString, pNextMarshal, pNext, "HRESULT")
        return result
    }
}
