#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACE_HEADER.ahk" { ACE_HEADER }

/**
 * The SYSTEM_ALARM_ACE structure is reserved for future use.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_alarm_ace
 * @namespace Windows.Win32.Security
 */
export default struct SYSTEM_ALARM_ACE {
    #StructPack 4

    Header : ACE_HEADER

    Mask : UInt32

    SidStart : UInt32

}
