#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITTerminal.ahk
#Include .\ITCallInfo.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITToneTerminalEvent interface contains methods that retrieve the description of tone terminal events that have occurred.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-ittoneterminalevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITToneTerminalEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITToneTerminalEvent
     * @type {Guid}
     */
    static IID => Guid("{e6f56009-611f-4945-bbd2-2d0ce5612056}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Terminal", "get_Call", "get_Error"]

    /**
     * 
     * @returns {ITTerminal} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittoneterminalevent-get_terminal
     */
    get_Terminal() {
        result := ComCall(7, this, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }

    /**
     * 
     * @returns {ITCallInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittoneterminalevent-get_call
     */
    get_Call() {
        result := ComCall(8, this, "ptr*", &ppCall := 0, "HRESULT")
        return ITCallInfo(ppCall)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittoneterminalevent-get_error
     */
    get_Error() {
        result := ComCall(9, this, "int*", &phrErrorCode := 0, "HRESULT")
        return phrErrorCode
    }
}
