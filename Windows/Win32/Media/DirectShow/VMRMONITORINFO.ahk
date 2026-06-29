#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VMRGUID.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\HMONITOR.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The VMRMONITORINFO structure is used in the IVMRMonitorConfig::GetAvailableMonitors method to set and retrieve information about monitors on the system (VMR-7 only).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-vmrmonitorinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
class VMRMONITORINFO extends Win32Struct {
    static sizeof => 656

    static packingSize => 8

    /**
     * A [VMRGUID](/windows/desktop/api/strmif/ns-strmif-vmrguid) structure that specifies the monitor.
     * @type {VMRGUID}
     */
    guid {
        get {
            if(!this.HasProp("__guid"))
                this.__guid := VMRGUID(0, this)
            return this.__guid
        }
    }

    /**
     * The monitor rectangle.
     * @type {RECT}
     */
    rcMonitor {
        get {
            if(!this.HasProp("__rcMonitor"))
                this.__rcMonitor := RECT(24, this)
            return this.__rcMonitor
        }
    }

    /**
     * A handle to the monitor.
     * @type {HMONITOR}
     */
    hMon {
        get {
            if(!this.HasProp("__hMon"))
                this.__hMon := HMONITOR(40, this)
            return this.__hMon
        }
    }

    /**
     * Flags as defined for the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-monitorinfoexa">MONITORINFOEX</a> structure. Currently the only valid flag is <b>MONITORINFOF_PRIMARY</b>, which indicates the primary display monitor.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Null-terminated string containing the device name.
     * @type {String}
     */
    szDevice {
        get => StrGet(this.ptr + 52, 31, "UTF-16")
        set => StrPut(value, this.ptr + 52, 31, "UTF-16")
    }

    /**
     * Null-terminated string containing the device description.
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 116, 255, "UTF-16")
        set => StrPut(value, this.ptr + 116, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    liDriverVersion {
        get => NumGet(this, 632, "int64")
        set => NumPut("int64", value, this, 632)
    }

    /**
     * @type {Integer}
     */
    dwVendorId {
        get => NumGet(this, 640, "uint")
        set => NumPut("uint", value, this, 640)
    }

    /**
     * @type {Integer}
     */
    dwDeviceId {
        get => NumGet(this, 644, "uint")
        set => NumPut("uint", value, this, 644)
    }

    /**
     * @type {Integer}
     */
    dwSubSysId {
        get => NumGet(this, 648, "uint")
        set => NumPut("uint", value, this, 648)
    }

    /**
     * @type {Integer}
     */
    dwRevision {
        get => NumGet(this, 652, "uint")
        set => NumPut("uint", value, this, 652)
    }
}
