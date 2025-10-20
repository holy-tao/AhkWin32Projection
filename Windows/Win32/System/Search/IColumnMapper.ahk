#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Retrieves property information for file based queries.
 * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nn-indexsrv-icolumnmapper
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IColumnMapper extends IUnknown{
    /**
     * The interface identifier for IColumnMapper
     * @type {Guid}
     */
    static IID => Guid("{0b63e37a-9ccc-11d0-bcdb-00805fccce04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} wcsPropName 
     * @param {Pointer<DBID>} ppPropId 
     * @param {Pointer<UInt16>} pPropType 
     * @param {Pointer<UInt32>} puiWidth 
     * @returns {HRESULT} 
     */
    GetPropInfoFromName(wcsPropName, ppPropId, pPropType, puiWidth) {
        wcsPropName := wcsPropName is String ? StrPtr(wcsPropName) : wcsPropName

        result := ComCall(3, this, "ptr", wcsPropName, "ptr", ppPropId, "ushort*", pPropType, "uint*", puiWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pPropId 
     * @param {Pointer<UInt16>} pwcsName 
     * @param {Pointer<UInt16>} pPropType 
     * @param {Pointer<UInt32>} puiWidth 
     * @returns {HRESULT} 
     */
    GetPropInfoFromId(pPropId, pwcsName, pPropType, puiWidth) {
        result := ComCall(4, this, "ptr", pPropId, "ushort*", pwcsName, "ushort*", pPropType, "uint*", puiWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iEntry 
     * @param {Pointer<UInt16>} pwcsName 
     * @param {Pointer<DBID>} ppPropId 
     * @param {Pointer<UInt16>} pPropType 
     * @param {Pointer<UInt32>} puiWidth 
     * @returns {HRESULT} 
     */
    EnumPropInfo(iEntry, pwcsName, ppPropId, pPropType, puiWidth) {
        result := ComCall(5, this, "uint", iEntry, "ushort*", pwcsName, "ptr", ppPropId, "ushort*", pPropType, "uint*", puiWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsMapUpToDate() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
