#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IImageDisplayProperties.ahk
#Include ..\..\Guid.ahk

/**
 * Provides properties for image information that is displayed by [SystemMediaTransportControlsDisplayUpdater](systemmediatransportcontrolsdisplayupdater.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.imagedisplayproperties
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class ImageDisplayProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IImageDisplayProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IImageDisplayProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the title of the image.
     * @see https://learn.microsoft.com/uwp/api/windows.media.imagedisplayproperties.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the subtitle of the image.
     * @see https://learn.microsoft.com/uwp/api/windows.media.imagedisplayproperties.subtitle
     * @type {HSTRING} 
     */
    Subtitle {
        get => this.get_Subtitle()
        set => this.put_Subtitle(value)
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
    get_Title() {
        if (!this.HasProp("__IImageDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IImageDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageDisplayProperties := IImageDisplayProperties(outPtr)
        }

        return this.__IImageDisplayProperties.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IImageDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IImageDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageDisplayProperties := IImageDisplayProperties(outPtr)
        }

        return this.__IImageDisplayProperties.put_Title(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subtitle() {
        if (!this.HasProp("__IImageDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IImageDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageDisplayProperties := IImageDisplayProperties(outPtr)
        }

        return this.__IImageDisplayProperties.get_Subtitle()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Subtitle(value) {
        if (!this.HasProp("__IImageDisplayProperties")) {
            if ((queryResult := this.QueryInterface(IImageDisplayProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IImageDisplayProperties := IImageDisplayProperties(outPtr)
        }

        return this.__IImageDisplayProperties.put_Subtitle(value)
    }

;@endregion Instance Methods
}
