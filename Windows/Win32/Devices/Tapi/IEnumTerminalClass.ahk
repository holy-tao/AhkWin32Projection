#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTerminalClass.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumTerminalClass interface provides COM-standard enumeration methods to discover and use the dynamic terminal classes that are available. The ITTerminalSupport::EnumerateDynamicTerminalClasses method returns a pointer to this interface.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ienumterminalclass
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IEnumTerminalClass extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumTerminalClass
     * @type {Guid}
     */
    static IID => Guid("{ae269cf5-935e-11d0-835c-00aa003ccabd}")

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
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumterminalclass-next
     */
    Next(celt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        pElements := Guid()
        result := ComCall(3, this, "uint", celt, "ptr", pElements, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return pElements
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumterminalclass-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumterminalclass-skip
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumTerminalClass} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ienumterminalclass-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTerminalClass(ppEnum)
    }
}
