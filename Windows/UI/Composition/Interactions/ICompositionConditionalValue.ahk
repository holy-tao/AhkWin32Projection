#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\ExpressionAnimation.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class ICompositionConditionalValue extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionConditionalValue
     * @type {Guid}
     */
    static IID => Guid("{43250538-eb73-4561-a71d-1a43eaeb7a9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Condition", "put_Condition", "get_Value", "put_Value"]

    /**
     * @type {ExpressionAnimation} 
     */
    Condition {
        get => this.get_Condition()
        set => this.put_Condition(value)
    }

    /**
     * @type {ExpressionAnimation} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
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
     * @returns {ExpressionAnimation} 
     */
    get_Value() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
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
    put_Value(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
