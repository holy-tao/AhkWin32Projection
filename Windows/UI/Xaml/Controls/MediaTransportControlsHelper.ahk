#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaTransportControlsHelper.ahk
#Include .\IMediaTransportControlsHelperStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides properties and methods to customize media transport controls.
 * @remarks
 * You do not instantiate this class directly. To use this class, set the [MediaTransportControlsHelper.DropoutOrder](mediatransportcontrolshelper_dropoutorder.md) attached property on a control in the template of a [MediaTransportControls](mediatransportcontrols.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrolshelper
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class MediaTransportControlsHelper extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaTransportControlsHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaTransportControlsHelper.IID

    /**
     * Identifies the [MediaTransportControlsHelper.DropoutOrder](mediatransportcontrolshelper_dropoutorder.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [MediaTransportControlsHelper.DropoutOrder](mediatransportcontrolshelper_dropoutorder.md) XAML attached property in XAML and won't need this identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrolshelper.dropoutorderproperty
     * @type {DependencyProperty} 
     */
    static DropoutOrderProperty {
        get => MediaTransportControlsHelper.get_DropoutOrderProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DropoutOrderProperty() {
        if (!MediaTransportControlsHelper.HasProp("__IMediaTransportControlsHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControlsHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsHelperStatics.IID)
            MediaTransportControlsHelper.__IMediaTransportControlsHelperStatics := IMediaTransportControlsHelperStatics(factoryPtr)
        }

        return MediaTransportControlsHelper.__IMediaTransportControlsHelperStatics.get_DropoutOrderProperty()
    }

    /**
     * Gets the value of the [MediaTransportControlsHelper.DropoutOrder](mediatransportcontrolshelper_dropoutorder.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [MediaTransportControlsHelper.DropoutOrder](mediatransportcontrolshelper_dropoutorder.md) XAML attached property in XAML and won't need this method. For more info, see the [MediaTransportControlsHelper.DropoutOrder](mediatransportcontrolshelper_dropoutorder.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {IReference<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrolshelper.getdropoutorder
     */
    static GetDropoutOrder(element) {
        if (!MediaTransportControlsHelper.HasProp("__IMediaTransportControlsHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControlsHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsHelperStatics.IID)
            MediaTransportControlsHelper.__IMediaTransportControlsHelperStatics := IMediaTransportControlsHelperStatics(factoryPtr)
        }

        return MediaTransportControlsHelper.__IMediaTransportControlsHelperStatics.GetDropoutOrder(element)
    }

    /**
     * Sets the value of the [MediaTransportControlsHelper.DropoutOrder](mediatransportcontrolshelper_dropoutorder.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [MediaTransportControlsHelper.DropoutOrder](mediatransportcontrolshelper_dropoutorder.md) XAML attached property in XAML and won't need this method. For more info, see the [MediaTransportControlsHelper.DropoutOrder](mediatransportcontrolshelper_dropoutorder.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {IReference<Integer>} value The value to set. (The dropout priority of the control relative to other transport controls.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrolshelper.setdropoutorder
     */
    static SetDropoutOrder(element, value) {
        if (!MediaTransportControlsHelper.HasProp("__IMediaTransportControlsHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControlsHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsHelperStatics.IID)
            MediaTransportControlsHelper.__IMediaTransportControlsHelperStatics := IMediaTransportControlsHelperStatics(factoryPtr)
        }

        return MediaTransportControlsHelper.__IMediaTransportControlsHelperStatics.SetDropoutOrder(element, value)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
