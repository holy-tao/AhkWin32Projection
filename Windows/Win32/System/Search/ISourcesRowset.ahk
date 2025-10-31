#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISourcesRowset extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISourcesRowset
     * @type {Guid}
     */
    static IID => Guid("{0c733a1e-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSourcesRowset"]

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgProperties 
     * @param {Pointer<IUnknown>} ppSourcesRowset 
     * @returns {HRESULT} 
     */
    GetSourcesRowset(pUnkOuter, riid, cPropertySets, rgProperties, ppSourcesRowset) {
        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", riid, "uint", cPropertySets, "ptr", rgProperties, "ptr*", ppSourcesRowset, "HRESULT")
        return result
    }
}
