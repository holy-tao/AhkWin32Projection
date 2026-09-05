#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputRawDevicePhysicalUnitKind extends Win32Enum {

    /**
     * Native name: GameInputPhysicalUnitUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => -1

    /**
     * Native name: GameInputPhysicalUnitNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: GameInputPhysicalUnitTime
     * @type {Integer (Int32)}
     */
    static Time => 1

    /**
     * Native name: GameInputPhysicalUnitFrequency
     * @type {Integer (Int32)}
     */
    static Frequency => 2

    /**
     * Native name: GameInputPhysicalUnitLength
     * @type {Integer (Int32)}
     */
    static Length => 3

    /**
     * Native name: GameInputPhysicalUnitVelocity
     * @type {Integer (Int32)}
     */
    static Velocity => 4

    /**
     * Native name: GameInputPhysicalUnitAcceleration
     * @type {Integer (Int32)}
     */
    static Acceleration => 5

    /**
     * Native name: GameInputPhysicalUnitMass
     * @type {Integer (Int32)}
     */
    static Mass => 6

    /**
     * Native name: GameInputPhysicalUnitMomentum
     * @type {Integer (Int32)}
     */
    static Momentum => 7

    /**
     * Native name: GameInputPhysicalUnitForce
     * @type {Integer (Int32)}
     */
    static Force => 8

    /**
     * Native name: GameInputPhysicalUnitPressure
     * @type {Integer (Int32)}
     */
    static Pressure => 9

    /**
     * Native name: GameInputPhysicalUnitAngle
     * @type {Integer (Int32)}
     */
    static Angle => 10

    /**
     * Native name: GameInputPhysicalUnitAngularVelocity
     * @type {Integer (Int32)}
     */
    static AngularVelocity => 11

    /**
     * Native name: GameInputPhysicalUnitAngularAcceleration
     * @type {Integer (Int32)}
     */
    static AngularAcceleration => 12

    /**
     * Native name: GameInputPhysicalUnitAngularMass
     * @type {Integer (Int32)}
     */
    static AngularMass => 13

    /**
     * Native name: GameInputPhysicalUnitAngularMomentum
     * @type {Integer (Int32)}
     */
    static AngularMomentum => 14

    /**
     * Native name: GameInputPhysicalUnitAngularTorque
     * @type {Integer (Int32)}
     */
    static AngularTorque => 15

    /**
     * Native name: GameInputPhysicalUnitElectricCurrent
     * @type {Integer (Int32)}
     */
    static ElectricCurrent => 16

    /**
     * Native name: GameInputPhysicalUnitElectricCharge
     * @type {Integer (Int32)}
     */
    static ElectricCharge => 17

    /**
     * Native name: GameInputPhysicalUnitElectricPotential
     * @type {Integer (Int32)}
     */
    static ElectricPotential => 18

    /**
     * Native name: GameInputPhysicalUnitEnergy
     * @type {Integer (Int32)}
     */
    static Energy => 19

    /**
     * Native name: GameInputPhysicalUnitPower
     * @type {Integer (Int32)}
     */
    static Power => 20

    /**
     * Native name: GameInputPhysicalUnitTemperature
     * @type {Integer (Int32)}
     */
    static Temperature => 21

    /**
     * Native name: GameInputPhysicalUnitLuminousIntensity
     * @type {Integer (Int32)}
     */
    static LuminousIntensity => 22

    /**
     * Native name: GameInputPhysicalUnitLuminousFlux
     * @type {Integer (Int32)}
     */
    static LuminousFlux => 23

    /**
     * Native name: GameInputPhysicalUnitIlluminance
     * @type {Integer (Int32)}
     */
    static Illuminance => 24
}
