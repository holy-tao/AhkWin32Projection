#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionColorGradientStop.ahk
#Include .\CompositionLinearGradientBrush.ahk
#Include .\SpringScalarNaturalMotionAnimation.ahk
#Include .\SpringVector2NaturalMotionAnimation.ahk
#Include .\SpringVector3NaturalMotionAnimation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositor4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositor4
     * @type {Guid}
     */
    static IID => Guid("{ae47e78a-7910-4425-a482-a05b758adce9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateColorGradientStop", "CreateColorGradientStopWithOffsetAndColor", "CreateLinearGradientBrush", "CreateSpringScalarAnimation", "CreateSpringVector2Animation", "CreateSpringVector3Animation"]

    /**
     * 
     * @returns {CompositionColorGradientStop} 
     */
    CreateColorGradientStop() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionColorGradientStop(result_)
    }

    /**
     * 
     * @param {Float} offset 
     * @param {Color} color_ 
     * @returns {CompositionColorGradientStop} 
     */
    CreateColorGradientStopWithOffsetAndColor(offset, color_) {
        result := ComCall(7, this, "float", offset, "ptr", color_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionColorGradientStop(result_)
    }

    /**
     * 
     * @returns {CompositionLinearGradientBrush} 
     */
    CreateLinearGradientBrush() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionLinearGradientBrush(result_)
    }

    /**
     * 
     * @returns {SpringScalarNaturalMotionAnimation} 
     */
    CreateSpringScalarAnimation() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpringScalarNaturalMotionAnimation(result_)
    }

    /**
     * 
     * @returns {SpringVector2NaturalMotionAnimation} 
     */
    CreateSpringVector2Animation() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpringVector2NaturalMotionAnimation(result_)
    }

    /**
     * 
     * @returns {SpringVector3NaturalMotionAnimation} 
     */
    CreateSpringVector3Animation() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpringVector3NaturalMotionAnimation(result_)
    }
}
