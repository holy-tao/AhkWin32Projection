#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdvancedPhotoCaptureSettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents settings for an [AdvancedPhotoControl](advancedphotocontrol.md) object.
 * @remarks
 * Use this class to configure an instance of the [AdvancedPhotoControl](advancedphotocontrol.md) class by passing it into the [AdvancedPhotoControl.Configure](advancedphotocontrol_configure_232907878.md) method.
 * 
 * For how-to guidance on using [AdvancedPhotoCapture](../windows.media.capture/advancedphotocapture.md), see [High dynamic range (HDR) and low-light photo capture](/windows/uwp/audio-video-camera/high-dynamic-range-hdr-photo-capture).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.advancedphotocapturesettings
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class AdvancedPhotoCaptureSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdvancedPhotoCaptureSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdvancedPhotoCaptureSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the advanced capture mode for which an [AdvancedPhotoControl](advancedphotocontrol.md) will be configured.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.advancedphotocapturesettings.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [AdvancedPhotoCaptureSettings](advancedphotocapturesettings.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.AdvancedPhotoCaptureSettings")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IAdvancedPhotoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAdvancedPhotoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedPhotoCaptureSettings := IAdvancedPhotoCaptureSettings(outPtr)
        }

        return this.__IAdvancedPhotoCaptureSettings.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__IAdvancedPhotoCaptureSettings")) {
            if ((queryResult := this.QueryInterface(IAdvancedPhotoCaptureSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdvancedPhotoCaptureSettings := IAdvancedPhotoCaptureSettings(outPtr)
        }

        return this.__IAdvancedPhotoCaptureSettings.put_Mode(value)
    }

;@endregion Instance Methods
}
