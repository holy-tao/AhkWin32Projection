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
     * Handles a WinEvent.
     * @param {Integer} idWinEvent Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The identifier of the incoming WinEvent. For a list of WinEvent IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">Event Constants</a>.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The handle of the window for which the WinEvent was fired. This should also be the window for which the proxy was created.
     * @param {Integer} idObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The object identifier (OBJID_*) of the accessible object associated with the event. For a list of object identifiers, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">Object Identifiers</a>.
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The child identifier of the element associated with the event, or <b>CHILDID_SELF</b> if the element is not a child.
     * @param {IProxyProviderWinEventSink} pSink Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iproxyproviderwineventsink">IProxyProviderWinEventSink</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iproxyproviderwineventsink">IProxyProviderWinEventSink</a> interface provided by the UI Automation core. Any event that the proxy needs to raise in response to the WinEvent being handled should be added to the sink.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iproxyproviderwineventhandler-respondtowinevent
     */
    RespondToWinEvent(idWinEvent, hwnd, idObject, idChild, pSink) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "uint", idWinEvent, "ptr", hwnd, "int", idObject, "int", idChild, "ptr", pSink, "HRESULT")
        return result
    }
}
