#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines the header to the list of sessions that enabled the provider specified in the InBuffer parameter of EnumerateTraceGuidsEx.
 * @remarks
 * 
  * Use the size of this structure to access the first <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-provider-instance-info">TRACE_PROVIDER_INSTANCE_INFO</a> block in the list.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//evntrace/ns-evntrace-trace_guid_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TRACE_GUID_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/ETW/trace-provider-instance-info">TRACE_PROVIDER_INSTANCE_INFO</a> blocks contained in the list. You can have multiple instances of the same provider if the provider lives in a DLL that is loaded by multiple processes.
     * @type {Integer}
     */
    InstanceCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
