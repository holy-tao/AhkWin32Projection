#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScriptDebugStackFrame extends IUnknown{
    /**
     * The interface identifier for IDataModelScriptDebugStackFrame
     * @type {Guid}
     */
    static IID => Guid("{dec6ed5e-6360-4941-ab4c-a26409de4f82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    GetName(name) {
        result := ComCall(3, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ScriptDebugPosition>} position 
     * @param {Pointer<ScriptDebugPosition>} positionSpanEnd 
     * @param {Pointer<BSTR>} lineText 
     * @returns {HRESULT} 
     */
    GetPosition(position, positionSpanEnd, lineText) {
        result := ComCall(4, this, "ptr", position, "ptr", positionSpanEnd, "ptr", lineText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} isTransitionPoint 
     * @returns {HRESULT} 
     */
    IsTransitionPoint(isTransitionPoint) {
        result := ComCall(5, this, "int*", isTransitionPoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataModelScript>} transitionScript 
     * @param {Pointer<Boolean>} isTransitionContiguous 
     * @returns {HRESULT} 
     */
    GetTransition(transitionScript, isTransitionContiguous) {
        result := ComCall(6, this, "ptr", transitionScript, "int*", isTransitionContiguous, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszExpression 
     * @param {Pointer<IModelObject>} ppResult 
     * @returns {HRESULT} 
     */
    Evaluate(pwszExpression, ppResult) {
        pwszExpression := pwszExpression is String ? StrPtr(pwszExpression) : pwszExpression

        result := ComCall(7, this, "ptr", pwszExpression, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataModelScriptDebugVariableSetEnumerator>} variablesEnum 
     * @returns {HRESULT} 
     */
    EnumerateLocals(variablesEnum) {
        result := ComCall(8, this, "ptr", variablesEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataModelScriptDebugVariableSetEnumerator>} variablesEnum 
     * @returns {HRESULT} 
     */
    EnumerateArguments(variablesEnum) {
        result := ComCall(9, this, "ptr", variablesEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
