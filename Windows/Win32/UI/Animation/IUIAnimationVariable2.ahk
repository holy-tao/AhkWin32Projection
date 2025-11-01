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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDimension", "GetValue", "GetVectorValue", "GetCurve", "GetVectorCurve", "GetFinalValue", "GetFinalVectorValue", "GetPreviousValue", "GetPreviousVectorValue", "GetIntegerValue", "GetIntegerVectorValue", "GetFinalIntegerValue", "GetFinalIntegerVectorValue", "GetPreviousIntegerValue", "GetPreviousIntegerVectorValue", "GetCurrentStoryboard", "SetLowerBound", "SetLowerBoundVector", "SetUpperBound", "SetUpperBoundVector", "SetRoundingMode", "SetTag", "GetTag", "SetVariableChangeHandler", "SetVariableIntegerChangeHandler", "SetVariableCurveChangeHandler"]

    /**
     * 
     * @param {Pointer<Integer>} dimension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getdimension
     */
    GetDimension(dimension) {
        dimensionMarshal := dimension is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, dimensionMarshal, dimension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getvalue
     */
    GetValue(value) {
        valueMarshal := value is VarRef ? "double*" : "ptr"

        result := ComCall(4, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} value 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getvectorvalue
     */
    GetVectorValue(value, cDimension) {
        valueMarshal := value is VarRef ? "double*" : "ptr"

        result := ComCall(5, this, valueMarshal, value, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getcurve
     */
    GetCurve(animation) {
        result := ComCall(6, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getvectorcurve
     */
    GetVectorCurve(animation, cDimension) {
        result := ComCall(7, this, "ptr*", animation, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} finalValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getfinalvalue
     */
    GetFinalValue(finalValue) {
        finalValueMarshal := finalValue is VarRef ? "double*" : "ptr"

        result := ComCall(8, this, finalValueMarshal, finalValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} finalValue 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getfinalvectorvalue
     */
    GetFinalVectorValue(finalValue, cDimension) {
        finalValueMarshal := finalValue is VarRef ? "double*" : "ptr"

        result := ComCall(9, this, finalValueMarshal, finalValue, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} previousValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getpreviousvalue
     */
    GetPreviousValue(previousValue) {
        previousValueMarshal := previousValue is VarRef ? "double*" : "ptr"

        result := ComCall(10, this, previousValueMarshal, previousValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} previousValue 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getpreviousvectorvalue
     */
    GetPreviousVectorValue(previousValue, cDimension) {
        previousValueMarshal := previousValue is VarRef ? "double*" : "ptr"

        result := ComCall(11, this, previousValueMarshal, previousValue, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getintegervalue
     */
    GetIntegerValue(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getintegervectorvalue
     */
    GetIntegerVectorValue(value, cDimension) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, valueMarshal, value, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} finalValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getfinalintegervalue
     */
    GetFinalIntegerValue(finalValue) {
        finalValueMarshal := finalValue is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, finalValueMarshal, finalValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} finalValue 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getfinalintegervectorvalue
     */
    GetFinalIntegerVectorValue(finalValue, cDimension) {
        finalValueMarshal := finalValue is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, finalValueMarshal, finalValue, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} previousValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getpreviousintegervalue
     */
    GetPreviousIntegerValue(previousValue) {
        previousValueMarshal := previousValue is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, previousValueMarshal, previousValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} previousValue 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getpreviousintegervectorvalue
     */
    GetPreviousIntegerVectorValue(previousValue, cDimension) {
        previousValueMarshal := previousValue is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, previousValueMarshal, previousValue, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationStoryboard2>} storyboard 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-getcurrentstoryboard
     */
    GetCurrentStoryboard(storyboard) {
        result := ComCall(18, this, "ptr*", storyboard, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} bound 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-setlowerbound
     */
    SetLowerBound(bound) {
        result := ComCall(19, this, "double", bound, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} bound 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-setlowerboundvector
     */
    SetLowerBoundVector(bound, cDimension) {
        boundMarshal := bound is VarRef ? "double*" : "ptr"

        result := ComCall(20, this, boundMarshal, bound, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} bound 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-setupperbound
     */
    SetUpperBound(bound) {
        result := ComCall(21, this, "double", bound, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} bound 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-setupperboundvector
     */
    SetUpperBoundVector(bound, cDimension) {
        boundMarshal := bound is VarRef ? "double*" : "ptr"

        result := ComCall(22, this, boundMarshal, bound, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-setroundingmode
     */
    SetRoundingMode(mode) {
        result := ComCall(23, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} object 
     * @param {Integer} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-settag
     */
    SetTag(object, id) {
        result := ComCall(24, this, "ptr", object, "uint", id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} object 
     * @param {Pointer<Integer>} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-gettag
     */
    GetTag(object, id) {
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, "ptr*", object, idMarshal, id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationVariableChangeHandler2} handler 
     * @param {BOOL} fRegisterForNextAnimationEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-setvariablechangehandler
     */
    SetVariableChangeHandler(handler, fRegisterForNextAnimationEvent) {
        result := ComCall(26, this, "ptr", handler, "int", fRegisterForNextAnimationEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationVariableIntegerChangeHandler2} handler 
     * @param {BOOL} fRegisterForNextAnimationEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-setvariableintegerchangehandler
     */
    SetVariableIntegerChangeHandler(handler, fRegisterForNextAnimationEvent) {
        result := ComCall(27, this, "ptr", handler, "int", fRegisterForNextAnimationEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationVariableCurveChangeHandler2} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable2-setvariablecurvechangehandler
     */
    SetVariableCurveChangeHandler(handler) {
        result := ComCall(28, this, "ptr", handler, "HRESULT")
        return result
    }
}
