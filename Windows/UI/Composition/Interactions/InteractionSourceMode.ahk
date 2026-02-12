#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides the various definitions for how a [VisualInteractionSource](visualinteractionsource.md) will process interactions. Options available for the enumeration are 
  *     **Disabled**
  *   , 
  *     **EnabledWithInertia**
  *    and 
  *     **EnabledWithoutInertia**
  *   . The InteractionSourceMode can be used to define the behavior for the X, Y and Scale Axis of a [VisualInteractionSource](visualinteractionsource.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactionsourcemode
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionSourceMode extends Win32Enum{

    /**
     * Interaction is disabled.
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * Interaction is enabled with inertia.
     * @type {Integer (Int32)}
     */
    static EnabledWithInertia => 1

    /**
     * Interaction is enabled without inertia.
     * @type {Integer (Int32)}
     */
    static EnabledWithoutInertia => 2
}
