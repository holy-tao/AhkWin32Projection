#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The gain set for each band of the headset equalizer.
 * @remarks
 * > [!CAUTION]
 * > To avoid damaging devices, the headset control APIs should only be used with hardware you have developed.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.headsetgeqgains
 * @namespace Windows.Gaming.Input.Preview
 * @version WindowsRuntime 1.4
 */
class HeadsetGeqGains extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Gain in decibels for band 1.
     * @type {Integer}
     */
    band1Gain {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Gain in decibels for band 2.
     * @type {Integer}
     */
    band2Gain {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Gain in decibels for band 3.
     * @type {Integer}
     */
    band3Gain {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Gain in decibels for band 4.
     * @type {Integer}
     */
    band4Gain {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Gain in decibels for band 5.
     * @type {Integer}
     */
    band5Gain {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
