#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the possible capture scene modes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.capturescenemode
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class CaptureSceneMode extends Win32Enum{

    /**
     * Indicates that the best settings and exposure optimization are automatically performed.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Indicates that no optimization is performed on the captured frame.
     * @type {Integer (Int32)}
     */
    static Manual => 1

    /**
     * Indicates that the captured framed is optimized for macro photos.
     * @type {Integer (Int32)}
     */
    static Macro => 2

    /**
     * Indicates that the captured framed is optimized for portrait photos.
     * @type {Integer (Int32)}
     */
    static Portrait => 3

    /**
     * Indicates that the captured framed is optimized for sports photos.
     * @type {Integer (Int32)}
     */
    static Sport => 4

    /**
     * Indicates that the captured framed is optimized for photos that include snow.
     * @type {Integer (Int32)}
     */
    static Snow => 5

    /**
     * Indicates that the captured framed is optimized for night photos
     * @type {Integer (Int32)}
     */
    static Night => 6

    /**
     * Indicates that the captured framed is optimized for beach photos.
     * @type {Integer (Int32)}
     */
    static Beach => 7

    /**
     * Indicates that the captured framed is optimized for sunset photos.
     * @type {Integer (Int32)}
     */
    static Sunset => 8

    /**
     * Indicates that the captured framed is optimized for candlelight photos.
     * @type {Integer (Int32)}
     */
    static Candlelight => 9

    /**
     * Indicates that the captured framed is optimized for photos of landscape.
     * @type {Integer (Int32)}
     */
    static Landscape => 10

    /**
     * Indicates that the captured framed is optimized for low-light portrait photos.
     * @type {Integer (Int32)}
     */
    static NightPortrait => 11

    /**
     * Indicates that the captured framed is optimized for photos that are backlit.
     * @type {Integer (Int32)}
     */
    static Backlit => 12
}
