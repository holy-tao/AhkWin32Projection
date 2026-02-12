#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IInkToolbarCustomPen.ahk
#Include .\IInkToolbarCustomPenOverrides.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an [InkToolbar](inktoolbar.md) pen for which the ink color palette and pen tip properties, such as shape, rotation, and size, are defined by the host app.
 * @remarks
 * To create an app-defined pen and corresponding button on the [InkToolbar](inktoolbar.md), use this class in conjunction with [InkToolbarCustomPenButton](inktoolbarcustompenbutton.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarcustompen
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkToolbarCustomPen extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarCustomPen

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarCustomPen.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves the [InkToolbarCustomPen](inktoolbarcustompen.md) attributes used for an [InkToolbarPenConfigurationControl](inktoolbarpenconfigurationcontrol.md).
     * @remarks
     * When providing a custom pen, it is possible to derive from [InkToolbarCustomPen](inktoolbarcustompen.md) and specify a custom [InkToolbarPenConfigurationControl](inktoolbarpenconfigurationcontrol.md). The derived class overrides the [CreateInkDrawingAttributesCore](inktoolbarcustompen_createinkdrawingattributescore_257776854.md) method to change the default [InkDrawingAttributes](../windows.ui.input.inking/inkdrawingattributes.md) settings.
     * @param {Brush} brush_ The brush used to draw the stroke. The default is 0 ([Black](../windows.ui/colors_black.md)).
     * @param {Float} strokeWidth The width of the stroke. The default is 0.
     * @returns {InkDrawingAttributes} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarcustompen.createinkdrawingattributes
     */
    CreateInkDrawingAttributes(brush_, strokeWidth) {
        if (!this.HasProp("__IInkToolbarCustomPen")) {
            if ((queryResult := this.QueryInterface(IInkToolbarCustomPen.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarCustomPen := IInkToolbarCustomPen(outPtr)
        }

        return this.__IInkToolbarCustomPen.CreateInkDrawingAttributes(brush_, strokeWidth)
    }

    /**
     * When overridden in a derived class, retrieves an [InkDrawingAttributes](../windows.ui.input.inking/inkdrawingattributes.md) object used to specify the [ConfigurationContent](inktoolbarcustompenbutton_configurationcontent.md) for an [InkToolbarCustomPen](inktoolbarcustompen.md).
     * 
     * This method is not called by application code.
     * @remarks
     * An [InkToolbarCustomPenButton](inktoolbarcustompenbutton.md) can reuse the standard [InkToolbarPenConfigurationControl](inktoolbarpenconfigurationcontrol.md) object to configure an optional settings flyout for the custom pen. An "extension glyph" is displayed on the button to indicate the existence of the flyout.
     * 
     * Derive from [InkToolbarCustomPen](inktoolbarcustompen.md) and specify a custom [InkToolbarPenConfigurationControl](inktoolbarpenconfigurationcontrol.md). Override the CreateInkDrawingAttributesCore method to change the default [InkDrawingAttributes](../windows.ui.input.inking/inkdrawingattributes.md) settings.
     * @param {Brush} brush_ The brush used to draw the stroke. The default is 0 ([Black](../windows.ui/colors_black.md)).
     * @param {Float} strokeWidth The width of the stroke. The default is 0.
     * @returns {InkDrawingAttributes} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inktoolbarcustompen.createinkdrawingattributescore
     */
    CreateInkDrawingAttributesCore(brush_, strokeWidth) {
        if (!this.HasProp("__IInkToolbarCustomPenOverrides")) {
            if ((queryResult := this.QueryInterface(IInkToolbarCustomPenOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkToolbarCustomPenOverrides := IInkToolbarCustomPenOverrides(outPtr)
        }

        return this.__IInkToolbarCustomPenOverrides.CreateInkDrawingAttributesCore(brush_, strokeWidth)
    }

;@endregion Instance Methods
}
