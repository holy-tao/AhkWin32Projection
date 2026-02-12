#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemVideoProperties.ahk
#Include ..\..\Guid.ahk

/**
 * A helper object that provides indexing names for [video file properties](/windows/desktop/properties/video-bumper).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.systemvideoproperties
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class SystemVideoProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemVideoProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemVideoProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the [System.Video.Director](/windows/desktop/properties/props-system-video-director) property (one of the [Windows video file properties](/windows/desktop/properties/video-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemvideoproperties.director
     * @type {HSTRING} 
     */
    Director {
        get => this.get_Director()
    }

    /**
     * Gets the name of the [System.Video.FrameHeight](/windows/desktop/properties/props-system-video-frameheight) property (one of the [Windows video file properties](/windows/desktop/properties/video-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemvideoproperties.frameheight
     * @type {HSTRING} 
     */
    FrameHeight {
        get => this.get_FrameHeight()
    }

    /**
     * Gets the name of the [System.Video.FrameWidth](/windows/desktop/properties/props-system-video-framewidth) property (one of the [Windows video file properties](/windows/desktop/properties/video-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemvideoproperties.framewidth
     * @type {HSTRING} 
     */
    FrameWidth {
        get => this.get_FrameWidth()
    }

    /**
     * Gets the name of the [System.Video.Orientation](/windows/desktop/properties/props-system-video-orientation) property (one of the [Windows video file properties](/windows/desktop/properties/video-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemvideoproperties.orientation
     * @type {HSTRING} 
     */
    Orientation {
        get => this.get_Orientation()
    }

    /**
     * Gets the name of the [System.Video.TotalBitrate](/windows/desktop/properties/props-system-video-totalbitrate) property (one of the [Windows video file properties](/windows/desktop/properties/video-bumper).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.systemvideoproperties.totalbitrate
     * @type {HSTRING} 
     */
    TotalBitrate {
        get => this.get_TotalBitrate()
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
    get_Director() {
        if (!this.HasProp("__ISystemVideoProperties")) {
            if ((queryResult := this.QueryInterface(ISystemVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemVideoProperties := ISystemVideoProperties(outPtr)
        }

        return this.__ISystemVideoProperties.get_Director()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FrameHeight() {
        if (!this.HasProp("__ISystemVideoProperties")) {
            if ((queryResult := this.QueryInterface(ISystemVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemVideoProperties := ISystemVideoProperties(outPtr)
        }

        return this.__ISystemVideoProperties.get_FrameHeight()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FrameWidth() {
        if (!this.HasProp("__ISystemVideoProperties")) {
            if ((queryResult := this.QueryInterface(ISystemVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemVideoProperties := ISystemVideoProperties(outPtr)
        }

        return this.__ISystemVideoProperties.get_FrameWidth()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Orientation() {
        if (!this.HasProp("__ISystemVideoProperties")) {
            if ((queryResult := this.QueryInterface(ISystemVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemVideoProperties := ISystemVideoProperties(outPtr)
        }

        return this.__ISystemVideoProperties.get_Orientation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TotalBitrate() {
        if (!this.HasProp("__ISystemVideoProperties")) {
            if ((queryResult := this.QueryInterface(ISystemVideoProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemVideoProperties := ISystemVideoProperties(outPtr)
        }

        return this.__ISystemVideoProperties.get_TotalBitrate()
    }

;@endregion Instance Methods
}
