#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the collection of currently visible 802.11 ad hoc network interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//adhoc/nn-adhoc-ienumdot11adhocinterfaces
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class IEnumDot11AdHocInterfaces extends IUnknown{
    /**
     * The interface identifier for IEnumDot11AdHocInterfaces
     * @type {Guid}
     */
    static IID => Guid("{8f10cc2c-cf0d-42a0-acbe-e2de7007384d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cElt 
     * @param {Pointer<IDot11AdHocInterface>} rgElt 
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
     * @param {Pointer<IEnumDot11AdHocInterfaces>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
