#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionVideoProfile.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a Windows.Devices.Perception video profile.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptionvideoprofile
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionVideoProfile extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionVideoProfile

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionVideoProfile.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the bitmap pixel format.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptionvideoprofile.bitmappixelformat
     * @type {Integer} 
     */
    BitmapPixelFormat {
        get => this.get_BitmapPixelFormat()
    }

    /**
     * Gets the bitmap alpha mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptionvideoprofile.bitmapalphamode
     * @type {Integer} 
     */
    BitmapAlphaMode {
        get => this.get_BitmapAlphaMode()
    }

    /**
     * Gets the frame width, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptionvideoprofile.width
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * Gets the frame height, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptionvideoprofile.height
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * Gets the time duration of each frame.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptionvideoprofile.frameduration
     * @type {TimeSpan} 
     */
    FrameDuration {
        get => this.get_FrameDuration()
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
    get_BitmapPixelFormat() {
        if (!this.HasProp("__IPerceptionVideoProfile")) {
            if ((queryResult := this.QueryInterface(IPerceptionVideoProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionVideoProfile := IPerceptionVideoProfile(outPtr)
        }

        return this.__IPerceptionVideoProfile.get_BitmapPixelFormat()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitmapAlphaMode() {
        if (!this.HasProp("__IPerceptionVideoProfile")) {
            if ((queryResult := this.QueryInterface(IPerceptionVideoProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionVideoProfile := IPerceptionVideoProfile(outPtr)
        }

        return this.__IPerceptionVideoProfile.get_BitmapAlphaMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        if (!this.HasProp("__IPerceptionVideoProfile")) {
            if ((queryResult := this.QueryInterface(IPerceptionVideoProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionVideoProfile := IPerceptionVideoProfile(outPtr)
        }

        return this.__IPerceptionVideoProfile.get_Width()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        if (!this.HasProp("__IPerceptionVideoProfile")) {
            if ((queryResult := this.QueryInterface(IPerceptionVideoProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionVideoProfile := IPerceptionVideoProfile(outPtr)
        }

        return this.__IPerceptionVideoProfile.get_Height()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_FrameDuration() {
        if (!this.HasProp("__IPerceptionVideoProfile")) {
            if ((queryResult := this.QueryInterface(IPerceptionVideoProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionVideoProfile := IPerceptionVideoProfile(outPtr)
        }

        return this.__IPerceptionVideoProfile.get_FrameDuration()
    }

    /**
     * A comparison function used to determine if two IPerceptionVideoProfile objects are equivalent.
     * @param {PerceptionVideoProfile} other The IPerceptionVideoProfile object to compare to this one.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptionvideoprofile.isequal
     */
    IsEqual(other) {
        if (!this.HasProp("__IPerceptionVideoProfile")) {
            if ((queryResult := this.QueryInterface(IPerceptionVideoProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionVideoProfile := IPerceptionVideoProfile(outPtr)
        }

        return this.__IPerceptionVideoProfile.IsEqual(other)
    }

;@endregion Instance Methods
}
