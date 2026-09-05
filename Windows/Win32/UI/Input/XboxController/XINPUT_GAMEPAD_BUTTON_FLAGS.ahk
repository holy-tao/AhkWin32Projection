#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 */
class XINPUT_GAMEPAD_BUTTON_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: XINPUT_GAMEPAD_DPAD_UP
     * @type {Integer (UInt16)}
     */
    static DPAD_UP => 1

    /**
     * Native name: XINPUT_GAMEPAD_DPAD_DOWN
     * @type {Integer (UInt16)}
     */
    static DPAD_DOWN => 2

    /**
     * Native name: XINPUT_GAMEPAD_DPAD_LEFT
     * @type {Integer (UInt16)}
     */
    static DPAD_LEFT => 4

    /**
     * Native name: XINPUT_GAMEPAD_DPAD_RIGHT
     * @type {Integer (UInt16)}
     */
    static DPAD_RIGHT => 8

    /**
     * Native name: XINPUT_GAMEPAD_START
     * @type {Integer (UInt16)}
     */
    static START => 16

    /**
     * Native name: XINPUT_GAMEPAD_BACK
     * @type {Integer (UInt16)}
     */
    static BACK => 32

    /**
     * Native name: XINPUT_GAMEPAD_LEFT_THUMB
     * @type {Integer (UInt16)}
     */
    static LEFT_THUMB => 64

    /**
     * Native name: XINPUT_GAMEPAD_RIGHT_THUMB
     * @type {Integer (UInt16)}
     */
    static RIGHT_THUMB => 128

    /**
     * Native name: XINPUT_GAMEPAD_LEFT_SHOULDER
     * @type {Integer (UInt16)}
     */
    static LEFT_SHOULDER => 256

    /**
     * Native name: XINPUT_GAMEPAD_RIGHT_SHOULDER
     * @type {Integer (UInt16)}
     */
    static RIGHT_SHOULDER => 512

    /**
     * Native name: XINPUT_GAMEPAD_A
     * @type {Integer (UInt16)}
     */
    static A => 4096

    /**
     * Native name: XINPUT_GAMEPAD_B
     * @type {Integer (UInt16)}
     */
    static B => 8192

    /**
     * Native name: XINPUT_GAMEPAD_X
     * @type {Integer (UInt16)}
     */
    static X => 16384

    /**
     * Native name: XINPUT_GAMEPAD_Y
     * @type {Integer (UInt16)}
     */
    static Y => 32768

    /**
     * Native name: XINPUT_GAMEPAD_LEFT_THUMB_DEADZONE
     * @type {Integer (UInt16)}
     */
    static LEFT_THUMB_DEADZONE => 7849

    /**
     * Native name: XINPUT_GAMEPAD_RIGHT_THUMB_DEADZONE
     * @type {Integer (UInt16)}
     */
    static RIGHT_THUMB_DEADZONE => 8689

    /**
     * Native name: XINPUT_GAMEPAD_TRIGGER_THRESHOLD
     * @type {Integer (UInt16)}
     */
    static TRIGGER_THRESHOLD => 30
}
