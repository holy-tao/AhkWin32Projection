#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMseSourceBufferList.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MseSourceBufferList.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a list of media source extensions (MSE) source buffers.
 * @remarks
 * Get an instance of this class by accessing the [ActiveSourceBuffers](msestreamsource_activesourcebuffers.md) or [SourceBuffers](msestreamsource_sourcebuffers.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.msesourcebufferlist
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MseSourceBufferList extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMseSourceBufferList

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMseSourceBufferList.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of [MseSourceBuffer](msesourcebuffer.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.msesourcebufferlist.buffers
     * @type {IVectorView<MseSourceBuffer>} 
     */
    Buffers {
        get => this.get_Buffers()
    }

    /**
     * Occurs when a [MseSourceBuffer](msesourcebuffer.md) object is added.
     * @type {TypedEventHandler<MseSourceBufferList, IInspectable>}
    */
    OnSourceBufferAdded {
        get {
            if(!this.HasProp("__OnSourceBufferAdded")){
                this.__OnSourceBufferAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0ff01695-fbb2-5e95-8ec7-da17d8e99f16}"),
                    MseSourceBufferList,
                    IInspectable
                )
                this.__OnSourceBufferAddedToken := this.add_SourceBufferAdded(this.__OnSourceBufferAdded.iface)
            }
            return this.__OnSourceBufferAdded
        }
    }

    /**
     * Occurs when a [MseSourceBuffer](msesourcebuffer.md) object is removed.
     * @type {TypedEventHandler<MseSourceBufferList, IInspectable>}
    */
    OnSourceBufferRemoved {
        get {
            if(!this.HasProp("__OnSourceBufferRemoved")){
                this.__OnSourceBufferRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0ff01695-fbb2-5e95-8ec7-da17d8e99f16}"),
                    MseSourceBufferList,
                    IInspectable
                )
                this.__OnSourceBufferRemovedToken := this.add_SourceBufferRemoved(this.__OnSourceBufferRemoved.iface)
            }
            return this.__OnSourceBufferRemoved
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSourceBufferAddedToken")) {
            this.remove_SourceBufferAdded(this.__OnSourceBufferAddedToken)
            this.__OnSourceBufferAdded.iface.Dispose()
        }

        if(this.HasProp("__OnSourceBufferRemovedToken")) {
            this.remove_SourceBufferRemoved(this.__OnSourceBufferRemovedToken)
            this.__OnSourceBufferRemoved.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MseSourceBufferList, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceBufferAdded(handler) {
        if (!this.HasProp("__IMseSourceBufferList")) {
            if ((queryResult := this.QueryInterface(IMseSourceBufferList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBufferList := IMseSourceBufferList(outPtr)
        }

        return this.__IMseSourceBufferList.add_SourceBufferAdded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceBufferAdded(token) {
        if (!this.HasProp("__IMseSourceBufferList")) {
            if ((queryResult := this.QueryInterface(IMseSourceBufferList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBufferList := IMseSourceBufferList(outPtr)
        }

        return this.__IMseSourceBufferList.remove_SourceBufferAdded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MseSourceBufferList, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceBufferRemoved(handler) {
        if (!this.HasProp("__IMseSourceBufferList")) {
            if ((queryResult := this.QueryInterface(IMseSourceBufferList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBufferList := IMseSourceBufferList(outPtr)
        }

        return this.__IMseSourceBufferList.add_SourceBufferRemoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceBufferRemoved(token) {
        if (!this.HasProp("__IMseSourceBufferList")) {
            if ((queryResult := this.QueryInterface(IMseSourceBufferList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBufferList := IMseSourceBufferList(outPtr)
        }

        return this.__IMseSourceBufferList.remove_SourceBufferRemoved(token)
    }

    /**
     * 
     * @returns {IVectorView<MseSourceBuffer>} 
     */
    get_Buffers() {
        if (!this.HasProp("__IMseSourceBufferList")) {
            if ((queryResult := this.QueryInterface(IMseSourceBufferList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMseSourceBufferList := IMseSourceBufferList(outPtr)
        }

        return this.__IMseSourceBufferList.get_Buffers()
    }

;@endregion Instance Methods
}
