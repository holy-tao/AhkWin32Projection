#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostExtensibility extends IUnknown{
    /**
     * The interface identifier for IDebugHostExtensibility
     * @type {Guid}
     */
    static IID => Guid("{3c2b24e1-11d0-4f86-8ae5-4df166f73253}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} aliasName 
     * @param {Pointer<IModelObject>} functionObject 
     * @returns {HRESULT} 
     */
    CreateFunctionAlias(aliasName, functionObject) {
        aliasName := aliasName is String ? StrPtr(aliasName) : aliasName

        result := ComCall(3, this, "ptr", aliasName, "ptr", functionObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} aliasName 
     * @returns {HRESULT} 
     */
    DestroyFunctionAlias(aliasName) {
        aliasName := aliasName is String ? StrPtr(aliasName) : aliasName

        result := ComCall(4, this, "ptr", aliasName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
