#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables a Microsoft UI Automation element to describe itself as an element that can be dragged as part of a drag-and-drop operation. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.Drag](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * The **Drag** control pattern is used to support draggable controls, or controls with draggable items. For more info on what this pattern is for, see [Drag Control Pattern](/windows/desktop/WinAuto/uiauto-implementingdrag).
 * 
 * IDragProvider is implemented by the existing Windows Runtime automation peers for a [ListView](../windows.ui.xaml.controls/listview.md) item ([ListViewItemAutomationPeer](../windows.ui.xaml.automation.peers/listviewitemautomationpeer.md)) or [GridView](../windows.ui.xaml.controls/gridview.md) item ([GridViewItemAutomationPeer](../windows.ui.xaml.automation.peers/gridviewitemautomationpeer.md)). This supports the Windows Runtime scenario of dragging list items so that they can be reordered. The peer for the host view of the items ([ListViewAutomationPeer](../windows.ui.xaml.automation.peers/listviewautomationpeer.md) or [GridViewAutomationPeer](../windows.ui.xaml.automation.peers/gridviewautomationpeer.md)) support the [IDropTargetProvider](idroptargetprovider.md) pattern.
 * 
 * Use [DragPatternIdentifiers](../windows.ui.xaml.automation/dragpatternidentifiers.md) if you want to reference the IDragProvider pattern properties from control code when you fire automation events or call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.idragprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IDragProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDragProvider
     * @type {Guid}
     */
    static IID => Guid("{2e7786a9-7ffc-4f57-b965-1ef1f373f546}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsGrabbed", "get_DropEffect", "get_DropEffects", "GetGrabbedItems"]

    /**
     * Gets a value indicating whether an item is currently being dragged.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.idragprovider.isgrabbed
     * @type {Boolean} 
     */
    IsGrabbed {
        get => this.get_IsGrabbed()
    }

    /**
     * Gets a string that indicates what will happen when the item is dropped.
     * @remarks
     * This property describes the default effect that happens when a grabbed element is dropped on a target, such as moving or copying the element. This property is null if this element doesn't implement the source-only style of drag-and-drop; that is, if the drop target defines its own drop effects. This property can be a short string such as "move", or a longer one such as "insert into Main group". The string is always localized.
     * 
     * 
     * <!--I changed the tagging here because strings are normally in literal tags.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.idragprovider.dropeffect
     * @type {HSTRING} 
     */
    DropEffect {
        get => this.get_DropEffect()
    }

    /**
     * Gets an array of strings that enumerates possible drop effects when this item is dropped.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.idragprovider.dropeffects
     */
    DropEffects {
        get => this.get_DropEffects()
    }

    /**
     * Indicates whether the element has been grabbed as part of a drag-and-drop operation.
     * @remarks
     * If this property changes, the provider must notify clients by calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraiseautomationpropertychangedevent">UiaRaiseAutomationPropertyChangedEvent</a> and specifying a property identifier of <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-control-pattern-propids">UIA_DragIsGrabbedPropertyId</a> or <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-control-pattern-propids">UIA_DragDropEffectPropertyId</a>.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-idragprovider-get_isgrabbed
     */
    get_IsGrabbed() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves a localized string that indicates what happens when this element is dropped as part of a drag-drop operation.
     * @remarks
     * In the source-only style of UI Automation drag-and-drop, no elements implement the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingdroptarget">DropTarget</a> pattern.  To find out what effect dropping the dragged element will have, a client can query the <b>DropEffect</b> property of the dragged element.  This property can be a short string such as "move", or a longer one, such as "insert into Main group".  The string is always localized.
     * 
     * If this property changes, the provider must notify clients by calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraiseautomationpropertychangedevent">UiaRaiseAutomationPropertyChangedEvent</a> and specifying a property identifier of <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-control-pattern-propids">UIA_DragIsGrabbedPropertyId</a> or <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-control-pattern-propids">UIA_DragDropEffectPropertyId</a>.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-idragprovider-get_dropeffect
     */
    get_DropEffect() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves an array of localized strings that enumerate the full set of effects that can happen when this element is dropped as part of a drag-and-drop operation.
     * @remarks
     * Some drag operations support a set of different drop effects. For example, a drag operation initiated through a right-click might display a menu of options when the element is dropped.   In the source-only style of Microsoft UI Automation drag-and-drop, no elements implement the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingdroptarget">DropTarget</a> pattern.    To find out what effect dropping the dragged element will have, a client can query the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-idragprovider-get_dropeffect">DropEffect</a> property of the dragged element.  This property can be a short string such as "move", or a longer one, such as "insert into Main group".    The strings are always localized.
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-idragprovider-get_dropeffects
     */
    get_DropEffects(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the collection of elements that are being dragged as part of a drag operation.
     * @remarks
     * If the user is dragging multiple items, the items are represented by a single master element with an associated set of grabbed elements.  The master element raises the appropriate events, to avoid having a large set of duplicate events.  The client can call <b>GetGrabbedItems</b> to retrieve the full list of grabbed items.  The provider should allocate a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> of appropriate length and add the Component Object Model (COM) pointers of the elements that are part of the drag operation.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-idragprovider-getgrabbeditems
     */
    GetGrabbedItems(result_) {
        result := ComCall(9, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
