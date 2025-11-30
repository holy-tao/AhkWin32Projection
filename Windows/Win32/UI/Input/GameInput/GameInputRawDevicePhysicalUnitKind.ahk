#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputRawDevicePhysicalUnitKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitUnknown => -1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitTime => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitFrequency => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitLength => 3

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitVelocity => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitAcceleration => 5

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitMass => 6

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitMomentum => 7

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitForce => 8

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitPressure => 9

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitAngle => 10

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitAngularVelocity => 11

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitAngularAcceleration => 12

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitAngularMass => 13

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitAngularMomentum => 14

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitAngularTorque => 15

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitElectricCurrent => 16

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitElectricCharge => 17

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitElectricPotential => 18

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitEnergy => 19

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitPower => 20

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitTemperature => 21

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitLuminousIntensity => 22

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitLuminousFlux => 23

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalUnitIlluminance => 24
}
