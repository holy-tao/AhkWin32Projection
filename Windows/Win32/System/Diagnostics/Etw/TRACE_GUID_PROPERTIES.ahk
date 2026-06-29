#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Returned by EnumerateTraceGuids. Contains information about an event trace provider.
 * @remarks
 * Be sure to initialize the memory for this structure to zero before setting any
 * members or passing to any functions.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-trace_guid_properties
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct TRACE_GUID_PROPERTIES {
    #StructPack 4

    /**
     * Control GUID of the event trace provider.
     */
    Guid : Guid

    /**
     * Not used.
     */
    GuidType : UInt32

    /**
     * Session handle that identifies the event tracing session.
     */
    LoggerId : UInt32

    /**
     * Value passed as the _EnableLevel_ parameter to the
     * [EnableTrace](/windows/desktop/ETW/enabletrace) function.
     */
    EnableLevel : UInt32

    /**
     * Value passed as the _EnableFlag_ parameter to the
     * [EnableTrace](/windows/desktop/ETW/enabletrace) function.
     */
    EnableFlags : UInt32

    /**
     * If this member is **TRUE**, the element identified by the **Guid** member is
     * currently enabled for the session identified by the **LoggerId** member. If this
     * member is **FALSE**, all other members have no meaning and should be zero.
     */
    IsEnable : BOOLEAN

}
