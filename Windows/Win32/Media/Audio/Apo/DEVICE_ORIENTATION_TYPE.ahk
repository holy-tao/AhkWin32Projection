#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ne-audioengineextensionapo-device_orientation_type
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class DEVICE_ORIENTATION_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static DEVICE_NOT_ROTATED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEVICE_ROTATED_90_DEGREES_CLOCKWISE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DEVICE_ROTATED_180_DEGREES_CLOCKWISE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DEVICE_ROTATED_270_DEGREES_CLOCKWISE => 3
}
