#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVisualStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [CurrentStateChanging](visualstategroup_currentstatechanging.md) and [CurrentStateChanged](visualstategroup_currentstatechanged.md) events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstatechangedeventargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class VisualStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVisualStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVisualStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the state the [Control](../windows.ui.xaml.controls/control.md) is changing from or has changed from.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstatechangedeventargs.oldstate
     * @type {VisualState} 
     */
    OldState {
        get => this.get_OldState()
        set => this.put_OldState(value)
    }

    /**
     * Gets the state the [Control](../windows.ui.xaml.controls/control.md) is changing to or has changed to.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstatechangedeventargs.newstate
     * @type {VisualState} 
     */
    NewState {
        get => this.get_NewState()
        set => this.put_NewState(value)
    }

    /**
     * Gets the [Control](../windows.ui.xaml.controls/control.md) that is changing states.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstatechangedeventargs.control
     * @type {Control} 
     */
    Control {
        get => this.get_Control()
        set => this.put_Control(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [VisualStateChangedEventArgs](visualstatechangedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.VisualStateChangedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {VisualState} 
     */
    get_OldState() {
        if (!this.HasProp("__IVisualStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVisualStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateChangedEventArgs := IVisualStateChangedEventArgs(outPtr)
        }

        return this.__IVisualStateChangedEventArgs.get_OldState()
    }

    /**
     * 
     * @param {VisualState} value 
     * @returns {HRESULT} 
     */
    put_OldState(value) {
        if (!this.HasProp("__IVisualStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVisualStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateChangedEventArgs := IVisualStateChangedEventArgs(outPtr)
        }

        return this.__IVisualStateChangedEventArgs.put_OldState(value)
    }

    /**
     * 
     * @returns {VisualState} 
     */
    get_NewState() {
        if (!this.HasProp("__IVisualStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVisualStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateChangedEventArgs := IVisualStateChangedEventArgs(outPtr)
        }

        return this.__IVisualStateChangedEventArgs.get_NewState()
    }

    /**
     * 
     * @param {VisualState} value 
     * @returns {HRESULT} 
     */
    put_NewState(value) {
        if (!this.HasProp("__IVisualStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVisualStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateChangedEventArgs := IVisualStateChangedEventArgs(outPtr)
        }

        return this.__IVisualStateChangedEventArgs.put_NewState(value)
    }

    /**
     * 
     * @returns {Control} 
     */
    get_Control() {
        if (!this.HasProp("__IVisualStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVisualStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateChangedEventArgs := IVisualStateChangedEventArgs(outPtr)
        }

        return this.__IVisualStateChangedEventArgs.get_Control()
    }

    /**
     * 
     * @param {Control} value 
     * @returns {HRESULT} 
     */
    put_Control(value) {
        if (!this.HasProp("__IVisualStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVisualStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateChangedEventArgs := IVisualStateChangedEventArgs(outPtr)
        }

        return this.__IVisualStateChangedEventArgs.put_Control(value)
    }

;@endregion Instance Methods
}
