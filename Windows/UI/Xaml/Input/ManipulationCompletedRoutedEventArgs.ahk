#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\IManipulationCompletedRoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [ManipulationCompleted](../windows.ui.xaml/uielement_manipulationcompleted.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationcompletedroutedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class ManipulationCompletedRoutedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IManipulationCompletedRoutedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IManipulationCompletedRoutedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [UIElement](../windows.ui.xaml/uielement.md) that is considered the container of the manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationcompletedroutedeventargs.container
     * @type {UIElement} 
     */
    Container {
        get => this.get_Container()
    }

    /**
     * Gets the x- and y- screen coordinates of the touch input at completed position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationcompletedroutedeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets whether the [ManipulationCompleted](../windows.ui.xaml/uielement_manipulationcompleted.md) event occurs during inertia.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationcompletedroutedeventargs.isinertial
     * @type {Boolean} 
     */
    IsInertial {
        get => this.get_IsInertial()
    }

    /**
     * Gets the overall changes since the beginning of the manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationcompletedroutedeventargs.cumulative
     * @type {ManipulationDelta} 
     */
    Cumulative {
        get => this.get_Cumulative()
    }

    /**
     * Gets the velocities that are used for the manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationcompletedroutedeventargs.velocities
     * @type {ManipulationVelocities} 
     */
    Velocities {
        get => this.get_Velocities()
    }

    /**
     * Gets or sets a value that marks the routed event as handled. Setting to **true** prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationcompletedroutedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets the [PointerDeviceType](../windows.devices.input/pointerdevicetype.md) for the pointer device involved in the manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationcompletedroutedeventargs.pointerdevicetype
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ManipulationCompletedRoutedEventArgs](manipulationcompletedroutedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.ManipulationCompletedRoutedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Container() {
        if (!this.HasProp("__IManipulationCompletedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationCompletedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationCompletedRoutedEventArgs := IManipulationCompletedRoutedEventArgs(outPtr)
        }

        return this.__IManipulationCompletedRoutedEventArgs.get_Container()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IManipulationCompletedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationCompletedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationCompletedRoutedEventArgs := IManipulationCompletedRoutedEventArgs(outPtr)
        }

        return this.__IManipulationCompletedRoutedEventArgs.get_Position()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInertial() {
        if (!this.HasProp("__IManipulationCompletedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationCompletedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationCompletedRoutedEventArgs := IManipulationCompletedRoutedEventArgs(outPtr)
        }

        return this.__IManipulationCompletedRoutedEventArgs.get_IsInertial()
    }

    /**
     * 
     * @returns {ManipulationDelta} 
     */
    get_Cumulative() {
        if (!this.HasProp("__IManipulationCompletedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationCompletedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationCompletedRoutedEventArgs := IManipulationCompletedRoutedEventArgs(outPtr)
        }

        return this.__IManipulationCompletedRoutedEventArgs.get_Cumulative()
    }

    /**
     * 
     * @returns {ManipulationVelocities} 
     */
    get_Velocities() {
        if (!this.HasProp("__IManipulationCompletedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationCompletedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationCompletedRoutedEventArgs := IManipulationCompletedRoutedEventArgs(outPtr)
        }

        return this.__IManipulationCompletedRoutedEventArgs.get_Velocities()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IManipulationCompletedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationCompletedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationCompletedRoutedEventArgs := IManipulationCompletedRoutedEventArgs(outPtr)
        }

        return this.__IManipulationCompletedRoutedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IManipulationCompletedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationCompletedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationCompletedRoutedEventArgs := IManipulationCompletedRoutedEventArgs(outPtr)
        }

        return this.__IManipulationCompletedRoutedEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerDeviceType() {
        if (!this.HasProp("__IManipulationCompletedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationCompletedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationCompletedRoutedEventArgs := IManipulationCompletedRoutedEventArgs(outPtr)
        }

        return this.__IManipulationCompletedRoutedEventArgs.get_PointerDeviceType()
    }

;@endregion Instance Methods
}
