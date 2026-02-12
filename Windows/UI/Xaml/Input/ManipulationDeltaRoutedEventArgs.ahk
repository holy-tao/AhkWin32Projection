#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\IManipulationDeltaRoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [ManipulationDelta](../windows.ui.xaml/uielement_manipulationdelta.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationdeltaroutedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class ManipulationDeltaRoutedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IManipulationDeltaRoutedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IManipulationDeltaRoutedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [UIElement](../windows.ui.xaml/uielement.md) that is considered the container of the manipulation.
     * @remarks
     * <!--Container is a concept in the Directmanipulation API that I do not yet understand. Needs more research.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationdeltaroutedeventargs.container
     * @type {UIElement} 
     */
    Container {
        get => this.get_Container()
    }

    /**
     * Gets the point from which the manipulation originated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationdeltaroutedeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets whether the [ManipulationDelta](../windows.ui.xaml/uielement_manipulationdelta.md) event occurs during inertia.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationdeltaroutedeventargs.isinertial
     * @type {Boolean} 
     */
    IsInertial {
        get => this.get_IsInertial()
    }

    /**
     * Gets the most recent changes of the current manipulation, as a [ManipulationDelta](manipulationdeltaroutedeventargs.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationdeltaroutedeventargs.delta
     * @type {ManipulationDelta} 
     */
    Delta {
        get => this.get_Delta()
    }

    /**
     * Gets the overall changes since the beginning of the manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationdeltaroutedeventargs.cumulative
     * @type {ManipulationDelta} 
     */
    Cumulative {
        get => this.get_Cumulative()
    }

    /**
     * Gets the rates of the most recent changes to the manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationdeltaroutedeventargs.velocities
     * @type {ManipulationVelocities} 
     */
    Velocities {
        get => this.get_Velocities()
    }

    /**
     * Gets or sets a value that marks the routed event as handled. Setting to **true** prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationdeltaroutedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets the [PointerDeviceType](../windows.devices.input/pointerdevicetype.md) for the pointer device involved in the manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationdeltaroutedeventargs.pointerdevicetype
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ManipulationDeltaRoutedEventArgs](manipulationdeltaroutedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.ManipulationDeltaRoutedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Container() {
        if (!this.HasProp("__IManipulationDeltaRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationDeltaRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationDeltaRoutedEventArgs := IManipulationDeltaRoutedEventArgs(outPtr)
        }

        return this.__IManipulationDeltaRoutedEventArgs.get_Container()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IManipulationDeltaRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationDeltaRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationDeltaRoutedEventArgs := IManipulationDeltaRoutedEventArgs(outPtr)
        }

        return this.__IManipulationDeltaRoutedEventArgs.get_Position()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInertial() {
        if (!this.HasProp("__IManipulationDeltaRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationDeltaRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationDeltaRoutedEventArgs := IManipulationDeltaRoutedEventArgs(outPtr)
        }

        return this.__IManipulationDeltaRoutedEventArgs.get_IsInertial()
    }

    /**
     * 
     * @returns {ManipulationDelta} 
     */
    get_Delta() {
        if (!this.HasProp("__IManipulationDeltaRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationDeltaRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationDeltaRoutedEventArgs := IManipulationDeltaRoutedEventArgs(outPtr)
        }

        return this.__IManipulationDeltaRoutedEventArgs.get_Delta()
    }

    /**
     * 
     * @returns {ManipulationDelta} 
     */
    get_Cumulative() {
        if (!this.HasProp("__IManipulationDeltaRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationDeltaRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationDeltaRoutedEventArgs := IManipulationDeltaRoutedEventArgs(outPtr)
        }

        return this.__IManipulationDeltaRoutedEventArgs.get_Cumulative()
    }

    /**
     * 
     * @returns {ManipulationVelocities} 
     */
    get_Velocities() {
        if (!this.HasProp("__IManipulationDeltaRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationDeltaRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationDeltaRoutedEventArgs := IManipulationDeltaRoutedEventArgs(outPtr)
        }

        return this.__IManipulationDeltaRoutedEventArgs.get_Velocities()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IManipulationDeltaRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationDeltaRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationDeltaRoutedEventArgs := IManipulationDeltaRoutedEventArgs(outPtr)
        }

        return this.__IManipulationDeltaRoutedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IManipulationDeltaRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationDeltaRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationDeltaRoutedEventArgs := IManipulationDeltaRoutedEventArgs(outPtr)
        }

        return this.__IManipulationDeltaRoutedEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerDeviceType() {
        if (!this.HasProp("__IManipulationDeltaRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationDeltaRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationDeltaRoutedEventArgs := IManipulationDeltaRoutedEventArgs(outPtr)
        }

        return this.__IManipulationDeltaRoutedEventArgs.get_PointerDeviceType()
    }

    /**
     * Completes the manipulation without inertia.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationdeltaroutedeventargs.complete
     */
    Complete() {
        if (!this.HasProp("__IManipulationDeltaRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationDeltaRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationDeltaRoutedEventArgs := IManipulationDeltaRoutedEventArgs(outPtr)
        }

        return this.__IManipulationDeltaRoutedEventArgs.Complete()
    }

;@endregion Instance Methods
}
