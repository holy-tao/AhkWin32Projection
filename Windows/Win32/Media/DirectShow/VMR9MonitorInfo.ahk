#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The VMR9MonitorInfo structure is used with the VMR-9 in the IVMRMonitorConfig9::GetAvailableMonitors method to set and retrieve information about monitors on the system.
 * @remarks
 * This structure is used to configure monitors on multi-monitor systems.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ns-vmr9-vmr9monitorinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMR9MonitorInfo {
    #StructPack 8

    /**
     * Integer index that specifies the monitor device.
     */
    uDevID : UInt32

    /**
     * Specifies the monitor's rectangle.
     */
    rcMonitor : RECT

    /**
     * Handle to the monitor.
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
     * Null-terminated string containing a description of the device.
     */
    szDescription : WCHAR[512]

    /**
     * Specifies the driver version.
     */
    liDriverVersion : Int64

    /**
     * Specifies the vendor.
     */
    dwVendorId : UInt32

    /**
     * Specifies the device ID.
     */
    dwDeviceId : UInt32

    /**
     * Specifies the device subsystem.
     */
    dwSubSysId : UInt32

    /**
     * Specifies the revision number.
     */
    dwRevision : UInt32

}
