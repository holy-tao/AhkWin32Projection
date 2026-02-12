#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDefaultAudioDeviceChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a default audio render device change event.
 * @remarks
 * This object is not instantiated directly. It is created by the [MediaDevice.DefaultAudioRenderDeviceChanged](mediadevice_defaultaudiorenderdevicechanged.md) event and is returned as an argument to the [TypedEventHandler](../windows.foundation/typedeventhandler_2.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.defaultaudiorenderdevicechangedeventargs
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class DefaultAudioRenderDeviceChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDefaultAudioDeviceChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDefaultAudioDeviceChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the newly selected default audio render device that caused the change event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.defaultaudiorenderdevicechangedeventargs.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the role of the newly selected default audio render device that caused the change event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.defaultaudiorenderdevicechangedeventargs.role
     * @type {Integer} 
     */
    Role {
        get => this.get_Role()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IDefaultAudioDeviceChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDefaultAudioDeviceChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDefaultAudioDeviceChangedEventArgs := IDefaultAudioDeviceChangedEventArgs(outPtr)
        }

        return this.__IDefaultAudioDeviceChangedEventArgs.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Role() {
        if (!this.HasProp("__IDefaultAudioDeviceChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDefaultAudioDeviceChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDefaultAudioDeviceChangedEventArgs := IDefaultAudioDeviceChangedEventArgs(outPtr)
        }

        return this.__IDefaultAudioDeviceChangedEventArgs.get_Role()
    }

;@endregion Instance Methods
}
