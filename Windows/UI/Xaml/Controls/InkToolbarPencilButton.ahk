#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\InkToolbarPenButton.ahk
#Include .\IInkToolbarPencilButton.ahk
#Include .\IInkToolbarPencilButtonFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an [InkToolbar](inktoolbar.md) toggle button control that activates the built-in pencil.
 * @remarks
 * The pencil draws a soft-edged, textured, and semi-transparent stroke (useful for layered shading effects) with a [Circle](../windows.ui.input.inking/pentipshape.md) [PenTip](../windows.ui.input.inking/inkdrawingattributes_pentip.md). The stroke color (darkness) is dependent on the pen pressure detected.
 * 
 * The [InkToolbar](inktoolbar.md) consists of two distinct groups of button types:
 * 
 * + One group of "tool" buttons containing the built-in drawing ([InkToolbarBallpointPenButton](inktoolbarballpointpenbutton.md), InkToolbarPencilButton), erasing ([InkToolbarEraserButton](inktoolbareraserbutton.md)), and highlighting ([InkToolbarHighlighterButton](inktoolbarhighlighterbutton.md)) buttons. Custom tools ([InkToolbarCustomPenButton](inktoolbarcustompenbutton.md) and [InkToolbarCustomToolButton](inktoolbarcustomtoolbutton.md)) are added here.
 * 
 *     > Feature selection is mutually exclusive.
 * 
 * + A second group of "toggle" buttons containing the built-in stencil ([InkToolbarStencilButton](inktoolbarstencilbutton.md)) button (or the [InkToolbarRulerButton](inktoolbarrulerbutton.md) button). Custom toggles ([InkToolbarCustomToggleButton](inktoolbarcustomtogglebutton.md)) are added here.
 * 
 *     > Features are not mutually exclusive and can be used concurrently with other active tools.
 * 
 * 
 * InkToolbarPencilButton inherits from [InkToolbarPenButton](inktoolbarpenbutton.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarpencilbutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarPencilButton extends InkToolbarPenButton {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarPencilButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarPencilButton.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {InkToolbarPencilButton} 
     */
    static CreateInstance() {
        if (!InkToolbarPencilButton.HasProp("__IInkToolbarPencilButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkToolbarPencilButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkToolbarPencilButtonFactory.IID)
            InkToolbarPencilButton.__IInkToolbarPencilButtonFactory := IInkToolbarPencilButtonFactory(factoryPtr)
        }

        return InkToolbarPencilButton.__IInkToolbarPencilButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
