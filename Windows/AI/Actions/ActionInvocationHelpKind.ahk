#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the kind of help represented by an [ActionInvocationHelpDetails](actioninvocationhelpdetails.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationhelpkind
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ActionInvocationHelpKind extends Win32Enum{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Error.
     * @type {Integer (Int32)}
     */
    static Error => 1

    /**
     * Warning.
     * @type {Integer (Int32)}
     */
    static Warning => 2
}
