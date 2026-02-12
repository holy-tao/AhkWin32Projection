#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The device subtype of the controller.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.custom.xusbdevicesubtype
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class XusbDeviceSubtype extends Win32Enum{

    /**
     * The device subtype is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The device subtype is gamepad.
     * @type {Integer (Int32)}
     */
    static Gamepad => 1

    /**
     * The device subtype is arcadepad.
     * @type {Integer (Int32)}
     */
    static ArcadePad => 2

    /**
     * The device subtype is arcadestick.
     * @type {Integer (Int32)}
     */
    static ArcadeStick => 3

    /**
     * The device subtype is flightstick.
     * @type {Integer (Int32)}
     */
    static FlightStick => 4

    /**
     * The device subtype is wheel.
     * @type {Integer (Int32)}
     */
    static Wheel => 5

    /**
     * The device subtype is guitar.
     * @type {Integer (Int32)}
     */
    static Guitar => 6

    /**
     * The device subtype is guitaralternate.
     * @type {Integer (Int32)}
     */
    static GuitarAlternate => 7

    /**
     * The device subtype is guitarbass.
     * @type {Integer (Int32)}
     */
    static GuitarBass => 8

    /**
     * The device subtype is drumkit.
     * @type {Integer (Int32)}
     */
    static DrumKit => 9

    /**
     * The device subtype is dancepad.
     * @type {Integer (Int32)}
     */
    static DancePad => 10
}
