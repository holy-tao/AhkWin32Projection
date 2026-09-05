#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the interaction modes that can be chosen by the user for the Tablet PC Input Panel.
 * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-interactionmode
 * @namespace Windows.Win32.UI.TabletPC
 */
class InteractionMode extends Win32Enum {

    /**
     * The Input Panel appears next to the text insertion point that currently has focus.
     * Native name: InteractionMode_InPlace
     * @type {Integer (Int32)}
     */
    static InPlace => 0

    /**
     * The Input Panel is not tied to an insertion point. The Floating Input Panel is opened by tapping on the Input Panel tab which appears by default on the left edge of the screen. The positioning and control of the Input Panel is left entirely to the user.
     * Native name: InteractionMode_Floating
     * @type {Integer (Int32)}
     */
    static Floating => 1

    /**
     * The Input Panel appears at the top of the screen and the active desktop is resized so that the Input Panel does not overlap with any other windows or UI elements.
     * Native name: InteractionMode_DockedTop
     * @type {Integer (Int32)}
     */
    static DockedTop => 2

    /**
     * The Input Panel appears at the bottom of the screen and the active desktop is resized so that the Input Panel does not overlap with any other windows or UI elements.
     * Native name: InteractionMode_DockedBottom
     * @type {Integer (Int32)}
     */
    static DockedBottom => 3
}
