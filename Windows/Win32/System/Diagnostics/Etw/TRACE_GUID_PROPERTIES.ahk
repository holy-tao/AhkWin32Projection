#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The TRACE_GUID_PROPERTIES structure contains information about an event trace provider.
 * @remarks
 * 
  * Be sure to initialize the memory for this structure to zero before setting any members or passing to any functions.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//evntrace/ns-evntrace-trace_guid_properties
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TRACE_GUID_PROPERTIES extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Control GUID of the event trace provider.
     * @type {Pointer<Guid>}
     */
    Guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    GuidType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Session handle that identifies the event tracing session.
     * @type {Integer}
     */
    LoggerId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Value passed as the <i>EnableLevel</i> parameter to the 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletrace">EnableTrace</a> function.
     * @type {Integer}
     */
    EnableLevel {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Value passed as the <i>EnableFlag</i> parameter to the 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/enabletrace">EnableTrace</a> function.
     * @type {Integer}
     */
    EnableFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * If this member is <b>TRUE</b>, the element identified by the <b>Guid</b> member is currently enabled for the session identified by the <b>LoggerId</b> member. If this member is <b>FALSE</b>, all other members have no meaning and should be zero.
     * @type {Integer}
     */
    IsEnable {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }
}
