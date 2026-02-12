#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICreateMediaSourceAudioInputNodeResult.ahk
#Include .\ICreateMediaSourceAudioInputNodeResult2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of attempting to create a [MediaSourceAudioInputNode](mediasourceaudioinputnode.md).
 * @remarks
 * Get an instance of this class by calling [AudioGraph.CreateMediaSourceAudioInputNodeAsync](audiograph_createmediasourceaudioinputnodeasync_989225096.md). Check the [Status](createmediasourceaudioinputnoderesult_status.md) property to determine if the node was successfully created, and if so, get the instance of the node with the [Node](createmediasourceaudioinputnoderesult_node.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createmediasourceaudioinputnoderesult
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class CreateMediaSourceAudioInputNodeResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICreateMediaSourceAudioInputNodeResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICreateMediaSourceAudioInputNodeResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the result status of an operation to create a [MediaSourceAudioInputNode](mediasourceaudioinputnode.md) with a call to [AudioGraph.CreateMediaSourceAudioInputNodeAsync](audiograph_createmediasourceaudioinputnodeasync_989225096.md).
     * @remarks
     * If the result status is **Success**, get the instance of the node with the [Node](createmediasourceaudioinputnoderesult_node.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createmediasourceaudioinputnoderesult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the **MediaSource** audio input node.
     * @remarks
     * This value will be null if the [Status](createmediasourceaudioinputnoderesult_status.md) property has a value other than **Success**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createmediasourceaudioinputnoderesult.node
     * @type {MediaSourceAudioInputNode} 
     */
    Node {
        get => this.get_Node()
    }

    /**
     * Gets the extended error code associated with the creation of a [MediaSourceAudioInputNode](mediasourceaudioinputnode.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createmediasourceaudioinputnoderesult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
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
        if (!this.HasProp("__ICreateMediaSourceAudioInputNodeResult")) {
            if ((queryResult := this.QueryInterface(ICreateMediaSourceAudioInputNodeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateMediaSourceAudioInputNodeResult := ICreateMediaSourceAudioInputNodeResult(outPtr)
        }

        return this.__ICreateMediaSourceAudioInputNodeResult.get_Status()
    }

    /**
     * 
     * @returns {MediaSourceAudioInputNode} 
     */
    get_Node() {
        if (!this.HasProp("__ICreateMediaSourceAudioInputNodeResult")) {
            if ((queryResult := this.QueryInterface(ICreateMediaSourceAudioInputNodeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateMediaSourceAudioInputNodeResult := ICreateMediaSourceAudioInputNodeResult(outPtr)
        }

        return this.__ICreateMediaSourceAudioInputNodeResult.get_Node()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__ICreateMediaSourceAudioInputNodeResult2")) {
            if ((queryResult := this.QueryInterface(ICreateMediaSourceAudioInputNodeResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateMediaSourceAudioInputNodeResult2 := ICreateMediaSourceAudioInputNodeResult2(outPtr)
        }

        return this.__ICreateMediaSourceAudioInputNodeResult2.get_ExtendedError()
    }

;@endregion Instance Methods
}
