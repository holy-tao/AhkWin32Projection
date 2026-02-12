#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values for audio effect types.
 * @remarks
 * See the [Audio effects discovery sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Audio%20effects%20discovery%20sample) for an example of how to query and monitor audio effects on render and capture audio devices.
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.audioeffecttype
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class AudioEffectType extends Win32Enum{

    /**
     * Other.
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * An acoustic echo cancellation effect.
     * @type {Integer (Int32)}
     */
    static AcousticEchoCancellation => 1

    /**
     * A noise suppression effect.
     * @type {Integer (Int32)}
     */
    static NoiseSuppression => 2

    /**
     * A automatic gain control effect.
     * @type {Integer (Int32)}
     */
    static AutomaticGainControl => 3

    /**
     * A beam forming effect.
     * @type {Integer (Int32)}
     */
    static BeamForming => 4

    /**
     * A constant tone removal effect.
     * @type {Integer (Int32)}
     */
    static ConstantToneRemoval => 5

    /**
     * A equalizer effect.
     * @type {Integer (Int32)}
     */
    static Equalizer => 6

    /**
     * A loudness equalizer effect.
     * @type {Integer (Int32)}
     */
    static LoudnessEqualizer => 7

    /**
     * A bass boost effect.
     * @type {Integer (Int32)}
     */
    static BassBoost => 8

    /**
     * A virtual surround sound effect.
     * @type {Integer (Int32)}
     */
    static VirtualSurround => 9

    /**
     * A virtual headphones effect.
     * @type {Integer (Int32)}
     */
    static VirtualHeadphones => 10

    /**
     * A speaker fill effect.
     * @type {Integer (Int32)}
     */
    static SpeakerFill => 11

    /**
     * A room correction effect.
     * @type {Integer (Int32)}
     */
    static RoomCorrection => 12

    /**
     * A bass management effect.
     * @type {Integer (Int32)}
     */
    static BassManagement => 13

    /**
     * An environmental effect.
     * @type {Integer (Int32)}
     */
    static EnvironmentalEffects => 14

    /**
     * A speaker protection effect.
     * @type {Integer (Int32)}
     */
    static SpeakerProtection => 15

    /**
     * A speaker compensation effect.
     * @type {Integer (Int32)}
     */
    static SpeakerCompensation => 16

    /**
     * A dynamic range compression effect.
     * @type {Integer (Int32)}
     */
    static DynamicRangeCompression => 17

    /**
     * A far-field beam forming effect.
     * @type {Integer (Int32)}
     */
    static FarFieldBeamForming => 18

    /**
     * A noise suppression effect. This type differs from **NoiseSuppression** in that it is a more advanced AI / machine learning based noise suppression effect.
     * @type {Integer (Int32)}
     */
    static DeepNoiseSuppression => 19
}
