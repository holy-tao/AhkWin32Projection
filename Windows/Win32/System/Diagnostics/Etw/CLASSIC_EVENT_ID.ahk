#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Identifies the kernel event for which you want to enable call stack tracing.
 * @remarks
 * To enable the [read](/windows/desktop/ETW/diskio-typegroup1) event type for
 * [disk IO](/windows/desktop/ETW/diskio) events, set **GUID** to
 * `3d6fa8d4-fe05-11d0-9dda-00c04fd7ba7c` and **Type** to 10.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-classic_event_id
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct CLASSIC_EVENT_ID {
    #StructPack 4

    /**
     * The GUID that identifies the kernel event class.
     */
    EventGuid : Guid

    /**
     * The event type that identifies the event within the kernel event class to
     * enable.
     */
    Type : Int8

    /**
     * Reserved.
     */
    Reserved : Int8[7]

}
