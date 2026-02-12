#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Tracks ways that synchronous work items may interact with asynchronous operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.causalityrelation
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class CausalityRelation extends Win32Enum{

    /**
     * Indicates that a synchronous work items has assigned a callback or continuation to be run by an asynchronous operation.
     * @type {Integer (Int32)}
     */
    static AssignDelegate => 0

    /**
     * Indicates that a synchronous work item has satisfied part of a join asynchronous operation.
     * @type {Integer (Int32)}
     */
    static Join => 1

    /**
     * Indicates that a synchronous work item has satisfied a choice asynchronous operation.
     * @type {Integer (Int32)}
     */
    static Choice => 2

    /**
     * Indicates that a synchronous work item was canceled.
     * @type {Integer (Int32)}
     */
    static Cancel => 3

    /**
     * Indicates that a synchronous work item caused an error in an asynchronous operation.
     * @type {Integer (Int32)}
     */
    static Error => 4
}
