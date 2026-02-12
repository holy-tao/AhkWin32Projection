#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMseSourceBuffer.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MseSourceBuffer.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a media source extensions (MSE) source buffer.
 * @remarks
 * Get an instance of this class by calling [AddSourceBuffer](msestreamsource_addsourcebuffer_362600906.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.msesourcebuffer
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MseSourceBuffer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMseSourceBuffer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMseSourceBuffer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets and sets how the [MseSourceBuffer](msesourcebuffer.md) object appends a buffer.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msesourcebuffer.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * Gets a value indicating whether the buffer is updating.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msesourcebuffer.isupdating
     * @type {Boolean} 
     */
    IsUpdating {
        get => this.get_IsUpdating()
    }

    /**
     * Gets how the [MseSourceBuffer](msesourcebuffer.md) object is buffered.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msesourcebuffer.buffered
     * @type {IVectorView<MseTimeRange>} 
     */
    Buffered {
        get => this.get_Buffered()
    }

    /**
     * Gets and sets the timestamp offset into the [MseSourceBuffer](msesourcebuffer.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msesourcebuffer.timestampoffset
     * @type {TimeSpan} 
     */
    TimestampOffset {
        get => this.get_TimestampOffset()
        set => this.put_TimestampOffset(value)
    }

    /**
     * Gets and sets the append-window-start interval.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msesourcebuffer.appendwindowstart
     * @type {TimeSpan} 
     */
    AppendWindowStart {
        get => this.get_AppendWindowStart()
        set => this.put_AppendWindowStart(value)
    }

    /**
     * Gets and sets the append-window-end interval.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msesourcebuffer.appendwindowend
     * @type {IReference<TimeSpan>} 
     */
    AppendWindowEnd {
        get => this.get_AppendWindowEnd()
        set => this.put_AppendWindowEnd(value)
    }

    /**
     * Occurs when the [MseSourceBuffer](msesourcebuffer.md) update is starting.
     * @type {TypedEventHandler<MseSourceBuffer, IInspectable>}
    */
    OnUpdateStarting {
        get {
            if(!this.HasProp("__OnUpdateStarting")){
                this.__OnUpdateStarting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{187fd3d7-bb9d-541a-94fd-43c31dd84a67}"),
                    MseSourceBuffer,
                    IInspectable
                )
                this.__OnUpdateStartingToken := this.add_UpdateStarting(this.__OnUpdateStarting.iface)
            }
            return this.__OnUpdateStarting
        }
    }

    /**
     * Occurs when the [MseSourceBuffer](msesourcebuffer.md) is updated.
     * @type {TypedEventHandler<MseSourceBuffer, IInspectable>}
    */
    OnUpdated {
        get {
            if(!this.HasProp("__OnUpdated")){
                this.__OnUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{187fd3d7-bb9d-541a-94fd-43c31dd84a67}"),
                    MseSourceBuffer,
                    IInspectable
                )
                this.__OnUpdatedToken := this.add_Updated(this.__OnUpdated.iface)
            }
            return this.__OnUpdated
        }
    }

    /**
     * Occurs when the [MseSourceBuffer](msesourcebuffer.md) update has ended.
     * @type {TypedEventHandler<MseSourceBuffer, IInspectable>}
    */
    OnUpdateEnded {
        get {
            if(!this.HasProp("__OnUpdateEnded")){
                this.__OnUpdateEnded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{187fd3d7-bb9d-541a-94fd-43c31dd84a67}"),
                    MseSourceBuffer,
                    IInspectable
                )
                this.__OnUpdateEndedToken := this.add_UpdateEnded(this.__OnUpdateEnded.iface)
            }
            return this.__OnUpdateEnded
        }
    }

    /**
     * Occurs when the [MseSourceBuffer](msesourcebuffer.md) has an error.
     * @type {TypedEventHandler<MseSourceBuffer, IInspectable>}
    */
    OnErrorOccurred {
        get {
            if(!this.HasProp("__OnErrorOccurred")){
                this.__OnErrorOccurred := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{187fd3d7-bb9d-541a-94fd-43c31dd84a67}"),
                    MseSourceBuffer,
                    IInspectable
                )
                this.__OnErrorOccurredToken := this.add_ErrorOccurred(this.__OnErrorOccurred.iface)
            }
            return this.__OnErrorOccurred
        }
    }

    /**
     * Occurs when the [MseSourceBuffer](msesourcebuffer.md) is aborted.
     * @type {TypedEventHandler<MseSourceBuffer, IInspectable>}
    */
    OnAborted {
        get {
            if(!this.HasProp("__OnAborted")){
                this.__OnAborted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{187fd3d7-bb9d-541a-94fd-43c31dd84a67}"),
                    MseSourceBuffer,
                    IInspectable
                )
                this.__OnAbortedToken := this.add_Aborted(this.__OnAborted.iface)
            }
            return this.__OnAborted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnUpdateStartingToken")) {
            this.remove_UpdateStarting(this.__OnUpdateStartingToken)
            this.__OnUpdateStarting.iface.Dispose()
        }

        if(this.HasProp("__OnUpdatedToken")) {
            this.remove_Updated(this.__OnUpdatedToken)
            this.__OnUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnUpdateEndedToken")) {
            this.remove_UpdateEnded(this.__OnUpdateEndedToken)
            this.__OnUpdateEnded.iface.Dispose()
        }

        if(this.HasProp("__OnErrorOccurredToken")) {
            this.remove_ErrorOccurred(this.__OnErrorOccurredToken)
            this.__OnErrorOccurred.iface.Dispose()
        }

        if(this.HasProp("__OnAbortedToken")) {
            this.remove_Aborted(this.__OnAbortedToken)
            this.__OnAborted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MseSourceBuffer, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UpdateStarting(handler) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.add_UpdateStarting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UpdateStarting(token) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.remove_UpdateStarting(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MseSourceBuffer, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Updated(handler) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.add_Updated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Updated(token) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.remove_Updated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MseSourceBuffer, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UpdateEnded(handler) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.add_UpdateEnded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UpdateEnded(token) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.remove_UpdateEnded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MseSourceBuffer, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ErrorOccurred(handler) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.add_ErrorOccurred(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ErrorOccurred(token) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.remove_ErrorOccurred(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MseSourceBuffer, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Aborted(handler) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.add_Aborted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Aborted(token) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.remove_Aborted(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.put_Mode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUpdating() {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.get_IsUpdating()
    }

    /**
     * 
     * @returns {IVectorView<MseTimeRange>} 
     */
    get_Buffered() {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.get_Buffered()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TimestampOffset() {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.get_TimestampOffset()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_TimestampOffset(value) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.put_TimestampOffset(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_AppendWindowStart() {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.get_AppendWindowStart()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_AppendWindowStart(value) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.put_AppendWindowStart(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_AppendWindowEnd() {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.get_AppendWindowEnd()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_AppendWindowEnd(value) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.put_AppendWindowEnd(value)
    }

    /**
     * Appends a buffer to the [MseSourceBuffer](msesourcebuffer.md) object.
     * @param {IBuffer} buffer_ The buffer to append.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msesourcebuffer.appendbuffer
     */
    AppendBuffer(buffer_) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.AppendBuffer(buffer_)
    }

    /**
     * Appends a stream to the [MseSourceBuffer](msesourcebuffer.md) object.
     * @param {IInputStream} stream The stream to append.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msesourcebuffer.appendstream
     */
    AppendStream(stream) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.AppendStream(stream)
    }

    /**
     * Appends a stream to the [MseSourceBuffer](msesourcebuffer.md) object.
     * @param {IInputStream} stream The stream to append.
     * @param {Integer} maxSize The maximum size of the stream.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msesourcebuffer.appendstream
     */
    AppendStreamMaxSize(stream, maxSize) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.AppendStreamMaxSize(stream, maxSize)
    }

    /**
     * Aborts media source extensions (MSE) source buffer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msesourcebuffer.abort
     */
    Abort() {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.Abort()
    }

    /**
     * Removes media for the specified time range.
     * @param {TimeSpan} start The start of the time range to remove.
     * @param {IReference<TimeSpan>} end The end of the time range to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msesourcebuffer.remove
     */
    Remove(start, end) {
        if (!this.HasProp("__IMseSourceBuffer")) {
            if ((queryResult := this.QueryInterface(IMseSourceBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBuffer := IMseSourceBuffer(outPtr)
        }

        return this.__IMseSourceBuffer.Remove(start, end)
    }

;@endregion Instance Methods
}
