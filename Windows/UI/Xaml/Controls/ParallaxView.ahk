#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IParallaxView.ahk
#Include .\IParallaxViewFactory.ahk
#Include .\IParallaxViewStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a container that ties the scroll position of a foreground element, such as a list, to a background element, such as an image. As you scroll through the foreground element, it animates the background element to create a parallax effect.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ParallaxView extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IParallaxView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IParallaxView.IID

    /**
     * Identifies the Child dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.ChildProperty](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.childproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.childproperty
     * @type {DependencyProperty} 
     */
    static ChildProperty {
        get => ParallaxView.get_ChildProperty()
    }

    /**
     * Identifies the HorizontalSourceEndOffset dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.HorizontalSourceEndOffsetProperty](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.horizontalsourceendoffsetproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.horizontalsourceendoffsetproperty
     * @type {DependencyProperty} 
     */
    static HorizontalSourceEndOffsetProperty {
        get => ParallaxView.get_HorizontalSourceEndOffsetProperty()
    }

    /**
     * Identifies the HorizontalSourceOffsetKind dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.HorizontalSourceOffsetKindProperty](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.horizontalsourceoffsetkindproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.horizontalsourceoffsetkindproperty
     * @type {DependencyProperty} 
     */
    static HorizontalSourceOffsetKindProperty {
        get => ParallaxView.get_HorizontalSourceOffsetKindProperty()
    }

    /**
     * Identifies the HorizontalSourceStartOffset dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.HorizontalSourceStartOffsetProperty](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.horizontalsourcestartoffsetproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.horizontalsourcestartoffsetproperty
     * @type {DependencyProperty} 
     */
    static HorizontalSourceStartOffsetProperty {
        get => ParallaxView.get_HorizontalSourceStartOffsetProperty()
    }

    /**
     * Identifies the MaxHorizontalShiftRatio dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.MaxHorizontalShiftRatioProperty](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.maxhorizontalshiftratioproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.maxhorizontalshiftratioproperty
     * @type {DependencyProperty} 
     */
    static MaxHorizontalShiftRatioProperty {
        get => ParallaxView.get_MaxHorizontalShiftRatioProperty()
    }

    /**
     * Identifies the HorizontalShift dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.HorizontalShiftProperty](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.horizontalshiftproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.horizontalshiftproperty
     * @type {DependencyProperty} 
     */
    static HorizontalShiftProperty {
        get => ParallaxView.get_HorizontalShiftProperty()
    }

    /**
     * Identifies the IsHorizontalShiftClamped dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.IsHorizontalShiftClampedProperty](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.ishorizontalshiftclampedproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.ishorizontalshiftclampedproperty
     * @type {DependencyProperty} 
     */
    static IsHorizontalShiftClampedProperty {
        get => ParallaxView.get_IsHorizontalShiftClampedProperty()
    }

    /**
     * Identifies the IsVerticalShiftClamped dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.IsVerticalShiftClampedProperty](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.isverticalshiftclampedproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.isverticalshiftclampedproperty
     * @type {DependencyProperty} 
     */
    static IsVerticalShiftClampedProperty {
        get => ParallaxView.get_IsVerticalShiftClampedProperty()
    }

    /**
     * Identifies the Source dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.SourceProperty](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.sourceproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.sourceproperty
     * @type {DependencyProperty} 
     */
    static SourceProperty {
        get => ParallaxView.get_SourceProperty()
    }

    /**
     * Identifies the VerticalSourceEndOffset dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.VerticalSourceEndOffsetProperty](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.verticalsourceendoffsetproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.verticalsourceendoffsetproperty
     * @type {DependencyProperty} 
     */
    static VerticalSourceEndOffsetProperty {
        get => ParallaxView.get_VerticalSourceEndOffsetProperty()
    }

    /**
     * Identifies the VerticalSourceOffsetKind dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.VerticalSourceOffsetKindProperty](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.verticalsourceoffsetkindproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.verticalsourceoffsetkindproperty
     * @type {DependencyProperty} 
     */
    static VerticalSourceOffsetKindProperty {
        get => ParallaxView.get_VerticalSourceOffsetKindProperty()
    }

    /**
     * Identifies the VerticalSourceStartOffset dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.VerticalSourceStartOffsetProperty](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.verticalsourcestartoffsetproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.verticalsourcestartoffsetproperty
     * @type {DependencyProperty} 
     */
    static VerticalSourceStartOffsetProperty {
        get => ParallaxView.get_VerticalSourceStartOffsetProperty()
    }

    /**
     * Identifies the MaxVerticalShiftRatio dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.MaxVerticalShiftRatioProperty](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.maxverticalshiftratioproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.maxverticalshiftratioproperty
     * @type {DependencyProperty} 
     */
    static MaxVerticalShiftRatioProperty {
        get => ParallaxView.get_MaxVerticalShiftRatioProperty()
    }

    /**
     * Identifies the VerticalShift dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.VerticalShiftProperty](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.verticalshiftproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.verticalshiftproperty
     * @type {DependencyProperty} 
     */
    static VerticalShiftProperty {
        get => ParallaxView.get_VerticalShiftProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ParallaxView} 
     */
    static CreateInstance() {
        if (!ParallaxView.HasProp("__IParallaxViewFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ParallaxView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IParallaxViewFactory.IID)
            ParallaxView.__IParallaxViewFactory := IParallaxViewFactory(factoryPtr)
        }

        return ParallaxView.__IParallaxViewFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ChildProperty() {
        if (!ParallaxView.HasProp("__IParallaxViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ParallaxView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IParallaxViewStatics.IID)
            ParallaxView.__IParallaxViewStatics := IParallaxViewStatics(factoryPtr)
        }

        return ParallaxView.__IParallaxViewStatics.get_ChildProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalSourceEndOffsetProperty() {
        if (!ParallaxView.HasProp("__IParallaxViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ParallaxView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IParallaxViewStatics.IID)
            ParallaxView.__IParallaxViewStatics := IParallaxViewStatics(factoryPtr)
        }

        return ParallaxView.__IParallaxViewStatics.get_HorizontalSourceEndOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalSourceOffsetKindProperty() {
        if (!ParallaxView.HasProp("__IParallaxViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ParallaxView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IParallaxViewStatics.IID)
            ParallaxView.__IParallaxViewStatics := IParallaxViewStatics(factoryPtr)
        }

        return ParallaxView.__IParallaxViewStatics.get_HorizontalSourceOffsetKindProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalSourceStartOffsetProperty() {
        if (!ParallaxView.HasProp("__IParallaxViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ParallaxView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IParallaxViewStatics.IID)
            ParallaxView.__IParallaxViewStatics := IParallaxViewStatics(factoryPtr)
        }

        return ParallaxView.__IParallaxViewStatics.get_HorizontalSourceStartOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxHorizontalShiftRatioProperty() {
        if (!ParallaxView.HasProp("__IParallaxViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ParallaxView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IParallaxViewStatics.IID)
            ParallaxView.__IParallaxViewStatics := IParallaxViewStatics(factoryPtr)
        }

        return ParallaxView.__IParallaxViewStatics.get_MaxHorizontalShiftRatioProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HorizontalShiftProperty() {
        if (!ParallaxView.HasProp("__IParallaxViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ParallaxView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IParallaxViewStatics.IID)
            ParallaxView.__IParallaxViewStatics := IParallaxViewStatics(factoryPtr)
        }

        return ParallaxView.__IParallaxViewStatics.get_HorizontalShiftProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsHorizontalShiftClampedProperty() {
        if (!ParallaxView.HasProp("__IParallaxViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ParallaxView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IParallaxViewStatics.IID)
            ParallaxView.__IParallaxViewStatics := IParallaxViewStatics(factoryPtr)
        }

        return ParallaxView.__IParallaxViewStatics.get_IsHorizontalShiftClampedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsVerticalShiftClampedProperty() {
        if (!ParallaxView.HasProp("__IParallaxViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ParallaxView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IParallaxViewStatics.IID)
            ParallaxView.__IParallaxViewStatics := IParallaxViewStatics(factoryPtr)
        }

        return ParallaxView.__IParallaxViewStatics.get_IsVerticalShiftClampedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SourceProperty() {
        if (!ParallaxView.HasProp("__IParallaxViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ParallaxView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IParallaxViewStatics.IID)
            ParallaxView.__IParallaxViewStatics := IParallaxViewStatics(factoryPtr)
        }

        return ParallaxView.__IParallaxViewStatics.get_SourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalSourceEndOffsetProperty() {
        if (!ParallaxView.HasProp("__IParallaxViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ParallaxView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IParallaxViewStatics.IID)
            ParallaxView.__IParallaxViewStatics := IParallaxViewStatics(factoryPtr)
        }

        return ParallaxView.__IParallaxViewStatics.get_VerticalSourceEndOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalSourceOffsetKindProperty() {
        if (!ParallaxView.HasProp("__IParallaxViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ParallaxView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IParallaxViewStatics.IID)
            ParallaxView.__IParallaxViewStatics := IParallaxViewStatics(factoryPtr)
        }

        return ParallaxView.__IParallaxViewStatics.get_VerticalSourceOffsetKindProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalSourceStartOffsetProperty() {
        if (!ParallaxView.HasProp("__IParallaxViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ParallaxView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IParallaxViewStatics.IID)
            ParallaxView.__IParallaxViewStatics := IParallaxViewStatics(factoryPtr)
        }

        return ParallaxView.__IParallaxViewStatics.get_VerticalSourceStartOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxVerticalShiftRatioProperty() {
        if (!ParallaxView.HasProp("__IParallaxViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ParallaxView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IParallaxViewStatics.IID)
            ParallaxView.__IParallaxViewStatics := IParallaxViewStatics(factoryPtr)
        }

        return ParallaxView.__IParallaxViewStatics.get_MaxVerticalShiftRatioProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VerticalShiftProperty() {
        if (!ParallaxView.HasProp("__IParallaxViewStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ParallaxView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IParallaxViewStatics.IID)
            ParallaxView.__IParallaxViewStatics := IParallaxViewStatics(factoryPtr)
        }

        return ParallaxView.__IParallaxViewStatics.get_VerticalShiftProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the background content of the ParallaxView.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.Child](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.child) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.child
     * @type {UIElement} 
     */
    Child {
        get => this.get_Child()
        set => this.put_Child(value)
    }

    /**
     * Represents the horizontal range of motion of the child element.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.HorizontalShift](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.horizontalshift) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The default value of 0 means there is no horizontal parallax motion. A value of 100 means the Child element is sized to 100px wider than the ParallaxView, so the range of the parallax motion is 100px.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.horizontalshift
     * @type {Float} 
     */
    HorizontalShift {
        get => this.get_HorizontalShift()
        set => this.put_HorizontalShift(value)
    }

    /**
     * Represents the horizontal scroll offset at which the parallax motion ends.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.HorizontalSourceEndOffset](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.horizontalsourceendoffset) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.horizontalsourceendoffset
     * @type {Float} 
     */
    HorizontalSourceEndOffset {
        get => this.get_HorizontalSourceEndOffset()
        set => this.put_HorizontalSourceEndOffset(value)
    }

    /**
     * Gets or sets a value that determines how the horizontal source offset values of a ParallaxView are interpreted.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.HorizontalSourceOffsetKind](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.horizontalsourceoffsetkind) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.horizontalsourceoffsetkind
     * @type {Integer} 
     */
    HorizontalSourceOffsetKind {
        get => this.get_HorizontalSourceOffsetKind()
        set => this.put_HorizontalSourceOffsetKind(value)
    }

    /**
     * Represents the horizontal scroll offset at which parallax motion starts.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.HorizontalSourceStartOffset](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.horizontalsourcestartoffset) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.horizontalsourcestartoffset
     * @type {Float} 
     */
    HorizontalSourceStartOffset {
        get => this.get_HorizontalSourceStartOffset()
        set => this.put_HorizontalSourceStartOffset(value)
    }

    /**
     * Gets or sets a value that indicates whether the horizontal parallax ratio is clampled to a specified percentage of the source scroll velocity.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.IsHorizontalShiftClamped](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.ishorizontalshiftclamped) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.ishorizontalshiftclamped
     * @type {Boolean} 
     */
    IsHorizontalShiftClamped {
        get => this.get_IsHorizontalShiftClamped()
        set => this.put_IsHorizontalShiftClamped(value)
    }

    /**
     * Gets or sets a value that indicates whether the vertical parallax ratio is clampled to a specified percentage of the source scroll velocity.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.IsVerticalShiftClamped](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.isverticalshiftclamped) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.isverticalshiftclamped
     * @type {Boolean} 
     */
    IsVerticalShiftClamped {
        get => this.get_IsVerticalShiftClamped()
        set => this.put_IsVerticalShiftClamped(value)
    }

    /**
     * Clamps the horizontal parallax ratio to the specified percentage of the source scroll velocity.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.MaxHorizontalShiftRatio](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.maxhorizontalshiftratio) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.maxhorizontalshiftratio
     * @type {Float} 
     */
    MaxHorizontalShiftRatio {
        get => this.get_MaxHorizontalShiftRatio()
        set => this.put_MaxHorizontalShiftRatio(value)
    }

    /**
     * Clamps the vertical parallax ratio to the specified percentage of the source scroll velocity.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.MaxVerticalShiftRatio](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.maxverticalshiftratio) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.maxverticalshiftratio
     * @type {Float} 
     */
    MaxVerticalShiftRatio {
        get => this.get_MaxVerticalShiftRatio()
        set => this.put_MaxVerticalShiftRatio(value)
    }

    /**
     * The element that either is or contains the ScrollViewer that controls the parallax operation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.Source](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.source) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * If the source element is not a ScrollViewer, the XAML tree is walked starting at the source element to find an embedded ScrollViewer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.source
     * @type {UIElement} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Represents the vertical range of motion of the child element.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.VerticalShift](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.verticalshift) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The default value of 0 means there is no vertical parallax motion. A value of 100 means the Child element is sized to 100px taller than the ParallaxView, so the range of the parallax motion is 100px.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.verticalshift
     * @type {Float} 
     */
    VerticalShift {
        get => this.get_VerticalShift()
        set => this.put_VerticalShift(value)
    }

    /**
     * Represents the vertical scroll offset at which the parallax motion ends.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.VerticalSourceEndOffset](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.verticalsourceendoffset) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.verticalsourceendoffset
     * @type {Float} 
     */
    VerticalSourceEndOffset {
        get => this.get_VerticalSourceEndOffset()
        set => this.put_VerticalSourceEndOffset(value)
    }

    /**
     * Gets or sets a value that determines how the vertical source offset values of a ParallaxView are interpreted.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.VerticalSourceOffsetKind](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.verticalsourceoffsetkind) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.verticalsourceoffsetkind
     * @type {Integer} 
     */
    VerticalSourceOffsetKind {
        get => this.get_VerticalSourceOffsetKind()
        set => this.put_VerticalSourceOffsetKind(value)
    }

    /**
     * Represents the vertical scroll offset at which parallax motion starts.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.VerticalSourceStartOffset](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.verticalsourcestartoffset) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.verticalsourcestartoffset
     * @type {Float} 
     */
    VerticalSourceStartOffset {
        get => this.get_VerticalSourceStartOffset()
        set => this.put_VerticalSourceStartOffset(value)
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
    get_Child() {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.get_Child()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Child(value) {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.put_Child(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalShift() {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.get_HorizontalShift()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HorizontalShift(value) {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.put_HorizontalShift(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalSourceEndOffset() {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.get_HorizontalSourceEndOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HorizontalSourceEndOffset(value) {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.put_HorizontalSourceEndOffset(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalSourceOffsetKind() {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.get_HorizontalSourceOffsetKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HorizontalSourceOffsetKind(value) {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.put_HorizontalSourceOffsetKind(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalSourceStartOffset() {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.get_HorizontalSourceStartOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HorizontalSourceStartOffset(value) {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.put_HorizontalSourceStartOffset(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHorizontalShiftClamped() {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.get_IsHorizontalShiftClamped()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHorizontalShiftClamped(value) {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.put_IsHorizontalShiftClamped(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVerticalShiftClamped() {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.get_IsVerticalShiftClamped()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsVerticalShiftClamped(value) {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.put_IsVerticalShiftClamped(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxHorizontalShiftRatio() {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.get_MaxHorizontalShiftRatio()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxHorizontalShiftRatio(value) {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.put_MaxHorizontalShiftRatio(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxVerticalShiftRatio() {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.get_MaxVerticalShiftRatio()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxVerticalShiftRatio(value) {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.put_MaxVerticalShiftRatio(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Source() {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.get_Source()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.put_Source(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalShift() {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.get_VerticalShift()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_VerticalShift(value) {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.put_VerticalShift(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalSourceEndOffset() {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.get_VerticalSourceEndOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_VerticalSourceEndOffset(value) {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.put_VerticalSourceEndOffset(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalSourceOffsetKind() {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.get_VerticalSourceOffsetKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VerticalSourceOffsetKind(value) {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.put_VerticalSourceOffsetKind(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalSourceStartOffset() {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.get_VerticalSourceStartOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_VerticalSourceStartOffset(value) {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.put_VerticalSourceStartOffset(value)
    }

    /**
     * Forces the automatically computed horizontal offsets to be recomputed.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.RefreshAutomaticHorizontalOffsets](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.refreshautomatichorizontaloffsets) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.refreshautomatichorizontaloffsets
     */
    RefreshAutomaticHorizontalOffsets() {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.RefreshAutomaticHorizontalOffsets()
    }

    /**
     * Forces the automatically computed vertical offsets to be recomputed.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ParallaxView.RefreshAutomaticVerticalOffsets](/windows/winui/api/microsoft.ui.xaml.controls.parallaxview.refreshautomaticverticaloffsets) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.parallaxview.refreshautomaticverticaloffsets
     */
    RefreshAutomaticVerticalOffsets() {
        if (!this.HasProp("__IParallaxView")) {
            if ((queryResult := this.QueryInterface(IParallaxView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IParallaxView := IParallaxView(outPtr)
        }

        return this.__IParallaxView.RefreshAutomaticVerticalOffsets()
    }

;@endregion Instance Methods
}
