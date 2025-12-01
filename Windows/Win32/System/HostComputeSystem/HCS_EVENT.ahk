#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCS_OPERATION.ahk

/**
 * HCS_EVENT
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HCS_EVENT
 * @namespace Windows.Win32.System.HostComputeSystem
 * @version v4.0.30319
 */
class HCS_EVENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type of event [`HCS_EVENT_TYPE`](./HCS_EVENT_TYPE.md)
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Optionally provides additional data for the event as a JSON document. The following table shows expected documents for specific event types.
     * 
     * |Event Type|JSON Document|
     * |---|---|
     * |`HcsEventSystemExited`|[`SystemExitStatus`](../SchemaReference.md#SystemExitStatus)|
     * |`HcsEventSystemCrashInitiated`|[`CrashReport`](../SchemaReference.md#CrashReport)|
     * |`HcsEventSystemCrashReport`|[`CrashReport`](../SchemaReference.md#CrashReport)|
     * |`HcsEventProcessExited`|[`ProcessStatus`](../SchemaReference.md#ProcessStatus)|
     * @type {PWSTR}
     */
    EventData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Handle to a completed operation, if `Type` is `HcsEventOperationCallback`. This is only possible when [`HcsSetComputeSystemCallback`](./HcsSetComputeSystemCallback.md) has specified event option `HcsEventOptionEnableOperationCallbacks`.
     * @type {HCS_OPERATION}
     */
    Operation{
        get {
            if(!this.HasProp("__Operation"))
                this.__Operation := HCS_OPERATION(16, this)
            return this.__Operation
        }
    }
}
