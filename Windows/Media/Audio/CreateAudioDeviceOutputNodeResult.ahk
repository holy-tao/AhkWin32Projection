#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICreateAudioDeviceOutputNodeResult.ahk
#Include .\ICreateAudioDeviceOutputNodeResult2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of attempting to create an audio device output node.
 * @remarks
 * Get an instance of this class by calling [AudioGraph.CreateDeviceOutputNodeAsync](audiograph_createdeviceoutputnodeasync_954542725.md). Check the [Status](createaudiodeviceoutputnoderesult_status.md) property to determine if the node was successfully created, and if so, get the instance of the node with the [DeviceOutputNode](createaudiodeviceoutputnoderesult_deviceoutputnode.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiodeviceoutputnoderesult
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class CreateAudioDeviceOutputNodeResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICreateAudioDeviceOutputNodeResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICreateAudioDeviceOutputNodeResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the result status of an operation to create an [AudioDeviceOutputNode](audiodeviceoutputnode.md) with a call to [CreateDeviceOutputNodeAsync](audiograph_createdeviceoutputnodeasync_954542725.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiodeviceoutputnoderesult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the audio device output node.
     * @remarks
     * This value will be null if the [Status](createaudiodeviceoutputnoderesult_status.md) property has a value other than **Success**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiodeviceoutputnoderesult.deviceoutputnode
     * @type {AudioDeviceOutputNode} 
     */
    DeviceOutputNode {
        get => this.get_DeviceOutputNode()
    }

    /**
     * Gets the extended error code associated with the creation of a [AudioDeviceOutputNode](audiodeviceoutputnode.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.createaudiodeviceoutputnoderesult.extendederror
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
        if (!this.HasProp("__ICreateAudioDeviceOutputNodeResult")) {
            if ((queryResult := this.QueryInterface(ICreateAudioDeviceOutputNodeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateAudioDeviceOutputNodeResult := ICreateAudioDeviceOutputNodeResult(outPtr)
        }

        return this.__ICreateAudioDeviceOutputNodeResult.get_Status()
    }

    /**
     * 
     * @returns {AudioDeviceOutputNode} 
     */
    get_DeviceOutputNode() {
        if (!this.HasProp("__ICreateAudioDeviceOutputNodeResult")) {
            if ((queryResult := this.QueryInterface(ICreateAudioDeviceOutputNodeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateAudioDeviceOutputNodeResult := ICreateAudioDeviceOutputNodeResult(outPtr)
        }

        return this.__ICreateAudioDeviceOutputNodeResult.get_DeviceOutputNode()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__ICreateAudioDeviceOutputNodeResult2")) {
            if ((queryResult := this.QueryInterface(ICreateAudioDeviceOutputNodeResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICreateAudioDeviceOutputNodeResult2 := ICreateAudioDeviceOutputNodeResult2(outPtr)
        }

        return this.__ICreateAudioDeviceOutputNodeResult2.get_ExtendedError()
    }

;@endregion Instance Methods
}
