#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 */
class MIDI_WAVE_OPEN_TYPE extends Win32BitflagEnum {

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
     * Native name: WAVE_FORMAT_QUERY
     * @type {Integer (UInt32)}
     */
    static FORMAT_QUERY => 1

    /**
     * Native name: WAVE_ALLOWSYNC
     * @type {Integer (UInt32)}
     */
    static ALLOWSYNC => 2

    /**
     * Native name: WAVE_MAPPED
     * @type {Integer (UInt32)}
     */
    static MAPPED => 4

    /**
     * Native name: WAVE_FORMAT_DIRECT
     * @type {Integer (UInt32)}
     */
    static FORMAT_DIRECT => 8

    /**
     * Native name: WAVE_FORMAT_DIRECT_QUERY
     * @type {Integer (UInt32)}
     */
    static FORMAT_DIRECT_QUERY => 9

    /**
     * Native name: WAVE_MAPPED_DEFAULT_COMMUNICATION_DEVICE
     * @type {Integer (UInt32)}
     */
    static MAPPED_DEFAULT_COMMUNICATION_DEVICE => 16

    /**
     * Native name: MIDI_IO_STATUS
     * @type {Integer (UInt32)}
     */
    static IO_STATUS => 32
}
