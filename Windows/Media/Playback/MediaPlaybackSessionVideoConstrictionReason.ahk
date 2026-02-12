#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the policy-based reason that video output of a media item is constricted.
 * @remarks
 * This enumeration supports the [MediaPlaybackSessionOutputDegradationPolicyState.VideoConstrictionReason](mediaplaybacksessionoutputdegradationpolicystate_videoconstrictionreason.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksessionvideoconstrictionreason
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackSessionVideoConstrictionReason extends Win32Enum{

    /**
     * The content is not currently being constricted.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The content is being played back on a virtual machine.
     * @type {Integer (Int32)}
     */
    static VirtualMachine => 1

    /**
     * The content is being displayed on an unsupported display adapter.
     * @type {Integer (Int32)}
     */
    static UnsupportedDisplayAdapter => 2

    /**
     * The content is being displayed by a device with an unsigned driver.
     * @type {Integer (Int32)}
     */
    static UnsignedDriver => 3

    /**
     * The content is being rendered in a [MediaPlayer](mediaplayer.md) with [IsVideoFrameServerEnabled](mediaplayer_isvideoframeserverenabled.md), providing direct access to video frames to the app.
     * @type {Integer (Int32)}
     */
    static FrameServerEnabled => 4

    /**
     * Output protection for the content failed.
     * @type {Integer (Int32)}
     */
    static OutputProtectionFailed => 5

    /**
     * The reason is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 6
}
