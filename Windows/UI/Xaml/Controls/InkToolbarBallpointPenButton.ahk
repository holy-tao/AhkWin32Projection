#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\InkToolbarPenButton.ahk
#Include .\IInkToolbarBallpointPenButton.ahk
#Include .\IInkToolbarBallpointPenButtonFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an [InkToolbar](inktoolbar.md) button that activates the built-in ballpoint pen.
 * @remarks
 * The ballpoint pen draws a solid, opaque stroke with a [Circle](../windows.ui.input.inking/pentipshape.md) [PenTip](../windows.ui.input.inking/inkdrawingattributes_pentip.md). The stroke size varies with the active pen pressure detected (default size is 2x2 pixels).
 * 
 * InkToolbarBallpointPenButton inherits from [InkToolbarPenButton](inktoolbarpenbutton.md).
 * 
 * This button is part of the default radio button group that enables a user to select a single ink feature from a mutually exclusive group of options.
 * 
 * The [InkToolbar](inktoolbar.md) consists of two distinct groups of button types:
 * 
 * + One group of "tool" buttons containing the built-in drawing (InkToolbarBallpointPenButton, [InkToolbarPencilButton](inktoolbarpencilbutton.md)), erasing ([InkToolbarEraserButton](inktoolbareraserbutton.md)), and highlighting ([InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)) buttons. Custom tools ([InkToolbarCustomPenButton](inktoolbarcustompenbutton.md) and [InkToolbarCustomToolButton](inktoolbarcustomtoolbutton.md)) are added here.
 * 
 *     > Feature selection is mutually exclusive.
 * 
 * + A second group of "toggle" buttons containing the built-in stencil ([InkToolbarStencilButton](inktoolbarstencilbutton.md)) button (or the [InkToolbarRulerButton](inktoolbarrulerbutton.md) button). Custom toggles ([InkToolbarCustomToggleButton](inktoolbarcustomtogglebutton.md)) are added here.
 * 
 *     > Features are not mutually exclusive and can be used concurrently with other active tools.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarballpointpenbutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarBallpointPenButton extends InkToolbarPenButton {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarBallpointPenButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarBallpointPenButton.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {InkToolbarBallpointPenButton} 
     */
    static CreateInstance() {
        if (!InkToolbarBallpointPenButton.HasProp("__IInkToolbarBallpointPenButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarBallpointPenButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarBallpointPenButtonFactory.IID)
            InkToolbarBallpointPenButton.__IInkToolbarBallpointPenButtonFactory := IInkToolbarBallpointPenButtonFactory(factoryPtr)
        }

        return InkToolbarBallpointPenButton.__IInkToolbarBallpointPenButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
