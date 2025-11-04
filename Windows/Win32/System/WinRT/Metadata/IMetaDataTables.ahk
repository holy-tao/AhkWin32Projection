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
     * 
     * @param {Pointer<Integer>} pcbStrings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getstringheapsize
     */
    GetStringHeapSize(pcbStrings) {
        pcbStringsMarshal := pcbStrings is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcbStringsMarshal, pcbStrings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbBlobs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getblobheapsize
     */
    GetBlobHeapSize(pcbBlobs) {
        pcbBlobsMarshal := pcbBlobs is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pcbBlobsMarshal, pcbBlobs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbGuids 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getguidheapsize
     */
    GetGuidHeapSize(pcbGuids) {
        pcbGuidsMarshal := pcbGuids is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pcbGuidsMarshal, pcbGuids, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbBlobs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getuserstringheapsize
     */
    GetUserStringHeapSize(pcbBlobs) {
        pcbBlobsMarshal := pcbBlobs is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pcbBlobsMarshal, pcbBlobs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcTables 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getnumtables
     */
    GetNumTables(pcTables) {
        pcTablesMarshal := pcTables is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pcTablesMarshal, pcTables, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} token 
     * @param {Pointer<Integer>} pixTbl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-gettableindex
     */
    GetTableIndex(token, pixTbl) {
        pixTblMarshal := pixTbl is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", token, pixTblMarshal, pixTbl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ixTbl 
     * @param {Pointer<Integer>} pcbRow 
     * @param {Pointer<Integer>} pcRows 
     * @param {Pointer<Integer>} pcCols 
     * @param {Pointer<Integer>} piKey 
     * @param {Pointer<Pointer<Integer>>} ppName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-gettableinfo
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
     * 
     * @param {Integer} ixTbl 
     * @param {Integer} ixCol 
     * @param {Pointer<Integer>} poCol 
     * @param {Pointer<Integer>} pcbCol 
     * @param {Pointer<Integer>} pType 
     * @param {Pointer<Pointer<Integer>>} ppName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getcolumninfo
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
     * 
     * @param {Integer} ixCdTkn 
     * @param {Pointer<Integer>} pcTokens 
     * @param {Pointer<Pointer<Integer>>} ppTokens 
     * @param {Pointer<Pointer<Integer>>} ppName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getcodedtokeninfo
     */
    GetCodedTokenInfo(ixCdTkn, pcTokens, ppTokens, ppName) {
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"
        ppTokensMarshal := ppTokens is VarRef ? "ptr*" : "ptr"
        ppNameMarshal := ppName is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "uint", ixCdTkn, pcTokensMarshal, pcTokens, ppTokensMarshal, ppTokens, ppNameMarshal, ppName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ixTbl 
     * @param {Integer} rid 
     * @param {Pointer<Pointer<Void>>} ppRow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getrow
     */
    GetRow(ixTbl, rid, ppRow) {
        ppRowMarshal := ppRow is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, "uint", ixTbl, "uint", rid, ppRowMarshal, ppRow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ixTbl 
     * @param {Integer} ixCol 
     * @param {Integer} rid 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getcolumn
     */
    GetColumn(ixTbl, ixCol, rid, pVal) {
        pValMarshal := pVal is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", ixTbl, "uint", ixCol, "uint", rid, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ixString 
     * @param {Pointer<Pointer<Integer>>} ppString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getstring
     */
    GetString(ixString, ppString) {
        ppStringMarshal := ppString is VarRef ? "ptr*" : "ptr"

        result := ComCall(14, this, "uint", ixString, ppStringMarshal, ppString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ixBlob 
     * @param {Pointer<Integer>} pcbData 
     * @param {Pointer<Pointer<Void>>} ppData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getblob
     */
    GetBlob(ixBlob, pcbData, ppData) {
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"

        result := ComCall(15, this, "uint", ixBlob, pcbDataMarshal, pcbData, ppDataMarshal, ppData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ixGuid 
     * @param {Pointer<Pointer<Guid>>} ppGUID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getguid
     */
    GetGuid(ixGuid, ppGUID) {
        ppGUIDMarshal := ppGUID is VarRef ? "ptr*" : "ptr"

        result := ComCall(16, this, "uint", ixGuid, ppGUIDMarshal, ppGUID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ixUserString 
     * @param {Pointer<Integer>} pcbData 
     * @param {Pointer<Pointer<Void>>} ppData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getuserstring
     */
    GetUserString(ixUserString, pcbData, ppData) {
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, "uint", ixUserString, pcbDataMarshal, pcbData, ppDataMarshal, ppData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ixString 
     * @param {Pointer<Integer>} pNext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getnextstring
     */
    GetNextString(ixString, pNext) {
        pNextMarshal := pNext is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "uint", ixString, pNextMarshal, pNext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ixBlob 
     * @param {Pointer<Integer>} pNext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getnextblob
     */
    GetNextBlob(ixBlob, pNext) {
        pNextMarshal := pNext is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "uint", ixBlob, pNextMarshal, pNext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ixGuid 
     * @param {Pointer<Integer>} pNext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getnextguid
     */
    GetNextGuid(ixGuid, pNext) {
        pNextMarshal := pNext is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "uint", ixGuid, pNextMarshal, pNext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ixUserString 
     * @param {Pointer<Integer>} pNext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables-getnextuserstring
     */
    GetNextUserString(ixUserString, pNext) {
        pNextMarshal := pNext is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "uint", ixUserString, pNextMarshal, pNext, "HRESULT")
        return result
    }
}
