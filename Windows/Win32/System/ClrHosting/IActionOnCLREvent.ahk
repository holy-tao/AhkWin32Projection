#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IActionOnCLREvent extends IUnknown{
    /**
     * The interface identifier for IActionOnCLREvent
     * @type {Guid}
     */
    static IID => Guid("{607be24b-d91b-4e28-a242-61871ce56e35}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} event 
     * @param {Pointer<Void>} data 
     * @returns {HRESULT} 
     */
    OnEvent(event, data) {
        result := ComCall(3, this, "int", event, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
