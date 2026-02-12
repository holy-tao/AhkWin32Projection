#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaBinder.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaBinder.ahk
#Include .\MediaBindingEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Enables deferred binding of media content associated with a [MediaSource](mediasource.md).
  * 
  * Use this class for media content that you don't want to bind to a **MediaSource** object until a media player is about to actually play the content. A typical scenario for this is playing content that requires payment when it is accessed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediabinder
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaBinder extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaBinder

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaBinder.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets an app-specified string that is used to identify the media content that the app should bind when the [Binding](mediabinder_binding.md) event is raised.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediabinder.token
     * @type {HSTRING} 
     */
    Token {
        get => this.get_Token()
        set => this.put_Token(value)
    }

    /**
     * Gets the [MediaSource](mediasource.md) object associated with the [MediaBinder](mediabinder.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediabinder.source
     * @type {MediaSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * Occurs when a media player is ready for the media content to be bound to a [MediaSource](mediasource.md). Use the handler for this to set the media content for the source by calling [SetStream](mediabindingeventargs_setstream_1882746634.md), [SetStreamReference](mediabindingeventargs_setstreamreference_1856037815.md), or [SetUri](mediabindingeventargs_seturi_1576665843.md).
     * @type {TypedEventHandler<MediaBinder, MediaBindingEventArgs>}
    */
    OnBinding {
        get {
            if(!this.HasProp("__OnBinding")){
                this.__OnBinding := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5b133719-ee98-59b2-b432-1c9a5a56ab05}"),
                    MediaBinder,
                    MediaBindingEventArgs
                )
                this.__OnBindingToken := this.add_Binding(this.__OnBinding.iface)
            }
            return this.__OnBinding
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MediaBinder](mediabinder.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MediaBinder")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnBindingToken")) {
            this.remove_Binding(this.__OnBindingToken)
            this.__OnBinding.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaBinder, MediaBindingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Binding(handler) {
        if (!this.HasProp("__IMediaBinder")) {
            if ((queryResult := this.QueryInterface(IMediaBinder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBinder := IMediaBinder(outPtr)
        }

        return this.__IMediaBinder.add_Binding(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Binding(token) {
        if (!this.HasProp("__IMediaBinder")) {
            if ((queryResult := this.QueryInterface(IMediaBinder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBinder := IMediaBinder(outPtr)
        }

        return this.__IMediaBinder.remove_Binding(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Token() {
        if (!this.HasProp("__IMediaBinder")) {
            if ((queryResult := this.QueryInterface(IMediaBinder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBinder := IMediaBinder(outPtr)
        }

        return this.__IMediaBinder.get_Token()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Token(value) {
        if (!this.HasProp("__IMediaBinder")) {
            if ((queryResult := this.QueryInterface(IMediaBinder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBinder := IMediaBinder(outPtr)
        }

        return this.__IMediaBinder.put_Token(value)
    }

    /**
     * 
     * @returns {MediaSource} 
     */
    get_Source() {
        if (!this.HasProp("__IMediaBinder")) {
            if ((queryResult := this.QueryInterface(IMediaBinder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBinder := IMediaBinder(outPtr)
        }

        return this.__IMediaBinder.get_Source()
    }

;@endregion Instance Methods
}
