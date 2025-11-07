#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that are called to notify the root element of a fragment when a Microsoft UI Automation client application begins or ends listening for events on that fragment.
 * @remarks
 * 
 * Implementation of this interface is optional. It can be used to improve performance by raising events only when they are being listened for.
 * 	
 * 
 * Similar to implementing reference counting in Component Object Model (COM) programming, it is important for UI Automation providers to treat the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementprovideradviseevents-adviseeventadded">AdviseEventAdded</a> and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-irawelementprovideradviseevents-adviseeventremoved">AdviseEventRemoved</a> methods like the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> and <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> methods of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
 * As long as <b>AdviseEventAdded</b> has been called more times than <b>AdviseEventRemoved</b> for a specific event or property, the provider should continue to raise corresponding events, because some clients are still listening. Alternatively, UI Automation providers can use the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaclientsarelistening">UiaClientsAreListening</a> function to determine if at least one client is listening and, if so, raise all appropriate events.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-irawelementprovideradviseevents
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IRawElementProviderAdviseEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRawElementProviderAdviseEvents
     * @type {Guid}
     */
    static IID => Guid("{a407b27b-0f6d-4427-9292-473c7bf93258}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdviseEventAdded", "AdviseEventRemoved"]

    /**
     * 
     * @param {Integer} eventId 
     * @param {Pointer<SAFEARRAY>} propertyIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementprovideradviseevents-adviseeventadded
     */
    AdviseEventAdded(eventId, propertyIDs) {
        result := ComCall(3, this, "int", eventId, "ptr", propertyIDs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eventId 
     * @param {Pointer<SAFEARRAY>} propertyIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementprovideradviseevents-adviseeventremoved
     */
    AdviseEventRemoved(eventId, propertyIDs) {
        result := ComCall(4, this, "int", eventId, "ptr", propertyIDs, "HRESULT")
        return result
    }
}
