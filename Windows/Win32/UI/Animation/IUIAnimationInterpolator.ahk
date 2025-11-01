#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for creating a custom interpolator.
 * @remarks
 * 
  * Client applications can use the transitions provided in  <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransitionlibrary">IUIAnimationTransitionLibrary</a> or in a library provided by a third party; however, if you need custom behavior, you can create your own transitions by implementing the <b>IUIAnimationInterpolator</b> interface.
  * 
  * Before Windows Animation can use your custom interpolator, you must wrap it in an object that implements  <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition">IUIAnimationTransition</a> by calling the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtransitionfactory-createtransition">IUIAnimationTransitionFactory::CreateTransition</a> method and passing in the custom  interpolator.  After the interpolator is wrapped, client applications interact with your interpolator using the <b>IUIAnimationTransition</b> interface.
  * 
  * Custom interpolators can be reused across applications, but it is recommended that they be exposed using factory interfaces that return <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition">IUIAnimationTransition</a> interfaces.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationinterpolator
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationInterpolator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationInterpolator
     * @type {Guid}
     */
    static IID => Guid("{7815cbba-ddf7-478c-a46c-7b6c738b7978}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInitialValueAndVelocity", "SetDuration", "GetDuration", "GetFinalValue", "InterpolateValue", "InterpolateVelocity", "GetDependencies"]

    /**
     * 
     * @param {Float} initialValue 
     * @param {Float} initialVelocity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationinterpolator-setinitialvalueandvelocity
     */
    SetInitialValueAndVelocity(initialValue, initialVelocity) {
        result := ComCall(3, this, "double", initialValue, "double", initialVelocity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} duration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationinterpolator-setduration
     */
    SetDuration(duration) {
        result := ComCall(4, this, "double", duration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} duration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationinterpolator-getduration
     */
    GetDuration(duration) {
        durationMarshal := duration is VarRef ? "double*" : "ptr"

        result := ComCall(5, this, durationMarshal, duration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationinterpolator-getfinalvalue
     */
    GetFinalValue(value) {
        valueMarshal := value is VarRef ? "double*" : "ptr"

        result := ComCall(6, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} offset 
     * @param {Pointer<Float>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationinterpolator-interpolatevalue
     */
    InterpolateValue(offset, value) {
        valueMarshal := value is VarRef ? "double*" : "ptr"

        result := ComCall(7, this, "double", offset, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} offset 
     * @param {Pointer<Float>} velocity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationinterpolator-interpolatevelocity
     */
    InterpolateVelocity(offset, velocity) {
        velocityMarshal := velocity is VarRef ? "double*" : "ptr"

        result := ComCall(8, this, "double", offset, velocityMarshal, velocity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} initialValueDependencies 
     * @param {Pointer<Integer>} initialVelocityDependencies 
     * @param {Pointer<Integer>} durationDependencies 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationinterpolator-getdependencies
     */
    GetDependencies(initialValueDependencies, initialVelocityDependencies, durationDependencies) {
        initialValueDependenciesMarshal := initialValueDependencies is VarRef ? "int*" : "ptr"
        initialVelocityDependenciesMarshal := initialVelocityDependencies is VarRef ? "int*" : "ptr"
        durationDependenciesMarshal := durationDependencies is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, initialValueDependenciesMarshal, initialValueDependencies, initialVelocityDependenciesMarshal, initialVelocityDependencies, durationDependenciesMarshal, durationDependencies, "HRESULT")
        return result
    }
}
