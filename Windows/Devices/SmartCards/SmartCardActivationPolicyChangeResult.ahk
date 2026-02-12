#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the return values for the [RequestActivationPolicyChangeAsync](smartcardappletidgroupregistration_requestactivationpolicychangeasync_926513637.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardactivationpolicychangeresult
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardActivationPolicyChangeResult extends Win32Enum{

    /**
     * The policy change was not allowed.
     * @type {Integer (Int32)}
     */
    static Denied => 0

    /**
     * The policy change was allowed.
     * @type {Integer (Int32)}
     */
    static Allowed => 1
}
