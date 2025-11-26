#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to handle events that occur when the Microsoft UI Automation tree structure is changed.
 * @remarks
 * 
 * This interface is implemented by the application to handle events that it has subscribed to by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addstructurechangedeventhandler">AddStructureChangedEventHandler</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationstructurechangedeventhandler
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationStructureChangedEventHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationStructureChangedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{e81d1b4e-11c5-42f8-9754-e7036c79f054}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HandleStructureChangedEvent"]

    /**
     * Handles an event that is raised when the Microsoft UI Automation tree structure has changed.
     * @param {IUIAutomationElement} sender Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element that raised the event.
     * @param {Integer} changeType 
     * @param {Pointer<SAFEARRAY>} runtimeId Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * Receives the runtime identifier of the element. This parameter is used only when <i>changeType</i> is <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-structurechangetype">StructureChangeType_ChildRemoved</a>; it is <b>NULL</b> for all other structure-change events.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationstructurechangedeventhandler-handlestructurechangedevent
     */
    HandleStructureChangedEvent(sender, changeType, runtimeId) {
        result := ComCall(3, this, "ptr", sender, "int", changeType, "ptr", runtimeId, "HRESULT")
        return result
    }
}
