#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies device orientation values for notifications of type APO_NOTIFICATION_TYPE_DEVICE_ORIENTATION.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ne-audioengineextensionapo-device_orientation_type
 * @namespace Windows.Win32.Media.Audio.Apo
 */
class DEVICE_ORIENTATION_TYPE extends Win32Enum {

    /**
     * The device is not rotated
     * Native name: DEVICE_NOT_ROTATED
     * @type {Integer (Int32)}
     */
    static NOT_ROTATED => 0

    /**
     * The device is rotated 90 degrees clockwise.
     * Native name: DEVICE_ROTATED_90_DEGREES_CLOCKWISE
     * @type {Integer (Int32)}
     */
    static ROTATED_90_DEGREES_CLOCKWISE => 1

    /**
     * The device is rotated 180 degrees clockwise.
     * Native name: DEVICE_ROTATED_180_DEGREES_CLOCKWISE
     * @type {Integer (Int32)}
     */
    static ROTATED_180_DEGREES_CLOCKWISE => 2

    /**
     * The device is rotated 180 degrees clockwise.
     * Native name: DEVICE_ROTATED_270_DEGREES_CLOCKWISE
     * @type {Integer (Int32)}
     */
    static ROTATED_270_DEGREES_CLOCKWISE => 3
}
