#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITLocationInfo.ahk
#Include .\IEnumLocation.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumLocation interface provides COM-standard enumeration methods for the ITLocationInfo interface. The ITAddressTranslation::EnumerateLocations method returns a pointer to IEnumLocation.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ienumlocation
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IEnumLocation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumLocation
     * @type {Guid}
     */
    static IID => Guid("{0c4d8f01-8ddb-11d1-a09e-00805fc147d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Reset", "Skip", "Clone"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {ITLocationInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumlocation-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &ppElements := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return ITLocationInfo(ppElements)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumlocation-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumlocation-skip
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumLocation} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumlocation-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumLocation(ppEnum)
    }
}
