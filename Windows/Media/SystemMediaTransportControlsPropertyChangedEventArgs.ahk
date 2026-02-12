#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemMediaTransportControlsPropertyChangedEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Occurs when a property is changed on the [SystemMediaTransportControls](systemmediatransportcontrols.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolspropertychangedeventargs
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class SystemMediaTransportControlsPropertyChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemMediaTransportControlsPropertyChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemMediaTransportControlsPropertyChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The property that was changed on the [SystemMediaTransportControls](systemmediatransportcontrols.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrolspropertychangedeventargs.property
     * @type {Integer} 
     */
    Property {
        get => this.get_Property()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Property() {
        if (!this.HasProp("__ISystemMediaTransportControlsPropertyChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControlsPropertyChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControlsPropertyChangedEventArgs := ISystemMediaTransportControlsPropertyChangedEventArgs(outPtr)
        }

        return this.__ISystemMediaTransportControlsPropertyChangedEventArgs.get_Property()
    }

;@endregion Instance Methods
}
