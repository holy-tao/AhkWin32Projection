#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumCallingCard interface provides COM-standard enumeration methods for the ITCallingCard interface. The ITAddressTranslation::EnumerateCallingCards method returns a pointer to IEnumCallingCard.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ienumcallingcard
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IEnumCallingCard extends IUnknown{
    /**
     * The interface identifier for IEnumCallingCard
     * @type {Guid}
     */
    static IID => Guid("{0c4d8f02-8ddb-11d1-a09e-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<ITCallingCard>} ppElements 
     * @param {Pointer<UInt32>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, ppElements, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr", ppElements, "uint*", pceltFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumCallingCard>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
