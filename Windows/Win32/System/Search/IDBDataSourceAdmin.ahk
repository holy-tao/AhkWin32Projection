#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDBDataSourceAdmin extends IUnknown{
    /**
     * The interface identifier for IDBDataSourceAdmin
     * @type {Guid}
     */
    static IID => Guid("{0c733a7a-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppDBSession 
     * @returns {HRESULT} 
     */
    CreateDataSource(cPropertySets, rgPropertySets, pUnkOuter, riid, ppDBSession) {
        result := ComCall(3, this, "uint", cPropertySets, "ptr", rgPropertySets, "ptr", pUnkOuter, "ptr", riid, "ptr", ppDBSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DestroyDataSource() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cPropertyIDSets 
     * @param {Pointer<DBPROPIDSET>} rgPropertyIDSets 
     * @param {Pointer<UInt32>} pcPropertyInfoSets 
     * @param {Pointer<DBPROPINFOSET>} prgPropertyInfoSets 
     * @param {Pointer<UInt16>} ppDescBuffer 
     * @returns {HRESULT} 
     */
    GetCreationProperties(cPropertyIDSets, rgPropertyIDSets, pcPropertyInfoSets, prgPropertyInfoSets, ppDescBuffer) {
        result := ComCall(5, this, "uint", cPropertyIDSets, "ptr", rgPropertyIDSets, "uint*", pcPropertyInfoSets, "ptr", prgPropertyInfoSets, "ushort*", ppDescBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {HRESULT} 
     */
    ModifyDataSource(cPropertySets, rgPropertySets) {
        result := ComCall(6, this, "uint", cPropertySets, "ptr", rgPropertySets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
