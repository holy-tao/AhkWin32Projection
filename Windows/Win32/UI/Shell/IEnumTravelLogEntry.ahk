#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumTravelLogEntry extends IUnknown{
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
     * 
     * @param {Integer} cElt 
     * @param {Pointer<ITravelLogEntry>} rgElt 
     * @param {Pointer<UInt32>} pcEltFetched 
     * @returns {HRESULT} 
     */
    Next(cElt, rgElt, pcEltFetched) {
        result := ComCall(3, this, "uint", cElt, "ptr", rgElt, "uint*", pcEltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cElt 
     * @returns {HRESULT} 
     */
    Skip(cElt) {
        result := ComCall(4, this, "uint", cElt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTravelLogEntry>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
