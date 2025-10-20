#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that is implemented by proxy providers to handle WinEvents.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iproxyproviderwineventhandler
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IProxyProviderWinEventHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProxyProviderWinEventHandler
     * @type {Guid}
     */
    static IID => Guid("{89592ad4-f4e0-43d5-a3b6-bad7e111b435}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RespondToWinEvent"]

    /**
     * 
     * @param {Integer} idWinEvent 
     * @param {HWND} hwnd 
     * @param {Integer} idObject 
     * @param {Integer} idChild 
     * @param {IProxyProviderWinEventSink} pSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iproxyproviderwineventhandler-respondtowinevent
     */
    RespondToWinEvent(idWinEvent, hwnd, idObject, idChild, pSink) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "uint", idWinEvent, "ptr", hwnd, "int", idObject, "int", idChild, "ptr", pSink, "HRESULT")
        return result
    }
}
