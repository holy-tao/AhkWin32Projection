#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEnumBstr.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumBstr interface provides COM-standard methods to enumerate BSTR strings.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ienumbstr
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IEnumBstr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumBstr
     * @type {Guid}
     */
    static IID => Guid("{35372049-0bc6-11d2-a033-00c04fb6809f}")

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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumbstr-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        ppStrings := BSTR()
        result := ComCall(3, this, "uint", celt, "ptr", ppStrings, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return ppStrings
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumbstr-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumbstr-skip
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumBstr} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumbstr-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumBstr(ppEnum)
    }
}
