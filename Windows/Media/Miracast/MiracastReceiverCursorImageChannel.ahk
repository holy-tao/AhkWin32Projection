#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMiracastReceiverCursorImageChannel.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MiracastReceiverCursorImageChannel.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * An object representing the channel for transmitting mouse cursor images from a Miracast Transmitter to a Miracast Receiver.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivercursorimagechannel
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverCursorImageChannel extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMiracastReceiverCursorImageChannel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMiracastReceiverCursorImageChannel.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies if the cursor image channel has been enabled by the Miracast Receiver.
     * @remarks
     * If the Miracast Transmitter does not support the Miracast Receiver Cursor Image Channel feature, the cursor image will still be transmitted as part of the video stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivercursorimagechannel.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * Gets the maximum width and height of the cursor image PNG bitmap, in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivercursorimagechannel.maximagesize
     * @type {SizeInt32} 
     */
    MaxImageSize {
        get => this.get_MaxImageSize()
    }

    /**
     * Gets the coordinates of the upper-left corner of the cursor image, in pixels.
     * @remarks
     * The coordinates are specified in the same scale as the Miracast video stream, as transmitted by the Miracast Transmitter. In other words, any rescaling done by the Miracast Receiver app has not been factored in.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivercursorimagechannel.position
     * @type {PointInt32} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the cursor image as a PNG image bitmap.
     * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceivercursorimagechannel.imagestream
     * @type {IRandomAccessStreamWithContentType} 
     */
    ImageStream {
        get => this.get_ImageStream()
    }

    /**
     * An event which is raised when the image stream bitmap has changed.
     * @remarks
     * Use the [ImageStream](miracastreceivercursorimagechannel_imagestream.md) property to retrieve the latest image stream bitmap.
     * @type {TypedEventHandler<MiracastReceiverCursorImageChannel, IInspectable>}
    */
    OnImageStreamChanged {
        get {
            if(!this.HasProp("__OnImageStreamChanged")){
                this.__OnImageStreamChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{401d6f64-cb30-59c3-a663-f84ab6edf1fa}"),
                    MiracastReceiverCursorImageChannel,
                    IInspectable
                )
                this.__OnImageStreamChangedToken := this.add_ImageStreamChanged(this.__OnImageStreamChanged.iface)
            }
            return this.__OnImageStreamChanged
        }
    }

    /**
     * An event which is raised when the position of the cursor image has changed.
     * @remarks
     * Use the [Position](miracastreceivercursorimagechannel_position.md) property to retrieve the latest position of the cursor image.
     * @type {TypedEventHandler<MiracastReceiverCursorImageChannel, IInspectable>}
    */
    OnPositionChanged {
        get {
            if(!this.HasProp("__OnPositionChanged")){
                this.__OnPositionChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{401d6f64-cb30-59c3-a663-f84ab6edf1fa}"),
                    MiracastReceiverCursorImageChannel,
                    IInspectable
                )
                this.__OnPositionChangedToken := this.add_PositionChanged(this.__OnPositionChanged.iface)
            }
            return this.__OnPositionChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnImageStreamChangedToken")) {
            this.remove_ImageStreamChanged(this.__OnImageStreamChangedToken)
            this.__OnImageStreamChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPositionChangedToken")) {
            this.remove_PositionChanged(this.__OnPositionChangedToken)
            this.__OnPositionChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IMiracastReceiverCursorImageChannel")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverCursorImageChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverCursorImageChannel := IMiracastReceiverCursorImageChannel(outPtr)
        }

        return this.__IMiracastReceiverCursorImageChannel.get_IsEnabled()
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_MaxImageSize() {
        if (!this.HasProp("__IMiracastReceiverCursorImageChannel")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverCursorImageChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverCursorImageChannel := IMiracastReceiverCursorImageChannel(outPtr)
        }

        return this.__IMiracastReceiverCursorImageChannel.get_MaxImageSize()
    }

    /**
     * 
     * @returns {PointInt32} 
     */
    get_Position() {
        if (!this.HasProp("__IMiracastReceiverCursorImageChannel")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverCursorImageChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverCursorImageChannel := IMiracastReceiverCursorImageChannel(outPtr)
        }

        return this.__IMiracastReceiverCursorImageChannel.get_Position()
    }

    /**
     * 
     * @returns {IRandomAccessStreamWithContentType} 
     */
    get_ImageStream() {
        if (!this.HasProp("__IMiracastReceiverCursorImageChannel")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverCursorImageChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverCursorImageChannel := IMiracastReceiverCursorImageChannel(outPtr)
        }

        return this.__IMiracastReceiverCursorImageChannel.get_ImageStream()
    }

    /**
     * 
     * @param {TypedEventHandler<MiracastReceiverCursorImageChannel, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ImageStreamChanged(handler) {
        if (!this.HasProp("__IMiracastReceiverCursorImageChannel")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverCursorImageChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverCursorImageChannel := IMiracastReceiverCursorImageChannel(outPtr)
        }

        return this.__IMiracastReceiverCursorImageChannel.add_ImageStreamChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ImageStreamChanged(token) {
        if (!this.HasProp("__IMiracastReceiverCursorImageChannel")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverCursorImageChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverCursorImageChannel := IMiracastReceiverCursorImageChannel(outPtr)
        }

        return this.__IMiracastReceiverCursorImageChannel.remove_ImageStreamChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MiracastReceiverCursorImageChannel, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PositionChanged(handler) {
        if (!this.HasProp("__IMiracastReceiverCursorImageChannel")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverCursorImageChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverCursorImageChannel := IMiracastReceiverCursorImageChannel(outPtr)
        }

        return this.__IMiracastReceiverCursorImageChannel.add_PositionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PositionChanged(token) {
        if (!this.HasProp("__IMiracastReceiverCursorImageChannel")) {
            if ((queryResult := this.QueryInterface(IMiracastReceiverCursorImageChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMiracastReceiverCursorImageChannel := IMiracastReceiverCursorImageChannel(outPtr)
        }

        return this.__IMiracastReceiverCursorImageChannel.remove_PositionChanged(token)
    }

;@endregion Instance Methods
}
