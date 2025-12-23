#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 * @version v4.0.30319
 */
class XINPUT_GAMEPAD_BUTTON_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_DPAD_UP => 1

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_DPAD_DOWN => 2

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_DPAD_LEFT => 4

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_DPAD_RIGHT => 8

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_START => 16

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_BACK => 32

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_LEFT_THUMB => 64

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_RIGHT_THUMB => 128

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_LEFT_SHOULDER => 256

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_RIGHT_SHOULDER => 512

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_A => 4096

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_B => 8192

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_X => 16384

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_Y => 32768

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_LEFT_THUMB_DEADZONE => 7849

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_RIGHT_THUMB_DEADZONE => 8689

    /**
     * @type {Integer (UInt16)}
     */
    static XINPUT_GAMEPAD_TRIGGER_THRESHOLD => 30
}
