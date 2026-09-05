#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the audio device was being accessed when the failure occurred.
 * @see https://learn.microsoft.com/windows/win32/api/audevcod/ne-audevcod-snddev_err
 * @namespace Windows.Win32.Media.DirectShow
 */
class SNDDEV_ERR extends Win32Enum {

    /**
     * The audio device attempted to open.
     * Native name: SNDDEV_ERROR_Open
     * @type {Integer (Int32)}
     */
    static ERROR_Open => 1

    /**
     * The audio device attempted to close.
     * Native name: SNDDEV_ERROR_Close
     * @type {Integer (Int32)}
     */
    static ERROR_Close => 2

    /**
     * The capabilities of the underlying hardware were being retrieved.
     * Native name: SNDDEV_ERROR_GetCaps
     * @type {Integer (Int32)}
     */
    static ERROR_GetCaps => 3

    /**
     * The header for the audio device was being prepared.
     * Native name: SNDDEV_ERROR_PrepareHeader
     * @type {Integer (Int32)}
     */
    static ERROR_PrepareHeader => 4

    /**
     * The header for the audio device was being unprepared.
     * Native name: SNDDEV_ERROR_UnprepareHeader
     * @type {Integer (Int32)}
     */
    static ERROR_UnprepareHeader => 5

    /**
     * The audio device attempted to reset.
     * Native name: SNDDEV_ERROR_Reset
     * @type {Integer (Int32)}
     */
    static ERROR_Reset => 6

    /**
     * The audio device attempted to restart.
     * Native name: SNDDEV_ERROR_Restart
     * @type {Integer (Int32)}
     */
    static ERROR_Restart => 7

    /**
     * The current and stop position settings were being retrieved.
     * Native name: SNDDEV_ERROR_GetPosition
     * @type {Integer (Int32)}
     */
    static ERROR_GetPosition => 8

    /**
     * The audio device was being written to.
     * Native name: SNDDEV_ERROR_Write
     * @type {Integer (Int32)}
     */
    static ERROR_Write => 9

    /**
     * The audio device attempted to pause.
     * Native name: SNDDEV_ERROR_Pause
     * @type {Integer (Int32)}
     */
    static ERROR_Pause => 10

    /**
     * The audio device attempted to stop.
     * Native name: SNDDEV_ERROR_Stop
     * @type {Integer (Int32)}
     */
    static ERROR_Stop => 11

    /**
     * The audio device attempted to start.
     * Native name: SNDDEV_ERROR_Start
     * @type {Integer (Int32)}
     */
    static ERROR_Start => 12

    /**
     * A buffer was being added to the audio device.
     * Native name: SNDDEV_ERROR_AddBuffer
     * @type {Integer (Int32)}
     */
    static ERROR_AddBuffer => 13

    /**
     * The audio device was being queried.
     * Native name: SNDDEV_ERROR_Query
     * @type {Integer (Int32)}
     */
    static ERROR_Query => 14
}
