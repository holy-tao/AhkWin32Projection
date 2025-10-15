#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VMRGUID.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Graphics\Gdi\HMONITOR.ahk

/**
 * The VMRMONITORINFO structure is used in the IVMRMonitorConfig::GetAvailableMonitors method to set and retrieve information about monitors on the system (VMR-7 only).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-vmrmonitorinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMRMONITORINFO extends Win32Struct
{
    static sizeof => 648

    static packingSize => 8

    /**
     * A [VMRGUID](/windows/desktop/api/strmif/ns-strmif-vmrguid) structure that specifies the monitor.
     * @type {VMRGUID}
     */
    guid{
        get {
            if(!this.HasProp("__guid"))
                this.__guid := VMRGUID(this.ptr + 0)
            return this.__guid
        }
    }

    /**
     * The monitor rectangle.
     * @type {RECT}
     */
    rcMonitor{
        get {
            if(!this.HasProp("__rcMonitor"))
                this.__rcMonitor := RECT(this.ptr + 16)
            return this.__rcMonitor
        }
    }

    /**
     * A handle to the monitor.
     * @type {HMONITOR}
     */
    hMon{
        get {
            if(!this.HasProp("__hMon"))
                this.__hMon := HMONITOR(this.ptr + 32)
            return this.__hMon
        }
    }

    /**
     * Flags as defined for the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-monitorinfoexa">MONITORINFOEX</a> structure. Currently the only valid flag is <b>MONITORINFOF_PRIMARY</b>, which indicates the primary display monitor.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Null-terminated string containing the device name.
     * @type {String}
     */
    szDevice {
        get => StrGet(this.ptr + 44, 31, "UTF-16")
        set => StrPut(value, this.ptr + 44, 31, "UTF-16")
    }

    /**
     * Null-terminated string containing the device description.
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 108, 255, "UTF-16")
        set => StrPut(value, this.ptr + 108, 255, "UTF-16")
    }

    /**
     * 
     * @type {Integer}
     */
    liDriverVersion {
        get => NumGet(this, 624, "int64")
        set => NumPut("int64", value, this, 624)
    }

    /**
     * 
     * @type {Integer}
     */
    dwVendorId {
        get => NumGet(this, 632, "uint")
        set => NumPut("uint", value, this, 632)
    }

    /**
     * 
     * @type {Integer}
     */
    dwDeviceId {
        get => NumGet(this, 636, "uint")
        set => NumPut("uint", value, this, 636)
    }

    /**
     * 
     * @type {Integer}
     */
    dwSubSysId {
        get => NumGet(this, 640, "uint")
        set => NumPut("uint", value, this, 640)
    }

    /**
     * 
     * @type {Integer}
     */
    dwRevision {
        get => NumGet(this, 644, "uint")
        set => NumPut("uint", value, this, 644)
    }
}
