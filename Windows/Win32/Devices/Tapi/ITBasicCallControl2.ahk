#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITTerminal.ahk
#Include .\ITBasicCallControl.ahk

/**
 * The ITBasicCallControl2 interface is an extension of the ITBasicCallControl interface.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itbasiccallcontrol2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITBasicCallControl2 extends ITBasicCallControl{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITBasicCallControl2
     * @type {Guid}
     */
    static IID => Guid("{161a4a56-1e99-4b3f-a46a-168f38a5ee4c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestTerminal", "SelectTerminalOnCall", "UnselectTerminalOnCall"]

    /**
     * 
     * @param {BSTR} bstrTerminalClassGUID 
     * @param {Integer} lMediaType 
     * @param {Integer} Direction 
     * @returns {ITTerminal} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol2-requestterminal
     */
    RequestTerminal(bstrTerminalClassGUID, lMediaType, Direction) {
        bstrTerminalClassGUID := bstrTerminalClassGUID is String ? BSTR.Alloc(bstrTerminalClassGUID).Value : bstrTerminalClassGUID

        result := ComCall(25, this, "ptr", bstrTerminalClassGUID, "int", lMediaType, "int", Direction, "ptr*", &ppTerminal := 0, "HRESULT")
        return ITTerminal(ppTerminal)
    }

    /**
     * 
     * @param {ITTerminal} pTerminal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol2-selectterminaloncall
     */
    SelectTerminalOnCall(pTerminal) {
        result := ComCall(26, this, "ptr", pTerminal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITTerminal} pTerminal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol2-unselectterminaloncall
     */
    UnselectTerminalOnCall(pTerminal) {
        result := ComCall(27, this, "ptr", pTerminal, "HRESULT")
        return result
    }
}
