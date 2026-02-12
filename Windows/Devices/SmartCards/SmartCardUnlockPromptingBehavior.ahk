#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the unlock prompting behavior.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardunlockpromptingbehavior
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardUnlockPromptingBehavior extends Win32Enum{

    /**
     * Allow an unlock prompt if required.
     * @type {Integer (Int32)}
     */
    static AllowUnlockPrompt => 0

    /**
     * Require an unlock prompt.
     * @type {Integer (Int32)}
     */
    static RequireUnlockPrompt => 1

    /**
     * Prevent an unlock prompt.
     * @type {Integer (Int32)}
     */
    static PreventUnlockPrompt => 2
}
