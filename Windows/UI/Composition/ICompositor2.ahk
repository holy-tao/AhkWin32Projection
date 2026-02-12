#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AmbientLight.ahk
#Include .\CompositionAnimationGroup.ahk
#Include .\CompositionBackdropBrush.ahk
#Include .\DistantLight.ahk
#Include .\DropShadow.ahk
#Include .\ImplicitAnimationCollection.ahk
#Include .\LayerVisual.ahk
#Include .\CompositionMaskBrush.ahk
#Include .\CompositionNineGridBrush.ahk
#Include .\PointLight.ahk
#Include .\SpotLight.ahk
#Include .\StepEasingFunction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositor2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositor2
     * @type {Guid}
     */
    static IID => Guid("{735081dc-5e24-45da-a38f-e32cc349a9a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAmbientLight", "CreateAnimationGroup", "CreateBackdropBrush", "CreateDistantLight", "CreateDropShadow", "CreateImplicitAnimationCollection", "CreateLayerVisual", "CreateMaskBrush", "CreateNineGridBrush", "CreatePointLight", "CreateSpotLight", "CreateStepEasingFunction", "CreateStepEasingFunctionWithStepCount"]

    /**
     * 
     * @returns {AmbientLight} 
     */
    CreateAmbientLight() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AmbientLight(result_)
    }

    /**
     * 
     * @returns {CompositionAnimationGroup} 
     */
    CreateAnimationGroup() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionAnimationGroup(result_)
    }

    /**
     * 
     * @returns {CompositionBackdropBrush} 
     */
    CreateBackdropBrush() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionBackdropBrush(result_)
    }

    /**
     * 
     * @returns {DistantLight} 
     */
    CreateDistantLight() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DistantLight(result_)
    }

    /**
     * 
     * @returns {DropShadow} 
     */
    CreateDropShadow() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DropShadow(result_)
    }

    /**
     * 
     * @returns {ImplicitAnimationCollection} 
     */
    CreateImplicitAnimationCollection() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImplicitAnimationCollection(result_)
    }

    /**
     * 
     * @returns {LayerVisual} 
     */
    CreateLayerVisual() {
        result := ComCall(12, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LayerVisual(result_)
    }

    /**
     * 
     * @returns {CompositionMaskBrush} 
     */
    CreateMaskBrush() {
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionMaskBrush(result_)
    }

    /**
     * 
     * @returns {CompositionNineGridBrush} 
     */
    CreateNineGridBrush() {
        result := ComCall(14, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionNineGridBrush(result_)
    }

    /**
     * 
     * @returns {PointLight} 
     */
    CreatePointLight() {
        result := ComCall(15, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PointLight(result_)
    }

    /**
     * 
     * @returns {SpotLight} 
     */
    CreateSpotLight() {
        result := ComCall(16, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpotLight(result_)
    }

    /**
     * 
     * @returns {StepEasingFunction} 
     */
    CreateStepEasingFunction() {
        result := ComCall(17, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StepEasingFunction(result_)
    }

    /**
     * 
     * @param {Integer} stepCount 
     * @returns {StepEasingFunction} 
     */
    CreateStepEasingFunctionWithStepCount(stepCount) {
        result := ComCall(18, this, "int", stepCount, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StepEasingFunction(result_)
    }
}
