#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the audio device was being accessed when the failure occurred.
 * @see https://learn.microsoft.com/windows/win32/api/audevcod/ne-audevcod-snddev_err
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class SNDDEV_ERR extends Win32Enum{

    /**
     * The audio device attempted to open.
     * @type {Integer (Int32)}
     */
    static SNDDEV_ERROR_Open => 1

    /**
     * The audio device attempted to close.
     * @type {Integer (Int32)}
     */
    static SNDDEV_ERROR_Close => 2

    /**
     * The capabilities of the underlying hardware were being retrieved.
     * @type {Integer (Int32)}
     */
    static SNDDEV_ERROR_GetCaps => 3

    /**
     * The header for the audio device was being prepared.
     * @type {Integer (Int32)}
     */
    static SNDDEV_ERROR_PrepareHeader => 4

    /**
     * The header for the audio device was being unprepared.
     * @type {Integer (Int32)}
     */
    static SNDDEV_ERROR_UnprepareHeader => 5

    /**
     * The audio device attempted to reset.
     * @type {Integer (Int32)}
     */
    static SNDDEV_ERROR_Reset => 6

    /**
     * The audio device attempted to restart.
     * @type {Integer (Int32)}
     */
    static SNDDEV_ERROR_Restart => 7

    /**
     * The current and stop position settings were being retrieved.
     * @type {Integer (Int32)}
     */
    static SNDDEV_ERROR_GetPosition => 8

    /**
     * The audio device was being written to.
     * @type {Integer (Int32)}
     */
    static SNDDEV_ERROR_Write => 9

    /**
     * The audio device attempted to pause.
     * @type {Integer (Int32)}
     */
    static SNDDEV_ERROR_Pause => 10

    /**
     * The audio device attempted to stop.
     * @type {Integer (Int32)}
     */
    static SNDDEV_ERROR_Stop => 11

    /**
     * The audio device attempted to start.
     * @type {Integer (Int32)}
     */
    static SNDDEV_ERROR_Start => 12

    /**
     * A buffer was being added to the audio device.
     * @type {Integer (Int32)}
     */
    static SNDDEV_ERROR_AddBuffer => 13

    /**
     * The audio device was being queried.
     * @type {Integer (Int32)}
     */
    static SNDDEV_ERROR_Query => 14
}
