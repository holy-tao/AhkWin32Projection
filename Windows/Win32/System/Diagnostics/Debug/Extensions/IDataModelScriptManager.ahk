#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDataModelNameBinder.ahk
#Include .\IDataModelScriptProvider.ahk
#Include .\IDataModelScriptProviderEnumerator.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScriptManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelScriptManager
     * @type {Guid}
     */
    static IID => Guid("{6fd11e33-e5ad-410b-8011-68c6bc4bf80d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefaultNameBinder", "RegisterScriptProvider", "UnregisterScriptProvider", "FindProviderForScriptType", "FindProviderForScriptExtension", "EnumerateScriptProviders"]

    /**
     * 
     * @returns {IDataModelNameBinder} 
     */
    GetDefaultNameBinder() {
        result := ComCall(3, this, "ptr*", &ppNameBinder := 0, "HRESULT")
        return IDataModelNameBinder(ppNameBinder)
    }

    /**
     * 
     * @param {IDataModelScriptProvider} provider 
     * @returns {HRESULT} 
     */
    RegisterScriptProvider(provider) {
        result := ComCall(4, this, "ptr", provider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataModelScriptProvider} provider 
     * @returns {HRESULT} 
     */
    UnregisterScriptProvider(provider) {
        result := ComCall(5, this, "ptr", provider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} scriptType 
     * @returns {IDataModelScriptProvider} 
     */
    FindProviderForScriptType(scriptType) {
        scriptType := scriptType is String ? StrPtr(scriptType) : scriptType

        result := ComCall(6, this, "ptr", scriptType, "ptr*", &provider := 0, "HRESULT")
        return IDataModelScriptProvider(provider)
    }

    /**
     * 
     * @param {PWSTR} scriptExtension 
     * @returns {IDataModelScriptProvider} 
     */
    FindProviderForScriptExtension(scriptExtension) {
        scriptExtension := scriptExtension is String ? StrPtr(scriptExtension) : scriptExtension

        result := ComCall(7, this, "ptr", scriptExtension, "ptr*", &provider := 0, "HRESULT")
        return IDataModelScriptProvider(provider)
    }

    /**
     * 
     * @returns {IDataModelScriptProviderEnumerator} 
     */
    EnumerateScriptProviders() {
        result := ComCall(8, this, "ptr*", &enumerator := 0, "HRESULT")
        return IDataModelScriptProviderEnumerator(enumerator)
    }
}
