#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Settings that can be read from or written to a headset that supports them.
 * @remarks
 * > [!CAUTION]
 * > To avoid damaging devices, the headset control APIs should only be used with hardware you have developed.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.headsetoperation
 * @namespace Windows.Gaming.Input.Preview
 * @version WindowsRuntime 1.4
 */
class HeadsetOperation extends Win32Enum{

    /**
     * Controls the equalizer. Buffers must be a byte array with the same layout as the [HeadsetGeqGains](headsetgeqgains.md) struct.
     * @type {Integer (Int32)}
     */
    static Geq => 0

    /**
     * Controls bass boost. The buffer must be a little-endian 4-byte signed integer between 0 and 12 decibels inclusive.
     * @type {Integer (Int32)}
     */
    static BassBoostGain => 1

    /**
     * Controls the smart mute feature. The buffer must be an unsigned 1-byte integer set to one of the values of the [HeadsetLevel](headsetlevel.md) enum.
     * @type {Integer (Int32)}
     */
    static SmartMute => 2

    /**
     * Controls the side tone feature. The buffer must be an unsigned 1-byte integer set to one of the values of the [HeadsetLevel](headsetlevel.md) enum.
     * @type {Integer (Int32)}
     */
    static SideTone => 3

    /**
     * Controls the mute LED brightness. The buffer must be an unsigned 1-byte integer set to HeadsetLevel.Low, HeadsetLevel.Medium, or HeadsetLevel.High.
     * @type {Integer (Int32)}
     */
    static MuteLedBrightness => 4

    /**
     * Controls whether the mix and volume dials are in-place or swapped. The buffer must be a one-byte boolean, false if the dials are in-place and true if they are swapped.
     * @type {Integer (Int32)}
     */
    static SwapMixAndVolumeDials => 5
}
