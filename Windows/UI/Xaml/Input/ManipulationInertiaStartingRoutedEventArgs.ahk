#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\IManipulationInertiaStartingRoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [ManipulationInertiaStarting](../windows.ui.xaml/uielement_manipulationinertiastarting.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationinertiastartingroutedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class ManipulationInertiaStartingRoutedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IManipulationInertiaStartingRoutedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IManipulationInertiaStartingRoutedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [UIElement](../windows.ui.xaml/uielement.md) that is considered the container of the manipulation.
     * @remarks
     * <!--Container is a concept in the Directmanipulation API that I do not yet understand. Needs more research.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationinertiastartingroutedeventargs.container
     * @type {UIElement} 
     */
    Container {
        get => this.get_Container()
    }

    /**
     * Get or sets the rate of slowdown of expansion inertial movement.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationinertiastartingroutedeventargs.expansionbehavior
     * @type {InertiaExpansionBehavior} 
     */
    ExpansionBehavior {
        get => this.get_ExpansionBehavior()
        set => this.put_ExpansionBehavior(value)
    }

    /**
     * Gets information about the rotation information associated with the manipulation for this event occurrence.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationinertiastartingroutedeventargs.rotationbehavior
     * @type {InertiaRotationBehavior} 
     */
    RotationBehavior {
        get => this.get_RotationBehavior()
        set => this.put_RotationBehavior(value)
    }

    /**
     * Gets information about the translation information associated with the manipulation for this event occurrence.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationinertiastartingroutedeventargs.translationbehavior
     * @type {InertiaTranslationBehavior} 
     */
    TranslationBehavior {
        get => this.get_TranslationBehavior()
        set => this.put_TranslationBehavior(value)
    }

    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for **Handled** prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationinertiastartingroutedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets the [PointerDeviceType](../windows.devices.input/pointerdevicetype.md) for the pointer device involved in the manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationinertiastartingroutedeventargs.pointerdevicetype
     * @type {Integer} 
     */
    PointerDeviceType {
        get => this.get_PointerDeviceType()
    }

    /**
     * Gets the most recent changes of the current manipulation, as a [ManipulationDelta](manipulationdeltaroutedeventargs.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationinertiastartingroutedeventargs.delta
     * @type {ManipulationDelta} 
     */
    Delta {
        get => this.get_Delta()
    }

    /**
     * Gets the overall changes since the beginning of the manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationinertiastartingroutedeventargs.cumulative
     * @type {ManipulationDelta} 
     */
    Cumulative {
        get => this.get_Cumulative()
    }

    /**
     * Gets the rates of the most recent changes to the manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationinertiastartingroutedeventargs.velocities
     * @type {ManipulationVelocities} 
     */
    Velocities {
        get => this.get_Velocities()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ManipulationInertiaStartingRoutedEventArgs](manipulationinertiastartingroutedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.ManipulationInertiaStartingRoutedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Container() {
        if (!this.HasProp("__IManipulationInertiaStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingRoutedEventArgs := IManipulationInertiaStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingRoutedEventArgs.get_Container()
    }

    /**
     * 
     * @returns {InertiaExpansionBehavior} 
     */
    get_ExpansionBehavior() {
        if (!this.HasProp("__IManipulationInertiaStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingRoutedEventArgs := IManipulationInertiaStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingRoutedEventArgs.get_ExpansionBehavior()
    }

    /**
     * 
     * @param {InertiaExpansionBehavior} value 
     * @returns {HRESULT} 
     */
    put_ExpansionBehavior(value) {
        if (!this.HasProp("__IManipulationInertiaStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingRoutedEventArgs := IManipulationInertiaStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingRoutedEventArgs.put_ExpansionBehavior(value)
    }

    /**
     * 
     * @returns {InertiaRotationBehavior} 
     */
    get_RotationBehavior() {
        if (!this.HasProp("__IManipulationInertiaStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingRoutedEventArgs := IManipulationInertiaStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingRoutedEventArgs.get_RotationBehavior()
    }

    /**
     * 
     * @param {InertiaRotationBehavior} value 
     * @returns {HRESULT} 
     */
    put_RotationBehavior(value) {
        if (!this.HasProp("__IManipulationInertiaStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingRoutedEventArgs := IManipulationInertiaStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingRoutedEventArgs.put_RotationBehavior(value)
    }

    /**
     * 
     * @returns {InertiaTranslationBehavior} 
     */
    get_TranslationBehavior() {
        if (!this.HasProp("__IManipulationInertiaStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingRoutedEventArgs := IManipulationInertiaStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingRoutedEventArgs.get_TranslationBehavior()
    }

    /**
     * 
     * @param {InertiaTranslationBehavior} value 
     * @returns {HRESULT} 
     */
    put_TranslationBehavior(value) {
        if (!this.HasProp("__IManipulationInertiaStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingRoutedEventArgs := IManipulationInertiaStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingRoutedEventArgs.put_TranslationBehavior(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IManipulationInertiaStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingRoutedEventArgs := IManipulationInertiaStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingRoutedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IManipulationInertiaStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingRoutedEventArgs := IManipulationInertiaStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingRoutedEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerDeviceType() {
        if (!this.HasProp("__IManipulationInertiaStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingRoutedEventArgs := IManipulationInertiaStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingRoutedEventArgs.get_PointerDeviceType()
    }

    /**
     * 
     * @returns {ManipulationDelta} 
     */
    get_Delta() {
        if (!this.HasProp("__IManipulationInertiaStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingRoutedEventArgs := IManipulationInertiaStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingRoutedEventArgs.get_Delta()
    }

    /**
     * 
     * @returns {ManipulationDelta} 
     */
    get_Cumulative() {
        if (!this.HasProp("__IManipulationInertiaStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingRoutedEventArgs := IManipulationInertiaStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingRoutedEventArgs.get_Cumulative()
    }

    /**
     * 
     * @returns {ManipulationVelocities} 
     */
    get_Velocities() {
        if (!this.HasProp("__IManipulationInertiaStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationInertiaStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationInertiaStartingRoutedEventArgs := IManipulationInertiaStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationInertiaStartingRoutedEventArgs.get_Velocities()
    }

;@endregion Instance Methods
}
