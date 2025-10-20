#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUIEventingManager interface is implemented by the Ribbon framework and provides the notification functionality for applications that register for ribbon events.
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nn-uiribbon-iuieventingmanager
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class IUIEventingManager extends IUnknown{
    /**
     * The interface identifier for IUIEventingManager
     * @type {Guid}
     */
    static IID => Guid("{3be6ea7f-9a9b-4198-9368-9b0f923bd534}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUIEventLogger>} eventLogger 
     * @returns {HRESULT} 
     */
    SetEventLogger(eventLogger) {
        result := ComCall(3, this, "ptr", eventLogger, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
