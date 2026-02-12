#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMseStreamSource.ahk
#Include .\IMseStreamSource2.ahk
#Include .\IMseStreamSourceStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MseStreamSource.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a media source extensions (MSE) stream source.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.msestreamsource
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MseStreamSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMseStreamSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMseStreamSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Specifies whether a content type is supported.
     * @param {HSTRING} contentType A string that describes the content type.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msestreamsource.iscontenttypesupported
     */
    static IsContentTypeSupported(contentType) {
        if (!MseStreamSource.HasProp("__IMseStreamSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MseStreamSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMseStreamSourceStatics.IID)
            MseStreamSource.__IMseStreamSourceStatics := IMseStreamSourceStatics(factoryPtr)
        }

        return MseStreamSource.__IMseStreamSourceStatics.IsContentTypeSupported(contentType)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the list of media source extensions (MSE) source buffers on the stream source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msestreamsource.sourcebuffers
     * @type {MseSourceBufferList} 
     */
    SourceBuffers {
        get => this.get_SourceBuffers()
    }

    /**
     * Gets the list of media source extensions (MSE) source buffers that are active on the stream source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msestreamsource.activesourcebuffers
     * @type {MseSourceBufferList} 
     */
    ActiveSourceBuffers {
        get => this.get_ActiveSourceBuffers()
    }

    /**
     * Gets a value that specifies the ready state of the [MseStreamSource](msestreamsource.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msestreamsource.readystate
     * @type {Integer} 
     */
    ReadyState {
        get => this.get_ReadyState()
    }

    /**
     * Gets and sets the duration of the stream source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msestreamsource.duration
     * @type {IReference<TimeSpan>} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets or sets the seekable time range for a Media Source Extension.
     * @remarks
     * Set this value to null to disable seeking during media playback. This enables scenarios like disabling seeking during ads.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msestreamsource.liveseekablerange
     * @type {IReference<MseTimeRange>} 
     */
    LiveSeekableRange {
        get => this.get_LiveSeekableRange()
        set => this.put_LiveSeekableRange(value)
    }

    /**
     * Occurs when the [MseStreamSource](msestreamsource.md) is opened.
     * @type {TypedEventHandler<MseStreamSource, IInspectable>}
    */
    OnOpened {
        get {
            if(!this.HasProp("__OnOpened")){
                this.__OnOpened := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{724bf4ef-de7a-5dbd-815e-522a87bc3344}"),
                    MseStreamSource,
                    IInspectable
                )
                this.__OnOpenedToken := this.add_Opened(this.__OnOpened.iface)
            }
            return this.__OnOpened
        }
    }

    /**
     * Occurs when the [MseStreamSource](msestreamsource.md) is ended.
     * @type {TypedEventHandler<MseStreamSource, IInspectable>}
    */
    OnEnded {
        get {
            if(!this.HasProp("__OnEnded")){
                this.__OnEnded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{724bf4ef-de7a-5dbd-815e-522a87bc3344}"),
                    MseStreamSource,
                    IInspectable
                )
                this.__OnEndedToken := this.add_Ended(this.__OnEnded.iface)
            }
            return this.__OnEnded
        }
    }

    /**
     * Occurs when the [MseStreamSource](msestreamsource.md) is closed.
     * @type {TypedEventHandler<MseStreamSource, IInspectable>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{724bf4ef-de7a-5dbd-815e-522a87bc3344}"),
                    MseStreamSource,
                    IInspectable
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Instantiates a new instance of an uninitialized [MseStreamSource](msestreamsource.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MseStreamSource")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnOpenedToken")) {
            this.remove_Opened(this.__OnOpenedToken)
            this.__OnOpened.iface.Dispose()
        }

        if(this.HasProp("__OnEndedToken")) {
            this.remove_Ended(this.__OnEndedToken)
            this.__OnEnded.iface.Dispose()
        }

        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MseStreamSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Opened(handler) {
        if (!this.HasProp("__IMseStreamSource")) {
            if ((queryResult := this.QueryInterface(IMseStreamSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseStreamSource := IMseStreamSource(outPtr)
        }

        return this.__IMseStreamSource.add_Opened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Opened(token) {
        if (!this.HasProp("__IMseStreamSource")) {
            if ((queryResult := this.QueryInterface(IMseStreamSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseStreamSource := IMseStreamSource(outPtr)
        }

        return this.__IMseStreamSource.remove_Opened(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MseStreamSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Ended(handler) {
        if (!this.HasProp("__IMseStreamSource")) {
            if ((queryResult := this.QueryInterface(IMseStreamSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseStreamSource := IMseStreamSource(outPtr)
        }

        return this.__IMseStreamSource.add_Ended(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Ended(token) {
        if (!this.HasProp("__IMseStreamSource")) {
            if ((queryResult := this.QueryInterface(IMseStreamSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseStreamSource := IMseStreamSource(outPtr)
        }

        return this.__IMseStreamSource.remove_Ended(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MseStreamSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IMseStreamSource")) {
            if ((queryResult := this.QueryInterface(IMseStreamSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseStreamSource := IMseStreamSource(outPtr)
        }

        return this.__IMseStreamSource.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IMseStreamSource")) {
            if ((queryResult := this.QueryInterface(IMseStreamSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseStreamSource := IMseStreamSource(outPtr)
        }

        return this.__IMseStreamSource.remove_Closed(token)
    }

    /**
     * 
     * @returns {MseSourceBufferList} 
     */
    get_SourceBuffers() {
        if (!this.HasProp("__IMseStreamSource")) {
            if ((queryResult := this.QueryInterface(IMseStreamSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseStreamSource := IMseStreamSource(outPtr)
        }

        return this.__IMseStreamSource.get_SourceBuffers()
    }

    /**
     * 
     * @returns {MseSourceBufferList} 
     */
    get_ActiveSourceBuffers() {
        if (!this.HasProp("__IMseStreamSource")) {
            if ((queryResult := this.QueryInterface(IMseStreamSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseStreamSource := IMseStreamSource(outPtr)
        }

        return this.__IMseStreamSource.get_ActiveSourceBuffers()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadyState() {
        if (!this.HasProp("__IMseStreamSource")) {
            if ((queryResult := this.QueryInterface(IMseStreamSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseStreamSource := IMseStreamSource(outPtr)
        }

        return this.__IMseStreamSource.get_ReadyState()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Duration() {
        if (!this.HasProp("__IMseStreamSource")) {
            if ((queryResult := this.QueryInterface(IMseStreamSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseStreamSource := IMseStreamSource(outPtr)
        }

        return this.__IMseStreamSource.get_Duration()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__IMseStreamSource")) {
            if ((queryResult := this.QueryInterface(IMseStreamSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseStreamSource := IMseStreamSource(outPtr)
        }

        return this.__IMseStreamSource.put_Duration(value)
    }

    /**
     * Adds a source buffer to the stream source.
     * @param {HSTRING} mimeType A string that describes the source buffer's MIME type.
     * @returns {MseSourceBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msestreamsource.addsourcebuffer
     */
    AddSourceBuffer(mimeType) {
        if (!this.HasProp("__IMseStreamSource")) {
            if ((queryResult := this.QueryInterface(IMseStreamSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseStreamSource := IMseStreamSource(outPtr)
        }

        return this.__IMseStreamSource.AddSourceBuffer(mimeType)
    }

    /**
     * Removes a source buffer from the stream source.
     * @param {MseSourceBuffer} buffer_ The [MseSourceBuffer](msesourcebuffer.md) object for the source buffer removed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msestreamsource.removesourcebuffer
     */
    RemoveSourceBuffer(buffer_) {
        if (!this.HasProp("__IMseStreamSource")) {
            if ((queryResult := this.QueryInterface(IMseStreamSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseStreamSource := IMseStreamSource(outPtr)
        }

        return this.__IMseStreamSource.RemoveSourceBuffer(buffer_)
    }

    /**
     * Specifies the status at the end of stream.
     * @param {Integer} status_ A [MseEndOfStreamStatus](mseendofstreamstatus.md)-typed value that specifies the status at the end of stream.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msestreamsource.endofstream
     */
    EndOfStream(status_) {
        if (!this.HasProp("__IMseStreamSource")) {
            if ((queryResult := this.QueryInterface(IMseStreamSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseStreamSource := IMseStreamSource(outPtr)
        }

        return this.__IMseStreamSource.EndOfStream(status_)
    }

    /**
     * 
     * @returns {IReference<MseTimeRange>} 
     */
    get_LiveSeekableRange() {
        if (!this.HasProp("__IMseStreamSource2")) {
            if ((queryResult := this.QueryInterface(IMseStreamSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseStreamSource2 := IMseStreamSource2(outPtr)
        }

        return this.__IMseStreamSource2.get_LiveSeekableRange()
    }

    /**
     * 
     * @param {IReference<MseTimeRange>} value 
     * @returns {HRESULT} 
     */
    put_LiveSeekableRange(value) {
        if (!this.HasProp("__IMseStreamSource2")) {
            if ((queryResult := this.QueryInterface(IMseStreamSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseStreamSource2 := IMseStreamSource2(outPtr)
        }

        return this.__IMseStreamSource2.put_LiveSeekableRange(value)
    }

;@endregion Instance Methods
}
