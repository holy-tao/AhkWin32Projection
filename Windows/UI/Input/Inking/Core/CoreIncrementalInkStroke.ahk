#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreIncrementalInkStroke.ahk
#Include .\ICoreIncrementalInkStrokeFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a single ink stroke that can be rendered incrementally, using individual [InkPoint](../windows.ui.input.inking/inkpoint.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.coreincrementalinkstroke
 * @namespace Windows.UI.Input.Inking.Core
 * @version WindowsRuntime 1.4
 */
class CoreIncrementalInkStroke extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreIncrementalInkStroke

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreIncrementalInkStroke.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [CoreIncrementalInkStroke](coreincrementalinkstroke.md) class.
     * @param {InkDrawingAttributes} drawingAttributes The ink stroke attributes associated with the drawing of a [CoreIncrementalInkStroke](coreincrementalinkstroke.md).
     * @param {Matrix3x2} pointTransform An affine transformation matrix to apply to the [CoreIncrementalInkStroke](coreincrementalinkstroke.md) object.
     * 
     * Both position and rotation are based on the top left corner of the stroke relative to the origin of the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
     * @returns {CoreIncrementalInkStroke} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.coreincrementalinkstroke.#ctor
     */
    static Create(drawingAttributes, pointTransform) {
        if (!CoreIncrementalInkStroke.HasProp("__ICoreIncrementalInkStrokeFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.Core.CoreIncrementalInkStroke")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreIncrementalInkStrokeFactory.IID)
            CoreIncrementalInkStroke.__ICoreIncrementalInkStrokeFactory := ICoreIncrementalInkStrokeFactory(factoryPtr)
        }

        return CoreIncrementalInkStroke.__ICoreIncrementalInkStrokeFactory.Create(drawingAttributes, pointTransform)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the ink stroke attributes associated with the drawing of a [CoreIncrementalInkStroke](coreincrementalinkstroke.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.coreincrementalinkstroke.drawingattributes
     * @type {InkDrawingAttributes} 
     */
    DrawingAttributes {
        get => this.get_DrawingAttributes()
    }

    /**
     * Gets or sets an affine transformation matrix to apply to the [CoreIncrementalInkStroke](coreincrementalinkstroke.md) object.
     * 
     * Both position and rotation are based on the top left corner of the stroke relative to the origin of the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.coreincrementalinkstroke.pointtransform
     * @type {Matrix3x2} 
     */
    PointTransform {
        get => this.get_PointTransform()
    }

    /**
     * Gets the bounding rectangle of the [CoreIncrementalInkStroke](coreincrementalinkstroke.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.coreincrementalinkstroke.boundingrect
     * @type {RECT} 
     */
    BoundingRect {
        get => this.get_BoundingRect()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Appends one or more [InkPoint](../windows.ui.input.inking/inkpoint.md) objects to the collection of [InkPoint](../windows.ui.input.inking/inkpoint.md) objects that compose the [CoreIncrementalInkStroke](coreincrementalinkstroke.md).
     * @param {IIterable<InkPoint>} inkPoints The collection of [InkPoint](../windows.ui.input.inking/inkpoint.md) objects to append.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.coreincrementalinkstroke.appendinkpoints
     */
    AppendInkPoints(inkPoints) {
        if (!this.HasProp("__ICoreIncrementalInkStroke")) {
            if ((queryResult := this.QueryInterface(ICoreIncrementalInkStroke.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreIncrementalInkStroke := ICoreIncrementalInkStroke(outPtr)
        }

        return this.__ICoreIncrementalInkStroke.AppendInkPoints(inkPoints)
    }

    /**
     * Creates a new ink stroke.
     * @returns {InkStroke} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.coreincrementalinkstroke.createinkstroke
     */
    CreateInkStroke() {
        if (!this.HasProp("__ICoreIncrementalInkStroke")) {
            if ((queryResult := this.QueryInterface(ICoreIncrementalInkStroke.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreIncrementalInkStroke := ICoreIncrementalInkStroke(outPtr)
        }

        return this.__ICoreIncrementalInkStroke.CreateInkStroke()
    }

    /**
     * 
     * @returns {InkDrawingAttributes} 
     */
    get_DrawingAttributes() {
        if (!this.HasProp("__ICoreIncrementalInkStroke")) {
            if ((queryResult := this.QueryInterface(ICoreIncrementalInkStroke.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreIncrementalInkStroke := ICoreIncrementalInkStroke(outPtr)
        }

        return this.__ICoreIncrementalInkStroke.get_DrawingAttributes()
    }

    /**
     * 
     * @returns {Matrix3x2} 
     */
    get_PointTransform() {
        if (!this.HasProp("__ICoreIncrementalInkStroke")) {
            if ((queryResult := this.QueryInterface(ICoreIncrementalInkStroke.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreIncrementalInkStroke := ICoreIncrementalInkStroke(outPtr)
        }

        return this.__ICoreIncrementalInkStroke.get_PointTransform()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_BoundingRect() {
        if (!this.HasProp("__ICoreIncrementalInkStroke")) {
            if ((queryResult := this.QueryInterface(ICoreIncrementalInkStroke.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreIncrementalInkStroke := ICoreIncrementalInkStroke(outPtr)
        }

        return this.__ICoreIncrementalInkStroke.get_BoundingRect()
    }

;@endregion Instance Methods
}
