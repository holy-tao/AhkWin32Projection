#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXamlUIPresenter.ahk
#Include .\IXamlUIPresenterStatics.ahk
#Include .\IXamlUIPresenterStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Enables presenting a visual tree on a Microsoft Direct3D surface. This type is used for design tool hosting scenarios and is not intended for general use.
 * @remarks
 * XamlUIPresenter is not intended for general Microsoft DirectX and Windows Runtime interoperation scenarios. You cannot use this API in a UWP app that you submit to the Microsoft Store, it will not pass certification.
 * 
 * For techniques for XAML-Microsoft DirectX interoperation functionality, instead see [DirectX and XAML interop](/previous-versions/windows/apps/hh825871(v=win.10)).
 * 
 *  XamlUIPresenter is specifically intended for interoperation with designer surfaces that represent Windows Runtime objects or their XAML markup as graphical objects in a Microsoft DirectX  UI.
 * 
 *  XamlUIPresenter has no constructor in the Windows Runtime. To get an instance of XamlUIPresenter you must invoke a Component Object Model (COM) function ([CreateXamlUIPresenter](/windows/desktop/WinRT/createxamluipresenter)) as exported from a Windows Runtime DLL. For example, as part of a C# application you can import the Component Object Model (COM) library:
 * 
 * ```csharp
 * [DllImport("windows.ui.xaml.dll", SetLastError = true, CallingConvention = CallingConvention.Winapi)]
 * public static extern void CreateXamlUIPresenter(
 *     IViewObjectPresentNotifySite presentSite, out Windows.UI.Xaml.Hosting.XamlUIPresenter presenter
 * );
 * 
 * ```
 * 
 * <!--These instructions are vague By Design. The product unit does not want this API to be a gate for general interop, it was intended to be limited to this Blend designer scenario. Anyone that can't figure out what to do based on the general hint that this is really a COM API shouldn't be messing with this type and is probably envisioning unsupported scenarios.-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamluipresenter
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class XamlUIPresenter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXamlUIPresenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXamlUIPresenter.IID

    /**
     * Gets or sets a value that determines whether the host wants timelines to always run to end.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamluipresenter.completetimelinesautomatically
     * @type {Boolean} 
     */
    static CompleteTimelinesAutomatically {
        get => XamlUIPresenter.get_CompleteTimelinesAutomatically()
        set => XamlUIPresenter.put_CompleteTimelinesAutomatically(value)
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_CompleteTimelinesAutomatically() {
        if (!XamlUIPresenter.HasProp("__IXamlUIPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.XamlUIPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlUIPresenterStatics.IID)
            XamlUIPresenter.__IXamlUIPresenterStatics := IXamlUIPresenterStatics(factoryPtr)
        }

        return XamlUIPresenter.__IXamlUIPresenterStatics.get_CompleteTimelinesAutomatically()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    static put_CompleteTimelinesAutomatically(value) {
        if (!XamlUIPresenter.HasProp("__IXamlUIPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.XamlUIPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlUIPresenterStatics.IID)
            XamlUIPresenter.__IXamlUIPresenterStatics := IXamlUIPresenterStatics(factoryPtr)
        }

        return XamlUIPresenter.__IXamlUIPresenterStatics.put_CompleteTimelinesAutomatically(value)
    }

    /**
     * Specifies the [IXamlUIPresenterHost](ixamluipresenterhost.md) service implementation to use for application resource resolution.
     * @param {IXamlUIPresenterHost} host A service implementation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamluipresenter.sethost
     */
    static SetHost(host) {
        if (!XamlUIPresenter.HasProp("__IXamlUIPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.XamlUIPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlUIPresenterStatics.IID)
            XamlUIPresenter.__IXamlUIPresenterStatics := IXamlUIPresenterStatics(factoryPtr)
        }

        return XamlUIPresenter.__IXamlUIPresenterStatics.SetHost(host)
    }

    /**
     * Invokes the [SizeChanged](../windows.ui.xaml/frameworkelement_sizechanged.md) event on [Window.Current](../windows.ui.xaml/window_current.md). Used by hosts to propagate size changes from host settings to user code, so that a design mode interaction can be differentiated from a run time interaction.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamluipresenter.notifywindowsizechanged
     */
    static NotifyWindowSizeChanged() {
        if (!XamlUIPresenter.HasProp("__IXamlUIPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.XamlUIPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlUIPresenterStatics.IID)
            XamlUIPresenter.__IXamlUIPresenterStatics := IXamlUIPresenterStatics(factoryPtr)
        }

        return XamlUIPresenter.__IXamlUIPresenterStatics.NotifyWindowSizeChanged()
    }

    /**
     * Returns calculated bounds of a placement target that is intended to also display a flyout in the host. Additional **out** parameters provide more info on how the bounds were calculated.
     * @param {FrameworkElement} placementTarget The placement target element that the [Flyout](../windows.ui.xaml.controls/flyout.md) should be positioned in relation to.
     * @param {Integer} preferredPlacement A value of the enumeration that declares the host's preferred placement of the [Flyout](../windows.ui.xaml.controls/flyout.md) relative to the target. 
     * <!--The default is ?-->
     * @param {Pointer<Int32>} targetPreferredPlacement A value of the enumeration that declares preferred placement of the [Flyout](../windows.ui.xaml.controls/flyout.md).
     * @param {Pointer<Boolean>} allowFallbacks **true** if fallback placements are permitted for the [Flyout](../windows.ui.xaml.controls/flyout.md) placement logic. **false** if only the *targetPreferredPlacement* value should be considered.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamluipresenter.getflyoutplacementtargetinfo
     */
    static GetFlyoutPlacementTargetInfo(placementTarget, preferredPlacement, targetPreferredPlacement, allowFallbacks) {
        if (!XamlUIPresenter.HasProp("__IXamlUIPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.XamlUIPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlUIPresenterStatics2.IID)
            XamlUIPresenter.__IXamlUIPresenterStatics2 := IXamlUIPresenterStatics2(factoryPtr)
        }

        return XamlUIPresenter.__IXamlUIPresenterStatics2.GetFlyoutPlacementTargetInfo(placementTarget, preferredPlacement, targetPreferredPlacement, allowFallbacks)
    }

    /**
     * Invokes the [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) placement logic, using a suggested size of a control that will show a placement target and its flyout. Returns the bounds that are the result of running the placement logic.
     * @param {RECT} placementTargetBounds The bounds of the placement target element, which are passed to [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) presenter logic.
     * @param {SIZE} controlSize The desired size of the control that should display the flyout.
     * @param {SIZE} minControlSize The minimum size of the control that should display the flyout.
     * @param {RECT} containerRect The bounds of the area that should hold the placement target and flyout.
     * @param {Integer} targetPreferredPlacement The desired placement mode to use for [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) placement logic.
     * @param {Boolean} allowFallbacks **true** if fallbacks can be used for the placement mode. **false** if fallbacks cannot be used.
     * @param {Pointer<Int32>} chosenPlacement The actual placement mode used by the invoked [FlyoutBase](../windows.ui.xaml.controls.primitives/flyoutbase.md) placement logic.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamluipresenter.getflyoutplacement
     */
    static GetFlyoutPlacement(placementTargetBounds, controlSize, minControlSize, containerRect, targetPreferredPlacement, allowFallbacks, chosenPlacement) {
        if (!XamlUIPresenter.HasProp("__IXamlUIPresenterStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.XamlUIPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlUIPresenterStatics2.IID)
            XamlUIPresenter.__IXamlUIPresenterStatics2 := IXamlUIPresenterStatics2(factoryPtr)
        }

        return XamlUIPresenter.__IXamlUIPresenterStatics2.GetFlyoutPlacement(placementTargetBounds, controlSize, minControlSize, containerRect, targetPreferredPlacement, allowFallbacks, chosenPlacement)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the root visual element to draw to the surface.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamluipresenter.rootelement
     * @type {UIElement} 
     */
    RootElement {
        get => this.get_RootElement()
        set => this.put_RootElement(value)
    }

    /**
     * Gets or sets the string key that identifies the theme set to use from [ThemeResourcesXaml](xamluipresenter_themeresourcesxaml.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamluipresenter.themekey
     * @type {HSTRING} 
     */
    ThemeKey {
        get => this.get_ThemeKey()
        set => this.put_ThemeKey(value)
    }

    /**
     * Gets or sets the XAML that specifies a resource dictionary. The resource dictionary contains themes that the host should resolve and that should be applied to the content.
     * @remarks
     * This property is expected to contain a string that can be parsed into a complete valid XAML resource dictionary, including all tagging, XAML namespaces specified, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamluipresenter.themeresourcesxaml
     * @type {HSTRING} 
     */
    ThemeResourcesXaml {
        get => this.get_ThemeResourcesXaml()
        set => this.put_ThemeResourcesXaml(value)
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
    get_RootElement() {
        if (!this.HasProp("__IXamlUIPresenter")) {
            if ((queryResult := this.QueryInterface(IXamlUIPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUIPresenter := IXamlUIPresenter(outPtr)
        }

        return this.__IXamlUIPresenter.get_RootElement()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_RootElement(value) {
        if (!this.HasProp("__IXamlUIPresenter")) {
            if ((queryResult := this.QueryInterface(IXamlUIPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUIPresenter := IXamlUIPresenter(outPtr)
        }

        return this.__IXamlUIPresenter.put_RootElement(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ThemeKey() {
        if (!this.HasProp("__IXamlUIPresenter")) {
            if ((queryResult := this.QueryInterface(IXamlUIPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUIPresenter := IXamlUIPresenter(outPtr)
        }

        return this.__IXamlUIPresenter.get_ThemeKey()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ThemeKey(value) {
        if (!this.HasProp("__IXamlUIPresenter")) {
            if ((queryResult := this.QueryInterface(IXamlUIPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUIPresenter := IXamlUIPresenter(outPtr)
        }

        return this.__IXamlUIPresenter.put_ThemeKey(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ThemeResourcesXaml() {
        if (!this.HasProp("__IXamlUIPresenter")) {
            if ((queryResult := this.QueryInterface(IXamlUIPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUIPresenter := IXamlUIPresenter(outPtr)
        }

        return this.__IXamlUIPresenter.get_ThemeResourcesXaml()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ThemeResourcesXaml(value) {
        if (!this.HasProp("__IXamlUIPresenter")) {
            if ((queryResult := this.QueryInterface(IXamlUIPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUIPresenter := IXamlUIPresenter(outPtr)
        }

        return this.__IXamlUIPresenter.put_ThemeResourcesXaml(value)
    }

    /**
     * Specifies the width and height of the surface.
     * @param {Integer} width A width in pixels.
     * @param {Integer} height A height in pixels.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamluipresenter.setsize
     */
    SetSize(width, height) {
        if (!this.HasProp("__IXamlUIPresenter")) {
            if ((queryResult := this.QueryInterface(IXamlUIPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUIPresenter := IXamlUIPresenter(outPtr)
        }

        return this.__IXamlUIPresenter.SetSize(width, height)
    }

    /**
     * Renders the surface. Intended for asynchronous calls via a timer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamluipresenter.render
     */
    Render() {
        if (!this.HasProp("__IXamlUIPresenter")) {
            if ((queryResult := this.QueryInterface(IXamlUIPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUIPresenter := IXamlUIPresenter(outPtr)
        }

        return this.__IXamlUIPresenter.Render()
    }

    /**
     * Presents the surface, as a synchronous call for the host.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamluipresenter.present
     */
    Present() {
        if (!this.HasProp("__IXamlUIPresenter")) {
            if ((queryResult := this.QueryInterface(IXamlUIPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlUIPresenter := IXamlUIPresenter(outPtr)
        }

        return this.__IXamlUIPresenter.Present()
    }

;@endregion Instance Methods
}
