#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DataSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DataSource
     * @type {Guid}
     */
    static IID => Guid("{7c0ffab3-cd84-11d0-949a-00a0c91110ed}")

    /**
     * The class identifier for DataSource
     * @type {Guid}
     */
    static CLSID => Guid("{7c0ffab3-cd84-11d0-949a-00a0c91110ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getDataMember", "getDataMemberName", "getDataMemberCount", "addDataSourceListener", "removeDataSourceListener"]

    /**
     * 
     * @param {Pointer<Integer>} bstrDM 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    getDataMember(bstrDM, riid, ppunk) {
        bstrDMMarshal := bstrDM is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, bstrDMMarshal, bstrDM, "ptr", riid, "ptr*", ppunk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<Pointer<Integer>>} pbstrDM 
     * @returns {HRESULT} 
     */
    getDataMemberName(lIndex, pbstrDM) {
        result := ComCall(4, this, "int", lIndex, "ptr*", pbstrDM, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     */
    getDataMemberCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {DataSourceListener} pDSL 
     * @returns {HRESULT} 
     */
    addDataSourceListener(pDSL) {
        result := ComCall(6, this, "ptr", pDSL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {DataSourceListener} pDSL 
     * @returns {HRESULT} 
     */
    removeDataSourceListener(pDSL) {
        result := ComCall(7, this, "ptr", pDSL, "HRESULT")
        return result
    }
}
