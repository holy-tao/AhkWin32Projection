#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCallHub.ahk
#Include .\IEnumCallHub.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumCallHub interface provides COM-standard enumeration methods for the ITCallHub interface. The ITTAPI::EnumerateCallHubs method returns a pointer to IEnumCallHub.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ienumcallhub
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IEnumCallHub extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumCallHub
     * @type {Guid}
     */
    static IID => Guid("{a3c15450-5b92-11d1-8f4e-00c04fb6809f}")

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
     * @returns {ITCallHub} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumcallhub-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &ppElements := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return ITCallHub(ppElements)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumcallhub-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumcallhub-skip
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumCallHub} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumcallhub-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumCallHub(ppEnum)
    }
}
