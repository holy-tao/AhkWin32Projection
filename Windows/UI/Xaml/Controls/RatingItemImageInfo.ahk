#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RatingItemInfo.ahk
#Include .\IRatingItemImageInfo.ahk
#Include .\IRatingItemImageInfoStatics.ahk
#Include .\IRatingItemImageInfoFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents information about the visual states of image elements that represent a rating.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemImageInfo](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemimageinfo) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemimageinfo
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RatingItemImageInfo extends RatingItemInfo {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRatingItemImageInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRatingItemImageInfo.IID

    /**
     * Identifies the DisabledImage dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemImageInfo.DisabledImageProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemimageinfo.disabledimageproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemimageinfo.disabledimageproperty
     * @type {DependencyProperty} 
     */
    static DisabledImageProperty {
        get => RatingItemImageInfo.get_DisabledImageProperty()
    }

    /**
     * Identifies the Image dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemImageInfo.ImageProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemimageinfo.imageproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemimageinfo.imageproperty
     * @type {DependencyProperty} 
     */
    static ImageProperty {
        get => RatingItemImageInfo.get_ImageProperty()
    }

    /**
     * Identifies the PlaceholderImage dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemImageInfo.PlaceholderImageProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemimageinfo.placeholderimageproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemimageinfo.placeholderimageproperty
     * @type {DependencyProperty} 
     */
    static PlaceholderImageProperty {
        get => RatingItemImageInfo.get_PlaceholderImageProperty()
    }

    /**
     * Identifies the PointerOverImage dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemImageInfo.PointerOverImageProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemimageinfo.pointeroverimageproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemimageinfo.pointeroverimageproperty
     * @type {DependencyProperty} 
     */
    static PointerOverImageProperty {
        get => RatingItemImageInfo.get_PointerOverImageProperty()
    }

    /**
     * Identifies the PointerOverPlaceholderImage dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemImageInfo.PointerOverPlaceholderImageProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemimageinfo.pointeroverplaceholderimageproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemimageinfo.pointeroverplaceholderimageproperty
     * @type {DependencyProperty} 
     */
    static PointerOverPlaceholderImageProperty {
        get => RatingItemImageInfo.get_PointerOverPlaceholderImageProperty()
    }

    /**
     * Identifies the UnsetImage dependency property.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemImageInfo.UnsetImageProperty](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemimageinfo.unsetimageproperty) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemimageinfo.unsetimageproperty
     * @type {DependencyProperty} 
     */
    static UnsetImageProperty {
        get => RatingItemImageInfo.get_UnsetImageProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DisabledImageProperty() {
        if (!RatingItemImageInfo.HasProp("__IRatingItemImageInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingItemImageInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingItemImageInfoStatics.IID)
            RatingItemImageInfo.__IRatingItemImageInfoStatics := IRatingItemImageInfoStatics(factoryPtr)
        }

        return RatingItemImageInfo.__IRatingItemImageInfoStatics.get_DisabledImageProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ImageProperty() {
        if (!RatingItemImageInfo.HasProp("__IRatingItemImageInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingItemImageInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingItemImageInfoStatics.IID)
            RatingItemImageInfo.__IRatingItemImageInfoStatics := IRatingItemImageInfoStatics(factoryPtr)
        }

        return RatingItemImageInfo.__IRatingItemImageInfoStatics.get_ImageProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlaceholderImageProperty() {
        if (!RatingItemImageInfo.HasProp("__IRatingItemImageInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingItemImageInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingItemImageInfoStatics.IID)
            RatingItemImageInfo.__IRatingItemImageInfoStatics := IRatingItemImageInfoStatics(factoryPtr)
        }

        return RatingItemImageInfo.__IRatingItemImageInfoStatics.get_PlaceholderImageProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointerOverImageProperty() {
        if (!RatingItemImageInfo.HasProp("__IRatingItemImageInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingItemImageInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingItemImageInfoStatics.IID)
            RatingItemImageInfo.__IRatingItemImageInfoStatics := IRatingItemImageInfoStatics(factoryPtr)
        }

        return RatingItemImageInfo.__IRatingItemImageInfoStatics.get_PointerOverImageProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointerOverPlaceholderImageProperty() {
        if (!RatingItemImageInfo.HasProp("__IRatingItemImageInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingItemImageInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingItemImageInfoStatics.IID)
            RatingItemImageInfo.__IRatingItemImageInfoStatics := IRatingItemImageInfoStatics(factoryPtr)
        }

        return RatingItemImageInfo.__IRatingItemImageInfoStatics.get_PointerOverPlaceholderImageProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_UnsetImageProperty() {
        if (!RatingItemImageInfo.HasProp("__IRatingItemImageInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingItemImageInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingItemImageInfoStatics.IID)
            RatingItemImageInfo.__IRatingItemImageInfoStatics := IRatingItemImageInfoStatics(factoryPtr)
        }

        return RatingItemImageInfo.__IRatingItemImageInfoStatics.get_UnsetImageProperty()
    }

    /**
     * 
     * @returns {RatingItemImageInfo} 
     */
    static CreateInstance() {
        if (!RatingItemImageInfo.HasProp("__IRatingItemImageInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingItemImageInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingItemImageInfoFactory.IID)
            RatingItemImageInfo.__IRatingItemImageInfoFactory := IRatingItemImageInfoFactory(factoryPtr)
        }

        return RatingItemImageInfo.__IRatingItemImageInfoFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets an image that represents a rating element that is disabled.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemImageInfo.DisabledImage](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemimageinfo.disabledimage) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemimageinfo.disabledimage
     * @type {ImageSource} 
     */
    DisabledImage {
        get => this.get_DisabledImage()
        set => this.put_DisabledImage(value)
    }

    /**
     * Gets or sets an image that represents a rating element that has been set by the user.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemImageInfo.Image](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemimageinfo.image) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemimageinfo.image
     * @type {ImageSource} 
     */
    Image {
        get => this.get_Image()
        set => this.put_Image(value)
    }

    /**
     * Gets or sets an image that represents a rating element that is showing a placeholder value.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemImageInfo.PlaceholderImage](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemimageinfo.placeholderimage) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemimageinfo.placeholderimage
     * @type {ImageSource} 
     */
    PlaceholderImage {
        get => this.get_PlaceholderImage()
        set => this.put_PlaceholderImage(value)
    }

    /**
     * Gets or sets an image that represents a rating element that has the pointer over it.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemImageInfo.PointerOverImage](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemimageinfo.pointeroverimage) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemimageinfo.pointeroverimage
     * @type {ImageSource} 
     */
    PointerOverImage {
        get => this.get_PointerOverImage()
        set => this.put_PointerOverImage(value)
    }

    /**
     * Gets or sets an image that represents a rating element showing a placeholder value with the pointer over it.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemImageInfo.PointerOverPlaceholderImage](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemimageinfo.pointeroverplaceholderimage) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemimageinfo.pointeroverplaceholderimage
     * @type {ImageSource} 
     */
    PointerOverPlaceholderImage {
        get => this.get_PointerOverPlaceholderImage()
        set => this.put_PointerOverPlaceholderImage(value)
    }

    /**
     * Gets or sets an image that represents a rating element that has not been set.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemImageInfo.UnsetImage](/windows/winui/api/microsoft.ui.xaml.controls.ratingitemimageinfo.unsetimage) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingitemimageinfo.unsetimage
     * @type {ImageSource} 
     */
    UnsetImage {
        get => this.get_UnsetImage()
        set => this.put_UnsetImage(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_DisabledImage() {
        if (!this.HasProp("__IRatingItemImageInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemImageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemImageInfo := IRatingItemImageInfo(outPtr)
        }

        return this.__IRatingItemImageInfo.get_DisabledImage()
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_DisabledImage(value) {
        if (!this.HasProp("__IRatingItemImageInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemImageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemImageInfo := IRatingItemImageInfo(outPtr)
        }

        return this.__IRatingItemImageInfo.put_DisabledImage(value)
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_Image() {
        if (!this.HasProp("__IRatingItemImageInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemImageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemImageInfo := IRatingItemImageInfo(outPtr)
        }

        return this.__IRatingItemImageInfo.get_Image()
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_Image(value) {
        if (!this.HasProp("__IRatingItemImageInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemImageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemImageInfo := IRatingItemImageInfo(outPtr)
        }

        return this.__IRatingItemImageInfo.put_Image(value)
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_PlaceholderImage() {
        if (!this.HasProp("__IRatingItemImageInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemImageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemImageInfo := IRatingItemImageInfo(outPtr)
        }

        return this.__IRatingItemImageInfo.get_PlaceholderImage()
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderImage(value) {
        if (!this.HasProp("__IRatingItemImageInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemImageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemImageInfo := IRatingItemImageInfo(outPtr)
        }

        return this.__IRatingItemImageInfo.put_PlaceholderImage(value)
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_PointerOverImage() {
        if (!this.HasProp("__IRatingItemImageInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemImageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemImageInfo := IRatingItemImageInfo(outPtr)
        }

        return this.__IRatingItemImageInfo.get_PointerOverImage()
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_PointerOverImage(value) {
        if (!this.HasProp("__IRatingItemImageInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemImageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemImageInfo := IRatingItemImageInfo(outPtr)
        }

        return this.__IRatingItemImageInfo.put_PointerOverImage(value)
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_PointerOverPlaceholderImage() {
        if (!this.HasProp("__IRatingItemImageInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemImageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemImageInfo := IRatingItemImageInfo(outPtr)
        }

        return this.__IRatingItemImageInfo.get_PointerOverPlaceholderImage()
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_PointerOverPlaceholderImage(value) {
        if (!this.HasProp("__IRatingItemImageInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemImageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemImageInfo := IRatingItemImageInfo(outPtr)
        }

        return this.__IRatingItemImageInfo.put_PointerOverPlaceholderImage(value)
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_UnsetImage() {
        if (!this.HasProp("__IRatingItemImageInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemImageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemImageInfo := IRatingItemImageInfo(outPtr)
        }

        return this.__IRatingItemImageInfo.get_UnsetImage()
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_UnsetImage(value) {
        if (!this.HasProp("__IRatingItemImageInfo")) {
            if ((queryResult := this.QueryInterface(IRatingItemImageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRatingItemImageInfo := IRatingItemImageInfo(outPtr)
        }

        return this.__IRatingItemImageInfo.put_UnsetImage(value)
    }

;@endregion Instance Methods
}
