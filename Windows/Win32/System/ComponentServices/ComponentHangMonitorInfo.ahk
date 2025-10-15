#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Represents the hang monitoring configuration for a COM+ component.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/ns-comsvcs-componenthangmonitorinfo
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ComponentHangMonitorInfo extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Indicates whether the component is configured for hang monitoring.
     * @type {BOOL}
     */
    IsMonitored{
        get {
            if(!this.HasProp("__IsMonitored"))
                this.__IsMonitored := BOOL(this.ptr + 0)
            return this.__IsMonitored
        }
    }

    /**
     * Indicates whether the hang monitoring configuration for the component specifies the process will be terminated on a hang. This member is meaningful only if <b>IsMonitored</b> is <b>TRUE</b>.
     * @type {BOOL}
     */
    TerminateOnHang{
        get {
            if(!this.HasProp("__TerminateOnHang"))
                this.__TerminateOnHang := BOOL(this.ptr + 4)
            return this.__TerminateOnHang
        }
    }

    /**
     * The average call response time threshold configured for the component. This member is meaningful only if <b>IsMonitored</b> is <b>TRUE</b>.
     * @type {Integer}
     */
    AvgCallThresholdInMs {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
