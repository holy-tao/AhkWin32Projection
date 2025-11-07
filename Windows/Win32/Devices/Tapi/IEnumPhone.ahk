#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITPhone.ahk
#Include .\IEnumPhone.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumPhone interface provides COM-standard enumeration methods for the ITPhone interface. The ITAddress2::EnumeratePhones and ITTAPI2::EnumeratePhones methods return a pointer to IEnumPhone.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ienumphone
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IEnumPhone extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumPhone
     * @type {Guid}
     */
    static IID => Guid("{f15b7669-4780-4595-8c89-fb369c8cf7aa}")

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
     * @returns {ITPhone} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumphone-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &ppElements := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return ITPhone(ppElements)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumphone-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumphone-skip
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumPhone} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumphone-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumPhone(ppEnum)
    }
}
