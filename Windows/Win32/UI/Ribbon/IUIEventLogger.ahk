#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUIEventLogger interface is implemented by the application and defines the ribbon events callback method.
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nn-uiribbon-iuieventlogger
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class IUIEventLogger extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIEventLogger
     * @type {Guid}
     */
    static IID => Guid("{ec3e1034-dbf4-41a1-95d5-03e0f1026e05}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnUIEvent"]

    /**
     * 
     * @param {Pointer<UI_EVENTPARAMS>} pEventParams 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuieventlogger-onuievent
     */
    OnUIEvent(pEventParams) {
        ComCall(3, this, "ptr", pEventParams)
    }
}
