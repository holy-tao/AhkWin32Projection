#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the slot type that a trace can be assigned to.
 * @remarks
 * > [!IMPORTANT]
 * > Only first-party applications should use this type.  
 * 
 * A slot is used to manage the priority of the traces that are assigned to that slot.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.tracereporting.platformdiagnostictraceslottype
 * @namespace Windows.System.Diagnostics.TraceReporting
 * @version WindowsRuntime 1.4
 */
class PlatformDiagnosticTraceSlotType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Alternative => 0

    /**
     * @type {Integer (Int32)}
     */
    static AlwaysOn => 1

    /**
     * @type {Integer (Int32)}
     */
    static Mini => 2
}
