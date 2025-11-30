#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class AUDIOPOSTURE_ORIENTATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AUDIOPOSTURE_ORIENTATION_NOTROTATED => 0

    /**
     * @type {Integer (Int32)}
     */
    static AUDIOPOSTURE_ORIENTATION_ROTATED90DEGREESCOUNTERCLOCKWISE => 1

    /**
     * @type {Integer (Int32)}
     */
    static AUDIOPOSTURE_ORIENTATION_ROTATED180DEGREESCOUNTERCLOCKWISE => 2

    /**
     * @type {Integer (Int32)}
     */
    static AUDIOPOSTURE_ORIENTATION_ROTATED270DEGREESCOUNTERCLOCKWISE => 3
}
