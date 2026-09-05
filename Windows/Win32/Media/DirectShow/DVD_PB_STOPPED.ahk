#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DVD_PB_STOPPED enumeration value has flags that indicate why DVD playback stopped. This flag is sent in the lParam1 parameter of the EC_DVD_PLAYBACK_STOPPED event.
 * @see https://learn.microsoft.com/windows/win32/api/dvdevcod/ne-dvdevcod-dvd_pb_stopped
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVD_PB_STOPPED extends Win32Enum {

    /**
     * Unspecified reason.
     * Native name: DVD_PB_STOPPED_Other
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * The current program chain (PGC) completed and the DVD Navigator found no other video or other branching instructions.
     * Native name: DVD_PB_STOPPED_NoBranch
     * @type {Integer (Int32)}
     */
    static NoBranch => 1

    /**
     * The disc does not contain an initial startup program.
     * Native name: DVD_PB_STOPPED_NoFirstPlayDomain
     * @type {Integer (Int32)}
     */
    static NoFirstPlayDomain => 2

    /**
     * The application stopped playback or a DVD Navigator reached a stop command on the disc.
     * Native name: DVD_PB_STOPPED_StopCommand
     * @type {Integer (Int32)}
     */
    static StopCommand => 3

    /**
     * The DVD Navigator was reset to the start of the disc.
     * Native name: DVD_PB_STOPPED_Reset
     * @type {Integer (Int32)}
     */
    static Reset => 4

    /**
     * The disc was ejected.
     * Native name: DVD_PB_STOPPED_DiscEjected
     * @type {Integer (Int32)}
     */
    static DiscEjected => 5

    /**
     * An invalid navigation command prevented playback from continuing.
     * Native name: DVD_PB_STOPPED_IllegalNavCommand
     * @type {Integer (Int32)}
     */
    static IllegalNavCommand => 6

    /**
     * Playback reached the end time that was specified by the application.
     * Native name: DVD_PB_STOPPED_PlayPeriodAutoStop
     * @type {Integer (Int32)}
     */
    static PlayPeriodAutoStop => 7

    /**
     * Playback reached the end of the chapter.
     * Native name: DVD_PB_STOPPED_PlayChapterAutoStop
     * @type {Integer (Int32)}
     */
    static PlayChapterAutoStop => 8

    /**
     * Playback was stopped because of the parental level.
     * Native name: DVD_PB_STOPPED_ParentalFailure
     * @type {Integer (Int32)}
     */
    static ParentalFailure => 9

    /**
     * Playback was stopped because the region did not match.
     * Native name: DVD_PB_STOPPED_RegionFailure
     * @type {Integer (Int32)}
     */
    static RegionFailure => 10

    /**
     * Playback was stopped because of analog copy protection.
     * Native name: DVD_PB_STOPPED_MacrovisionFailure
     * @type {Integer (Int32)}
     */
    static MacrovisionFailure => 11

    /**
     * An error occurred while reading the disc.
     * Native name: DVD_PB_STOPPED_DiscReadError
     * @type {Integer (Int32)}
     */
    static DiscReadError => 12

    /**
     * Playback was stopped because of copy protection.
     * Native name: DVD_PB_STOPPED_CopyProtectFailure
     * @type {Integer (Int32)}
     */
    static CopyProtectFailure => 13

    /**
     * The disc cannot be played because the video display does not meet the copy protection requirements.
     * Native name: DVD_PB_STOPPED_CopyProtectOutputFailure
     * @type {Integer (Int32)}
     */
    static CopyProtectOutputFailure => 14

    /**
     * The disc cannot be played because the driver does not support checking the video display.
     * Native name: DVD_PB_STOPPED_CopyProtectOutputNotSupported
     * @type {Integer (Int32)}
     */
    static CopyProtectOutputNotSupported => 15
}
