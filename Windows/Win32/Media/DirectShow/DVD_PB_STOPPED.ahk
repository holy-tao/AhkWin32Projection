#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DVD_PB_STOPPED enumeration value has flags that indicate why DVD playback stopped. This flag is sent in the lParam1 parameter of the EC_DVD_PLAYBACK_STOPPED event.
 * @see https://learn.microsoft.com/windows/win32/api/dvdevcod/ne-dvdevcod-dvd_pb_stopped
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_PB_STOPPED extends Win32Enum{

    /**
     * Unspecified reason.
     * @type {Integer (Int32)}
     */
    static DVD_PB_STOPPED_Other => 0

    /**
     * The current program chain (PGC) completed and the DVD Navigator found no other video or other branching instructions.
     * @type {Integer (Int32)}
     */
    static DVD_PB_STOPPED_NoBranch => 1

    /**
     * The disc does not contain an initial startup program.
     * @type {Integer (Int32)}
     */
    static DVD_PB_STOPPED_NoFirstPlayDomain => 2

    /**
     * The application stopped playback or a DVD Navigator reached a stop command on the disc.
     * @type {Integer (Int32)}
     */
    static DVD_PB_STOPPED_StopCommand => 3

    /**
     * The DVD Navigator was reset to the start of the disc.
     * @type {Integer (Int32)}
     */
    static DVD_PB_STOPPED_Reset => 4

    /**
     * The disc was ejected.
     * @type {Integer (Int32)}
     */
    static DVD_PB_STOPPED_DiscEjected => 5

    /**
     * An invalid navigation command prevented playback from continuing.
     * @type {Integer (Int32)}
     */
    static DVD_PB_STOPPED_IllegalNavCommand => 6

    /**
     * Playback reached the end time that was specified by the application.
     * @type {Integer (Int32)}
     */
    static DVD_PB_STOPPED_PlayPeriodAutoStop => 7

    /**
     * Playback reached the end of the chapter.
     * @type {Integer (Int32)}
     */
    static DVD_PB_STOPPED_PlayChapterAutoStop => 8

    /**
     * Playback was stopped because of the parental level.
     * @type {Integer (Int32)}
     */
    static DVD_PB_STOPPED_ParentalFailure => 9

    /**
     * Playback was stopped because the region did not match.
     * @type {Integer (Int32)}
     */
    static DVD_PB_STOPPED_RegionFailure => 10

    /**
     * Playback was stopped because of analog copy protection.
     * @type {Integer (Int32)}
     */
    static DVD_PB_STOPPED_MacrovisionFailure => 11

    /**
     * An error occurred while reading the disc.
     * @type {Integer (Int32)}
     */
    static DVD_PB_STOPPED_DiscReadError => 12

    /**
     * Playback was stopped because of copy protection.
     * @type {Integer (Int32)}
     */
    static DVD_PB_STOPPED_CopyProtectFailure => 13

    /**
     * The disc cannot be played because the video display does not meet the copy protection requirements.
     * @type {Integer (Int32)}
     */
    static DVD_PB_STOPPED_CopyProtectOutputFailure => 14

    /**
     * The disc cannot be played because the driver does not support checking the video display.
     * @type {Integer (Int32)}
     */
    static DVD_PB_STOPPED_CopyProtectOutputNotSupported => 15
}
