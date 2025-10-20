#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DataSource extends IUnknown{
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
     * 
     * @param {Pointer<UInt16>} bstrDM 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    getDataMember(bstrDM, riid, ppunk) {
        result := ComCall(3, this, "ushort*", bstrDM, "ptr", riid, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<UInt16>} pbstrDM 
     * @returns {HRESULT} 
     */
    getDataMemberName(lIndex, pbstrDM) {
        result := ComCall(4, this, "int", lIndex, "ushort*", pbstrDM, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    getDataMemberCount(plCount) {
        result := ComCall(5, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DataSourceListener>} pDSL 
     * @returns {HRESULT} 
     */
    addDataSourceListener(pDSL) {
        result := ComCall(6, this, "ptr", pDSL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DataSourceListener>} pDSL 
     * @returns {HRESULT} 
     */
    removeDataSourceListener(pDSL) {
        result := ComCall(7, this, "ptr", pDSL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
