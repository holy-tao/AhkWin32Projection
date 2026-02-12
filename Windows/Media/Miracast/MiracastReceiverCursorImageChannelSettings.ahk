#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiverCursorImageChannelSettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * An object that represents settings that can be configured on the [MiracastReceiverCursorImageChannel](miracastreceivercursorimagechannel.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivercursorimagechannelsettings
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverCursorImageChannelSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiverCursorImageChannelSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiverCursorImageChannelSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the enabled status of the use of the separate channel for mouse cursor images.
     * @remarks
     * When set to true, the Miracast Transmitter may transmit the mouse cursor image as a PNG bitmap, separate from the normal Miracast video stream.
     * Not all Miracast Transmitters support this feature, in which case the mouse cursor image, if any, will remain included in the video stream even if the property is set to True.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivercursorimagechannelsettings.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Controls the maximum width and height of the cursor image PNG bitmap, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivercursorimagechannelsettings.maximagesize
     * @type {SizeInt32} 
     */
    MaxImageSize {
        get => this.get_MaxImageSize()
        set => this.put_MaxImageSize(value)
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
    get_IsEnabled() {
        if (!this.HasProp("__IMiracastReceiverCursorImageChannelSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverCursorImageChannelSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverCursorImageChannelSettings := IMiracastReceiverCursorImageChannelSettings(outPtr)
        }

        return this.__IMiracastReceiverCursorImageChannelSettings.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__IMiracastReceiverCursorImageChannelSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverCursorImageChannelSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverCursorImageChannelSettings := IMiracastReceiverCursorImageChannelSettings(outPtr)
        }

        return this.__IMiracastReceiverCursorImageChannelSettings.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_MaxImageSize() {
        if (!this.HasProp("__IMiracastReceiverCursorImageChannelSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverCursorImageChannelSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverCursorImageChannelSettings := IMiracastReceiverCursorImageChannelSettings(outPtr)
        }

        return this.__IMiracastReceiverCursorImageChannelSettings.get_MaxImageSize()
    }

    /**
     * 
     * @param {SizeInt32} value 
     * @returns {HRESULT} 
     */
    put_MaxImageSize(value) {
        if (!this.HasProp("__IMiracastReceiverCursorImageChannelSettings")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverCursorImageChannelSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverCursorImageChannelSettings := IMiracastReceiverCursorImageChannelSettings(outPtr)
        }

        return this.__IMiracastReceiverCursorImageChannelSettings.put_MaxImageSize(value)
    }

;@endregion Instance Methods
}
