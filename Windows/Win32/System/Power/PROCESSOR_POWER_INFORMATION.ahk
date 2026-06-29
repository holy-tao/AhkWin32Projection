#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a processor.
 * @remarks
 * Note that this structure definition was accidentally omitted from WinNT.h. This error will be corrected in the future. In the meantime, to compile your application, include the structure definition contained in this topic in your source code.
 * @see https://learn.microsoft.com/windows/win32/Power/processor-power-information-str
 * @namespace Windows.Win32.System.Power
 */
export default struct PROCESSOR_POWER_INFORMATION {
    #StructPack 4

    /**
     * The system processor number.
     */
    Number : UInt32

    /**
     * The maximum specified clock frequency of the system processor, in megahertz.
     */
    MaxMhz : UInt32

    /**
     * The processor clock frequency, in megahertz. This number is the maximum specified processor clock frequency multiplied by the current processor throttle.
     */
    CurrentMhz : UInt32

    /**
     * The limit on the processor clock frequency, in megahertz. This number is the maximum specified processor clock frequency multiplied by the current processor thermal throttle limit.
     */
    MhzLimit : UInt32

    /**
     * The maximum idle state of this processor.
     */
    MaxIdleState : UInt32

    /**
     * The current idle state of this processor.
     */
    CurrentIdleState : UInt32

}
