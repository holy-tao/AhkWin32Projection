#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how the Input Method Editor (IME) window for text predictions is aligned with a text edit control.
 * @remarks
 * This enumeration is used by the [TextBox.DesiredCandidateWindowAlignment](textbox_desiredcandidatewindowalignment.md) and [RichEditBox.DesiredCandidateWindowAlignment](richeditbox_desiredcandidatewindowalignment.md) properties.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.candidatewindowalignment
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CandidateWindowAlignment extends Win32Enum{

    /**
     * When the hardware keyboard is used, the Input Method Editor (IME) follows the cursor. When the Soft Input Panel (SIP) is used, the Input Method Editor (IME) is docked to the Soft Input Panel (SIP).
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * When the hardware keyboard is used, the Input Method Editor (IME) aligns to the bottom edge and left side of the text edit control. When the Soft Input Panel (SIP) is used, the Input Method Editor (IME) is docked to the Soft Input Panel (SIP).
     * @type {Integer (Int32)}
     */
    static BottomEdge => 1
}
