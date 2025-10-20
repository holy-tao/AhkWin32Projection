#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Extends the IUIAnimationInterpolator interface that defines methods for creating a custom interpolator. IUIAnimationInterpolator2 supports interpolation in a given dimension.
 * @remarks
 * 
  * Client applications can use the transitions provided in  the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransitionlibrary">IUIAnimationTransitionLibrary</a> or<a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransitionlibrary2">IUIAnimationTransitionLibrary2</a> interfaces, or in a library provided by a third party; however, custom transitions can be created by implementing the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationinterpolator">IUIAnimationInterpolator</a> or  <b>IUIAnimationInterpolator2</b> interfaces.
  * 
  * Before Windows Animation can use your custom interpolator, you must wrap it in an object that implements the  <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition">IUIAnimationTransition</a> interface (by calling <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtransitionfactory-createtransition">IUIAnimationTransitionFactory::CreateTransition</a>) or the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition2">IUIAnimationTransition2</a> interface (by calling  <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransitionfactory2">IUIAnimationTransitionFactory2::CreateTransition</a>)  and passing in the custom  interpolator.  After the interpolator wrapper has been created, client applications interact with your interpolator using the <b>IUIAnimationTransition</b> or <b>IUIAnimationTransition2</b> interfaces.
  * 
  * Custom interpolators can be reused across applications, but it is recommended that they be exposed using factory interfaces that return an  <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition">IUIAnimationTransition</a> interface or an <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition2">IUIAnimationTransition2</a> interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationinterpolator2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationInterpolator2 extends IUnknown{
    /**
     * The interface identifier for IUIAnimationInterpolator2
     * @type {Guid}
     */
    static IID => Guid("{ea76aff8-ea22-4a23-a0ef-a6a966703518}")

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
     * @param {Pointer<Double>} initialValue 
     * @param {Pointer<Double>} initialVelocity 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     */
    SetInitialValueAndVelocity(initialValue, initialVelocity, cDimension) {
        result := ComCall(4, this, "double*", initialValue, "double*", initialVelocity, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} duration 
     * @returns {HRESULT} 
     */
    SetDuration(duration) {
        result := ComCall(5, this, "double", duration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} duration 
     * @returns {HRESULT} 
     */
    GetDuration(duration) {
        result := ComCall(6, this, "double*", duration, "int")
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
    GetFinalValue(value, cDimension) {
        result := ComCall(7, this, "double*", value, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} offset 
     * @param {Pointer<Double>} value 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     */
    InterpolateValue(offset, value, cDimension) {
        result := ComCall(8, this, "double", offset, "double*", value, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} offset 
     * @param {Pointer<Double>} velocity 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     */
    InterpolateVelocity(offset, velocity, cDimension) {
        result := ComCall(9, this, "double", offset, "double*", velocity, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAnimationPrimitiveInterpolation>} interpolation 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     */
    GetPrimitiveInterpolation(interpolation, cDimension) {
        result := ComCall(10, this, "ptr", interpolation, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} initialValueDependencies 
     * @param {Pointer<Int32>} initialVelocityDependencies 
     * @param {Pointer<Int32>} durationDependencies 
     * @returns {HRESULT} 
     */
    GetDependencies(initialValueDependencies, initialVelocityDependencies, durationDependencies) {
        result := ComCall(11, this, "int*", initialValueDependencies, "int*", initialVelocityDependencies, "int*", durationDependencies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
