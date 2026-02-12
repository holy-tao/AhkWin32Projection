#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\StateTriggerBase.ahk
#Include .\IAdaptiveTrigger.ahk
#Include .\IAdaptiveTriggerFactory.ahk
#Include .\IAdaptiveTriggerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a declarative rule that applies visual states based on window properties.
 * @remarks
 * Use AdaptiveTriggers to create rules that automatically trigger a [VisualState](visualstate.md) change when the window is a specified height or width. When you use AdaptiveTriggers in your XAML markup, you don't need to handle the [Window.SizeChanged](window_sizechanged.md) event and call [VisualStateManager.GoToState](visualstatemanager_gotostate_443481648.md) in your code. Also, when you use AdaptiveTriggers in your [VisualStateManager](visualstatemanager.md), you can see the effects of these adaptive changes directly on the XAML design surface in Microsoft Visual Studio.
 * 
 * You can use the [MinWindowWidth](adaptivetrigger_minwindowwidth.md) and [MinWindowHeight](adaptivetrigger_minwindowheight.md) properties either independently or in conjunction with each other. This XAML shows an example of using both properties together. The trigger indicates that the corresponding [VisualState](visualstate.md) is to be applied when the current window width is &gt;= 720 effective pixels AND the current window height is &gt;= 900 effective pixels.
 * 
 * ```xaml
 * <AdaptiveTrigger MinWindowWidth="720" MinWindowHeight="900"/>
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.adaptivetrigger
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class AdaptiveTrigger extends StateTriggerBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdaptiveTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdaptiveTrigger.IID

    /**
     * Identifies the [MinWindowWidth](adaptivetrigger_minwindowwidth.md) dependency property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [MinWindowWidth](adaptivetrigger_minwindowwidth.md) dependency property in XAML and won't need this identifier.
     * 
     * To access the [MinWindowWidth](adaptivetrigger_minwindowwidth.md) dependency property in code, you can use the dependency property system, calling either [GetValue](dependencyobject_getvalue_1188551207.md) or [SetValue](dependencyobject_setvalue_52578133.md) and passing AdaptiveTrigger.MinWindowWidthProperty as the dependency property identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.adaptivetrigger.minwindowwidthproperty
     * @type {DependencyProperty} 
     */
    static MinWindowWidthProperty {
        get => AdaptiveTrigger.get_MinWindowWidthProperty()
    }

    /**
     * Identifies the [MinWindowHeight](adaptivetrigger_minwindowheight.md) dependency property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [MinWindowHeight](adaptivetrigger_minwindowheight.md) dependency property in XAML and won't need this identifier.
     * 
     * To access the [MinWindowHeight](adaptivetrigger_minwindowheight.md) dependency property in code, you can use the dependency property system, calling either [GetValue](dependencyobject_getvalue_1188551207.md) or [SetValue](dependencyobject_setvalue_52578133.md) and passing AdaptiveTrigger.MinWindowHeightProperty as the dependency property identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.adaptivetrigger.minwindowheightproperty
     * @type {DependencyProperty} 
     */
    static MinWindowHeightProperty {
        get => AdaptiveTrigger.get_MinWindowHeightProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AdaptiveTrigger} 
     */
    static CreateInstance() {
        if (!AdaptiveTrigger.HasProp("__IAdaptiveTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.AdaptiveTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAdaptiveTriggerFactory.IID)
            AdaptiveTrigger.__IAdaptiveTriggerFactory := IAdaptiveTriggerFactory(factoryPtr)
        }

        return AdaptiveTrigger.__IAdaptiveTriggerFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinWindowWidthProperty() {
        if (!AdaptiveTrigger.HasProp("__IAdaptiveTriggerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.AdaptiveTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAdaptiveTriggerStatics.IID)
            AdaptiveTrigger.__IAdaptiveTriggerStatics := IAdaptiveTriggerStatics(factoryPtr)
        }

        return AdaptiveTrigger.__IAdaptiveTriggerStatics.get_MinWindowWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinWindowHeightProperty() {
        if (!AdaptiveTrigger.HasProp("__IAdaptiveTriggerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.AdaptiveTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAdaptiveTriggerStatics.IID)
            AdaptiveTrigger.__IAdaptiveTriggerStatics := IAdaptiveTriggerStatics(factoryPtr)
        }

        return AdaptiveTrigger.__IAdaptiveTriggerStatics.get_MinWindowHeightProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the minimum window width at which the [VisualState](visualstate.md) should be applied.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.adaptivetrigger.minwindowwidth
     * @type {Float} 
     */
    MinWindowWidth {
        get => this.get_MinWindowWidth()
        set => this.put_MinWindowWidth(value)
    }

    /**
     * Gets or sets the minimum window height at which the [VisualState](visualstate.md) should be applied.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.adaptivetrigger.minwindowheight
     * @type {Float} 
     */
    MinWindowHeight {
        get => this.get_MinWindowHeight()
        set => this.put_MinWindowHeight(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinWindowWidth() {
        if (!this.HasProp("__IAdaptiveTrigger")) {
            if ((queryResult := this.QueryInterface(IAdaptiveTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveTrigger := IAdaptiveTrigger(outPtr)
        }

        return this.__IAdaptiveTrigger.get_MinWindowWidth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MinWindowWidth(value) {
        if (!this.HasProp("__IAdaptiveTrigger")) {
            if ((queryResult := this.QueryInterface(IAdaptiveTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveTrigger := IAdaptiveTrigger(outPtr)
        }

        return this.__IAdaptiveTrigger.put_MinWindowWidth(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinWindowHeight() {
        if (!this.HasProp("__IAdaptiveTrigger")) {
            if ((queryResult := this.QueryInterface(IAdaptiveTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveTrigger := IAdaptiveTrigger(outPtr)
        }

        return this.__IAdaptiveTrigger.get_MinWindowHeight()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MinWindowHeight(value) {
        if (!this.HasProp("__IAdaptiveTrigger")) {
            if ((queryResult := this.QueryInterface(IAdaptiveTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveTrigger := IAdaptiveTrigger(outPtr)
        }

        return this.__IAdaptiveTrigger.put_MinWindowHeight(value)
    }

;@endregion Instance Methods
}
