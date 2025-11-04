#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Encapsulates the functionality of one or more output protection systems that a trusted output supports.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfoutputtrustauthority
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFOutputTrustAuthority extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFOutputTrustAuthority
     * @type {Guid}
     */
    static IID => Guid("{d19f8e94-b126-4446-890c-5dcb7ad71453}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAction", "SetPolicy"]

    /**
     * 
     * @param {Pointer<Integer>} pAction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfoutputtrustauthority-getaction
     */
    GetAction(pAction) {
        pActionMarshal := pAction is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pActionMarshal, pAction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFOutputPolicy>} ppPolicy 
     * @param {Integer} nPolicy 
     * @param {Pointer<Pointer<Integer>>} ppbTicket 
     * @param {Pointer<Integer>} pcbTicket 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfoutputtrustauthority-setpolicy
     */
    SetPolicy(ppPolicy, nPolicy, ppbTicket, pcbTicket) {
        ppbTicketMarshal := ppbTicket is VarRef ? "ptr*" : "ptr"
        pcbTicketMarshal := pcbTicket is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr*", ppPolicy, "uint", nPolicy, ppbTicketMarshal, ppbTicket, pcbTicketMarshal, pcbTicket, "HRESULT")
        return result
    }
}
