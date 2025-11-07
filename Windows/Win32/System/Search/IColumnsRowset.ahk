#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IColumnsRowset extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAvailableColumns", "GetColumnsRowset"]

    /**
     * 
     * @param {Pointer<Pointer>} pcOptColumns 
     * @param {Pointer<Pointer<DBID>>} prgOptColumns 
     * @returns {HRESULT} 
     */
    GetAvailableColumns(pcOptColumns, prgOptColumns) {
        pcOptColumnsMarshal := pcOptColumns is VarRef ? "ptr*" : "ptr"
        prgOptColumnsMarshal := prgOptColumns is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pcOptColumnsMarshal, pcOptColumns, prgOptColumnsMarshal, prgOptColumns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer} cOptColumns 
     * @param {Pointer<DBID>} rgOptColumns 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {IUnknown} 
     */
    GetColumnsRowset(pUnkOuter, cOptColumns, rgOptColumns, riid, cPropertySets, rgPropertySets) {
        result := ComCall(4, this, "ptr", pUnkOuter, "ptr", cOptColumns, "ptr", rgOptColumns, "ptr", riid, "uint", cPropertySets, "ptr", rgPropertySets, "ptr*", &ppColRowset := 0, "HRESULT")
        return IUnknown(ppColRowset)
    }
}
