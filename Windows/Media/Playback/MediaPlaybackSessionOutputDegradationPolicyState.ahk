#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlaybackSessionOutputDegradationPolicyState.ahk
#Include ..\..\..\Guid.ahk

/**
 * Expresses the current output degradation policy state of a [MediaPlaybackSession](mediaplaybacksession.md).
 * @remarks
 * Get an instance of this class by calling [MediaPlaybackSession.GetOutputDegradationPolicyState](mediaplaybacksession_getoutputdegradationpolicystate_882169610.md). 
 * 
 * In some circumstances the system may degrade the playback of a media item, such as reducing the resolution (constriction), based on a policy rather than a performance issue. The object retrieved with this property allows you to determine if and why this policy-based degredation is occurring for telemetry purposes.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksessionoutputdegradationpolicystate
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackSessionOutputDegradationPolicyState extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlaybackSessionOutputDegradationPolicyState

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlaybackSessionOutputDegradationPolicyState.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value from the [MediaPlaybackSessionVideoConstrictionReason](mediaplaybacksessionvideoconstrictionreason.md) enumeration specifying the reason why video is being constricted, if known.
     * @remarks
     * In some circumstances the system may reduce the resolution (constrict) the output of a media item based on a policy rather than a performance issue. The value retrieved with this property specifies the reason this policy-based degredation is occurring for telemetry purposes. A value of **None** indicates that the content is not currently being constricted.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksessionoutputdegradationpolicystate.videoconstrictionreason
     * @type {Integer} 
     */
    VideoConstrictionReason {
        get => this.get_VideoConstrictionReason()
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
    get_VideoConstrictionReason() {
        if (!this.HasProp("__IMediaPlaybackSessionOutputDegradationPolicyState")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSessionOutputDegradationPolicyState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSessionOutputDegradationPolicyState := IMediaPlaybackSessionOutputDegradationPolicyState(outPtr)
        }

        return this.__IMediaPlaybackSessionOutputDegradationPolicyState.get_VideoConstrictionReason()
    }

;@endregion Instance Methods
}
