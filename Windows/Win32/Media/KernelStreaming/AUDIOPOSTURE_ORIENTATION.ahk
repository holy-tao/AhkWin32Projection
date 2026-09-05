#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class AUDIOPOSTURE_ORIENTATION extends Win32Enum {

    /**
     * Native name: AUDIOPOSTURE_ORIENTATION_NOTROTATED
     * @type {Integer (Int32)}
     */
    static NOTROTATED => 0

    /**
     * Native name: AUDIOPOSTURE_ORIENTATION_ROTATED90DEGREESCOUNTERCLOCKWISE
     * @type {Integer (Int32)}
     */
    static ROTATED90DEGREESCOUNTERCLOCKWISE => 1

    /**
     * Native name: AUDIOPOSTURE_ORIENTATION_ROTATED180DEGREESCOUNTERCLOCKWISE
     * @type {Integer (Int32)}
     */
    static ROTATED180DEGREESCOUNTERCLOCKWISE => 2

    /**
     * Native name: AUDIOPOSTURE_ORIENTATION_ROTATED270DEGREESCOUNTERCLOCKWISE
     * @type {Integer (Int32)}
     */
    static ROTATED270DEGREESCOUNTERCLOCKWISE => 3
}
