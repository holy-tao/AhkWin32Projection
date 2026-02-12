#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkDrawingAttributesPencilProperties.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a set of static [InkDrawingAttributes](inkdrawingattributes.md) properties for rendering a pencil stroke on an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
  * 
  * Get an instance of this class by calling [InkDrawingAttributes.CreateForPencil](inkdrawingattributes_createforpencil_181700669.md) and accessing [InkDrawingAttributes.PencilProperties](inkdrawingattributes_pencilproperties.md).
 * @remarks
 * By default, a pencil draws a soft-edged, textured, and semi-transparent stroke (useful for layered shading effects) with a Circle PenTip. The stroke color (darkness) is dependent on the pen pressure detected.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkdrawingattributespencilproperties
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkDrawingAttributesPencilProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkDrawingAttributesPencilProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkDrawingAttributesPencilProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the level of transparency used for rendering a pencil stroke on an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
     * 
     * Opacity is a static property of [InkDrawingAttributes](inkdrawingattributes.md).
     * 
     * Get an instance of this class by calling [InkDrawingAttributes.CreateForPencil](inkdrawingattributes_createforpencil_181700669.md) and accessing [InkDrawingAttributes.PencilProperties](inkdrawingattributes_pencilproperties.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkdrawingattributespencilproperties.opacity
     * @type {Float} 
     */
    Opacity {
        get => this.get_Opacity()
        set => this.put_Opacity(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Opacity() {
        if (!this.HasProp("__IInkDrawingAttributesPencilProperties")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributesPencilProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributesPencilProperties := IInkDrawingAttributesPencilProperties(outPtr)
        }

        return this.__IInkDrawingAttributesPencilProperties.get_Opacity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Opacity(value) {
        if (!this.HasProp("__IInkDrawingAttributesPencilProperties")) {
            if ((queryResult := this.QueryInterface(IInkDrawingAttributesPencilProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkDrawingAttributesPencilProperties := IInkDrawingAttributesPencilProperties(outPtr)
        }

        return this.__IInkDrawingAttributesPencilProperties.put_Opacity(value)
    }

;@endregion Instance Methods
}
