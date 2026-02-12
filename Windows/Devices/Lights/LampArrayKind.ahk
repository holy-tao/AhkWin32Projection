#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The type of physical device the LampArray is part of.
 * @remarks
 * Avoid placing error checks that validate **LampArrayKind** within the current bounds, because this list might expand over time. Rather, compare against the subset of **LampArrayKind** that your application supports.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.lamparraykind
 * @namespace Windows.Devices.Lights
 * @version WindowsRuntime 1.4
 */
class LampArrayKind extends Win32Enum{

    /**
     * No Kind specified for this device.
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Is part of a keyboard or keypad.
     * @type {Integer (Int32)}
     */
    static Keyboard => 1

    /**
     * Is part of a mouse.
     * @type {Integer (Int32)}
     */
    static Mouse => 2

    /**
     * Is part of a game controller (for example, gamepad, flightstick, sailing simulation device).
     * @type {Integer (Int32)}
     */
    static GameController => 3

    /**
     * Is part of a more general peripheral/accessory (for example, speakers, mousepad, microphone, webcam).
     * @type {Integer (Int32)}
     */
    static Peripheral => 4

    /**
     * Illuminates a room/performance-stage/area (for example, room light-bulbs, spotlights, washlights, strobelights, booth-strips, billboard/sign, camera-flash).
     * @type {Integer (Int32)}
     */
    static Scene => 5

    /**
     * Is part of a notification device.
     * @type {Integer (Int32)}
     */
    static Notification => 6

    /**
     * Is part of an internal PC case component (for example, RAM-stick, motherboard, fan).
     * @type {Integer (Int32)}
     */
    static Chassis => 7

    /**
     * Is embedded in a wearable accessory (for example, audio-headset, wristband, watch, shoes).
     * @type {Integer (Int32)}
     */
    static Wearable => 8

    /**
     * Is embedded in a piece of furniture (for example, chair, desk, bookcase).
     * @type {Integer (Int32)}
     */
    static Furniture => 9

    /**
     * Is embedded in an artwork (for example, painting or sculpture).
     * @type {Integer (Int32)}
     */
    static Art => 10

    /**
     * Is embedded in a wearable accessory designed specifically for the head (for example, headphones or microphones). This is a specialization of *Wearable*.
     * @type {Integer (Int32)}
     */
    static Headset => 11

    /**
     * @type {Integer (Int32)}
     */
    static Microphone => 12

    /**
     * @type {Integer (Int32)}
     */
    static Speaker => 13
}
