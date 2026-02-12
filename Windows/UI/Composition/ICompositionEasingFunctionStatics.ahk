#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CubicBezierEasingFunction.ahk
#Include .\LinearEasingFunction.ahk
#Include .\StepEasingFunction.ahk
#Include .\BackEasingFunction.ahk
#Include .\BounceEasingFunction.ahk
#Include .\CircleEasingFunction.ahk
#Include .\ElasticEasingFunction.ahk
#Include .\ExponentialEasingFunction.ahk
#Include .\PowerEasingFunction.ahk
#Include .\SineEasingFunction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionEasingFunctionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionEasingFunctionStatics
     * @type {Guid}
     */
    static IID => Guid("{17a766b6-2936-53ea-b5af-c642f4a61083}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCubicBezierEasingFunction", "CreateLinearEasingFunction", "CreateStepEasingFunction", "CreateStepEasingFunctionWithStepCount", "CreateBackEasingFunction", "CreateBounceEasingFunction", "CreateCircleEasingFunction", "CreateElasticEasingFunction", "CreateExponentialEasingFunction", "CreatePowerEasingFunction", "CreateSineEasingFunction"]

    /**
     * 
     * @param {Compositor} owner 
     * @param {Vector2} controlPoint1 
     * @param {Vector2} controlPoint2 
     * @returns {CubicBezierEasingFunction} 
     */
    CreateCubicBezierEasingFunction(owner, controlPoint1, controlPoint2) {
        result := ComCall(6, this, "ptr", owner, "ptr", controlPoint1, "ptr", controlPoint2, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CubicBezierEasingFunction(result_)
    }

    /**
     * 
     * @param {Compositor} owner 
     * @returns {LinearEasingFunction} 
     */
    CreateLinearEasingFunction(owner) {
        result := ComCall(7, this, "ptr", owner, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LinearEasingFunction(result_)
    }

    /**
     * 
     * @param {Compositor} owner 
     * @returns {StepEasingFunction} 
     */
    CreateStepEasingFunction(owner) {
        result := ComCall(8, this, "ptr", owner, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StepEasingFunction(result_)
    }

    /**
     * 
     * @param {Compositor} owner 
     * @param {Integer} stepCount 
     * @returns {StepEasingFunction} 
     */
    CreateStepEasingFunctionWithStepCount(owner, stepCount) {
        result := ComCall(9, this, "ptr", owner, "int", stepCount, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StepEasingFunction(result_)
    }

    /**
     * 
     * @param {Compositor} owner 
     * @param {Integer} mode_ 
     * @param {Float} amplitude 
     * @returns {BackEasingFunction} 
     */
    CreateBackEasingFunction(owner, mode_, amplitude) {
        result := ComCall(10, this, "ptr", owner, "int", mode_, "float", amplitude, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BackEasingFunction(result_)
    }

    /**
     * 
     * @param {Compositor} owner 
     * @param {Integer} mode_ 
     * @param {Integer} bounces 
     * @param {Float} bounciness 
     * @returns {BounceEasingFunction} 
     */
    CreateBounceEasingFunction(owner, mode_, bounces, bounciness) {
        result := ComCall(11, this, "ptr", owner, "int", mode_, "int", bounces, "float", bounciness, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BounceEasingFunction(result_)
    }

    /**
     * 
     * @param {Compositor} owner 
     * @param {Integer} mode_ 
     * @returns {CircleEasingFunction} 
     */
    CreateCircleEasingFunction(owner, mode_) {
        result := ComCall(12, this, "ptr", owner, "int", mode_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CircleEasingFunction(result_)
    }

    /**
     * 
     * @param {Compositor} owner 
     * @param {Integer} mode_ 
     * @param {Integer} oscillations 
     * @param {Float} springiness 
     * @returns {ElasticEasingFunction} 
     */
    CreateElasticEasingFunction(owner, mode_, oscillations, springiness) {
        result := ComCall(13, this, "ptr", owner, "int", mode_, "int", oscillations, "float", springiness, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ElasticEasingFunction(result_)
    }

    /**
     * 
     * @param {Compositor} owner 
     * @param {Integer} mode_ 
     * @param {Float} exponent 
     * @returns {ExponentialEasingFunction} 
     */
    CreateExponentialEasingFunction(owner, mode_, exponent) {
        result := ComCall(14, this, "ptr", owner, "int", mode_, "float", exponent, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ExponentialEasingFunction(result_)
    }

    /**
     * 
     * @param {Compositor} owner 
     * @param {Integer} mode_ 
     * @param {Float} power 
     * @returns {PowerEasingFunction} 
     */
    CreatePowerEasingFunction(owner, mode_, power) {
        result := ComCall(15, this, "ptr", owner, "int", mode_, "float", power, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PowerEasingFunction(result_)
    }

    /**
     * 
     * @param {Compositor} owner 
     * @param {Integer} mode_ 
     * @returns {SineEasingFunction} 
     */
    CreateSineEasingFunction(owner, mode_) {
        result := ComCall(16, this, "ptr", owner, "int", mode_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SineEasingFunction(result_)
    }
}
