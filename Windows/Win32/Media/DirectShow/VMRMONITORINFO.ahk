#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VMRGUID.ahk" { VMRGUID }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The VMRMONITORINFO structure is used in the IVMRMonitorConfig::GetAvailableMonitors method to set and retrieve information about monitors on the system (VMR-7 only).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-vmrmonitorinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMRMONITORINFO {
    #StructPack 8

    /**
     * A [VMRGUID](/windows/desktop/api/strmif/ns-strmif-vmrguid) structure that specifies the monitor.
     */
    guid : VMRGUID

    /**
     * The monitor rectangle.
     */
    rcMonitor : RECT

    /**
     * A handle to the monitor.
     */
    hMon : HMONITOR

    /**
     * Flags as defined for the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-monitorinfoexa">MONITORINFOEX</a> structure. Currently the only valid flag is <b>MONITORINFOF_PRIMARY</b>, which indicates the primary display monitor.
     */
    dwFlags : UInt32

    /**
     * Null-terminated string containing the device name.
     */
    szDevice : WCHAR[32]

    /**
     * Null-terminated string containing the device description.
     */
    szDescription : WCHAR[256]

    liDriverVersion : Int64

    dwVendorId : UInt32

    dwDeviceId : UInt32

    dwSubSysId : UInt32

    dwRevision : UInt32

}
