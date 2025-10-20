#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnAdviseText interface is implemented by a text service and used by the TSF manager to supply notifications when the text or lattice element in a context changes.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnadvisetext
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnAdviseText extends ITfFunction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFnAdviseText
     * @type {Guid}
     */
    static IID => Guid("{3527268b-7d53-4dd9-92b7-7296ae461249}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnTextUpdate", "OnLatticeUpdate"]

    /**
     * 
     * @param {ITfRange} pRange 
     * @param {PWSTR} pchText 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnadvisetext-ontextupdate
     */
    OnTextUpdate(pRange, pchText, cch) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(4, this, "ptr", pRange, "ptr", pchText, "int", cch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfRange} pRange 
     * @param {ITfLMLattice} pLattice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itffnadvisetext-onlatticeupdate
     */
    OnLatticeUpdate(pRange, pLattice) {
        result := ComCall(5, this, "ptr", pRange, "ptr", pLattice, "HRESULT")
        return result
    }
}
