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
     * Gets property information from a name. This will return a DBID pointer in parameter ppPropId which now has to be freed by the caller and not by the callee (this class).
     * @param {PWSTR} wcsPropName The property name to look up.
     * @param {Pointer<Pointer<DBID>>} ppPropId The return Id of the property.
     * @param {Pointer<Integer>} pPropType The return type of the property.
     * @param {Pointer<Integer>} puiWidth The return property width.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nf-indexsrv-icolumnmapper-getpropinfofromname
     */
    GetPropInfoFromName(wcsPropName, ppPropId, pPropType, puiWidth) {
        wcsPropName := wcsPropName is String ? StrPtr(wcsPropName) : wcsPropName

        ppPropIdMarshal := ppPropId is VarRef ? "ptr*" : "ptr"
        pPropTypeMarshal := pPropType is VarRef ? "ushort*" : "ptr"
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", wcsPropName, ppPropIdMarshal, ppPropId, pPropTypeMarshal, pPropType, puiWidthMarshal, puiWidth, "HRESULT")
        return result
    }

    /**
     * Gets the property information from the DBID.
     * @param {Pointer<DBID>} pPropId Pointer to the property to look up.
     * @param {Pointer<Pointer<Integer>>} pwcsName The return property name.
     * @param {Pointer<Integer>} pPropType The return type of the property.
     * @param {Pointer<Integer>} puiWidth The return property width.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nf-indexsrv-icolumnmapper-getpropinfofromid
     */
    GetPropInfoFromId(pPropId, pwcsName, pPropType, puiWidth) {
        pwcsNameMarshal := pwcsName is VarRef ? "ptr*" : "ptr"
        pPropTypeMarshal := pPropType is VarRef ? "ushort*" : "ptr"
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pPropId, pwcsNameMarshal, pwcsName, pPropTypeMarshal, pPropType, puiWidthMarshal, puiWidth, "HRESULT")
        return result
    }

    /**
     * Gets the i-th entry from the list of properties.
     * @param {Integer} iEntry i-th entry to retrieve. Note that the entries are 0-based.
     * @param {Pointer<Pointer<Integer>>} pwcsName The return property name.
     * @param {Pointer<Pointer<DBID>>} ppPropId The Id of the property.
     * @param {Pointer<Integer>} pPropType The return type of the property.
     * @param {Pointer<Integer>} puiWidth The return property width.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nf-indexsrv-icolumnmapper-enumpropinfo
     */
    EnumPropInfo(iEntry, pwcsName, ppPropId, pPropType, puiWidth) {
        pwcsNameMarshal := pwcsName is VarRef ? "ptr*" : "ptr"
        ppPropIdMarshal := ppPropId is VarRef ? "ptr*" : "ptr"
        pPropTypeMarshal := pPropType is VarRef ? "ushort*" : "ptr"
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", iEntry, pwcsNameMarshal, pwcsName, ppPropIdMarshal, ppPropId, pPropTypeMarshal, pPropType, puiWidthMarshal, puiWidth, "HRESULT")
        return result
    }

    /**
     * Determines if the map is up to date.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//indexsrv/nf-indexsrv-icolumnmapper-ismapuptodate
     */
    IsMapUpToDate() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
