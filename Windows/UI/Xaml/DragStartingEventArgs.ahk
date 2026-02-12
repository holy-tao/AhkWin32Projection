#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RoutedEventArgs.ahk
#Include .\IDragStartingEventArgs.ahk
#Include .\IDragStartingEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event data for the [DragStarting](uielement_dragstarting.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dragstartingeventargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DragStartingEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDragStartingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDragStartingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the drag action should be canceled.
     * @remarks
     * Set this property to **true** in a handler in order to cancel a drag action.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dragstartingeventargs.cancel
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
    }

    /**
     * Gets the data payload associated with a drag action.
     * @remarks
     * In your [DragStarting](uielement_dragstarting.md) event handler, use the [DataPackage.SetData](../windows.applicationmodel.datatransfer/datapackage_setdata_2074524277.md) method to provide the data being dragged.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dragstartingeventargs.data
     * @type {DataPackage} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * Gets the visual representation of the data being dragged.
     * @remarks
     * <!--The value of this property is used only when the DragVisualOptions Enum option is not set to “UseDataFormat “. This is the visual that is set on the Drag Source side. The visual can be changed on the Target side during the Drag Enter and DragOver events.
     * If this property is set to Null, then the UIElement being dragged is used to as the DragVisual 
     * -->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dragstartingeventargs.dragui
     * @type {DragUI} 
     */
    DragUI {
        get => this.get_DragUI()
    }

    /**
     * Gets or sets a value that specifies which operations (none, move, copy, and/or link) are allowed by the source of the drag event.
     * @remarks
     * This value is set in the [UIElement.DragStarting](uielement_dragstarting.md) event handler. It can then be read from the [DragEventArgs.AllowedOperations](drageventargs_allowedoperations.md) property in the [DragEnter](uielement_dragenter.md) and [DragOver](uielement_dragover.md) events of the `UIElement` that is a potential drop target of the drag and drop operation. It notifies the target which data package operations (none, move, copy, and/or link) are allowed by the source.
     * 
     * For more info about the allowed data operations, see the [DataPackageOperation](../windows.applicationmodel.datatransfer/datapackageoperation.md) enumeration.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dragstartingeventargs.allowedoperations
     * @type {Integer} 
     */
    AllowedOperations {
        get => this.get_AllowedOperations()
        set => this.put_AllowedOperations(value)
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
    get_Cancel() {
        if (!this.HasProp("__IDragStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragStartingEventArgs := IDragStartingEventArgs(outPtr)
        }

        return this.__IDragStartingEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__IDragStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragStartingEventArgs := IDragStartingEventArgs(outPtr)
        }

        return this.__IDragStartingEventArgs.put_Cancel(value)
    }

    /**
     * 
     * @returns {DataPackage} 
     */
    get_Data() {
        if (!this.HasProp("__IDragStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragStartingEventArgs := IDragStartingEventArgs(outPtr)
        }

        return this.__IDragStartingEventArgs.get_Data()
    }

    /**
     * 
     * @returns {DragUI} 
     */
    get_DragUI() {
        if (!this.HasProp("__IDragStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragStartingEventArgs := IDragStartingEventArgs(outPtr)
        }

        return this.__IDragStartingEventArgs.get_DragUI()
    }

    /**
     * Supports asynchronous drag-and-drop operations by creating and returning a [DragOperationDeferral](dragoperationdeferral.md) object.
     * @returns {DragOperationDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dragstartingeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IDragStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragStartingEventArgs := IDragStartingEventArgs(outPtr)
        }

        return this.__IDragStartingEventArgs.GetDeferral()
    }

    /**
     * Returns a drop point that is relative to a specified [UIElement](uielement.md).
     * @param {UIElement} relativeTo The [UIElement](uielement.md) for which to get a relative drop point.
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dragstartingeventargs.getposition
     */
    GetPosition(relativeTo) {
        if (!this.HasProp("__IDragStartingEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragStartingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragStartingEventArgs := IDragStartingEventArgs(outPtr)
        }

        return this.__IDragStartingEventArgs.GetPosition(relativeTo)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllowedOperations() {
        if (!this.HasProp("__IDragStartingEventArgs2")) {
            if ((queryResult := this.QueryInterface(IDragStartingEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragStartingEventArgs2 := IDragStartingEventArgs2(outPtr)
        }

        return this.__IDragStartingEventArgs2.get_AllowedOperations()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AllowedOperations(value) {
        if (!this.HasProp("__IDragStartingEventArgs2")) {
            if ((queryResult := this.QueryInterface(IDragStartingEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragStartingEventArgs2 := IDragStartingEventArgs2(outPtr)
        }

        return this.__IDragStartingEventArgs2.put_AllowedOperations(value)
    }

;@endregion Instance Methods
}
