#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 */
class XINPUT_DEVSUBTYPE extends Win32Enum {

    /**
     * Native name: XINPUT_DEVSUBTYPE_GAMEPAD
     * @type {Integer (Byte)}
     */
    static GAMEPAD => 0x01

    /**
     * Native name: XINPUT_DEVSUBTYPE_UNKNOWN
     * @type {Integer (Byte)}
     */
    static UNKNOWN => 0x00

    /**
     * Native name: XINPUT_DEVSUBTYPE_WHEEL
     * @type {Integer (Byte)}
     */
    static WHEEL => 0x02

    /**
     * Native name: XINPUT_DEVSUBTYPE_ARCADE_STICK
     * @type {Integer (Byte)}
     */
    static ARCADE_STICK => 0x03

    /**
     * Native name: XINPUT_DEVSUBTYPE_FLIGHT_STICK
     * @type {Integer (Byte)}
     */
    static FLIGHT_STICK => 0x04

    /**
     * Native name: XINPUT_DEVSUBTYPE_DANCE_PAD
     * @type {Integer (Byte)}
     */
    static DANCE_PAD => 0x05

    /**
     * Native name: XINPUT_DEVSUBTYPE_GUITAR
     * @type {Integer (Byte)}
     */
    static GUITAR => 0x06

    /**
     * Native name: XINPUT_DEVSUBTYPE_GUITAR_ALTERNATE
     * @type {Integer (Byte)}
     */
    static GUITAR_ALTERNATE => 0x07

    /**
     * Native name: XINPUT_DEVSUBTYPE_DRUM_KIT
     * @type {Integer (Byte)}
     */
    static DRUM_KIT => 0x08

    /**
     * Native name: XINPUT_DEVSUBTYPE_GUITAR_BASS
     * @type {Integer (Byte)}
     */
    static GUITAR_BASS => 0x0B

    /**
     * Native name: XINPUT_DEVSUBTYPE_ARCADE_PAD
     * @type {Integer (Byte)}
     */
    static ARCADE_PAD => 0x13
}
