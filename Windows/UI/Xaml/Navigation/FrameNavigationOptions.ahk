#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFrameNavigationOptions.ahk
#Include .\IFrameNavigationOptionsFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents options for a frame navigation, including whether it is recorded in the navigation stack and what transition animation is used.
 * @remarks
 * FrameNavigationOptions is used as a parameter of the [Frame.NavigateToType](../windows.ui.xaml.controls/frame_navigatetotype_853885036.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.framenavigationoptions
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class FrameNavigationOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameNavigationOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameNavigationOptions.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {FrameNavigationOptions} 
     */
    static CreateInstance() {
        if (!FrameNavigationOptions.HasProp("__IFrameNavigationOptionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Navigation.FrameNavigationOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameNavigationOptionsFactory.IID)
            FrameNavigationOptions.__IFrameNavigationOptionsFactory := IFrameNavigationOptionsFactory(factoryPtr)
        }

        return FrameNavigationOptions.__IFrameNavigationOptionsFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether navigation is recorded in the Frame's ForwardStack or BackStack.
     * @remarks
     * FrameNavigationOptions is used as a parameter of the [Frame.NavigateToType](../windows.ui.xaml.controls/frame_navigatetotype_853885036.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.framenavigationoptions.isnavigationstackenabled
     * @type {Boolean} 
     */
    IsNavigationStackEnabled {
        get => this.get_IsNavigationStackEnabled()
        set => this.put_IsNavigationStackEnabled(value)
    }

    /**
     * Gets or sets a value that indicates the animated transition associated with the navigation.
     * @remarks
     * FrameNavigationOptions is used as a parameter of the [Frame.NavigateToType](../windows.ui.xaml.controls/frame_navigatetotype_853885036.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.framenavigationoptions.transitioninfooverride
     * @type {NavigationTransitionInfo} 
     */
    TransitionInfoOverride {
        get => this.get_TransitionInfoOverride()
        set => this.put_TransitionInfoOverride(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNavigationStackEnabled() {
        if (!this.HasProp("__IFrameNavigationOptions")) {
            if ((queryResult := this.QueryInterface(IFrameNavigationOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameNavigationOptions := IFrameNavigationOptions(outPtr)
        }

        return this.__IFrameNavigationOptions.get_IsNavigationStackEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsNavigationStackEnabled(value) {
        if (!this.HasProp("__IFrameNavigationOptions")) {
            if ((queryResult := this.QueryInterface(IFrameNavigationOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameNavigationOptions := IFrameNavigationOptions(outPtr)
        }

        return this.__IFrameNavigationOptions.put_IsNavigationStackEnabled(value)
    }

    /**
     * 
     * @returns {NavigationTransitionInfo} 
     */
    get_TransitionInfoOverride() {
        if (!this.HasProp("__IFrameNavigationOptions")) {
            if ((queryResult := this.QueryInterface(IFrameNavigationOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameNavigationOptions := IFrameNavigationOptions(outPtr)
        }

        return this.__IFrameNavigationOptions.get_TransitionInfoOverride()
    }

    /**
     * 
     * @param {NavigationTransitionInfo} value 
     * @returns {HRESULT} 
     */
    put_TransitionInfoOverride(value) {
        if (!this.HasProp("__IFrameNavigationOptions")) {
            if ((queryResult := this.QueryInterface(IFrameNavigationOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameNavigationOptions := IFrameNavigationOptions(outPtr)
        }

        return this.__IFrameNavigationOptions.put_TransitionInfoOverride(value)
    }

;@endregion Instance Methods
}
