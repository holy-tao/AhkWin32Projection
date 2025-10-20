#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods used by proxy providers to raise events.
 * @remarks
 * 
  * The <b>IProxyProviderWinEventSink</b> interface is provided by UIAutomationCore.dll when the framework calls the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iproxyproviderwineventhandler-respondtowinevent">IProxyProviderWinEventHandler::RespondToWinEvent</a> method. The framework stores the events added to the <b>IProxyProviderWinEventSink</b> object. When <b>IProxyProviderWinEventHandler::RespondToWinEvent</b> returns, the framework passes the events back to the client side, where the UI Automation events are actually fired.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iproxyproviderwineventsink
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IProxyProviderWinEventSink extends IUnknown{
    /**
     * The interface identifier for IProxyProviderWinEventSink
     * @type {Guid}
     */
    static IID => Guid("{4fd82b78-a43e-46ac-9803-0a6969c7c183}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IRawElementProviderSimple>} pProvider 
     * @param {Integer} id 
     * @param {VARIANT} newValue 
     * @returns {HRESULT} 
     */
    AddAutomationPropertyChangedEvent(pProvider, id, newValue) {
        result := ComCall(3, this, "ptr", pProvider, "int", id, "ptr", newValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRawElementProviderSimple>} pProvider 
     * @param {Integer} id 
     * @returns {HRESULT} 
     */
    AddAutomationEvent(pProvider, id) {
        result := ComCall(4, this, "ptr", pProvider, "int", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRawElementProviderSimple>} pProvider 
     * @param {Integer} structureChangeType 
     * @param {Pointer<SAFEARRAY>} runtimeId 
     * @returns {HRESULT} 
     */
    AddStructureChangedEvent(pProvider, structureChangeType, runtimeId) {
        result := ComCall(5, this, "ptr", pProvider, "int", structureChangeType, "ptr", runtimeId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
