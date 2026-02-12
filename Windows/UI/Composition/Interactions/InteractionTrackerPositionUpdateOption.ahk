#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that indicate whether an already running custom scale animation should be allowed to continue running.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerpositionupdateoption
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionTrackerPositionUpdateOption extends Win32Enum{

    /**
     * An active scale animation will stop.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * An active scale animation will continue.
     * @type {Integer (Int32)}
     */
    static AllowActiveCustomScaleAnimation => 1
}
