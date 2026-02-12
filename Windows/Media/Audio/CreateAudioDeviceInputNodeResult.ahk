#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICreateAudioDeviceInputNodeResult.ahk
#Include .\ICreateAudioDeviceInputNodeResult2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of attempting to create an audio device input node.
 * @remarks
 * Get an instance of this class by calling [AudioGraph.CreateDeviceInputNodeAsync](audiograph_createdeviceinputnodeasync_1285412965.md). Check the [Status](createaudiodeviceinputnoderesult_status.md) property to determine if the node was successfully created, and if so, get the instance of the node with the [DeviceInputNode](createaudiodeviceinputnoderesult_deviceinputnode.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiodeviceinputnoderesult
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class CreateAudioDeviceInputNodeResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICreateAudioDeviceInputNodeResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICreateAudioDeviceInputNodeResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the result status of an operation to create an [AudioDeviceInputNode](audiodeviceinputnode.md) with a call to [CreateDeviceInputNodeAsync](audiograph_createdeviceinputnodeasync_420106269.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiodeviceinputnoderesult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the audio device input node.
     * @remarks
     * This value will be null if the [Status](createaudiodeviceinputnoderesult_status.md) property has a value other than **Success**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiodeviceinputnoderesult.deviceinputnode
     * @type {AudioDeviceInputNode} 
     */
    DeviceInputNode {
        get => this.get_DeviceInputNode()
    }

    /**
     * Gets the extended error code associated with the creation of a [AudioDeviceInputNode](audiodeviceinputnode.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiodeviceinputnoderesult.extendederror
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
        if (!this.HasProp("__ICreateAudioDeviceInputNodeResult")) {
            if ((queryResult := this.QueryInterface(ICreateAudioDeviceInputNodeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateAudioDeviceInputNodeResult := ICreateAudioDeviceInputNodeResult(outPtr)
        }

        return this.__ICreateAudioDeviceInputNodeResult.get_Status()
    }

    /**
     * 
     * @returns {AudioDeviceInputNode} 
     */
    get_DeviceInputNode() {
        if (!this.HasProp("__ICreateAudioDeviceInputNodeResult")) {
            if ((queryResult := this.QueryInterface(ICreateAudioDeviceInputNodeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateAudioDeviceInputNodeResult := ICreateAudioDeviceInputNodeResult(outPtr)
        }

        return this.__ICreateAudioDeviceInputNodeResult.get_DeviceInputNode()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__ICreateAudioDeviceInputNodeResult2")) {
            if ((queryResult := this.QueryInterface(ICreateAudioDeviceInputNodeResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateAudioDeviceInputNodeResult2 := ICreateAudioDeviceInputNodeResult2(outPtr)
        }

        return this.__ICreateAudioDeviceInputNodeResult2.get_ExtendedError()
    }

;@endregion Instance Methods
}
