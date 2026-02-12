#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkStrokeBuilder.ahk
#Include .\IInkStrokeBuilder2.ahk
#Include .\IInkStrokeBuilder3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Builds strokes from raw pointer input.
  * 
  * > [!NOTE]
  * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
  * 
  * Use [CreateStrokeFromInkPoints](inkstrokebuilder_createstrokefrominkpoints_2009821049.md) and [SetDefaultDrawingAttributes](inkstrokebuilder_setdefaultdrawingattributes_1436218448.md) to programmatically build strokes for an [InkPresenter](inkpresenter.md).
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokebuilder
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkStrokeBuilder extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkStrokeBuilder

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkStrokeBuilder.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Creates a new [InkStrokeBuilder](inkstrokebuilder.md) object that is used to construct [InkStroke](inkstroke.md) objects.
     * 
     * > [!NOTE]
     * > For Universal Windows app using Extensible Application Markup Language (XAML), we recommend using [InkPresenter](inkpresenter.md) and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
     * 
     * Use [CreateStrokeFromInkPoints](inkstrokebuilder_createstrokefrominkpoints_2009821049.md) and [SetDefaultDrawingAttributes](inkstrokebuilder_setdefaultdrawingattributes_1436218448.md) to programmatically build strokes for an [InkPresenter](inkpresenter.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.InkStrokeBuilder")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Starts building the ink stroke.
     * 
     * > [!NOTE]
     * > BeginStroke is not supported by [InkPresenter](inkpresenter.md). Use [CreateStrokeFromInkPoints](inkstrokebuilder_createstrokefrominkpoints_2009821049.md) and [SetDefaultDrawingAttributes](inkstrokebuilder_setdefaultdrawingattributes_1436218448.md) to programmatically build strokes for an [InkPresenter](inkpresenter.md).
     * @param {PointerPoint} pointerPoint_ The first point for the stroke.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokebuilder.beginstroke
     */
    BeginStroke(pointerPoint_) {
        if (!this.HasProp("__IInkStrokeBuilder")) {
            if ((queryResult := this.QueryInterface(IInkStrokeBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeBuilder := IInkStrokeBuilder(outPtr)
        }

        return this.__IInkStrokeBuilder.BeginStroke(pointerPoint_)
    }

    /**
     * Adds a new segment to the ink stroke.
     * 
     * AppendToStroke is called after [BeginStroke](inkstrokebuilder_beginstroke_947510527.md) and before [EndStroke](inkstrokebuilder_endstroke_245944492.md) during the [InkStroke](inkstroke.md) building process.
     * 
     * > [!NOTE]
     * > AppendToStroke is not supported by [InkPresenter](inkpresenter.md). Use [CreateStrokeFromInkPoints](inkstrokebuilder_createstrokefrominkpoints_2009821049.md) and [SetDefaultDrawingAttributes](inkstrokebuilder_setdefaultdrawingattributes_1436218448.md) to programmatically build strokes for an [InkPresenter](inkpresenter.md).
     * @param {PointerPoint} pointerPoint_ The end point of the new segment.
     * @returns {PointerPoint} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokebuilder.appendtostroke
     */
    AppendToStroke(pointerPoint_) {
        if (!this.HasProp("__IInkStrokeBuilder")) {
            if ((queryResult := this.QueryInterface(IInkStrokeBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeBuilder := IInkStrokeBuilder(outPtr)
        }

        return this.__IInkStrokeBuilder.AppendToStroke(pointerPoint_)
    }

    /**
     * Stops building the ink stroke.
     * 
     * > [!NOTE]
     * > EndStroke is not supported by [InkPresenter](inkpresenter.md). Use [CreateStrokeFromInkPoints](inkstrokebuilder_createstrokefrominkpoints_2009821049.md) and [SetDefaultDrawingAttributes](inkstrokebuilder_setdefaultdrawingattributes_1436218448.md) to programmatically build strokes for an [InkPresenter](inkpresenter.md).
     * @param {PointerPoint} pointerPoint_ The last point for the stroke.
     * @returns {InkStroke} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokebuilder.endstroke
     */
    EndStroke(pointerPoint_) {
        if (!this.HasProp("__IInkStrokeBuilder")) {
            if ((queryResult := this.QueryInterface(IInkStrokeBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeBuilder := IInkStrokeBuilder(outPtr)
        }

        return this.__IInkStrokeBuilder.EndStroke(pointerPoint_)
    }

    /**
     * Creates a stroke from an array of [Point](../windows.foundation/point.md) coordinates.
     * 
     * > [!NOTE]
     * > CreateStroke is not supported by [InkPresenter](inkpresenter.md). Use [CreateStrokeFromInkPoints](inkstrokebuilder_createstrokefrominkpoints_2009821049.md) and [SetDefaultDrawingAttributes](inkstrokebuilder_setdefaultdrawingattributes_1436218448.md) to programmatically build strokes for an [InkPresenter](inkpresenter.md).
     * @param {IIterable<POINT>} points_ An array of [Point](../windows.foundation/point.md) coordinates.
     * @returns {InkStroke} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokebuilder.createstroke
     */
    CreateStroke(points_) {
        if (!this.HasProp("__IInkStrokeBuilder")) {
            if ((queryResult := this.QueryInterface(IInkStrokeBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeBuilder := IInkStrokeBuilder(outPtr)
        }

        return this.__IInkStrokeBuilder.CreateStroke(points_)
    }

    /**
     * Sets the default [InkDrawingAttributes](inkdrawingattributes.md) for all new ink strokes created after the current stroke.
     * 
     * SetDefaultDrawingAttributes does not affect the current stroke, or any existing strokes.
     * 
     * > [!NOTE]
     * > Use SetDefaultDrawingAttributes when programmatically building strokes for both [InkPresenter](inkpresenter.md) and [InkManager](inkmanager.md) objects.
     * @param {InkDrawingAttributes} drawingAttributes The default attributes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokebuilder.setdefaultdrawingattributes
     */
    SetDefaultDrawingAttributes(drawingAttributes) {
        if (!this.HasProp("__IInkStrokeBuilder")) {
            if ((queryResult := this.QueryInterface(IInkStrokeBuilder.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeBuilder := IInkStrokeBuilder(outPtr)
        }

        return this.__IInkStrokeBuilder.SetDefaultDrawingAttributes(drawingAttributes)
    }

    /**
     * Creates a basic ink stroke from collection of [InkPoint](inkpoint.md) objects.
     * 
     * > [!NOTE]
     * > Use [CreateStrokeFromInkPoints](inkstrokebuilder_createstrokefrominkpoints_2009821049.md) and [SetDefaultDrawingAttributes](inkstrokebuilder_setdefaultdrawingattributes_1436218448.md) to programmatically build strokes for an [InkPresenter](inkpresenter.md).
     * @param {IIterable<InkPoint>} inkPoints The collection of [InkPoint](inkpoint.md) objects.
     * @param {Matrix3x2} transform_ A 2-D transformation matrix.
     * @returns {InkStroke} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokebuilder.createstrokefrominkpoints
     */
    CreateStrokeFromInkPoints(inkPoints, transform_) {
        if (!this.HasProp("__IInkStrokeBuilder2")) {
            if ((queryResult := this.QueryInterface(IInkStrokeBuilder2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeBuilder2 := IInkStrokeBuilder2(outPtr)
        }

        return this.__IInkStrokeBuilder2.CreateStrokeFromInkPoints(inkPoints, transform_)
    }

    /**
     * Creates a basic ink stroke from collection of [InkPoint](inkpoint.md) objects.
     * 
     * > [!NOTE]
     * > Use [CreateStrokeFromInkPoints](inkstrokebuilder_createstrokefrominkpoints_2009821049.md) and [SetDefaultDrawingAttributes](inkstrokebuilder_setdefaultdrawingattributes_1436218448.md) to programmatically build strokes for an [InkPresenter](inkpresenter.md).
     * @param {IIterable<InkPoint>} inkPoints The collection of [InkPoint](inkpoint.md) objects.
     * @param {Matrix3x2} transform_ A 2-D transformation matrix.
     * @param {IReference<DateTime>} strokeStartedTime 
     * @param {IReference<TimeSpan>} strokeDuration 
     * @returns {InkStroke} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokebuilder.createstrokefrominkpoints
     */
    CreateStrokeFromInkPoints1(inkPoints, transform_, strokeStartedTime, strokeDuration) {
        if (!this.HasProp("__IInkStrokeBuilder3")) {
            if ((queryResult := this.QueryInterface(IInkStrokeBuilder3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeBuilder3 := IInkStrokeBuilder3(outPtr)
        }

        return this.__IInkStrokeBuilder3.CreateStrokeFromInkPoints(inkPoints, transform_, strokeStartedTime, strokeDuration)
    }

;@endregion Instance Methods
}
