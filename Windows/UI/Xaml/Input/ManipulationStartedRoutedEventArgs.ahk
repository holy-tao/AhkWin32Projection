#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\IManipulationStartedRoutedEventArgs.ahk
#Include .\IManipulationStartedRoutedEventArgsFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [ManipulationStarted](../windows.ui.xaml/uielement_manipulationstarted.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationstartedroutedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class ManipulationStartedRoutedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IManipulationStartedRoutedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IManipulationStartedRoutedEventArgs.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ManipulationStartedRoutedEventArgs} 
     */
    static CreateInstance() {
        if (!ManipulationStartedRoutedEventArgs.HasProp("__IManipulationStartedRoutedEventArgsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.ManipulationStartedRoutedEventArgs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IManipulationStartedRoutedEventArgsFactory.IID)
            ManipulationStartedRoutedEventArgs.__IManipulationStartedRoutedEventArgsFactory := IManipulationStartedRoutedEventArgsFactory(factoryPtr)
        }

        return ManipulationStartedRoutedEventArgs.__IManipulationStartedRoutedEventArgsFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [UIElement](../windows.ui.xaml/uielement.md) that is considered the container of the manipulation.
     * @remarks
     * <!--Container is a concept in the Directmanipulation API that I do not yet understand. Needs more research.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationstartedroutedeventargs.container
     * @type {UIElement} 
     */
    Container {
        get => this.get_Container()
    }

    /**
     * Gets the point from which the manipulation originated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationstartedroutedeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets or sets a value that marks the routed event as handled. Setting to **true** prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationstartedroutedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets the [PointerDeviceType](../windows.devices.input/pointerdevicetype.md) for the pointer device involved in the manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationstartedroutedeventargs.pointerdevicetype
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * Gets the overall changes since the beginning of the manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationstartedroutedeventargs.cumulative
     * @type {ManipulationDelta} 
     */
    Cumulative {
        get => this.get_Cumulative()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Container() {
        if (!this.HasProp("__IManipulationStartedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartedRoutedEventArgs := IManipulationStartedRoutedEventArgs(outPtr)
        }

        return this.__IManipulationStartedRoutedEventArgs.get_Container()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IManipulationStartedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartedRoutedEventArgs := IManipulationStartedRoutedEventArgs(outPtr)
        }

        return this.__IManipulationStartedRoutedEventArgs.get_Position()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IManipulationStartedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartedRoutedEventArgs := IManipulationStartedRoutedEventArgs(outPtr)
        }

        return this.__IManipulationStartedRoutedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IManipulationStartedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartedRoutedEventArgs := IManipulationStartedRoutedEventArgs(outPtr)
        }

        return this.__IManipulationStartedRoutedEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerDeviceType() {
        if (!this.HasProp("__IManipulationStartedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartedRoutedEventArgs := IManipulationStartedRoutedEventArgs(outPtr)
        }

        return this.__IManipulationStartedRoutedEventArgs.get_PointerDeviceType()
    }

    /**
     * 
     * @returns {ManipulationDelta} 
     */
    get_Cumulative() {
        if (!this.HasProp("__IManipulationStartedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartedRoutedEventArgs := IManipulationStartedRoutedEventArgs(outPtr)
        }

        return this.__IManipulationStartedRoutedEventArgs.get_Cumulative()
    }

    /**
     * Completes the manipulation without inertia.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationstartedroutedeventargs.complete
     */
    Complete() {
        if (!this.HasProp("__IManipulationStartedRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartedRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartedRoutedEventArgs := IManipulationStartedRoutedEventArgs(outPtr)
        }

        return this.__IManipulationStartedRoutedEventArgs.Complete()
    }

;@endregion Instance Methods
}
