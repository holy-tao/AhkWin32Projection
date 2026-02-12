#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\PickerFlyoutBase.ahk
#Include .\IPickerFlyout.ahk
#Include .\IPickerFlyoutStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\PickerFlyout.ahk
#Include .\PickerConfirmedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a custom picker control. (Not recommended for Universal Windows Platform (UWP) app. See [Flyout](flyout.md).)
 * @remarks
 * > [!NOTE]
 * > PickerFlyout is not supported for use in Universal Windows Platform (UWP) app for Windows 10. Instead, use a [Flyout](flyout.md) with a custom UI to present a custom picker control.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pickerflyout
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class PickerFlyout extends PickerFlyoutBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPickerFlyout

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPickerFlyout.IID

    /**
     * Gets the identifier for the [Content](pickerflyout_content.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pickerflyout.contentproperty
     * @type {DependencyProperty} 
     */
    static ContentProperty {
        get => PickerFlyout.get_ContentProperty()
    }

    /**
     * Identifies the [ConfirmationButtonsVisible](pickerflyout_confirmationbuttonsvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pickerflyout.confirmationbuttonsvisibleproperty
     * @type {DependencyProperty} 
     */
    static ConfirmationButtonsVisibleProperty {
        get => PickerFlyout.get_ConfirmationButtonsVisibleProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ContentProperty() {
        if (!PickerFlyout.HasProp("__IPickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPickerFlyoutStatics.IID)
            PickerFlyout.__IPickerFlyoutStatics := IPickerFlyoutStatics(factoryPtr)
        }

        return PickerFlyout.__IPickerFlyoutStatics.get_ContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ConfirmationButtonsVisibleProperty() {
        if (!PickerFlyout.HasProp("__IPickerFlyoutStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PickerFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPickerFlyoutStatics.IID)
            PickerFlyout.__IPickerFlyoutStatics := IPickerFlyoutStatics(factoryPtr)
        }

        return PickerFlyout.__IPickerFlyoutStatics.get_ConfirmationButtonsVisibleProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the content that is contained within the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pickerflyout.content
     * @type {UIElement} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * Gets or sets whether the confirmation buttons are visible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pickerflyout.confirmationbuttonsvisible
     * @type {Boolean} 
     */
    ConfirmationButtonsVisible {
        get => this.get_ConfirmationButtonsVisible()
        set => this.put_ConfirmationButtonsVisible(value)
    }

    /**
     * Occurs when the user has tapped a confirmation button to confirm the selection.
     * @type {TypedEventHandler<PickerFlyout, PickerConfirmedEventArgs>}
    */
    OnConfirmed {
        get {
            if(!this.HasProp("__OnConfirmed")){
                this.__OnConfirmed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{22cde5b7-4eb7-5ee4-8d28-1f1cbcf68fb0}"),
                    PickerFlyout,
                    PickerConfirmedEventArgs
                )
                this.__OnConfirmedToken := this.add_Confirmed(this.__OnConfirmed.iface)
            }
            return this.__OnConfirmed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PickerFlyout](pickerflyout.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PickerFlyout")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnConfirmedToken")) {
            this.remove_Confirmed(this.__OnConfirmedToken)
            this.__OnConfirmed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Content() {
        if (!this.HasProp("__IPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPickerFlyout := IPickerFlyout(outPtr)
        }

        return this.__IPickerFlyout.get_Content()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        if (!this.HasProp("__IPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPickerFlyout := IPickerFlyout(outPtr)
        }

        return this.__IPickerFlyout.put_Content(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ConfirmationButtonsVisible() {
        if (!this.HasProp("__IPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPickerFlyout := IPickerFlyout(outPtr)
        }

        return this.__IPickerFlyout.get_ConfirmationButtonsVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ConfirmationButtonsVisible(value) {
        if (!this.HasProp("__IPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPickerFlyout := IPickerFlyout(outPtr)
        }

        return this.__IPickerFlyout.put_ConfirmationButtonsVisible(value)
    }

    /**
     * 
     * @param {TypedEventHandler<PickerFlyout, PickerConfirmedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Confirmed(handler) {
        if (!this.HasProp("__IPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPickerFlyout := IPickerFlyout(outPtr)
        }

        return this.__IPickerFlyout.add_Confirmed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Confirmed(token) {
        if (!this.HasProp("__IPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPickerFlyout := IPickerFlyout(outPtr)
        }

        return this.__IPickerFlyout.remove_Confirmed(token)
    }

    /**
     * Begins an asynchronous operation to show the flyout placed in relation to the specified element.
     * @param {FrameworkElement} target The element to use as the flyout's placement target.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pickerflyout.showatasync
     */
    ShowAtAsync(target) {
        if (!this.HasProp("__IPickerFlyout")) {
            if ((queryResult := this.QueryInterface(IPickerFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPickerFlyout := IPickerFlyout(outPtr)
        }

        return this.__IPickerFlyout.ShowAtAsync(target)
    }

;@endregion Instance Methods
}
