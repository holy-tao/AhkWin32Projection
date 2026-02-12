#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RoutedEventArgs.ahk
#Include .\IDragEventArgs.ahk
#Include .\IDragEventArgs2.ahk
#Include .\IDragEventArgs3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for drag-and-drop events.
 * @remarks
 * DragEventArgs is used as event data for these events:
 * 
 * + [UIElement.DragEnter](uielement_drop.md)
 * + [UIElement.DragLeave](uielement_dragleave.md)
 * + [UIElement.DragOver](uielement_dragover.md)
 * + [UIElement.Drop](uielement_drop.md)
 * 
 * These events are routed events. Changing the value of the [Handled](drageventargs_handled.md) property of DragEventArgs from an event handler can influence how a routed event behaves. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
 * 
 * The [Control](../windows.ui.xaml.controls/control.md) class has pre-wired event handlers that [Control](../windows.ui.xaml.controls/control.md) derived types can override to provide class-based handling for the drag-drop events, and these methods also use DragEventArgs as a parameter. These methods are:
 * 
 * + [Control.OnDragEnter](../windows.ui.xaml.controls/control_ondragenter_196818472.md)
 * + [Control.OnDragLeave](../windows.ui.xaml.controls/control_ondragleave_545548419.md)
 * + [Control.OnDragOver](../windows.ui.xaml.controls/control_ondragover_783114431.md)
 * + [Control.OnDrop](../windows.ui.xaml.controls/control_ondrop_1015747496.md)
 * 
 * The Windows Runtime implementation of drag-drop concepts permits only certain controls and input actions to initiate a drag-drop action. There is no generalized **DoDragDrop** method that would permit any UI element to initiate a drag-drop action. The main source of a drag-drop action is when you drag the items of a list such as [GridView](../windows.ui.xaml.controls/gridview.md). For a list item drag-drop action, the [Data](drageventargs_data.md) value in event data can potentially be modified from the control-defined default data about the item. This is done by handling the [DragItemsStarting](../windows.ui.xaml.controls/listviewbase_dragitemsstarting.md) event, and working with the [DataPackage](../windows.applicationmodel.datatransfer/datapackage.md) object that is obtained from the [DragItemsStartingEventArgs.Data](../windows.ui.xaml.controls/dragitemsstartingeventargs_data.md) property in the event data.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.drageventargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DragEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDragEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDragEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates the present state of the event handling for a routed event as it travels the route.
     * @remarks
     * The events that use [DragEventArgs](drageventargs.md) for event data are routed events. Setting the value of the Handled property to **true** from an event handler can influence how a routed event behaves: it prevents handlers further along the route from being invoked. However, a handler that was attached by calling [AddHandler](uielement_addhandler_2121467075.md) with *handledEventsToo* is still invoked. For more info on the routed event concept, see [Events and routed events overview](/windows/uwp/xaml-platform/events-and-routed-events-overview).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.drageventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets or sets a data object ([DataPackage](../windows.applicationmodel.datatransfer/datapackage.md)) that contains the data associated with the corresponding drag event. This value is not useful in all event cases; specifically, the event must be handled by a valid drop target.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.drageventargs.data
     * @type {DataPackage} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * Gets a read-only copy of the [Data](drageventargs_data.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.drageventargs.dataview
     * @type {DataPackageView} 
     */
    DataView {
        get => this.get_DataView()
    }

    /**
     * Gets the visual representation of the data being dragged.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.drageventargs.draguioverride
     * @type {DragUIOverride} 
     */
    DragUIOverride {
        get => this.get_DragUIOverride()
    }

    /**
     * Gets a flag enumeration indicating the current state of the SHIFT, CTRL, and ALT keys, as well as the state of the mouse buttons.
     * @remarks
     * The effect of a drag-and-drop operation can be adjusted depending on the state of a particular key. For example, data may either be copied or moved depending on whether the CTRL or SHIFT keys are pressed during the drag-and-drop operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.drageventargs.modifiers
     * @type {Integer} 
     */
    Modifiers {
        get => this.get_Modifiers()
    }

    /**
     * Gets or sets a value that specifies which operations (none, move, copy, and/or link) can be accepted by the target of the drag event.
     * @remarks
     * This value is set in the [DragEnter](uielement_dragenter.md) or [DragOver](uielement_dragover.md) event of the `UIElement` that is a potential drop target of the drag and drop operation. It notifies the drag source of what operations it can accept, if any, for the [DataPackage](../windows.applicationmodel.datatransfer/datapackage.md) that is being dragged.
     * 
     * For more info about data operations, see the [DataPackageOperation](../windows.applicationmodel.datatransfer/datapackageoperation.md) enumeration.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.drageventargs.acceptedoperation
     * @type {Integer} 
     */
    AcceptedOperation {
        get => this.get_AcceptedOperation()
        set => this.put_AcceptedOperation(value)
    }

    /**
     * Gets a value that specifies which operations (none, move, copy, and/or link) are allowed by the source of the drag event.
     * @remarks
     * This value is set in the [UIElement.DragStarting](uielement_dragstarting.md) event handler via the [DragStartingEventArgs.AllowedOperations](dragstartingeventargs_allowedoperations.md) property. It can then be read from this property in the [DragEnter](uielement_dragenter.md) and [DragOver](uielement_dragover.md) events of the `UIElement` that is a potential drop target of the drag and drop operation. It notifies the target which data package operations (none, move, copy, and/or link) are allowed by the source.
     * 
     * For more info about the allowed data operations, see the [DataPackageOperation](../windows.applicationmodel.datatransfer/datapackageoperation.md) enumeration.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.drageventargs.allowedoperations
     * @type {Integer} 
     */
    AllowedOperations {
        get => this.get_AllowedOperations()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IDragEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragEventArgs := IDragEventArgs(outPtr)
        }

        return this.__IDragEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IDragEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragEventArgs := IDragEventArgs(outPtr)
        }

        return this.__IDragEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {DataPackage} 
     */
    get_Data() {
        if (!this.HasProp("__IDragEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragEventArgs := IDragEventArgs(outPtr)
        }

        return this.__IDragEventArgs.get_Data()
    }

    /**
     * 
     * @param {DataPackage} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if (!this.HasProp("__IDragEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragEventArgs := IDragEventArgs(outPtr)
        }

        return this.__IDragEventArgs.put_Data(value)
    }

    /**
     * Returns a drop point that is relative to a specified [UIElement](uielement.md).
     * @remarks
     * For drag-drop operations involving a UI container, you typically call GetPosition using a *relativeTo* reference to the object that is the *sender* of the event. This gives the relative position within the container.
     * 
     * If this [DragEventArgs](drageventargs.md) is associated with the [UIElement.Drop](uielement_drop.md) event, then the return value of GetPosition is the drop point.
     * @param {UIElement} relativeTo The [UIElement](uielement.md) for which to get a relative drop point.
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.drageventargs.getposition
     */
    GetPosition(relativeTo) {
        if (!this.HasProp("__IDragEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragEventArgs := IDragEventArgs(outPtr)
        }

        return this.__IDragEventArgs.GetPosition(relativeTo)
    }

    /**
     * 
     * @returns {DataPackageView} 
     */
    get_DataView() {
        if (!this.HasProp("__IDragEventArgs2")) {
            if ((queryResult := this.QueryInterface(IDragEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragEventArgs2 := IDragEventArgs2(outPtr)
        }

        return this.__IDragEventArgs2.get_DataView()
    }

    /**
     * 
     * @returns {DragUIOverride} 
     */
    get_DragUIOverride() {
        if (!this.HasProp("__IDragEventArgs2")) {
            if ((queryResult := this.QueryInterface(IDragEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragEventArgs2 := IDragEventArgs2(outPtr)
        }

        return this.__IDragEventArgs2.get_DragUIOverride()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Modifiers() {
        if (!this.HasProp("__IDragEventArgs2")) {
            if ((queryResult := this.QueryInterface(IDragEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragEventArgs2 := IDragEventArgs2(outPtr)
        }

        return this.__IDragEventArgs2.get_Modifiers()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AcceptedOperation() {
        if (!this.HasProp("__IDragEventArgs2")) {
            if ((queryResult := this.QueryInterface(IDragEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragEventArgs2 := IDragEventArgs2(outPtr)
        }

        return this.__IDragEventArgs2.get_AcceptedOperation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AcceptedOperation(value) {
        if (!this.HasProp("__IDragEventArgs2")) {
            if ((queryResult := this.QueryInterface(IDragEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragEventArgs2 := IDragEventArgs2(outPtr)
        }

        return this.__IDragEventArgs2.put_AcceptedOperation(value)
    }

    /**
     * Supports asynchronous drag-and-drop operations by creating and returning a [DragOperationDeferral](dragoperationdeferral.md) object.
     * @remarks
     * The GetDeferral method allows your app to call a function during a drag-and-drop operation, so that your app can asynchronously generate the [DataPackage](../windows.applicationmodel.datatransfer/datapackage.md) object for the target app.
     * 
     * 
     * <!--Same behavior as DataRequest.GetDeferral?-->
     * @returns {DragOperationDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.drageventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IDragEventArgs2")) {
            if ((queryResult := this.QueryInterface(IDragEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragEventArgs2 := IDragEventArgs2(outPtr)
        }

        return this.__IDragEventArgs2.GetDeferral()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedOperations() {
        if (!this.HasProp("__IDragEventArgs3")) {
            if ((queryResult := this.QueryInterface(IDragEventArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragEventArgs3 := IDragEventArgs3(outPtr)
        }

        return this.__IDragEventArgs3.get_AllowedOperations()
    }

;@endregion Instance Methods
}
