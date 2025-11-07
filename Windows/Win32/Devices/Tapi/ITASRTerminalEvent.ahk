#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITTerminal.ahk
#Include .\ITCallInfo.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITASRTerminalEvent interface contains methods that retrieve the description of Automatic Speech Recognition terminal events that have occurred.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itasrterminalevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITASRTerminalEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITASRTerminalEvent
     * @type {Guid}
     */
    static IID => Guid("{ee016a02-4fa9-467c-933f-5a15b12377d7}")

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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itasrterminalevent-get_terminal
     */
    get_Terminal() {
        result := ComCall(7, this, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }

    /**
     * 
     * @returns {ITCallInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itasrterminalevent-get_call
     */
    get_Call() {
        result := ComCall(8, this, "ptr*", &ppCall := 0, "HRESULT")
        return ITCallInfo(ppCall)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itasrterminalevent-get_error
     */
    get_Error() {
        result := ComCall(9, this, "int*", &phrErrorCode := 0, "HRESULT")
        return phrErrorCode
    }
}
