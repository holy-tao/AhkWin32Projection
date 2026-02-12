#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGlobalSystemMediaTransportControlsSessionPlaybackInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * The object that holds all of the playback information about a session (Play state, Controls, playback type etc.)
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackinfo
 * @namespace Windows.Media.Control
 * @version WindowsRuntime 1.4
 */
class GlobalSystemMediaTransportControlsSessionPlaybackInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGlobalSystemMediaTransportControlsSessionPlaybackInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGlobalSystemMediaTransportControlsSessionPlaybackInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies which controls the session has enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackinfo.controls
     * @type {GlobalSystemMediaTransportControlsSessionPlaybackControls} 
     */
    Controls {
        get => this.get_Controls()
    }

    /**
     * The current playback state of the session.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackinfo.playbackstatus
     * @type {Integer} 
     */
    PlaybackStatus {
        get => this.get_PlaybackStatus()
    }

    /**
     * Specifies what type of content the session has.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackinfo.playbacktype
     * @type {IReference<Integer>} 
     */
    PlaybackType {
        get => this.get_PlaybackType()
    }

    /**
     * Specifies the repeat mode of the session.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackinfo.autorepeatmode
     * @type {IReference<Integer>} 
     */
    AutoRepeatMode {
        get => this.get_AutoRepeatMode()
    }

    /**
     * The rate at which playback is happening.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackinfo.playbackrate
     * @type {IReference<Float>} 
     */
    PlaybackRate {
        get => this.get_PlaybackRate()
    }

    /**
     * Specifies whether the session is currently playing content in a shuffled order or not.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackinfo.isshuffleactive
     * @type {IReference<Boolean>} 
     */
    IsShuffleActive {
        get => this.get_IsShuffleActive()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {GlobalSystemMediaTransportControlsSessionPlaybackControls} 
     */
    get_Controls() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackInfo")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackInfo := IGlobalSystemMediaTransportControlsSessionPlaybackInfo(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackInfo.get_Controls()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlaybackStatus() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackInfo")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackInfo := IGlobalSystemMediaTransportControlsSessionPlaybackInfo(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackInfo.get_PlaybackStatus()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PlaybackType() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackInfo")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackInfo := IGlobalSystemMediaTransportControlsSessionPlaybackInfo(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackInfo.get_PlaybackType()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_AutoRepeatMode() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackInfo")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackInfo := IGlobalSystemMediaTransportControlsSessionPlaybackInfo(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackInfo.get_AutoRepeatMode()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_PlaybackRate() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackInfo")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackInfo := IGlobalSystemMediaTransportControlsSessionPlaybackInfo(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackInfo.get_PlaybackRate()
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_IsShuffleActive() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackInfo")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackInfo := IGlobalSystemMediaTransportControlsSessionPlaybackInfo(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackInfo.get_IsShuffleActive()
    }

;@endregion Instance Methods
}
