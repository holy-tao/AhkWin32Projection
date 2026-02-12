#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioNodeListener.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the position and other physical characteristics of a listener from which the audio output of an [AudioGraph](audiograph.md) node is heard when spatial audio processing is used.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodelistener
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioNodeListener extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioNodeListener

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioNodeListener.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a vector representing the position of the emitter in 3D space, expressed in meters.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodelistener.position
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * Gets or sets a [Quaternion](../windows.foundation.numerics/quaternion.md) expressing the rotation of the listener in 3D space.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodelistener.orientation
     * @type {Quaternion} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * Gets or sets the speed of sound used for computing spatial audio, expressed in meters per second.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodelistener.speedofsound
     * @type {Float} 
     */
    SpeedOfSound {
        get => this.get_SpeedOfSound()
        set => this.put_SpeedOfSound(value)
    }

    /**
     * Gets or sets a [Vector3](../windows.foundation.numerics/vector3.md) expressing the velocity at which the listener is moving in 3D space, expressed in meters per second.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audionodelistener.dopplervelocity
     * @type {Vector3} 
     */
    DopplerVelocity {
        get => this.get_DopplerVelocity()
        set => this.put_DopplerVelocity(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [AudioNodeListener](audionodelistener.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.AudioNodeListener")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Position() {
        if (!this.HasProp("__IAudioNodeListener")) {
            if ((queryResult := this.QueryInterface(IAudioNodeListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeListener := IAudioNodeListener(outPtr)
        }

        return this.__IAudioNodeListener.get_Position()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        if (!this.HasProp("__IAudioNodeListener")) {
            if ((queryResult := this.QueryInterface(IAudioNodeListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeListener := IAudioNodeListener(outPtr)
        }

        return this.__IAudioNodeListener.put_Position(value)
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_Orientation() {
        if (!this.HasProp("__IAudioNodeListener")) {
            if ((queryResult := this.QueryInterface(IAudioNodeListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeListener := IAudioNodeListener(outPtr)
        }

        return this.__IAudioNodeListener.get_Orientation()
    }

    /**
     * 
     * @param {Quaternion} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__IAudioNodeListener")) {
            if ((queryResult := this.QueryInterface(IAudioNodeListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeListener := IAudioNodeListener(outPtr)
        }

        return this.__IAudioNodeListener.put_Orientation(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SpeedOfSound() {
        if (!this.HasProp("__IAudioNodeListener")) {
            if ((queryResult := this.QueryInterface(IAudioNodeListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeListener := IAudioNodeListener(outPtr)
        }

        return this.__IAudioNodeListener.get_SpeedOfSound()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_SpeedOfSound(value) {
        if (!this.HasProp("__IAudioNodeListener")) {
            if ((queryResult := this.QueryInterface(IAudioNodeListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeListener := IAudioNodeListener(outPtr)
        }

        return this.__IAudioNodeListener.put_SpeedOfSound(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_DopplerVelocity() {
        if (!this.HasProp("__IAudioNodeListener")) {
            if ((queryResult := this.QueryInterface(IAudioNodeListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeListener := IAudioNodeListener(outPtr)
        }

        return this.__IAudioNodeListener.get_DopplerVelocity()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_DopplerVelocity(value) {
        if (!this.HasProp("__IAudioNodeListener")) {
            if ((queryResult := this.QueryInterface(IAudioNodeListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioNodeListener := IAudioNodeListener(outPtr)
        }

        return this.__IAudioNodeListener.put_DopplerVelocity(value)
    }

;@endregion Instance Methods
}
