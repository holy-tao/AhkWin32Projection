#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkStroke.ahk
#Include .\IInkStroke2.ahk
#Include .\IInkStroke3.ahk
#Include .\IInkStroke4.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A single ink stroke, including the Bézier curve parameters used for final rendering of the stroke.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstroke
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkStroke extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkStroke

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkStroke.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the properties associated with an [InkStroke](inkstroke.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstroke.drawingattributes
     * @type {InkDrawingAttributes} 
     */
    DrawingAttributes {
        get => this.get_DrawingAttributes()
        set => this.put_DrawingAttributes(value)
    }

    /**
     * Gets the bounding box for the [InkStroke](inkstroke.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstroke.boundingrect
     * @type {RECT} 
     */
    BoundingRect {
        get => this.get_BoundingRect()
    }

    /**
     * Gets whether the stroke is selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstroke.selected
     * @type {Boolean} 
     */
    Selected {
        get => this.get_Selected()
        set => this.put_Selected(value)
    }

    /**
     * Gets whether the stroke is recognized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstroke.recognized
     * @type {Boolean} 
     */
    Recognized {
        get => this.get_Recognized()
    }

    /**
     * Gets or sets an affine transformation matrix to apply to the [InkStroke](inkstroke.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstroke.pointtransform
     * @type {Matrix3x2} 
     */
    PointTransform {
        get => this.get_PointTransform()
        set => this.put_PointTransform(value)
    }

    /**
     * Gets the ink stroke identifier.
     * 
     * A unique identifier is assigned to each ink stroke managed by the [InkPresenter](inkpresenter.md).
     * @remarks
     * This identifier does not persist through serialization/deserialization of the ink stroke. After deserialization, a new identifer is assigned.
     * 
     * Calling the **[Clone](/uwp/api/Windows.UI.Input.Inking.InkStroke.Clone)** method also generates a new identifier for the cloned stroke.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstroke.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets or sets the date and time when the InkStroke was started.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstroke.strokestartedtime
     * @type {IReference<DateTime>} 
     */
    StrokeStartedTime {
        get => this.get_StrokeStartedTime()
        set => this.put_StrokeStartedTime(value)
    }

    /**
     * Gets or sets the time taken by the user to draw a single ink stroke.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstroke.strokeduration
     * @type {IReference<TimeSpan>} 
     */
    StrokeDuration {
        get => this.get_StrokeDuration()
        set => this.put_StrokeDuration(value)
    }

    /**
     * Gets the ID of the pointer associated with the ink stroke.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstroke.pointerid
     * @type {Integer} 
     */
    PointerId {
        get => this.get_PointerId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {InkDrawingAttributes} 
     */
    get_DrawingAttributes() {
        if (!this.HasProp("__IInkStroke")) {
            if ((queryResult := this.QueryInterface(IInkStroke.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke := IInkStroke(outPtr)
        }

        return this.__IInkStroke.get_DrawingAttributes()
    }

    /**
     * 
     * @param {InkDrawingAttributes} value 
     * @returns {HRESULT} 
     */
    put_DrawingAttributes(value) {
        if (!this.HasProp("__IInkStroke")) {
            if ((queryResult := this.QueryInterface(IInkStroke.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke := IInkStroke(outPtr)
        }

        return this.__IInkStroke.put_DrawingAttributes(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_BoundingRect() {
        if (!this.HasProp("__IInkStroke")) {
            if ((queryResult := this.QueryInterface(IInkStroke.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke := IInkStroke(outPtr)
        }

        return this.__IInkStroke.get_BoundingRect()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Selected() {
        if (!this.HasProp("__IInkStroke")) {
            if ((queryResult := this.QueryInterface(IInkStroke.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke := IInkStroke(outPtr)
        }

        return this.__IInkStroke.get_Selected()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Selected(value) {
        if (!this.HasProp("__IInkStroke")) {
            if ((queryResult := this.QueryInterface(IInkStroke.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke := IInkStroke(outPtr)
        }

        return this.__IInkStroke.put_Selected(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Recognized() {
        if (!this.HasProp("__IInkStroke")) {
            if ((queryResult := this.QueryInterface(IInkStroke.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke := IInkStroke(outPtr)
        }

        return this.__IInkStroke.get_Recognized()
    }

    /**
     * Gets the rendering segments of the stroke.
     * 
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), use [GetInkPoints](inkstroke_getinkpoints_1369941995.md) (see remarks).
     * @remarks
     * If [FitToCurve](inkdrawingattributes_fittocurve.md) is set to true, this method returns an [InkStrokeRenderingSegment](inkstrokerenderingsegment.md) that approximates the Bezier curve of the stroke.
     * 
     * If [FitToCurve](inkdrawingattributes_fittocurve.md) is set to false, this method returns a collection of [InkStrokeRenderingSegment](inkstrokerenderingsegment.md) objects that represent the original raw pointer data as line segments.
     * 
     * For Universal Windows app using Extensible Application Markup Language (XAML), avoid changing the state of an ink stroke to retrieve the raw pointer data by using [GetInkPoints](inkstroke_getinkpoints_1369941995.md) instead.
     * @returns {IVectorView<InkStrokeRenderingSegment>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstroke.getrenderingsegments
     */
    GetRenderingSegments() {
        if (!this.HasProp("__IInkStroke")) {
            if ((queryResult := this.QueryInterface(IInkStroke.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke := IInkStroke(outPtr)
        }

        return this.__IInkStroke.GetRenderingSegments()
    }

    /**
     * Copies the [InkStroke](inkstroke.md) to another [InkManager](inkmanager.md) (or [InkStrokeContainer](inkstrokecontainer.md)).
     * @remarks
     * This method must be used with [AddStroke](inkmanager_addstroke_367978361.md) ([InkManager](inkmanager.md)) or [AddStroke](inkstrokecontainer_addstroke_367978361.md) ([InkStrokeContainer](inkstrokecontainer.md)).
     * 
     * ```csharp
     * inkStrokeContainer.AddStroke(stroke.Clone());
     * inkManager.AddStroke(stroke.Clone());
     * ```
     * @returns {InkStroke} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstroke.clone
     */
    Clone() {
        if (!this.HasProp("__IInkStroke")) {
            if ((queryResult := this.QueryInterface(IInkStroke.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke := IInkStroke(outPtr)
        }

        return this.__IInkStroke.Clone()
    }

    /**
     * 
     * @returns {Matrix3x2} 
     */
    get_PointTransform() {
        if (!this.HasProp("__IInkStroke2")) {
            if ((queryResult := this.QueryInterface(IInkStroke2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke2 := IInkStroke2(outPtr)
        }

        return this.__IInkStroke2.get_PointTransform()
    }

    /**
     * 
     * @param {Matrix3x2} value 
     * @returns {HRESULT} 
     */
    put_PointTransform(value) {
        if (!this.HasProp("__IInkStroke2")) {
            if ((queryResult := this.QueryInterface(IInkStroke2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke2 := IInkStroke2(outPtr)
        }

        return this.__IInkStroke2.put_PointTransform(value)
    }

    /**
     * Gets the collection of [InkPoint](inkpoint.md) objects used to construct the [InkStroke](inkstroke.md).
     * @returns {IVectorView<InkPoint>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstroke.getinkpoints
     */
    GetInkPoints() {
        if (!this.HasProp("__IInkStroke2")) {
            if ((queryResult := this.QueryInterface(IInkStroke2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke2 := IInkStroke2(outPtr)
        }

        return this.__IInkStroke2.GetInkPoints()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IInkStroke3")) {
            if ((queryResult := this.QueryInterface(IInkStroke3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke3 := IInkStroke3(outPtr)
        }

        return this.__IInkStroke3.get_Id()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_StrokeStartedTime() {
        if (!this.HasProp("__IInkStroke3")) {
            if ((queryResult := this.QueryInterface(IInkStroke3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke3 := IInkStroke3(outPtr)
        }

        return this.__IInkStroke3.get_StrokeStartedTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_StrokeStartedTime(value) {
        if (!this.HasProp("__IInkStroke3")) {
            if ((queryResult := this.QueryInterface(IInkStroke3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke3 := IInkStroke3(outPtr)
        }

        return this.__IInkStroke3.put_StrokeStartedTime(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_StrokeDuration() {
        if (!this.HasProp("__IInkStroke3")) {
            if ((queryResult := this.QueryInterface(IInkStroke3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke3 := IInkStroke3(outPtr)
        }

        return this.__IInkStroke3.get_StrokeDuration()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_StrokeDuration(value) {
        if (!this.HasProp("__IInkStroke3")) {
            if ((queryResult := this.QueryInterface(IInkStroke3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke3 := IInkStroke3(outPtr)
        }

        return this.__IInkStroke3.put_StrokeDuration(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerId() {
        if (!this.HasProp("__IInkStroke4")) {
            if ((queryResult := this.QueryInterface(IInkStroke4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStroke4 := IInkStroke4(outPtr)
        }

        return this.__IInkStroke4.get_PointerId()
    }

;@endregion Instance Methods
}
