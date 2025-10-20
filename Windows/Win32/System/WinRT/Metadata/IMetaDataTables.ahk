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
     * 
     * @param {Pointer<UInt32>} pcbStrings 
     * @returns {HRESULT} 
     */
    GetStringHeapSize(pcbStrings) {
        result := ComCall(3, this, "uint*", pcbStrings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbBlobs 
     * @returns {HRESULT} 
     */
    GetBlobHeapSize(pcbBlobs) {
        result := ComCall(4, this, "uint*", pcbBlobs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbGuids 
     * @returns {HRESULT} 
     */
    GetGuidHeapSize(pcbGuids) {
        result := ComCall(5, this, "uint*", pcbGuids, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbBlobs 
     * @returns {HRESULT} 
     */
    GetUserStringHeapSize(pcbBlobs) {
        result := ComCall(6, this, "uint*", pcbBlobs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcTables 
     * @returns {HRESULT} 
     */
    GetNumTables(pcTables) {
        result := ComCall(7, this, "uint*", pcTables, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} token 
     * @param {Pointer<UInt32>} pixTbl 
     * @returns {HRESULT} 
     */
    GetTableIndex(token, pixTbl) {
        result := ComCall(8, this, "uint", token, "uint*", pixTbl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ixTbl 
     * @param {Pointer<UInt32>} pcbRow 
     * @param {Pointer<UInt32>} pcRows 
     * @param {Pointer<UInt32>} pcCols 
     * @param {Pointer<UInt32>} piKey 
     * @param {Pointer<SByte>} ppName 
     * @returns {HRESULT} 
     */
    GetTableInfo(ixTbl, pcbRow, pcRows, pcCols, piKey, ppName) {
        result := ComCall(9, this, "uint", ixTbl, "uint*", pcbRow, "uint*", pcRows, "uint*", pcCols, "uint*", piKey, "char*", ppName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ixTbl 
     * @param {Integer} ixCol 
     * @param {Pointer<UInt32>} poCol 
     * @param {Pointer<UInt32>} pcbCol 
     * @param {Pointer<UInt32>} pType 
     * @param {Pointer<SByte>} ppName 
     * @returns {HRESULT} 
     */
    GetColumnInfo(ixTbl, ixCol, poCol, pcbCol, pType, ppName) {
        result := ComCall(10, this, "uint", ixTbl, "uint", ixCol, "uint*", poCol, "uint*", pcbCol, "uint*", pType, "char*", ppName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ixCdTkn 
     * @param {Pointer<UInt32>} pcTokens 
     * @param {Pointer<UInt32>} ppTokens 
     * @param {Pointer<SByte>} ppName 
     * @returns {HRESULT} 
     */
    GetCodedTokenInfo(ixCdTkn, pcTokens, ppTokens, ppName) {
        result := ComCall(11, this, "uint", ixCdTkn, "uint*", pcTokens, "uint*", ppTokens, "char*", ppName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ixTbl 
     * @param {Integer} rid 
     * @param {Pointer<Void>} ppRow 
     * @returns {HRESULT} 
     */
    GetRow(ixTbl, rid, ppRow) {
        result := ComCall(12, this, "uint", ixTbl, "uint", rid, "ptr", ppRow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ixTbl 
     * @param {Integer} ixCol 
     * @param {Integer} rid 
     * @param {Pointer<UInt32>} pVal 
     * @returns {HRESULT} 
     */
    GetColumn(ixTbl, ixCol, rid, pVal) {
        result := ComCall(13, this, "uint", ixTbl, "uint", ixCol, "uint", rid, "uint*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ixString 
     * @param {Pointer<SByte>} ppString 
     * @returns {HRESULT} 
     */
    GetString(ixString, ppString) {
        result := ComCall(14, this, "uint", ixString, "char*", ppString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ixBlob 
     * @param {Pointer<UInt32>} pcbData 
     * @param {Pointer<Void>} ppData 
     * @returns {HRESULT} 
     */
    GetBlob(ixBlob, pcbData, ppData) {
        result := ComCall(15, this, "uint", ixBlob, "uint*", pcbData, "ptr", ppData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ixGuid 
     * @param {Pointer<Guid>} ppGUID 
     * @returns {HRESULT} 
     */
    GetGuid(ixGuid, ppGUID) {
        result := ComCall(16, this, "uint", ixGuid, "ptr", ppGUID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ixUserString 
     * @param {Pointer<UInt32>} pcbData 
     * @param {Pointer<Void>} ppData 
     * @returns {HRESULT} 
     */
    GetUserString(ixUserString, pcbData, ppData) {
        result := ComCall(17, this, "uint", ixUserString, "uint*", pcbData, "ptr", ppData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ixString 
     * @param {Pointer<UInt32>} pNext 
     * @returns {HRESULT} 
     */
    GetNextString(ixString, pNext) {
        result := ComCall(18, this, "uint", ixString, "uint*", pNext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ixBlob 
     * @param {Pointer<UInt32>} pNext 
     * @returns {HRESULT} 
     */
    GetNextBlob(ixBlob, pNext) {
        result := ComCall(19, this, "uint", ixBlob, "uint*", pNext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ixGuid 
     * @param {Pointer<UInt32>} pNext 
     * @returns {HRESULT} 
     */
    GetNextGuid(ixGuid, pNext) {
        result := ComCall(20, this, "uint", ixGuid, "uint*", pNext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ixUserString 
     * @param {Pointer<UInt32>} pNext 
     * @returns {HRESULT} 
     */
    GetNextUserString(ixUserString, pNext) {
        result := ComCall(21, this, "uint", ixUserString, "uint*", pNext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
