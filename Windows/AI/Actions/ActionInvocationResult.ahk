#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the result state of an app action invocation.
 * @remarks
 * This enumeration is used by the [ActionInvocationContext.Result](actioninvocationcontext_result.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationresult
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ActionInvocationResult extends Win32Enum{

    /**
     * The app action invocation was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The app action invocation was cancelled by the user.
     * @type {Integer (Int32)}
     */
    static UserCanceled => 1

    /**
     * The app action was unsupported.
     * @type {Integer (Int32)}
     */
    static Unsupported => 2

    /**
     * The app action was unavailable. For information on app action availability, see [Toggle availability of an App Action for Windows](/windows/ai/app-actions/actions-availability).
     * @type {Integer (Int32)}
     */
    static Unavailable => 3
}
