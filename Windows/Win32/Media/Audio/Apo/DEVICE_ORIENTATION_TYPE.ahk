#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies device orientation values for notifications of type APO_NOTIFICATION_TYPE_DEVICE_ORIENTATION.
 * @remarks
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/ne-audioengineextensionapo-device_orientation_type
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class DEVICE_ORIENTATION_TYPE extends Win32Enum{

    /**
     * The device is not rotated
     * @type {Integer (Int32)}
     */
    static DEVICE_NOT_ROTATED => 0

    /**
     * The device is rotated 90 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static DEVICE_ROTATED_90_DEGREES_CLOCKWISE => 1

    /**
     * The device is rotated 180 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static DEVICE_ROTATED_180_DEGREES_CLOCKWISE => 2

    /**
     * The device is rotated 180 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static DEVICE_ROTATED_270_DEGREES_CLOCKWISE => 3
}
