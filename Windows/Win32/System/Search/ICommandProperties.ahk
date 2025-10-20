#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICommandProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandProperties
     * @type {Guid}
     */
    static IID => Guid("{0c733a79-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "SetProperties"]

    /**
     * 
     * @param {Integer} cPropertyIDSets 
     * @param {Pointer<DBPROPIDSET>} rgPropertyIDSets 
     * @param {Pointer<Integer>} pcPropertySets 
     * @param {Pointer<Pointer<DBPROPSET>>} prgPropertySets 
     * @returns {HRESULT} 
     */
    GetProperties(cPropertyIDSets, rgPropertyIDSets, pcPropertySets, prgPropertySets) {
        result := ComCall(3, this, "uint", cPropertyIDSets, "ptr", rgPropertyIDSets, "uint*", pcPropertySets, "ptr*", prgPropertySets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {HRESULT} 
     */
    SetProperties(cPropertySets, rgPropertySets) {
        result := ComCall(4, this, "uint", cPropertySets, "ptr", rgPropertySets, "HRESULT")
        return result
    }
}
