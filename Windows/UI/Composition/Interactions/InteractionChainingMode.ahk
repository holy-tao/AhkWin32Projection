#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the chaining behavior for a [VisualInteractionSource](visualinteractionsource.md). There are three options: Always chain, never chain or auto chain (let the system choose). If chaining is enabled, when an [InteractionTracker](interactiontracker.md) reaches its minimum or maximum bounds, it will instead send the input to the next ancestor [VisualInteractionSource](visualinteractionsource.md).
 * @remarks
 * When an InteractionTracker reaches either its minimum or maximum bounds, it will either overpan or chain the input up to its next ancestor VisualInteractionSource.
 * 
 * The picture below demonstrates a scenario where there may be a VisualInteractionSource (B) who is the child of another VisualInteractionSource (A). In this scenario, both elements are scrollable content – when the InteractionTracker in B reaches the boundary and chaining is enabled on B, the input will chain to A whose content will now begin to scroll.
 * 
 * > [!NOTE]
 * > In these situations with chaining enabled, the input can chain from an InteractionTracker to an InteractionTracker, from an InteractionTracker to a XAML ScrollViewer, or from an InteractionTracker to a CoreWindow.
 * 
 * <img src="images/chainingmode.png" alt="VisualInteractionSource (B) who is the child of another VisualInteractionSource (A)" />
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactionchainingmode
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionChainingMode extends Win32Enum{

    /**
     * Automatically determine whether to continue the manipulation.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Always continue the manipulation.
     * @type {Integer (Int32)}
     */
    static Always => 1

    /**
     * Never continue the manipulation.
     * @type {Integer (Int32)}
     */
    static Never => 2
}
