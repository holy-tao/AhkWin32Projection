#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The VMR9MonitorInfo structure is used with the VMR-9 in the IVMRMonitorConfig9::GetAvailableMonitors method to set and retrieve information about monitors on the system.
 * @remarks
 * This structure is used to configure monitors on multi-monitor systems.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ns-vmr9-vmr9monitorinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9MonitorInfo extends Win32Struct
{
    static sizeof => 1152

    static packingSize => 8

    /**
     * Integer index that specifies the monitor device.
     * @type {Integer}
     */
    uDevID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the monitor's rectangle.
     * @type {RECT}
     */
    rcMonitor{
        get {
            if(!this.HasProp("__rcMonitor"))
                this.__rcMonitor := RECT(this.ptr + 8)
            return this.__rcMonitor
        }
    }

    /**
     * Handle to the monitor.
     * @type {Pointer<Void>}
     */
    hMon {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Flags as defined for the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-monitorinfoexa">MONITORINFOEX</a> structure. Currently the only valid flag is <b>MONITORINFOF_PRIMARY</b>, which indicates the primary display monitor.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Null-terminated string containing the device name.
     * @type {String}
     */
    szDevice {
        get => StrGet(this.ptr + 36, 31, "UTF-16")
        set => StrPut(value, this.ptr + 36, 31, "UTF-16")
    }

    /**
     * Null-terminated string containing a description of the device.
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 100, 511, "UTF-16")
        set => StrPut(value, this.ptr + 100, 511, "UTF-16")
    }

    /**
     * Specifies the driver version.
     * @type {Integer}
     */
    liDriverVersion {
        get => NumGet(this, 1128, "int64")
        set => NumPut("int64", value, this, 1128)
    }

    /**
     * Specifies the vendor.
     * @type {Integer}
     */
    dwVendorId {
        get => NumGet(this, 1136, "uint")
        set => NumPut("uint", value, this, 1136)
    }

    /**
     * Specifies the device ID.
     * @type {Integer}
     */
    dwDeviceId {
        get => NumGet(this, 1140, "uint")
        set => NumPut("uint", value, this, 1140)
    }

    /**
     * Specifies the device subsystem.
     * @type {Integer}
     */
    dwSubSysId {
        get => NumGet(this, 1144, "uint")
        set => NumPut("uint", value, this, 1144)
    }

    /**
     * Specifies the revision number.
     * @type {Integer}
     */
    dwRevision {
        get => NumGet(this, 1148, "uint")
        set => NumPut("uint", value, this, 1148)
    }
}
