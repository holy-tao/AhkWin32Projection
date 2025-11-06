#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTravelLogEntry.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumTravelLogEntry extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumTravelLogEntry
     * @type {Guid}
     */
    static IID => Guid("{7ebfdd85-ad18-11d3-a4c5-00c04f72d6b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} cElt 
     * @param {Pointer<ITravelLogEntry>} rgElt 
     * @param {Pointer<Integer>} pcEltFetched 
     * @returns {HRESULT} 
     */
    Next(cElt, rgElt, pcEltFetched) {
        pcEltFetchedMarshal := pcEltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cElt, "ptr*", rgElt, pcEltFetchedMarshal, pcEltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cElt 
     * @returns {HRESULT} 
     */
    Skip(cElt) {
        result := ComCall(4, this, "uint", cElt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumTravelLogEntry} 
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTravelLogEntry(ppEnum)
    }
}
