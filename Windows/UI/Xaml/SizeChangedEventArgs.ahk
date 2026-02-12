#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RoutedEventArgs.ahk
#Include .\ISizeChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data related to the [FrameworkElement.SizeChanged](frameworkelement_sizechanged.md) event.
 * @remarks
 * The [PreviousSize](sizechangedeventargs_previoussize.md) value is based on [ActualHeight](frameworkelement_actualheight.md) and [ActualWidth](frameworkelement_actualwidth.md) values on the element before the layout change that motivated the [SizeChanged](frameworkelement_sizechanged.md) event. The [NewSize](sizechangedeventargs_newsize.md) value is based on the [ActualHeight](frameworkelement_actualheight.md) and [ActualWidth](frameworkelement_actualwidth.md) values after the layout change is processed.
 * 
 * There's another event named **SizeChanged** that's defined by the [Window](window.md) class. Event handlers for [Window.SizeChanged](window_sizechanged.md) use the [WindowSizeChangedEventArgs](../windows.ui.core/windowsizechangedeventargs.md) class for data. [Window.SizeChanged](window_sizechanged.md) can occur in some of the same circumstances that [FrameworkElement.SizeChanged](frameworkelement_sizechanged.md) occurs; for more info, see [FrameworkElement.SizeChanged](frameworkelement_sizechanged.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.sizechangedeventargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class SizeChangedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISizeChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISizeChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the previous size of the object reporting the size change.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.sizechangedeventargs.previoussize
     * @type {SIZE} 
     */
    PreviousSize {
        get => this.get_PreviousSize()
    }

    /**
     * Gets the new size of the object reporting the size change.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.sizechangedeventargs.newsize
     * @type {SIZE} 
     */
    NewSize {
        get => this.get_NewSize()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_PreviousSize() {
        if (!this.HasProp("__ISizeChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISizeChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISizeChangedEventArgs := ISizeChangedEventArgs(outPtr)
        }

        return this.__ISizeChangedEventArgs.get_PreviousSize()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_NewSize() {
        if (!this.HasProp("__ISizeChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISizeChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISizeChangedEventArgs := ISizeChangedEventArgs(outPtr)
        }

        return this.__ISizeChangedEventArgs.get_NewSize()
    }

;@endregion Instance Methods
}
