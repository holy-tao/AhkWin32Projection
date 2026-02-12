#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaRatio.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents ratios used in media operations.
 * @remarks
 * This object is not instantiated directly, it is returned by the [VideoEncodingProperties.FrameRate](videoencodingproperties_framerate.md) and [VideoEncodingProperties.PixelAspectRatio](videoencodingproperties_pixelaspectratio.md) properties.
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaratio
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class MediaRatio extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaRatio

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaRatio.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The numerator of the MediaRatio.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaratio.numerator
     * @type {Integer} 
     */
    Numerator {
        get => this.get_Numerator()
        set => this.put_Numerator(value)
    }

    /**
     * The denominator of the MediaRatio.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.mediaratio.denominator
     * @type {Integer} 
     */
    Denominator {
        get => this.get_Denominator()
        set => this.put_Denominator(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Numerator(value) {
        if (!this.HasProp("__IMediaRatio")) {
            if ((queryResult := this.QueryInterface(IMediaRatio.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaRatio := IMediaRatio(outPtr)
        }

        return this.__IMediaRatio.put_Numerator(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Numerator() {
        if (!this.HasProp("__IMediaRatio")) {
            if ((queryResult := this.QueryInterface(IMediaRatio.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaRatio := IMediaRatio(outPtr)
        }

        return this.__IMediaRatio.get_Numerator()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Denominator(value) {
        if (!this.HasProp("__IMediaRatio")) {
            if ((queryResult := this.QueryInterface(IMediaRatio.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaRatio := IMediaRatio(outPtr)
        }

        return this.__IMediaRatio.put_Denominator(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Denominator() {
        if (!this.HasProp("__IMediaRatio")) {
            if ((queryResult := this.QueryInterface(IMediaRatio.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaRatio := IMediaRatio(outPtr)
        }

        return this.__IMediaRatio.get_Denominator()
    }

;@endregion Instance Methods
}
