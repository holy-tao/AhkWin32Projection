#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines an animation variable, which represents a visual element that can be animated in multiple dimensions.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationvariable2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationVariable2 extends IUnknown{
    /**
     * The interface identifier for IUIAnimationVariable2
     * @type {Guid}
     */
    static IID => Guid("{4914b304-96ab-44d9-9e77-d5109b7e7466}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} dimension 
     * @returns {HRESULT} 
     */
    GetDimension(dimension) {
        result := ComCall(3, this, "uint*", dimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} value 
     * @returns {HRESULT} 
     */
    GetValue(value) {
        result := ComCall(4, this, "double*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} value 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     */
    GetVectorValue(value, cDimension) {
        result := ComCall(5, this, "double*", value, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    GetCurve(animation) {
        result := ComCall(6, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     */
    GetVectorCurve(animation, cDimension) {
        result := ComCall(7, this, "ptr", animation, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} finalValue 
     * @returns {HRESULT} 
     */
    GetFinalValue(finalValue) {
        result := ComCall(8, this, "double*", finalValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} finalValue 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     */
    GetFinalVectorValue(finalValue, cDimension) {
        result := ComCall(9, this, "double*", finalValue, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} previousValue 
     * @returns {HRESULT} 
     */
    GetPreviousValue(previousValue) {
        result := ComCall(10, this, "double*", previousValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} previousValue 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     */
    GetPreviousVectorValue(previousValue, cDimension) {
        result := ComCall(11, this, "double*", previousValue, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    GetIntegerValue(value) {
        result := ComCall(12, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     */
    GetIntegerVectorValue(value, cDimension) {
        result := ComCall(13, this, "int*", value, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} finalValue 
     * @returns {HRESULT} 
     */
    GetFinalIntegerValue(finalValue) {
        result := ComCall(14, this, "int*", finalValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} finalValue 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     */
    GetFinalIntegerVectorValue(finalValue, cDimension) {
        result := ComCall(15, this, "int*", finalValue, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} previousValue 
     * @returns {HRESULT} 
     */
    GetPreviousIntegerValue(previousValue) {
        result := ComCall(16, this, "int*", previousValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} previousValue 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     */
    GetPreviousIntegerVectorValue(previousValue, cDimension) {
        result := ComCall(17, this, "int*", previousValue, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationStoryboard2>} storyboard 
     * @returns {HRESULT} 
     */
    GetCurrentStoryboard(storyboard) {
        result := ComCall(18, this, "ptr", storyboard, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} bound 
     * @returns {HRESULT} 
     */
    SetLowerBound(bound) {
        result := ComCall(19, this, "double", bound, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} bound 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     */
    SetLowerBoundVector(bound, cDimension) {
        result := ComCall(20, this, "double*", bound, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} bound 
     * @returns {HRESULT} 
     */
    SetUpperBound(bound) {
        result := ComCall(21, this, "double", bound, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} bound 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     */
    SetUpperBoundVector(bound, cDimension) {
        result := ComCall(22, this, "double*", bound, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    SetRoundingMode(mode) {
        result := ComCall(23, this, "int", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} object 
     * @param {Integer} id 
     * @returns {HRESULT} 
     */
    SetTag(object, id) {
        result := ComCall(24, this, "ptr", object, "uint", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} object 
     * @param {Pointer<UInt32>} id 
     * @returns {HRESULT} 
     */
    GetTag(object, id) {
        result := ComCall(25, this, "ptr", object, "uint*", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationVariableChangeHandler2>} handler 
     * @param {BOOL} fRegisterForNextAnimationEvent 
     * @returns {HRESULT} 
     */
    SetVariableChangeHandler(handler, fRegisterForNextAnimationEvent) {
        result := ComCall(26, this, "ptr", handler, "int", fRegisterForNextAnimationEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationVariableIntegerChangeHandler2>} handler 
     * @param {BOOL} fRegisterForNextAnimationEvent 
     * @returns {HRESULT} 
     */
    SetVariableIntegerChangeHandler(handler, fRegisterForNextAnimationEvent) {
        result := ComCall(27, this, "ptr", handler, "int", fRegisterForNextAnimationEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationVariableCurveChangeHandler2>} handler 
     * @returns {HRESULT} 
     */
    SetVariableCurveChangeHandler(handler) {
        result := ComCall(28, this, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
