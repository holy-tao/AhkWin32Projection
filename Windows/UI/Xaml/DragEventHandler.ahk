#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle the [DragEnter](uielement_dragenter.md), [DragLeave](uielement_dragleave.md), [DragOver](uielement_dragover.md), and [Drop](uielement_drop.md) events of a [UIElement](uielement.md).
 * @remarks
 * DragEventHandler is the delegate you implement to handle these events:
 * + [UIElement.DragEnter](uielement_drop.md)
 * + [UIElement.DragLeave](uielement_dragleave.md)
 * + [UIElement.DragOver](uielement_dragover.md)
 * + [UIElement.Drop](uielement_drop.md)
 * These events are routed events. Changing the value of the [Handled](drageventargs_handled.md) property of [DragEventArgs](drageventargs.md) from an event handler can influence how a routed event behaves. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
 * 
 * The [Control](../windows.ui.xaml.controls/control.md) class has pre-wired event handlers that [Control](../windows.ui.xaml.controls/control.md) derived types can override to provide class-based handling for the drag-drop events,. These methods are:
 * + [Control.OnDragEnter](../windows.ui.xaml.controls/control_ondragenter_196818472.md)
 * + [Control.OnDragLeave](../windows.ui.xaml.controls/control_ondragleave_545548419.md)
 * + [Control.OnDragOver](../windows.ui.xaml.controls/control_ondragover_783114431.md)
 * + [Control.OnDrop](../windows.ui.xaml.controls/control_ondrop_1015747496.md)
 * 
 * 
 * The Windows Runtime implementation of drag-drop concepts permits only certain controls and input actions to initiate a drag-drop action. There is no generalized **DoDragDrop** method that would permit any UI element to initiate a drag-drop action. The main source of a drag-drop action is when you drag the items of a list such as [GridView](../windows.ui.xaml.controls/gridview.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.drageventhandler
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DragEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DragEventHandler
     * @type {Guid}
     */
    static IID => Guid("{2ab1a205-1e73-4bcf-aabc-57b97e21961d}")

    /**
     * The class identifier for DragEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{2ab1a205-1e73-4bcf-aabc-57b97e21961d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {IInspectable} sender 
     * @param {DragEventArgs} e 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, e) {
        result := ComCall(3, this, "ptr", sender, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
