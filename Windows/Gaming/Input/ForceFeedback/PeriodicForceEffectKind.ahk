#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of the periodic force feedback effect.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.forcefeedback.periodicforceeffectkind
 * @namespace Windows.Gaming.Input.ForceFeedback
 * @version WindowsRuntime 1.4
 */
class PeriodicForceEffectKind extends Win32Enum{

    /**
     * The waveform is a square.
     * @type {Integer (Int32)}
     */
    static SquareWave => 0

    /**
     * The waveform is a sine wave.
     * @type {Integer (Int32)}
     */
    static SineWave => 1

    /**
     * The waveform is a triangle.
     * @type {Integer (Int32)}
     */
    static TriangleWave => 2

    /**
     * The waveform drops vertically after it reaches maximum positive force.
     * @type {Integer (Int32)}
     */
    static SawtoothWaveUp => 3

    /**
     * The waveform rises vertically after it reaches maximum negative force.
     * @type {Integer (Int32)}
     */
    static SawtoothWaveDown => 4
}
