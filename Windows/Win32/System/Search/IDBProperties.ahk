#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDBProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDBProperties
     * @type {Guid}
     */
    static IID => Guid("{0c733a8a-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetPropertyInfo", "SetProperties"]

    /**
     * 
     * @param {Integer} cPropertyIDSets 
     * @param {Pointer<DBPROPIDSET>} rgPropertyIDSets 
     * @param {Pointer<Integer>} pcPropertySets 
     * @param {Pointer<Pointer<DBPROPSET>>} prgPropertySets 
     * @returns {HRESULT} 
     */
    GetProperties(cPropertyIDSets, rgPropertyIDSets, pcPropertySets, prgPropertySets) {
        pcPropertySetsMarshal := pcPropertySets is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cPropertyIDSets, "ptr", rgPropertyIDSets, pcPropertySetsMarshal, pcPropertySets, "ptr*", prgPropertySets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cPropertyIDSets 
     * @param {Pointer<DBPROPIDSET>} rgPropertyIDSets 
     * @param {Pointer<Integer>} pcPropertyInfoSets 
     * @param {Pointer<Pointer<DBPROPINFOSET>>} prgPropertyInfoSets 
     * @param {Pointer<Pointer<Integer>>} ppDescBuffer 
     * @returns {HRESULT} 
     */
    GetPropertyInfo(cPropertyIDSets, rgPropertyIDSets, pcPropertyInfoSets, prgPropertyInfoSets, ppDescBuffer) {
        pcPropertyInfoSetsMarshal := pcPropertyInfoSets is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", cPropertyIDSets, "ptr", rgPropertyIDSets, pcPropertyInfoSetsMarshal, pcPropertyInfoSets, "ptr*", prgPropertyInfoSets, "ptr*", ppDescBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {HRESULT} 
     */
    SetProperties(cPropertySets, rgPropertySets) {
        result := ComCall(5, this, "uint", cPropertySets, "ptr", rgPropertySets, "HRESULT")
        return result
    }
}
