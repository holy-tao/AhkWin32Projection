#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JOYREGHWVALUES.ahk" { JOYREGHWVALUES }
#Import ".\JOYREGHWCONFIG.ahk" { JOYREGHWCONFIG }
#Import ".\JOYRANGE.ahk" { JOYRANGE }
#Import ".\JOYPOS.ahk" { JOYPOS }
#Import ".\JOYREGHWSETTINGS.ahk" { JOYREGHWSETTINGS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The DIJOYCONFIG structure contains information about a joystick's configuration.
 * @remarks
 * WDM gameports can be found during enumeration by calling <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/nf-dinputd-idirectinputjoyconfig8-gettypeinfo">IDirectInputJoyConfig8::GetTypeInfo</a> method for an enumerated joystick, then studying the flags present in the <b>dwFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/ns-dinputd-dijoytypeinfo">DIJOYTYPEINFO</a> structure. If the JOY_HWS_ISGAMEPORTBUS flag is set, the currently enumerated object is an available WDM gameport.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-dijoyconfig
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIJOYCONFIG {
    #StructPack 4

    /**
     * Specifies the size of the structure in bytes. This member must be initialized before the structure is used.
     */
    dwSize : UInt32

    /**
     * Specifies the instance GUID for the joystick.
     */
    guidInstance : Guid

    /**
     * Joystick hardware configuration.
     */
    hwc : JOYREGHWCONFIG

    /**
     * Specifies the global gain setting. This value is applied to all force feedback effects as a "master volume control".
     */
    dwGain : UInt32

    /**
     * The joystick type for the joystick. It must be one of the values enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/nf-dinputd-idirectinputjoyconfig8-enumtypes">IDirectInputJoyConfig8::EnumTypes</a>.
     */
    wszType : WCHAR[256]

    /**
     * The callout driver for the joystick.
     */
    wszCallout : WCHAR[256]

    /**
     * Specifies a GUID that identifies the gameport being used for this joystick.
     */
    guidGameport : Guid

}
