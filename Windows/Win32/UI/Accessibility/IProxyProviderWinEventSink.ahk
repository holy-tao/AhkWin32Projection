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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddAutomationPropertyChangedEvent", "AddAutomationEvent", "AddStructureChangedEvent"]

    /**
     * Raises a property-changed event.
     * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * A pointer to the provider for the element that will raise the event.
     * @param {Integer} id Type: <b>PROPERTYID</b>
     * 
     * The identifier of the property that is to be changed. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {VARIANT} newValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
     * 
     * The new value for the changed property.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iproxyproviderwineventsink-addautomationpropertychangedevent
     */
    AddAutomationPropertyChangedEvent(pProvider, id, newValue) {
        result := ComCall(3, this, "ptr", pProvider, "int", id, "ptr", newValue, "HRESULT")
        return result
    }

    /**
     * Raises a Microsoft UI Automation event.
     * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * A pointer to the provider for the element that will raise the event.
     * @param {Integer} id Type: <b>EVENTID</b>
     * 
     * The identifier of the event that will be raised. For a list of event identifiers, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iproxyproviderwineventsink-addautomationevent
     */
    AddAutomationEvent(pProvider, id) {
        result := ComCall(4, this, "ptr", pProvider, "int", id, "HRESULT")
        return result
    }

    /**
     * Raises an event to notify clients that the structure of the UI Automation tree has changed.
     * @param {IRawElementProviderSimple} pProvider Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * A pointer to the provider of the element that is raising the event.
     * @param {Integer} structureChangeType 
     * @param {Pointer<SAFEARRAY>} runtimeId Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * A pointer to the runtime identifiers of the elements that are affected. These IDs enable applications to identify elements that have been removed and are no longer represented by <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a> interfaces.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iproxyproviderwineventsink-addstructurechangedevent
     */
    AddStructureChangedEvent(pProvider, structureChangeType, runtimeId) {
        result := ComCall(5, this, "ptr", pProvider, "int", structureChangeType, "ptr", runtimeId, "HRESULT")
        return result
    }
}
