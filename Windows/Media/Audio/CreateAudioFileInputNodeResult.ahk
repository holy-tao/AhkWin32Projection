#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICreateAudioFileInputNodeResult.ahk
#Include .\ICreateAudioFileInputNodeResult2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of attempting to create an audio file input node.
 * @remarks
 * Get an instance of this class by calling [AudioGraph.CreateFileInputNodeAsync](audiograph_createfileinputnodeasync_152724062.md). Check the [Status](createaudiofileinputnoderesult_status.md) property to determine if the node was successfully created, and if so, get the instance of the node with the [FileInputNode](createaudiofileinputnoderesult_fileinputnode.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiofileinputnoderesult
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class CreateAudioFileInputNodeResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICreateAudioFileInputNodeResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICreateAudioFileInputNodeResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the result status of an operation to create an [AudioFileInputNode](audiofileinputnode.md) with a call to [CreateFileInputNodeAsync](audiograph_createfileinputnodeasync_152724062.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiofileinputnoderesult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the audio file input node.
     * @remarks
     * This value will be null if the [Status](createaudiofileinputnoderesult_status.md) property has a value other than **Success**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiofileinputnoderesult.fileinputnode
     * @type {AudioFileInputNode} 
     */
    FileInputNode {
        get => this.get_FileInputNode()
    }

    /**
     * Gets the extended error code associated with the creation of a [AudioFileInputNode](audiofileinputnode.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiofileinputnoderesult.extendederror
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
        if (!this.HasProp("__ICreateAudioFileInputNodeResult")) {
            if ((queryResult := this.QueryInterface(ICreateAudioFileInputNodeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateAudioFileInputNodeResult := ICreateAudioFileInputNodeResult(outPtr)
        }

        return this.__ICreateAudioFileInputNodeResult.get_Status()
    }

    /**
     * 
     * @returns {AudioFileInputNode} 
     */
    get_FileInputNode() {
        if (!this.HasProp("__ICreateAudioFileInputNodeResult")) {
            if ((queryResult := this.QueryInterface(ICreateAudioFileInputNodeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateAudioFileInputNodeResult := ICreateAudioFileInputNodeResult(outPtr)
        }

        return this.__ICreateAudioFileInputNodeResult.get_FileInputNode()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__ICreateAudioFileInputNodeResult2")) {
            if ((queryResult := this.QueryInterface(ICreateAudioFileInputNodeResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateAudioFileInputNodeResult2 := ICreateAudioFileInputNodeResult2(outPtr)
        }

        return this.__ICreateAudioFileInputNodeResult2.get_ExtendedError()
    }

;@endregion Instance Methods
}
