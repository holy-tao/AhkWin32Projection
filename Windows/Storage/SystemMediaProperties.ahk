#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemMediaProperties.ahk
#Include ..\..\Guid.ahk

/**
 * A helper object that provides indexing names for [Windows media file properties](/windows/desktop/properties/media-bumper).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.systemmediaproperties
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class SystemMediaProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemMediaProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemMediaProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the [System.Media.Duration](/windows/desktop/properties/props-system-media-duration) property (one of the [Windows media file properties](/windows/desktop/properties/media-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemmediaproperties.duration
     * @type {HSTRING} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * Gets the name of the [System.Media.Producer](/windows/desktop/properties/props-system-media-producer) property (one of the [Windows media file properties](/windows/desktop/properties/media-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemmediaproperties.producer
     * @type {HSTRING} 
     */
    Producer {
        get => this.get_Producer()
    }

    /**
     * Gets the name of the [System.Media.Publisher](/windows/desktop/properties/props-system-media-publisher) property (one of the [Windows media file properties](/windows/desktop/properties/media-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemmediaproperties.publisher
     * @type {HSTRING} 
     */
    Publisher {
        get => this.get_Publisher()
    }

    /**
     * Gets the name of the [System.Media.SubTitle](/windows/desktop/properties/props-system-media-subtitle) property (one of the [Windows media file properties](/windows/desktop/properties/media-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemmediaproperties.subtitle
     * @type {HSTRING} 
     */
    SubTitle {
        get => this.get_SubTitle()
    }

    /**
     * Gets the name of the [System.Media.Writer](/windows/desktop/properties/props-system-media-writer) property (one of the [Windows media file properties](/windows/desktop/properties/media-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemmediaproperties.writer
     * @type {HSTRING} 
     */
    Writer {
        get => this.get_Writer()
    }

    /**
     * Gets the name of the [System.Media.Year](/windows/desktop/properties/props-system-media-year) property (one of the [Windows media file properties](/windows/desktop/properties/media-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemmediaproperties.year
     * @type {HSTRING} 
     */
    Year {
        get => this.get_Year()
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
    get_Duration() {
        if (!this.HasProp("__ISystemMediaProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMediaProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaProperties := ISystemMediaProperties(outPtr)
        }

        return this.__ISystemMediaProperties.get_Duration()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Producer() {
        if (!this.HasProp("__ISystemMediaProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMediaProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaProperties := ISystemMediaProperties(outPtr)
        }

        return this.__ISystemMediaProperties.get_Producer()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Publisher() {
        if (!this.HasProp("__ISystemMediaProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMediaProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaProperties := ISystemMediaProperties(outPtr)
        }

        return this.__ISystemMediaProperties.get_Publisher()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SubTitle() {
        if (!this.HasProp("__ISystemMediaProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMediaProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaProperties := ISystemMediaProperties(outPtr)
        }

        return this.__ISystemMediaProperties.get_SubTitle()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Writer() {
        if (!this.HasProp("__ISystemMediaProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMediaProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaProperties := ISystemMediaProperties(outPtr)
        }

        return this.__ISystemMediaProperties.get_Writer()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Year() {
        if (!this.HasProp("__ISystemMediaProperties")) {
            if ((queryResult := this.QueryInterface(ISystemMediaProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaProperties := ISystemMediaProperties(outPtr)
        }

        return this.__ISystemMediaProperties.get_Year()
    }

;@endregion Instance Methods
}
