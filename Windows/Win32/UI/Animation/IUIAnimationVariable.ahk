#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines an animation variable, which represents a visual element that can be animated.
 * @remarks
 * 
  * Along with 
  *          <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition">IUIAnimationTransition</a> and 
  *          <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationstoryboard">IUIAnimationStoryboard</a>, <b>IUIAnimationVariable</b> is a primary component for building animations. To create and manage animation variables, use <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationmanager">IUIAnimationManager</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationvariable
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationVariable extends IUnknown{
    /**
     * The interface identifier for IUIAnimationVariable
     * @type {Guid}
     */
    static IID => Guid("{8ceeb155-2849-4ce5-9448-91ff70e1e4d9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Double>} value 
     * @returns {HRESULT} 
     */
    GetValue(value) {
        result := ComCall(3, this, "double*", value, "int")
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
        result := ComCall(4, this, "double*", finalValue, "int")
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
        result := ComCall(5, this, "double*", previousValue, "int")
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
        result := ComCall(6, this, "int*", value, "int")
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
        result := ComCall(7, this, "int*", finalValue, "int")
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
        result := ComCall(8, this, "int*", previousValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationStoryboard>} storyboard 
     * @returns {HRESULT} 
     */
    GetCurrentStoryboard(storyboard) {
        result := ComCall(9, this, "ptr", storyboard, "int")
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
        result := ComCall(10, this, "double", bound, "int")
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
        result := ComCall(11, this, "double", bound, "int")
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
        result := ComCall(12, this, "int", mode, "int")
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
        result := ComCall(13, this, "ptr", object, "uint", id, "int")
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
        result := ComCall(14, this, "ptr", object, "uint*", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationVariableChangeHandler>} handler 
     * @returns {HRESULT} 
     */
    SetVariableChangeHandler(handler) {
        result := ComCall(15, this, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationVariableIntegerChangeHandler>} handler 
     * @returns {HRESULT} 
     */
    SetVariableIntegerChangeHandler(handler) {
        result := ComCall(16, this, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
