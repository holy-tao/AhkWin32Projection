#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionAnimation.ahk
#Include .\ICompositionAnimation2.ahk
#Include .\ICompositionAnimation3.ahk
#Include .\ICompositionAnimation4.ahk
#Include .\ICompositionAnimationFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the base animation class.
 * @remarks
 * This is the base class for [ExpressionAnimation](expressionanimation.md) and [KeyFrameAnimation](keyframeanimation.md).
 * 
 * Use the [CompostionObject.StartAnimation](compositionobject_startanimation_709050842.md) and [CompostionObject.StopAnimation](compositionobject_stopanimation_1075337060.md) methods to start and stop the animation.
 * 
 * Value parameters (as opposed to reference parameters which are set using [SetReferenceParameter](compositionanimation_setreferenceparameter_486390519.md)) are copied and "embedded" into an expression at the time [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) is called. Changing the value of the variable after [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) is called will not affect the value of the [ExpressionAnimation](expressionanimation.md). See the remarks section of [ExpressionAnimation](expressionanimation.md) for additional information.
 * 
 * For a list of animatable properties, see the remarks on [CompostionObject.StartAnimation](compositionobject_startanimation_709050842.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimation
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionAnimation extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionAnimation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The target of the animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimation.target
     * @type {HSTRING} 
     */
    Target {
        get => this.get_Target()
        set => this.put_Target(value)
    }

    /**
     * Gets the initial values for the animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimation.initialvalueexpressions
     * @type {InitialValueExpressionCollection} 
     */
    InitialValueExpressions {
        get => this.get_InitialValueExpressions()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Clears all of the parameters of the animation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimation.clearallparameters
     */
    ClearAllParameters() {
        if (!this.HasProp("__ICompositionAnimation")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimation := ICompositionAnimation(outPtr)
        }

        return this.__ICompositionAnimation.ClearAllParameters()
    }

    /**
     * Clears a parameter from the animation.
     * @param {HSTRING} key The parameter to clear.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimation.clearparameter
     */
    ClearParameter(key) {
        if (!this.HasProp("__ICompositionAnimation")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimation := ICompositionAnimation(outPtr)
        }

        return this.__ICompositionAnimation.ClearParameter(key)
    }

    /**
     * Sets a [Color](../windows.ui/color.md) value parameter for use with an [ExpressionAnimation](expressionanimation.md) or an [expression keyframe](keyframeanimation_insertexpressionkeyframe_1955314135.md).
     * @param {HSTRING} key The name of the parameter to set.
     * @param {Color} value The [Color](../windows.ui/color.md) value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimation.setcolorparameter
     */
    SetColorParameter(key, value) {
        if (!this.HasProp("__ICompositionAnimation")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimation := ICompositionAnimation(outPtr)
        }

        return this.__ICompositionAnimation.SetColorParameter(key, value)
    }

    /**
     * Sets a [Matrix3x2](../windows.foundation.numerics/matrix3x2.md) value parameter for use with an [ExpressionAnimation](expressionanimation.md) or an [expression keyframe](keyframeanimation_insertexpressionkeyframe_1955314135.md).
     * @param {HSTRING} key The name of the parameter to set.
     * @param {Matrix3x2} value The [Matrix3x2](../windows.foundation.numerics/matrix3x2.md) value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimation.setmatrix3x2parameter
     */
    SetMatrix3x2Parameter(key, value) {
        if (!this.HasProp("__ICompositionAnimation")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimation := ICompositionAnimation(outPtr)
        }

        return this.__ICompositionAnimation.SetMatrix3x2Parameter(key, value)
    }

    /**
     * Sets a [Matrix4x4](../windows.foundation.numerics/matrix4x4.md) value parameter for use with an [ExpressionAnimation](expressionanimation.md) or an [expression keyframe](keyframeanimation_insertexpressionkeyframe_1955314135.md).
     * @param {HSTRING} key The name of the parameter to set.
     * @param {Matrix4x4} value The [Matrix4x4](../windows.foundation.numerics/matrix4x4.md) value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimation.setmatrix4x4parameter
     */
    SetMatrix4x4Parameter(key, value) {
        if (!this.HasProp("__ICompositionAnimation")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimation := ICompositionAnimation(outPtr)
        }

        return this.__ICompositionAnimation.SetMatrix4x4Parameter(key, value)
    }

    /**
     * Sets a Quaternion value for use with an [ExpressionAnimation](expressionanimation.md) or an [expression keyframe](/uwp/api/windows.ui.composition.keyframeanimation.insertexpressionkeyframe).
     * @param {HSTRING} key The name of the parameter to set.
     * @param {Quaternion} value The quaternion value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimation.setquaternionparameter
     */
    SetQuaternionParameter(key, value) {
        if (!this.HasProp("__ICompositionAnimation")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimation := ICompositionAnimation(outPtr)
        }

        return this.__ICompositionAnimation.SetQuaternionParameter(key, value)
    }

    /**
     * Sets a reference to a Composition object for use with an [ExpressionAnimation](expressionanimation.md) or an [expression keyframe](keyframeanimation_insertexpressionkeyframe_1955314135.md).
     * @remarks
     * By setting a reference to a [CompositionObject](compositionobject.md), an [ExpressionAnimation](expressionanimation.md) can refer to any animatable property on that [CompositionObject](compositionobject.md). The [CompositionObject](compositionobject.md)'s current property value in the [Compositor](compositor.md) will be used when calculating the value of the expression. See the remarks section of [ExpressionAnimation](expressionanimation.md) for additional information.
     * @param {HSTRING} key The name of the parameter to set. The name can be used to reference the parameter in the [ExpressionAnimation](expressionanimation.md).
     * @param {CompositionObject} compositionObject_ The [CompositionObject](compositionobject.md) value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimation.setreferenceparameter
     */
    SetReferenceParameter(key, compositionObject_) {
        if (!this.HasProp("__ICompositionAnimation")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimation := ICompositionAnimation(outPtr)
        }

        return this.__ICompositionAnimation.SetReferenceParameter(key, compositionObject_)
    }

    /**
     * Sets a Scalar value parameter for use with an [ExpressionAnimation](expressionanimation.md) or an [expression keyframe](keyframeanimation_insertexpressionkeyframe_1955314135.md).
     * @param {HSTRING} key The name of the parameter to set.
     * @param {Float} value The [Single](/dotnet/api/system.single?view=dotnet-uwp-10.0&preserve-view=true) value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimation.setscalarparameter
     */
    SetScalarParameter(key, value) {
        if (!this.HasProp("__ICompositionAnimation")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimation := ICompositionAnimation(outPtr)
        }

        return this.__ICompositionAnimation.SetScalarParameter(key, value)
    }

    /**
     * Sets a [Vector2](../windows.foundation.numerics/vector2.md) value parameter for use with an [ExpressionAnimation](expressionanimation.md) or an [expression keyframe](keyframeanimation_insertexpressionkeyframe_1955314135.md).
     * @param {HSTRING} key The name of the parameter to set.
     * @param {Vector2} value The [Vector2](../windows.foundation.numerics/vector2.md) value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimation.setvector2parameter
     */
    SetVector2Parameter(key, value) {
        if (!this.HasProp("__ICompositionAnimation")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimation := ICompositionAnimation(outPtr)
        }

        return this.__ICompositionAnimation.SetVector2Parameter(key, value)
    }

    /**
     * Sets a [Vector3](../windows.foundation.numerics/vector3.md) value parameter for use with an [ExpressionAnimation](expressionanimation.md) or an [expression keyframe](keyframeanimation_insertexpressionkeyframe_1955314135.md).
     * @param {HSTRING} key The name of the parameter to set.
     * @param {Vector3} value The [Vector3](../windows.foundation.numerics/vector3.md) value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimation.setvector3parameter
     */
    SetVector3Parameter(key, value) {
        if (!this.HasProp("__ICompositionAnimation")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimation := ICompositionAnimation(outPtr)
        }

        return this.__ICompositionAnimation.SetVector3Parameter(key, value)
    }

    /**
     * Sets a [Vector4](../windows.foundation.numerics/vector4.md) value parameter for use with an [ExpressionAnimation](expressionanimation.md) or an [expression keyframe](keyframeanimation_insertexpressionkeyframe_1955314135.md).
     * @param {HSTRING} key The name of the parameter.
     * @param {Vector4} value The [Vector4](../windows.foundation.numerics/vector4.md) value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimation.setvector4parameter
     */
    SetVector4Parameter(key, value) {
        if (!this.HasProp("__ICompositionAnimation")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimation := ICompositionAnimation(outPtr)
        }

        return this.__ICompositionAnimation.SetVector4Parameter(key, value)
    }

    /**
     * Sets a boolean value parameter for use with an [ExpressionAnimation](expressionanimation.md) or an [expression keyframe](/uwp/api/windows.ui.composition.keyframeanimation.insertexpressionkeyframe).
     * @param {HSTRING} key The name of the parameter to set.
     * @param {Boolean} value The boolean value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimation.setbooleanparameter
     */
    SetBooleanParameter(key, value) {
        if (!this.HasProp("__ICompositionAnimation2")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimation2 := ICompositionAnimation2(outPtr)
        }

        return this.__ICompositionAnimation2.SetBooleanParameter(key, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Target() {
        if (!this.HasProp("__ICompositionAnimation2")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimation2 := ICompositionAnimation2(outPtr)
        }

        return this.__ICompositionAnimation2.get_Target()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Target(value) {
        if (!this.HasProp("__ICompositionAnimation2")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimation2 := ICompositionAnimation2(outPtr)
        }

        return this.__ICompositionAnimation2.put_Target(value)
    }

    /**
     * 
     * @returns {InitialValueExpressionCollection} 
     */
    get_InitialValueExpressions() {
        if (!this.HasProp("__ICompositionAnimation3")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimation3 := ICompositionAnimation3(outPtr)
        }

        return this.__ICompositionAnimation3.get_InitialValueExpressions()
    }

    /**
     * Sets an object that implements [IAnimationObject](ianimationobject.md) as a reference parameter in an [ExpressionAnimation](expressionanimation.md).
     * @param {HSTRING} parameterName The name of the parameter to set.
     * @param {IAnimationObject} source The source object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionanimation.setexpressionreferenceparameter
     */
    SetExpressionReferenceParameter(parameterName, source) {
        if (!this.HasProp("__ICompositionAnimation4")) {
            if ((queryResult := this.QueryInterface(ICompositionAnimation4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionAnimation4 := ICompositionAnimation4(outPtr)
        }

        return this.__ICompositionAnimation4.SetExpressionReferenceParameter(parameterName, source)
    }

;@endregion Instance Methods
}
