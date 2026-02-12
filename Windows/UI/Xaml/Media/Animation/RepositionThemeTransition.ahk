#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transition.ahk
#Include .\IRepositionThemeTransition.ahk
#Include .\IRepositionThemeTransition2.ahk
#Include .\IRepositionThemeTransitionStatics2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Reacts to layout moves when no context is set and a trigger of *move* is passed.
 * @remarks
 * The RepositionThemeTransition is not designed to be used with Panels that perform UI virtualization such as the default Panel on a ListView or GridView control.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repositionthemetransition
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class RepositionThemeTransition extends Transition {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRepositionThemeTransition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRepositionThemeTransition.IID

    /**
     * Identifies the [IsStaggeringEnabled](repositionthemetransition_isstaggeringenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repositionthemetransition.isstaggeringenabledproperty
     * @type {DependencyProperty} 
     */
    static IsStaggeringEnabledProperty {
        get => RepositionThemeTransition.get_IsStaggeringEnabledProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsStaggeringEnabledProperty() {
        if (!RepositionThemeTransition.HasProp("__IRepositionThemeTransitionStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.RepositionThemeTransition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRepositionThemeTransitionStatics2.IID)
            RepositionThemeTransition.__IRepositionThemeTransitionStatics2 := IRepositionThemeTransitionStatics2(factoryPtr)
        }

        return RepositionThemeTransition.__IRepositionThemeTransitionStatics2.get_IsStaggeringEnabledProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that determines whether the transition staggers rendering of multiple items, or renders all items at once.
     * @remarks
     * Available starting in Windows 10, version 1607.
     * 
     * The [ListView](../windows.ui.xaml.controls/listview.md) control utilizes the [RepositionThemeTransition](repositionthemetransition.md) to animate items when an item’s position changes. Unlike some of the other theme transitions, when more than one item’s position changes, the [RepositionThemeTransition](repositionthemetransition.md) staggers the animation across the collection. (The second item lags slightly behind the first item, the third behind the second, etc.) Set this property to **false** to make all items render at once.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repositionthemetransition.isstaggeringenabled
     * @type {Boolean} 
     */
    IsStaggeringEnabled {
        get => this.get_IsStaggeringEnabled()
        set => this.put_IsStaggeringEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [RepositionThemeTransition](repositionthemetransition.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.RepositionThemeTransition")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStaggeringEnabled() {
        if (!this.HasProp("__IRepositionThemeTransition2")) {
            if ((queryResult := this.QueryInterface(IRepositionThemeTransition2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRepositionThemeTransition2 := IRepositionThemeTransition2(outPtr)
        }

        return this.__IRepositionThemeTransition2.get_IsStaggeringEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsStaggeringEnabled(value) {
        if (!this.HasProp("__IRepositionThemeTransition2")) {
            if ((queryResult := this.QueryInterface(IRepositionThemeTransition2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRepositionThemeTransition2 := IRepositionThemeTransition2(outPtr)
        }

        return this.__IRepositionThemeTransition2.put_IsStaggeringEnabled(value)
    }

;@endregion Instance Methods
}
