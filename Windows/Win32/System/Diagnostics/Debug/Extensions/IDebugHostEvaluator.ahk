#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostEvaluator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostEvaluator
     * @type {Guid}
     */
    static IID => Guid("{0fef9a21-577e-4997-ac7b-1c4883241d99}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EvaluateExpression", "EvaluateExtendedExpression"]

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {PWSTR} expression 
     * @param {IModelObject} bindingContext 
     * @param {Pointer<IModelObject>} result 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    EvaluateExpression(context, expression, bindingContext, result, metadata) {
        expression := expression is String ? StrPtr(expression) : expression

        result := ComCall(3, this, "ptr", context, "ptr", expression, "ptr", bindingContext, "ptr*", result, "ptr*", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {PWSTR} expression 
     * @param {IModelObject} bindingContext 
     * @param {Pointer<IModelObject>} result 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    EvaluateExtendedExpression(context, expression, bindingContext, result, metadata) {
        expression := expression is String ? StrPtr(expression) : expression

        result := ComCall(4, this, "ptr", context, "ptr", expression, "ptr", bindingContext, "ptr*", result, "ptr*", metadata, "HRESULT")
        return result
    }
}
