#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRow extends IUnknown{
    /**
     * The interface identifier for IRow
     * @type {Guid}
     */
    static IID => Guid("{0c733ab4-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer} cColumns 
     * @param {Pointer<DBCOLUMNACCESS>} rgColumns 
     * @returns {HRESULT} 
     */
    GetColumns(cColumns, rgColumns) {
        result := ComCall(3, this, "ptr", cColumns, "ptr", rgColumns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppRowset 
     * @param {Pointer<UIntPtr>} phRow 
     * @returns {HRESULT} 
     */
    GetSourceRowset(riid, ppRowset, phRow) {
        result := ComCall(4, this, "ptr", riid, "ptr", ppRowset, "ptr*", phRow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Pointer<DBID>} pColumnID 
     * @param {Pointer<Guid>} rguidColumnType 
     * @param {Integer} dwBindFlags 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    Open(pUnkOuter, pColumnID, rguidColumnType, dwBindFlags, riid, ppUnk) {
        result := ComCall(5, this, "ptr", pUnkOuter, "ptr", pColumnID, "ptr", rguidColumnType, "uint", dwBindFlags, "ptr", riid, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
