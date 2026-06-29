#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BOOLEAN.ahk

/**
 * Returned by EnumerateTraceGuids. Contains information about an event trace provider.
 * @remarks
 * Be sure to initialize the memory for this structure to zero before setting any
 * members or passing to any functions.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-trace_guid_properties
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class TRACE_GUID_PROPERTIES extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * Control GUID of the event trace provider.
     * @type {Guid}
     */
    Guid {
        get {
            if(!this.HasProp("__Guid"))
                this.__Guid := Guid(0, this)
            return this.__Guid
        }
    }

    /**
     * Not used.
     * @type {Integer}
     */
    GuidType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Session handle that identifies the event tracing session.
     * @type {Integer}
     */
    LoggerId {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Value passed as the _EnableLevel_ parameter to the
     * [EnableTrace](/windows/desktop/ETW/enabletrace) function.
     * @type {Integer}
     */
    EnableLevel {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Value passed as the _EnableFlag_ parameter to the
     * [EnableTrace](/windows/desktop/ETW/enabletrace) function.
     * @type {Integer}
     */
    EnableFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * If this member is **TRUE**, the element identified by the **Guid** member is
     * currently enabled for the session identified by the **LoggerId** member. If this
     * member is **FALSE**, all other members have no meaning and should be zero.
     * @type {BOOLEAN}
     */
    IsEnable {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }
}
