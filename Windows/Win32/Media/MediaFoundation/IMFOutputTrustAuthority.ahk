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
     * 
     * @param {Pointer<Int32>} pAction 
     * @returns {HRESULT} 
     */
    GetAction(pAction) {
        result := ComCall(3, this, "int*", pAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFOutputPolicy>} ppPolicy 
     * @param {Integer} nPolicy 
     * @param {Pointer<Byte>} ppbTicket 
     * @param {Pointer<UInt32>} pcbTicket 
     * @returns {HRESULT} 
     */
    SetPolicy(ppPolicy, nPolicy, ppbTicket, pcbTicket) {
        result := ComCall(4, this, "ptr", ppPolicy, "uint", nPolicy, "char*", ppbTicket, "uint*", pcbTicket, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
