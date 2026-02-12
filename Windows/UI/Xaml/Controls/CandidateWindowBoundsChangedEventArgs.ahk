#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICandidateWindowBoundsChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the **CandidateWindowBoundsChanged** event.
 * @remarks
 * For more info, see [TextBox.CandidateWindowBoundsChanged](textbox_candidatewindowboundschanged.md) and [RichEditBox.CandidateWindowBoundsChanged](richeditbox_candidatewindowboundschanged.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.candidatewindowboundschangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CandidateWindowBoundsChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICandidateWindowBoundsChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICandidateWindowBoundsChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [Rect](../windows.foundation/rect.md) that defines the size and location of the Input Method Editor (IME) window, in the coordinate space of the text edit control.
     * @remarks
     * This property gets a [Rect](../windows.foundation/rect.md) that defines the size and location of the Input Method Editor (IME), in the coordinate space of the text control (upper left hand corner). This is (0,0,0,0) if there is no window, or if the Input Method Editor (IME) is aligned to the Soft Input Panel (SIP).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.candidatewindowboundschangedeventargs.bounds
     * @type {RECT} 
     */
    Bounds {
        get => this.get_Bounds()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Bounds() {
        if (!this.HasProp("__ICandidateWindowBoundsChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICandidateWindowBoundsChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICandidateWindowBoundsChangedEventArgs := ICandidateWindowBoundsChangedEventArgs(outPtr)
        }

        return this.__ICandidateWindowBoundsChangedEventArgs.get_Bounds()
    }

;@endregion Instance Methods
}
