#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

/**
 * The TRACE_GUID_REGISTRATION structure is used to register event trace classes.
 * @remarks
 * 
  * Be sure to initialize the memory for this structure to zero before setting any members.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//evntrace/ns-evntrace-trace_guid_registration
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TRACE_GUID_REGISTRATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Class GUID of an event trace class that you are registering.
     * @type {Pointer<Guid>}
     */
    Guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Handle to the registered event trace class. The <a href="https://docs.microsoft.com/windows/desktop/ETW/registertraceguids">RegisterTraceGuids</a> function generates this value.
     * 
     * Use this handle when you call the <a href="https://docs.microsoft.com/windows/desktop/ETW/createtraceinstanceid">CreateTraceInstanceId</a> function and to set the <b>RegHandle</b> member of <a href="https://docs.microsoft.com/windows/desktop/ETW/event-instance-header">EVENT_INSTANCE_HEADER</a> when calling the <a href="https://docs.microsoft.com/windows/desktop/ETW/traceeventinstance">TraceEventInstance</a> function.
     * @type {HANDLE}
     */
    RegHandle{
        get {
            if(!this.HasProp("__RegHandle"))
                this.__RegHandle := HANDLE(this.ptr + 8)
            return this.__RegHandle
        }
    }
}
