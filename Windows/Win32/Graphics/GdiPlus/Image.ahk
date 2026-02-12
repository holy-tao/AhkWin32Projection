#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Win32Handle.ahk

/**
 * This class is the parent class for image events. The following syntax is simplified from MOF code.
 * @remarks
 * The **Image** class does not define any members.
 * 
 * 
 * To enable image events in an NT Kernel logging session, specify the **EVENT\_TRACE\_FLAG\_IMAGE\_LOAD** flag in the **EnableFlags** member of the [**EVENT\_TRACE\_PROPERTIES**](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties) structure when calling the [**StartTrace**](/windows/win32/api/evntrace/nf-evntrace-starttracea) function.
 * 
 * Event trace consumers can implement special processing for image load events by calling the [**SetTraceCallback**](/windows/win32/api/evntrace/nf-evntrace-settracecallback) function and specifying [**ImageLoadGuid**](nt-kernel-logger-constants.md) as the *pGuid* parameter. Use the following event types to identify image load events when consuming events.
 * 
 * 
 * 
 * | Event type                                                          | Description                                                                                                                                                                                                                                      |
 * |---------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | **EVENT\_TRACE\_TYPE\_LOAD**(Event type value is 10)<br/>     | Image load event. Generated when a DLL or executable file is loaded. The provider generates only one event for the first time a given DLL is loaded. The [**Image\_Load**](image-load.md) MOF class defines the event data for this event.      |
 * | **EVENT\_TRACE\_TYPE\_END**(Event type value is 2)<br/>       | Image unload event. Generated when a DLL or executable file is unloaded. The provider generates only one event for the last time a given DLL is unloaded. The [**Image\_Load**](image-load.md) MOF class defines the event data for this event. |
 * | **EVENT\_TRACE\_TYPE\_DC\_START**(Event type value is 3)<br/> | Data collection start event. Enumerates all loaded images at the beginning of the trace. The [**Image\_Load**](image-load.md) MOF class defines the event data for this event.                                                                  |
 * | **EVENT\_TRACE\_TYPE\_DC\_END**(Event type value is 4)<br/>   | Data collection end event. Enumerates all loaded images at the end of the trace. The [**Image\_Load**](image-load.md) MOF class defines the event data for this event.                                                                          |
 * @see https://learn.microsoft.com/windows/win32/ktop-src/ETW/image
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Image extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => []

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
