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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropInfoFromName", "GetPropInfoFromId", "EnumPropInfo", "IsMapUpToDate"]

    /**
     * 
     * @param {PWSTR} wcsPropName 
     * @param {Pointer<Pointer<DBID>>} ppPropId 
     * @param {Pointer<Integer>} pPropType 
     * @param {Pointer<Integer>} puiWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-icolumnmapper-getpropinfofromname
     */
    GetPropInfoFromName(wcsPropName, ppPropId, pPropType, puiWidth) {
        wcsPropName := wcsPropName is String ? StrPtr(wcsPropName) : wcsPropName

        result := ComCall(3, this, "ptr", wcsPropName, "ptr*", ppPropId, "ushort*", pPropType, "uint*", puiWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DBID>} pPropId 
     * @param {Pointer<Pointer<Integer>>} pwcsName 
     * @param {Pointer<Integer>} pPropType 
     * @param {Pointer<Integer>} puiWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-icolumnmapper-getpropinfofromid
     */
    GetPropInfoFromId(pPropId, pwcsName, pPropType, puiWidth) {
        result := ComCall(4, this, "ptr", pPropId, "ptr*", pwcsName, "ushort*", pPropType, "uint*", puiWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iEntry 
     * @param {Pointer<Pointer<Integer>>} pwcsName 
     * @param {Pointer<Pointer<DBID>>} ppPropId 
     * @param {Pointer<Integer>} pPropType 
     * @param {Pointer<Integer>} puiWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-icolumnmapper-enumpropinfo
     */
    EnumPropInfo(iEntry, pwcsName, ppPropId, pPropType, puiWidth) {
        result := ComCall(5, this, "uint", iEntry, "ptr*", pwcsName, "ptr*", ppPropId, "ushort*", pPropType, "uint*", puiWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/indexsrv/nf-indexsrv-icolumnmapper-ismapuptodate
     */
    IsMapUpToDate() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
