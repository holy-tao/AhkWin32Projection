#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\InkToolbarPenButton.ahk
#Include .\IInkToolbarHighlighterButton.ahk
#Include .\IInkToolbarHighlighterButtonFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an [InkToolbar](inktoolbar.md) toggle button control that activates the built-in highlighter pen.
 * @remarks
 * The highlighter draws a semi-transparent stroke with a [Rectangle](../windows.ui.input.inking/pentipshape.md) [PenTip](../windows.ui.input.inking/inkdrawingattributes_pentip.md).
 * 
 * The [InkToolbar](inktoolbar.md) consists of two distinct groups of button types:
 * 
 * + One group of "tool" buttons containing the built-in drawing ([InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md), [InkToolbarPencilButton](inktoolbarpencilbutton.md)), erasing ([InkToolbarEraserButton](inktoolbareraserbutton.md)), and highlighting (InkToolbarHighlighterButton) buttons. Custom tools ([InkToolbarCustomPenButton](inktoolbarcustompenbutton.md) and [InkToolbarCustomToolButton](inktoolbarcustomtoolbutton.md)) are added here.
 * 
 *     > Feature selection is mutually exclusive.
 * 
 * + A second group of "toggle" buttons containing the built-in stencil ([InkToolbarStencilButton](inktoolbarstencilbutton.md)) button (or the [InkToolbarRulerButton](inktoolbarrulerbutton.md) button). Custom toggles ([InkToolbarCustomToggleButton](inktoolbarcustomtogglebutton.md)) are added here.
 * 
 *     > Features are not mutually exclusive and can be used concurrently with other active tools.
 * 
 * InkToolbarHighlighterButton inherits from [InkToolbarPenButton](inktoolbarpenbutton.md).
 * 
 * By default, the stroke height is 36 pixels and the width is 12 pixels.
 * 
 * The size (in [Device-Independent Pixels](/windows/desktop/LearnWin32/dpi-and-device-independent-pixels)) of the highlighter stroke is obtained from the [InkDrawingAttributes](inktoolbar_inkdrawingattributes.md) setting for [Size](../windows.ui.input.inking/inkdrawingattributes_size.md) —the stroke height is set to [Size.Width](../windows.foundation/size.md) and the stroke width is set to [Size.Width](../windows.foundation/size.md)/3.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarhighlighterbutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarHighlighterButton extends InkToolbarPenButton {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarHighlighterButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarHighlighterButton.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {InkToolbarHighlighterButton} 
     */
    static CreateInstance() {
        if (!InkToolbarHighlighterButton.HasProp("__IInkToolbarHighlighterButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarHighlighterButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarHighlighterButtonFactory.IID)
            InkToolbarHighlighterButton.__IInkToolbarHighlighterButtonFactory := IInkToolbarHighlighterButtonFactory(factoryPtr)
        }

        return InkToolbarHighlighterButton.__IInkToolbarHighlighterButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
