#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnDeviceServiceStateEvents extends IUnknown{
    /**
     * The interface identifier for IMbnDeviceServiceStateEvents
     * @type {Guid}
     */
    static IID => Guid("{5d3ff196-89ee-49d8-8b60-33ffddffc58d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BSTR} interfaceID 
     * @param {Integer} stateChange 
     * @returns {HRESULT} 
     */
    OnSessionsStateChange(interfaceID, stateChange) {
        interfaceID := interfaceID is String ? BSTR.Alloc(interfaceID).Value : interfaceID

        result := ComCall(3, this, "ptr", interfaceID, "int", stateChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
