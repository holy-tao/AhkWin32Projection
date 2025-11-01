#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchQueryHits extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchQueryHits
     * @type {Guid}
     */
    static IID => Guid("{ed8ce7e0-106c-11ce-84e2-00aa004b9986}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "NextHitMoniker", "NextHitOffset"]

    /**
     * 
     * @param {IFilter} pflt 
     * @param {Integer} ulFlags 
     * @returns {Integer} 
     */
    Init(pflt, ulFlags) {
        result := ComCall(3, this, "ptr", pflt, "uint", ulFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcMnk 
     * @param {Pointer<Pointer<IMoniker>>} papMnk 
     * @returns {Integer} 
     */
    NextHitMoniker(pcMnk, papMnk) {
        result := ComCall(4, this, "uint*", pcMnk, "ptr*", papMnk, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcRegion 
     * @param {Pointer<Pointer<FILTERREGION>>} paRegion 
     * @returns {Integer} 
     */
    NextHitOffset(pcRegion, paRegion) {
        result := ComCall(5, this, "uint*", pcRegion, "ptr*", paRegion, "int")
        return result
    }
}
