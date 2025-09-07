#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class MIDI_WAVE_OPEN_TYPE{

    /**
     * @type {Integer (UInt32)}
     */
    static CALLBACK_TYPEMASK => 458752

    /**
     * @type {Integer (UInt32)}
     */
    static CALLBACK_NULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CALLBACK_WINDOW => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CALLBACK_TASK => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CALLBACK_FUNCTION => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static CALLBACK_THREAD => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CALLBACK_EVENT => 327680

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_QUERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_ALLOWSYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_MAPPED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DIRECT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_FORMAT_DIRECT_QUERY => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WAVE_MAPPED_DEFAULT_COMMUNICATION_DEVICE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MIDI_IO_STATUS => 32
}
