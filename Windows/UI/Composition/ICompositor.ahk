#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ColorKeyFrameAnimation.ahk
#Include .\CompositionColorBrush.ahk
#Include .\ContainerVisual.ahk
#Include .\CubicBezierEasingFunction.ahk
#Include .\CompositionEffectFactory.ahk
#Include .\ExpressionAnimation.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\InsetClip.ahk
#Include .\LinearEasingFunction.ahk
#Include .\CompositionPropertySet.ahk
#Include .\QuaternionKeyFrameAnimation.ahk
#Include .\ScalarKeyFrameAnimation.ahk
#Include .\CompositionScopedBatch.ahk
#Include .\SpriteVisual.ahk
#Include .\CompositionSurfaceBrush.ahk
#Include .\CompositionTarget.ahk
#Include .\Vector2KeyFrameAnimation.ahk
#Include .\Vector3KeyFrameAnimation.ahk
#Include .\Vector4KeyFrameAnimation.ahk
#Include .\CompositionCommitBatch.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Native interoperation interface that allows creating swapchain surfaces and graphics devices. This is interface is available in C++ only.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.composition.interop/nn-windows-ui-composition-interop-icompositiondrawingsurfaceinterop">ICompositionDrawingSurfaceInterop</a> for usage examples.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.composition.interop/nn-windows-ui-composition-interop-icompositorinterop
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositor
     * @type {Guid}
     */
    static IID => Guid("{b403ca50-7f8c-4e83-985f-cc45060036d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateColorKeyFrameAnimation", "CreateColorBrush", "CreateColorBrushWithColor", "CreateContainerVisual", "CreateCubicBezierEasingFunction", "CreateEffectFactory", "CreateEffectFactoryWithProperties", "CreateExpressionAnimation", "CreateExpressionAnimationWithExpression", "CreateInsetClip", "CreateInsetClipWithInsets", "CreateLinearEasingFunction", "CreatePropertySet", "CreateQuaternionKeyFrameAnimation", "CreateScalarKeyFrameAnimation", "CreateScopedBatch", "CreateSpriteVisual", "CreateSurfaceBrush", "CreateSurfaceBrushWithSurface", "CreateTargetForCurrentView", "CreateVector2KeyFrameAnimation", "CreateVector3KeyFrameAnimation", "CreateVector4KeyFrameAnimation", "GetCommitBatch"]

    /**
     * 
     * @returns {ColorKeyFrameAnimation} 
     */
    CreateColorKeyFrameAnimation() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ColorKeyFrameAnimation(result_)
    }

    /**
     * 
     * @returns {CompositionColorBrush} 
     */
    CreateColorBrush() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionColorBrush(result_)
    }

    /**
     * 
     * @param {Color} color_ 
     * @returns {CompositionColorBrush} 
     */
    CreateColorBrushWithColor(color_) {
        result := ComCall(8, this, "ptr", color_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionColorBrush(result_)
    }

    /**
     * 
     * @returns {ContainerVisual} 
     */
    CreateContainerVisual() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContainerVisual(result_)
    }

    /**
     * 
     * @param {Vector2} controlPoint1 
     * @param {Vector2} controlPoint2 
     * @returns {CubicBezierEasingFunction} 
     */
    CreateCubicBezierEasingFunction(controlPoint1, controlPoint2) {
        result := ComCall(10, this, "ptr", controlPoint1, "ptr", controlPoint2, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CubicBezierEasingFunction(result_)
    }

    /**
     * 
     * @param {IGraphicsEffect} graphicsEffect 
     * @returns {CompositionEffectFactory} 
     */
    CreateEffectFactory(graphicsEffect) {
        result := ComCall(11, this, "ptr", graphicsEffect, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionEffectFactory(result_)
    }

    /**
     * 
     * @param {IGraphicsEffect} graphicsEffect 
     * @param {IIterable<HSTRING>} animatableProperties 
     * @returns {CompositionEffectFactory} 
     */
    CreateEffectFactoryWithProperties(graphicsEffect, animatableProperties) {
        result := ComCall(12, this, "ptr", graphicsEffect, "ptr", animatableProperties, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionEffectFactory(result_)
    }

    /**
     * 
     * @returns {ExpressionAnimation} 
     */
    CreateExpressionAnimation() {
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ExpressionAnimation(result_)
    }

    /**
     * 
     * @param {HSTRING} expression 
     * @returns {ExpressionAnimation} 
     */
    CreateExpressionAnimationWithExpression(expression) {
        if(expression is String) {
            pin := HSTRING.Create(expression)
            expression := pin.Value
        }
        expression := expression is Win32Handle ? NumGet(expression, "ptr") : expression

        result := ComCall(14, this, "ptr", expression, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ExpressionAnimation(result_)
    }

    /**
     * 
     * @returns {InsetClip} 
     */
    CreateInsetClip() {
        result := ComCall(15, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InsetClip(result_)
    }

    /**
     * 
     * @param {Float} leftInset 
     * @param {Float} topInset 
     * @param {Float} rightInset 
     * @param {Float} bottomInset 
     * @returns {InsetClip} 
     */
    CreateInsetClipWithInsets(leftInset, topInset, rightInset, bottomInset) {
        result := ComCall(16, this, "float", leftInset, "float", topInset, "float", rightInset, "float", bottomInset, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InsetClip(result_)
    }

    /**
     * 
     * @returns {LinearEasingFunction} 
     */
    CreateLinearEasingFunction() {
        result := ComCall(17, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LinearEasingFunction(result_)
    }

    /**
     * 
     * @returns {CompositionPropertySet} 
     */
    CreatePropertySet() {
        result := ComCall(18, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionPropertySet(result_)
    }

    /**
     * 
     * @returns {QuaternionKeyFrameAnimation} 
     */
    CreateQuaternionKeyFrameAnimation() {
        result := ComCall(19, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return QuaternionKeyFrameAnimation(result_)
    }

    /**
     * 
     * @returns {ScalarKeyFrameAnimation} 
     */
    CreateScalarKeyFrameAnimation() {
        result := ComCall(20, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ScalarKeyFrameAnimation(result_)
    }

    /**
     * 
     * @param {Integer} batchType 
     * @returns {CompositionScopedBatch} 
     */
    CreateScopedBatch(batchType) {
        result := ComCall(21, this, "uint", batchType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionScopedBatch(result_)
    }

    /**
     * 
     * @returns {SpriteVisual} 
     */
    CreateSpriteVisual() {
        result := ComCall(22, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpriteVisual(result_)
    }

    /**
     * 
     * @returns {CompositionSurfaceBrush} 
     */
    CreateSurfaceBrush() {
        result := ComCall(23, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionSurfaceBrush(result_)
    }

    /**
     * 
     * @param {ICompositionSurface} surface 
     * @returns {CompositionSurfaceBrush} 
     */
    CreateSurfaceBrushWithSurface(surface) {
        result := ComCall(24, this, "ptr", surface, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionSurfaceBrush(result_)
    }

    /**
     * 
     * @returns {CompositionTarget} 
     */
    CreateTargetForCurrentView() {
        result := ComCall(25, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionTarget(result_)
    }

    /**
     * 
     * @returns {Vector2KeyFrameAnimation} 
     */
    CreateVector2KeyFrameAnimation() {
        result := ComCall(26, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Vector2KeyFrameAnimation(result_)
    }

    /**
     * 
     * @returns {Vector3KeyFrameAnimation} 
     */
    CreateVector3KeyFrameAnimation() {
        result := ComCall(27, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Vector3KeyFrameAnimation(result_)
    }

    /**
     * 
     * @returns {Vector4KeyFrameAnimation} 
     */
    CreateVector4KeyFrameAnimation() {
        result := ComCall(28, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Vector4KeyFrameAnimation(result_)
    }

    /**
     * 
     * @param {Integer} batchType 
     * @returns {CompositionCommitBatch} 
     */
    GetCommitBatch(batchType) {
        result := ComCall(29, this, "uint", batchType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionCommitBatch(result_)
    }
}
