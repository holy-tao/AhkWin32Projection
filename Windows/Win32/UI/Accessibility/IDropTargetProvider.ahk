#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables a Microsoft UI Automation element to describe itself as an element that can receive a drop of a dragged element as part of a UI Automation drag-and-drop operation.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-idroptargetprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IDropTargetProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDropTargetProvider
     * @type {Guid}
     */
    static IID => Guid("{bae82bfd-358a-481c-85a0-d8b4d90a5d61}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DropTargetEffect", "get_DropTargetEffects"]

    /**
     * @type {BSTR} 
     */
    DropTargetEffect {
        get => this.get_DropTargetEffect()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    DropTargetEffects {
        get => this.get_DropTargetEffects()
    }

    /**
     * Retrieves a localized string that describes the effect that happens when the user drops the grabbed element on this drop target.
     * @remarks
     * 
     * This property describes the default effect that happens when the user drops a grabbed element on a target, such as moving or copying the element.  This property can be a short string such as "move", or a longer one such as "insert into Main group".  The string is always localized.
     * 
     * If this property changes, the provider must notify clients by firing a <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_AutomationPropertyChangedEventId</a> event. 
     * 
     * 
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-idroptargetprovider-get_droptargeteffect
     */
    get_DropTargetEffect() {
        pRetVal := BSTR()
        result := ComCall(3, this, "ptr", pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves an array of localized strings that enumerate the full set of effects that can happen when the user drops a grabbed element on this drop target as part of a drag-and-drop operation.
     * @remarks
     * 
     * Some drag operations support a set of different drop effects. For example, a drag operation that is initiated with a right-click might display a menu of options for the action that occurs when the element is dropped.  To find out the set of effects that can happen when the grabbed element is dropped, a client can query the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-idragprovider-get_dropeffects">DropEffects</a> property of the dragged element.  This property can contain short strings such as "move", or longer ones such as "insert into Main group".  The strings are always localized.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-idroptargetprovider-get_droptargeteffects
     */
    get_DropTargetEffects() {
        result := ComCall(4, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}
