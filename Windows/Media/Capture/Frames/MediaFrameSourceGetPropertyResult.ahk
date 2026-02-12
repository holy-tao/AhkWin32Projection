#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaFrameSourceGetPropertyResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the value of a [MediaFrameSource](mediaframesource.md) property, if it was successfully retrieved, and the result status of the get operation.
 * @remarks
 * Get an instance of **MediaFrameSourceGetPropertyResult** by calling [MediaFrameSourceController.GetPropertyAsync](mediaframesourcecontroller_getpropertyasync_1561087689.md). Check the value of the [Status](mediaframesourcegetpropertyresult_status.md) property to determine if the get operation was successful.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcegetpropertyresult
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MediaFrameSourceGetPropertyResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaFrameSourceGetPropertyResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaFrameSourceGetPropertyResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value describing the result status of the get operation that attempted to retrieve the [MediaFrameSource](mediaframesource.md) property value.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcegetpropertyresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets an object containing the value of a [MediaFrameSource](mediaframesource.md) property, if the value was successfully retreived.
     * @remarks
     * If the value of the Status property is anything other than [Success](mediaframesourcegetpropertystatus.md), then this property is null.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.mediaframesourcegetpropertyresult.value
     * @type {IInspectable} 
     */
    Value {
        get => this.get_Value()
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
    get_Status() {
        if (!this.HasProp("__IMediaFrameSourceGetPropertyResult")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSourceGetPropertyResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSourceGetPropertyResult := IMediaFrameSourceGetPropertyResult(outPtr)
        }

        return this.__IMediaFrameSourceGetPropertyResult.get_Status()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Value() {
        if (!this.HasProp("__IMediaFrameSourceGetPropertyResult")) {
            if ((queryResult := this.QueryInterface(IMediaFrameSourceGetPropertyResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrameSourceGetPropertyResult := IMediaFrameSourceGetPropertyResult(outPtr)
        }

        return this.__IMediaFrameSourceGetPropertyResult.get_Value()
    }

;@endregion Instance Methods
}
