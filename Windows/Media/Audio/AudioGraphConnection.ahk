#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioGraphConnection.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a connection within an audio graph.
 * @remarks
 * Get an instance of this class with the [OutgoingConnections](iaudioinputnode_outgoingconnections.md) property of a class that implements [IAudioInputNode](iaudioinputnode.md). These include:
 * 
 * 
 * + [AudioDeviceInputNode](audiodeviceinputnode.md)
 * + [AudioFileInputNode](audiofileinputnode.md)
 * + [AudioFrameInputNode](audioframeinputnode.md)
 * + [AudioSubmixNode](audiosubmixnode.md)
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiographconnection
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioGraphConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioGraphConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioGraphConnection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the destination node for the connection.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiographconnection.destination
     * @type {IAudioNode} 
     */
    Destination {
        get => this.get_Destination()
    }

    /**
     * Gets the gain associated with the audio graph connection.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiographconnection.gain
     * @type {Float} 
     */
    Gain {
        get => this.get_Gain()
        set => this.put_Gain(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IAudioNode} 
     */
    get_Destination() {
        if (!this.HasProp("__IAudioGraphConnection")) {
            if ((queryResult := this.QueryInterface(IAudioGraphConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphConnection := IAudioGraphConnection(outPtr)
        }

        return this.__IAudioGraphConnection.get_Destination()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Gain(value) {
        if (!this.HasProp("__IAudioGraphConnection")) {
            if ((queryResult := this.QueryInterface(IAudioGraphConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphConnection := IAudioGraphConnection(outPtr)
        }

        return this.__IAudioGraphConnection.put_Gain(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Gain() {
        if (!this.HasProp("__IAudioGraphConnection")) {
            if ((queryResult := this.QueryInterface(IAudioGraphConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphConnection := IAudioGraphConnection(outPtr)
        }

        return this.__IAudioGraphConnection.get_Gain()
    }

;@endregion Instance Methods
}
