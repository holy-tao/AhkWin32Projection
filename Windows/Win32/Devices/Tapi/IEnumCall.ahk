#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITCallInfo.ahk
#Include .\IEnumCall.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumCall interface provides COM-standard enumeration methods for the ITCallInfo interface. The ITCallHub::EnumerateCalls and ITAddress::EnumerateCalls methods return a pointer to IEnumCall.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ienumcall
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IEnumCall extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumCall
     * @type {Guid}
     */
    static IID => Guid("{ae269cf6-935e-11d0-835c-00aa003ccabd}")

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
     * @returns {ITCallInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumcall-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", &ppElements := 0, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return ITCallInfo(ppElements)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumcall-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumcall-skip
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumCall} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumcall-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumCall(ppEnum)
    }
}
