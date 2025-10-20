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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetValue", "GetFinalValue", "GetPreviousValue", "GetIntegerValue", "GetFinalIntegerValue", "GetPreviousIntegerValue", "GetCurrentStoryboard", "SetLowerBound", "SetUpperBound", "SetRoundingMode", "SetTag", "GetTag", "SetVariableChangeHandler", "SetVariableIntegerChangeHandler"]

    /**
     * 
     * @param {Pointer<Float>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable-getvalue
     */
    GetValue(value) {
        result := ComCall(3, this, "double*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} finalValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable-getfinalvalue
     */
    GetFinalValue(finalValue) {
        result := ComCall(4, this, "double*", finalValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} previousValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable-getpreviousvalue
     */
    GetPreviousValue(previousValue) {
        result := ComCall(5, this, "double*", previousValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable-getintegervalue
     */
    GetIntegerValue(value) {
        result := ComCall(6, this, "int*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} finalValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable-getfinalintegervalue
     */
    GetFinalIntegerValue(finalValue) {
        result := ComCall(7, this, "int*", finalValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} previousValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable-getpreviousintegervalue
     */
    GetPreviousIntegerValue(previousValue) {
        result := ComCall(8, this, "int*", previousValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationStoryboard>} storyboard 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable-getcurrentstoryboard
     */
    GetCurrentStoryboard(storyboard) {
        result := ComCall(9, this, "ptr*", storyboard, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} bound 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable-setlowerbound
     */
    SetLowerBound(bound) {
        result := ComCall(10, this, "double", bound, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} bound 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable-setupperbound
     */
    SetUpperBound(bound) {
        result := ComCall(11, this, "double", bound, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable-setroundingmode
     */
    SetRoundingMode(mode) {
        result := ComCall(12, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} object 
     * @param {Integer} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable-settag
     */
    SetTag(object, id) {
        result := ComCall(13, this, "ptr", object, "uint", id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} object 
     * @param {Pointer<Integer>} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable-gettag
     */
    GetTag(object, id) {
        result := ComCall(14, this, "ptr*", object, "uint*", id, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationVariableChangeHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable-setvariablechangehandler
     */
    SetVariableChangeHandler(handler) {
        result := ComCall(15, this, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAnimationVariableIntegerChangeHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariable-setvariableintegerchangehandler
     */
    SetVariableIntegerChangeHandler(handler) {
        result := ComCall(16, this, "ptr", handler, "HRESULT")
        return result
    }
}
