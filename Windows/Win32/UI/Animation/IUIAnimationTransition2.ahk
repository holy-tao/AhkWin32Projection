#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Extends the IUIAnimationTransition interface that defines a transition. An IUIAnimationTransition2 transition determines how an animation variable changes over time in a given dimension.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationtransition2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationTransition2 extends IUnknown{
    /**
     * The interface identifier for IUIAnimationTransition2
     * @type {Guid}
     */
    static IID => Guid("{62ff9123-a85a-4e9b-a218-435a93e268fd}")

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
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    SetInitialValue(value) {
        result := ComCall(4, this, "double", value, "int")
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
    SetInitialVectorValue(value, cDimension) {
        result := ComCall(5, this, "double*", value, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} velocity 
     * @returns {HRESULT} 
     */
    SetInitialVelocity(velocity) {
        result := ComCall(6, this, "double", velocity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} velocity 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     */
    SetInitialVectorVelocity(velocity, cDimension) {
        result := ComCall(7, this, "double*", velocity, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDurationKnown() {
        result := ComCall(8, this, "int")
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
        result := ComCall(9, this, "double*", duration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
