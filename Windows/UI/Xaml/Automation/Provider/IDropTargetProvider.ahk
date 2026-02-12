#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables a Microsoft UI Automation element to describe itself as an element that can receive a drop of a dragged element as part of a drag-and-drop operation. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.DropTarget](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * A drop target reports the action if the user drops the dragged item on the peer's owner as drop target. These action results are called *effects*. The effects are descriptive strings, not visual effects in a UI and design sense. For more info on what this pattern is for, see [DropTarget Control Pattern](/windows/desktop/WinAuto/uiauto-implementingdroptarget).
 * 
 * IDropTargetProvider is implemented by the existing Windows Runtime automation peers for a [ListView](../windows.ui.xaml.controls/listview.md) or [GridView](../windows.ui.xaml.controls/gridview.md) ([ListViewAutomationPeer](../windows.ui.xaml.automation.peers/listviewautomationpeer.md), [GridViewAutomationPeer](../windows.ui.xaml.automation.peers/gridviewautomationpeer.md)). This supports the Windows Runtime scenario of dragging list items so that they can be reordered. There are a limited number of Windows Runtime classes that can be a drag source; these sources support the [IDragProvider](idragprovider.md) pattern for automation purposes.
 * 
 * Use [DropTargetPatternIdentifiers](../windows.ui.xaml.automation/droptargetpatternidentifiers.md) if you want to reference the IDropTargetProvider pattern properties from control code when you fire automation events or call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.idroptargetprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IDropTargetProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDropTargetProvider
     * @type {Guid}
     */
    static IID => Guid("{7a245bdd-b458-4fe0-98c8-aac89df56d61}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DropEffect", "get_DropEffects"]

    /**
     * Gets a string that indicates what will happen when the item is dropped.
     * @remarks
     * This property describes the default effect that happens when a grabbed element is dropped on a target, such as moving or copying the element. This property can be a short string such as "move", or a longer one such as "insert into Main group". The string is always localized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.idroptargetprovider.dropeffect
     * @type {HSTRING} 
     */
    DropEffect {
        get => this.get_DropEffect()
    }

    /**
     * Gets an array of strings that enumerates possible drop effects when this item is dropped.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.idroptargetprovider.dropeffects
     */
    DropEffects {
        get => this.get_DropEffects()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DropEffect() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_DropEffects(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
