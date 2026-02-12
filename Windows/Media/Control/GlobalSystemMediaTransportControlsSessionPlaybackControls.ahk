#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGlobalSystemMediaTransportControlsSessionPlaybackControls.ahk
#Include ..\..\..\Guid.ahk

/**
 * An object that describes what controls a session currently has enabled.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackcontrols
 * @namespace Windows.Media.Control
 * @version WindowsRuntime 1.4
 */
class GlobalSystemMediaTransportControlsSessionPlaybackControls extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGlobalSystemMediaTransportControlsSessionPlaybackControls

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGlobalSystemMediaTransportControlsSessionPlaybackControls.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Whether the session currently supports the Play command.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackcontrols.isplayenabled
     * @type {Boolean} 
     */
    IsPlayEnabled {
        get => this.get_IsPlayEnabled()
    }

    /**
     * Whether the session currently supports the pause command.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackcontrols.ispauseenabled
     * @type {Boolean} 
     */
    IsPauseEnabled {
        get => this.get_IsPauseEnabled()
    }

    /**
     * Whether the session currently supports the stop command.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackcontrols.isstopenabled
     * @type {Boolean} 
     */
    IsStopEnabled {
        get => this.get_IsStopEnabled()
    }

    /**
     * Whether the session currently supports the record command.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackcontrols.isrecordenabled
     * @type {Boolean} 
     */
    IsRecordEnabled {
        get => this.get_IsRecordEnabled()
    }

    /**
     * Whether the session currently supports the fast forward command.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackcontrols.isfastforwardenabled
     * @type {Boolean} 
     */
    IsFastForwardEnabled {
        get => this.get_IsFastForwardEnabled()
    }

    /**
     * Whether the session currently supports the rewind command.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackcontrols.isrewindenabled
     * @type {Boolean} 
     */
    IsRewindEnabled {
        get => this.get_IsRewindEnabled()
    }

    /**
     * Whether the session currently supports the next command.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackcontrols.isnextenabled
     * @type {Boolean} 
     */
    IsNextEnabled {
        get => this.get_IsNextEnabled()
    }

    /**
     * Whether the session currently supports the previous command.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackcontrols.ispreviousenabled
     * @type {Boolean} 
     */
    IsPreviousEnabled {
        get => this.get_IsPreviousEnabled()
    }

    /**
     * Whether the session currently supports ChannelUp.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackcontrols.ischannelupenabled
     * @type {Boolean} 
     */
    IsChannelUpEnabled {
        get => this.get_IsChannelUpEnabled()
    }

    /**
     * Whether the session currently supports ChannelDown.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackcontrols.ischanneldownenabled
     * @type {Boolean} 
     */
    IsChannelDownEnabled {
        get => this.get_IsChannelDownEnabled()
    }

    /**
     * Whether the session currently supports the play pause toggle command (where play or pause is picked depending on state).
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackcontrols.isplaypausetoggleenabled
     * @type {Boolean} 
     */
    IsPlayPauseToggleEnabled {
        get => this.get_IsPlayPauseToggleEnabled()
    }

    /**
     * Gets a value indicating whether the session currently allows control of its shuffle state.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackcontrols.isshuffleenabled
     * @type {Boolean} 
     */
    IsShuffleEnabled {
        get => this.get_IsShuffleEnabled()
    }

    /**
     * Whether the session currently supports control of its repeat mode.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackcontrols.isrepeatenabled
     * @type {Boolean} 
     */
    IsRepeatEnabled {
        get => this.get_IsRepeatEnabled()
    }

    /**
     * Whether the session currently supports changing the playback rate.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackcontrols.isplaybackrateenabled
     * @type {Boolean} 
     */
    IsPlaybackRateEnabled {
        get => this.get_IsPlaybackRateEnabled()
    }

    /**
     * Whether the session currently supports changing the playback position.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssessionplaybackcontrols.isplaybackpositionenabled
     * @type {Boolean} 
     */
    IsPlaybackPositionEnabled {
        get => this.get_IsPlaybackPositionEnabled()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlayEnabled() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackControls")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls := IGlobalSystemMediaTransportControlsSessionPlaybackControls(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls.get_IsPlayEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPauseEnabled() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackControls")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls := IGlobalSystemMediaTransportControlsSessionPlaybackControls(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls.get_IsPauseEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStopEnabled() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackControls")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls := IGlobalSystemMediaTransportControlsSessionPlaybackControls(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls.get_IsStopEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRecordEnabled() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackControls")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls := IGlobalSystemMediaTransportControlsSessionPlaybackControls(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls.get_IsRecordEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFastForwardEnabled() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackControls")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls := IGlobalSystemMediaTransportControlsSessionPlaybackControls(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls.get_IsFastForwardEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRewindEnabled() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackControls")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls := IGlobalSystemMediaTransportControlsSessionPlaybackControls(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls.get_IsRewindEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNextEnabled() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackControls")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls := IGlobalSystemMediaTransportControlsSessionPlaybackControls(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls.get_IsNextEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPreviousEnabled() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackControls")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls := IGlobalSystemMediaTransportControlsSessionPlaybackControls(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls.get_IsPreviousEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsChannelUpEnabled() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackControls")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls := IGlobalSystemMediaTransportControlsSessionPlaybackControls(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls.get_IsChannelUpEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsChannelDownEnabled() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackControls")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls := IGlobalSystemMediaTransportControlsSessionPlaybackControls(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls.get_IsChannelDownEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlayPauseToggleEnabled() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackControls")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls := IGlobalSystemMediaTransportControlsSessionPlaybackControls(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls.get_IsPlayPauseToggleEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsShuffleEnabled() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackControls")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls := IGlobalSystemMediaTransportControlsSessionPlaybackControls(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls.get_IsShuffleEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRepeatEnabled() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackControls")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls := IGlobalSystemMediaTransportControlsSessionPlaybackControls(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls.get_IsRepeatEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlaybackRateEnabled() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackControls")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls := IGlobalSystemMediaTransportControlsSessionPlaybackControls(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls.get_IsPlaybackRateEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlaybackPositionEnabled() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSessionPlaybackControls")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSessionPlaybackControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls := IGlobalSystemMediaTransportControlsSessionPlaybackControls(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSessionPlaybackControls.get_IsPlaybackPositionEnabled()
    }

;@endregion Instance Methods
}
