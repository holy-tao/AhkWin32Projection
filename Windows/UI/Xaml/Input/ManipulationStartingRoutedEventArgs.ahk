#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\IManipulationStartingRoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [ManipulationStarting](../windows.ui.xaml/uielement_manipulationstarting.md), event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationstartingroutedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class ManipulationStartingRoutedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IManipulationStartingRoutedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IManipulationStartingRoutedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets which types of manipulations are possible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationstartingroutedeventargs.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * Gets the [UIElement](../windows.ui.xaml/uielement.md) that is considered the container of the manipulation.
     * @remarks
     * <!--Container is a concept in the Directmanipulation API that I do not yet understand. Needs more research.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationstartingroutedeventargs.container
     * @type {UIElement} 
     */
    Container {
        get => this.get_Container()
        set => this.put_Container(value)
    }

    /**
     * Gets or sets an object that describes the pivot for a single-point manipulation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationstartingroutedeventargs.pivot
     * @type {ManipulationPivot} 
     */
    Pivot {
        get => this.get_Pivot()
        set => this.put_Pivot(value)
    }

    /**
     * Gets or sets a value that marks the routed event as handled. Setting to **true** prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationstartingroutedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ManipulationStartingRoutedEventArgs](manipulationstartingroutedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.ManipulationStartingRoutedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IManipulationStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartingRoutedEventArgs := IManipulationStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationStartingRoutedEventArgs.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__IManipulationStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartingRoutedEventArgs := IManipulationStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationStartingRoutedEventArgs.put_Mode(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Container() {
        if (!this.HasProp("__IManipulationStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartingRoutedEventArgs := IManipulationStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationStartingRoutedEventArgs.get_Container()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Container(value) {
        if (!this.HasProp("__IManipulationStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartingRoutedEventArgs := IManipulationStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationStartingRoutedEventArgs.put_Container(value)
    }

    /**
     * 
     * @returns {ManipulationPivot} 
     */
    get_Pivot() {
        if (!this.HasProp("__IManipulationStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartingRoutedEventArgs := IManipulationStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationStartingRoutedEventArgs.get_Pivot()
    }

    /**
     * 
     * @param {ManipulationPivot} value 
     * @returns {HRESULT} 
     */
    put_Pivot(value) {
        if (!this.HasProp("__IManipulationStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartingRoutedEventArgs := IManipulationStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationStartingRoutedEventArgs.put_Pivot(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IManipulationStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartingRoutedEventArgs := IManipulationStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationStartingRoutedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IManipulationStartingRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IManipulationStartingRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManipulationStartingRoutedEventArgs := IManipulationStartingRoutedEventArgs(outPtr)
        }

        return this.__IManipulationStartingRoutedEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
