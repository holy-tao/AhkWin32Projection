#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a processor.
 * @remarks
 * Note that this structure definition was accidentally omitted from WinNT.h. This error will be corrected in the future. In the meantime, to compile your application, include the structure definition contained in this topic in your source code.
 * @see https://learn.microsoft.com/windows/win32/Power/processor-power-information-str
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class PROCESSOR_POWER_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The system processor number.
     * @type {Integer}
     */
    Number {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum specified clock frequency of the system processor, in megahertz.
     * @type {Integer}
     */
    MaxMhz {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The processor clock frequency, in megahertz. This number is the maximum specified processor clock frequency multiplied by the current processor throttle.
     * @type {Integer}
     */
    CurrentMhz {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The limit on the processor clock frequency, in megahertz. This number is the maximum specified processor clock frequency multiplied by the current processor thermal throttle limit.
     * @type {Integer}
     */
    MhzLimit {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The maximum idle state of this processor.
     * @type {Integer}
     */
    MaxIdleState {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The current idle state of this processor.
     * @type {Integer}
     */
    CurrentIdleState {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
