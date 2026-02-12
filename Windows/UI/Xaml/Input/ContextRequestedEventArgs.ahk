#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\IContextRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [ContextRequested](../windows.ui.xaml/uielement_contextrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.contextrequestedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class ContextRequestedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContextRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContextRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for **Handled** prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.contextrequestedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ContextRequestedEventArgs](contextrequestedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.ContextRequestedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IContextRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContextRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContextRequestedEventArgs := IContextRequestedEventArgs(outPtr)
        }

        return this.__IContextRequestedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IContextRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContextRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContextRequestedEventArgs := IContextRequestedEventArgs(outPtr)
        }

        return this.__IContextRequestedEventArgs.put_Handled(value)
    }

    /**
     * Gets the x- and y-coordinates of the pointer position, optionally evaluated against a coordinate origin of a supplied [UIElement](../windows.ui.xaml/uielement.md).
     * @param {UIElement} relativeTo Any [UIElement](../windows.ui.xaml/uielement.md)-derived object that is connected to the same object tree. To specify the object relative to the overall coordinate system, use a *relativeTo*  value of **null**.
     * @param {Pointer<POINT>} point_ A [Point](../windows.foundation/point.md) that represents the current x- and y-coordinates of the mouse pointer position. If **null** was passed as *relativeTo*, this coordinate is for the overall window. If a *relativeTo* value other than **null** was passed, this coordinate is relative to the object referenced by *relativeTo*.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.contextrequestedeventargs.trygetposition
     */
    TryGetPosition(relativeTo, point_) {
        if (!this.HasProp("__IContextRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContextRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContextRequestedEventArgs := IContextRequestedEventArgs(outPtr)
        }

        return this.__IContextRequestedEventArgs.TryGetPosition(relativeTo, point_)
    }

;@endregion Instance Methods
}
