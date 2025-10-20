#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IColumnsRowset extends IUnknown{
    /**
     * The interface identifier for IColumnsRowset
     * @type {Guid}
     */
    static IID => Guid("{0c733a10-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UIntPtr>} pcOptColumns 
     * @param {Pointer<DBID>} prgOptColumns 
     * @returns {HRESULT} 
     */
    GetAvailableColumns(pcOptColumns, prgOptColumns) {
        result := ComCall(3, this, "ptr*", pcOptColumns, "ptr", prgOptColumns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Pointer} cOptColumns 
     * @param {Pointer<DBID>} rgOptColumns 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @param {Pointer<IUnknown>} ppColRowset 
     * @returns {HRESULT} 
     */
    GetColumnsRowset(pUnkOuter, cOptColumns, rgOptColumns, riid, cPropertySets, rgPropertySets, ppColRowset) {
        result := ComCall(4, this, "ptr", pUnkOuter, "ptr", cOptColumns, "ptr", rgOptColumns, "ptr", riid, "uint", cPropertySets, "ptr", rgPropertySets, "ptr", ppColRowset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
