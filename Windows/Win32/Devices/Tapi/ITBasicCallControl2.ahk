#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITBasicCallControl.ahk

/**
 * The ITBasicCallControl2 interface is an extension of the ITBasicCallControl interface.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itbasiccallcontrol2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITBasicCallControl2 extends ITBasicCallControl{
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
     * 
     * @param {BSTR} bstrTerminalClassGUID 
     * @param {Integer} lMediaType 
     * @param {Integer} Direction 
     * @param {Pointer<ITTerminal>} ppTerminal 
     * @returns {HRESULT} 
     */
    RequestTerminal(bstrTerminalClassGUID, lMediaType, Direction, ppTerminal) {
        bstrTerminalClassGUID := bstrTerminalClassGUID is String ? BSTR.Alloc(bstrTerminalClassGUID).Value : bstrTerminalClassGUID

        result := ComCall(25, this, "ptr", bstrTerminalClassGUID, "int", lMediaType, "int", Direction, "ptr", ppTerminal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITTerminal>} pTerminal 
     * @returns {HRESULT} 
     */
    SelectTerminalOnCall(pTerminal) {
        result := ComCall(26, this, "ptr", pTerminal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITTerminal>} pTerminal 
     * @returns {HRESULT} 
     */
    UnselectTerminalOnCall(pTerminal) {
        result := ComCall(27, this, "ptr", pTerminal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
