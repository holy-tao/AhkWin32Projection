#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCS_EVENT_TYPE.ahk" { HCS_EVENT_TYPE }
#Import ".\HCS_OPERATION.ahk" { HCS_OPERATION }

/**
 * HCS_EVENT
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HCS_EVENT
 * @namespace Windows.Win32.System.HostComputeSystem
 */
export default struct HCS_EVENT {
    #StructPack 8

    /**
     * Type of event [`HCS_EVENT_TYPE`](./HCS_EVENT_TYPE.md)
     */
    Type : HCS_EVENT_TYPE

    /**
     * Optionally provides additional data for the event as a JSON document. The following table shows expected documents for specific event types.
     * 
     * |Event Type|JSON Document|
     * |---|---|
     * |`HcsEventSystemExited`|[`SystemExitStatus`](../SchemaReference.md#SystemExitStatus)|
     * |`HcsEventSystemCrashInitiated`|[`CrashReport`](../SchemaReference.md#CrashReport)|
     * |`HcsEventSystemCrashReport`|[`CrashReport`](../SchemaReference.md#CrashReport)|
     * |`HcsEventProcessExited`|[`ProcessStatus`](../SchemaReference.md#ProcessStatus)|
     */
    EventData : PWSTR

    /**
     * Handle to a completed operation, if `Type` is `HcsEventOperationCallback`. This is only possible when [`HcsSetComputeSystemCallback`](./HcsSetComputeSystemCallback.md) has specified event option `HcsEventOptionEnableOperationCallbacks`.
     */
    Operation : HCS_OPERATION

}
