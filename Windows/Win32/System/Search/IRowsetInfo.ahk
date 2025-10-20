#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetInfo extends IUnknown{
    /**
     * The interface identifier for IRowsetInfo
     * @type {Guid}
     */
    static IID => Guid("{0c733a55-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cPropertyIDSets 
     * @param {Pointer<DBPROPIDSET>} rgPropertyIDSets 
     * @param {Pointer<UInt32>} pcPropertySets 
     * @param {Pointer<DBPROPSET>} prgPropertySets 
     * @returns {HRESULT} 
     */
    GetProperties(cPropertyIDSets, rgPropertyIDSets, pcPropertySets, prgPropertySets) {
        result := ComCall(3, this, "uint", cPropertyIDSets, "ptr", rgPropertyIDSets, "uint*", pcPropertySets, "ptr", prgPropertySets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} iOrdinal 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppReferencedRowset 
     * @returns {HRESULT} 
     */
    GetReferencedRowset(iOrdinal, riid, ppReferencedRowset) {
        result := ComCall(4, this, "ptr", iOrdinal, "ptr", riid, "ptr", ppReferencedRowset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppSpecification 
     * @returns {HRESULT} 
     */
    GetSpecification(riid, ppSpecification) {
        result := ComCall(5, this, "ptr", riid, "ptr", ppSpecification, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
