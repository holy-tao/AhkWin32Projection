#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\ExpressionAnimation.ahk
#Include ..\ScalarNaturalMotionAnimation.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IInteractionTrackerInertiaNaturalMotion extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInteractionTrackerInertiaNaturalMotion
     * @type {Guid}
     */
    static IID => Guid("{70acdaae-27dc-48ed-a3c3-6d61c9a029d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Condition", "put_Condition", "get_NaturalMotion", "put_NaturalMotion"]

    /**
     * @type {ExpressionAnimation} 
     */
    Condition {
        get => this.get_Condition()
        set => this.put_Condition(value)
    }

    /**
     * @type {ScalarNaturalMotionAnimation} 
     */
    NaturalMotion {
        get => this.get_NaturalMotion()
        set => this.put_NaturalMotion(value)
    }

    /**
     * 
     * @returns {ExpressionAnimation} 
     */
    get_Condition() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ExpressionAnimation(value)
    }

    /**
     * 
     * @param {ExpressionAnimation} value 
     * @returns {HRESULT} 
     */
    put_Condition(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ScalarNaturalMotionAnimation} 
     */
    get_NaturalMotion() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ScalarNaturalMotionAnimation(value)
    }

    /**
     * 
     * @param {ScalarNaturalMotionAnimation} value 
     * @returns {HRESULT} 
     */
    put_NaturalMotion(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
