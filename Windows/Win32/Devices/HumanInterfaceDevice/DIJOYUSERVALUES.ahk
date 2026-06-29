#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JOYRANGE.ahk" { JOYRANGE }
#Import ".\JOYREGUSERVALUES.ahk" { JOYREGUSERVALUES }
#Import ".\JOYPOS.ahk" { JOYPOS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The DIJOYUSERVALUES structure contains information about the user's joystick settings.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-dijoyuservalues
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIJOYUSERVALUES {
    #StructPack 4

    /**
     * Specifies the size of the structure in bytes. This member must be initialized before the structure is used.
     */
    dwSize : UInt32

    /**
     * Joystick user configuration. In addition to the fields contained in the mmddk.h header file, the previously unused <b>jrvRanges.jpCenter</b> field contains the user saturation levels for each axis. A control panel application sets the dead zone and saturation values based on the values set by the end-user during calibration or fine-tuning. Dead zone can be interpreted as "sensitivity in the center" and saturation can be interpreted as "sensitivity along the edges".
     */
    ruv : JOYREGUSERVALUES

    /**
     * The global port driver.
     */
    wszGlobalDriver : WCHAR[256]

    /**
     * Unused.
     */
    wszGameportEmulator : WCHAR[256]

}
