#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICreateAudioFileOutputNodeResult.ahk
#Include .\ICreateAudioFileOutputNodeResult2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of attempting to create an audio file output node.
 * @remarks
 * Get an instance of this class by calling [AudioGraph.CreateFileOutputNodeAsync](audiograph_createfileoutputnodeasync_1127853521.md). Check the [Status](createaudiofileoutputnoderesult_status.md) property to determine if the node was successfully created, and if so, get the instance of the node with the [FileOutputNode](createaudiofileoutputnoderesult_fileoutputnode.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiofileoutputnoderesult
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class CreateAudioFileOutputNodeResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICreateAudioFileOutputNodeResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICreateAudioFileOutputNodeResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the result status of an operation to create an [AudioFileOutputNode](audiofileoutputnode.md) with a call to [CreateFileOutputNodeAsync](audiograph_createfileoutputnodeasync_870871467.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiofileoutputnoderesult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the audio file output node.
     * @remarks
     * This value will be null if the [Status](createaudiofileoutputnoderesult_status.md) property has a value other than **Success**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiofileoutputnoderesult.fileoutputnode
     * @type {AudioFileOutputNode} 
     */
    FileOutputNode {
        get => this.get_FileOutputNode()
    }

    /**
     * Gets the extended error code associated with the creation of a [AudioFileOutputNode](audiofileoutputnode.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiofileoutputnoderesult.extendederror
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
        if (!this.HasProp("__ICreateAudioFileOutputNodeResult")) {
            if ((queryResult := this.QueryInterface(ICreateAudioFileOutputNodeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateAudioFileOutputNodeResult := ICreateAudioFileOutputNodeResult(outPtr)
        }

        return this.__ICreateAudioFileOutputNodeResult.get_Status()
    }

    /**
     * 
     * @returns {AudioFileOutputNode} 
     */
    get_FileOutputNode() {
        if (!this.HasProp("__ICreateAudioFileOutputNodeResult")) {
            if ((queryResult := this.QueryInterface(ICreateAudioFileOutputNodeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateAudioFileOutputNodeResult := ICreateAudioFileOutputNodeResult(outPtr)
        }

        return this.__ICreateAudioFileOutputNodeResult.get_FileOutputNode()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__ICreateAudioFileOutputNodeResult2")) {
            if ((queryResult := this.QueryInterface(ICreateAudioFileOutputNodeResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateAudioFileOutputNodeResult2 := ICreateAudioFileOutputNodeResult2(outPtr)
        }

        return this.__ICreateAudioFileOutputNodeResult2.get_ExtendedError()
    }

;@endregion Instance Methods
}
