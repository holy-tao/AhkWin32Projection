#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<IDataModelNameBinder>} ppNameBinder 
     * @returns {HRESULT} 
     */
    GetDefaultNameBinder(ppNameBinder) {
        result := ComCall(3, this, "ptr*", ppNameBinder, "HRESULT")
        return result
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
     * @param {Pointer<IDataModelScriptProvider>} provider 
     * @returns {HRESULT} 
     */
    FindProviderForScriptType(scriptType, provider) {
        scriptType := scriptType is String ? StrPtr(scriptType) : scriptType

        result := ComCall(6, this, "ptr", scriptType, "ptr*", provider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} scriptExtension 
     * @param {Pointer<IDataModelScriptProvider>} provider 
     * @returns {HRESULT} 
     */
    FindProviderForScriptExtension(scriptExtension, provider) {
        scriptExtension := scriptExtension is String ? StrPtr(scriptExtension) : scriptExtension

        result := ComCall(7, this, "ptr", scriptExtension, "ptr*", provider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDataModelScriptProviderEnumerator>} enumerator 
     * @returns {HRESULT} 
     */
    EnumerateScriptProviders(enumerator) {
        result := ComCall(8, this, "ptr*", enumerator, "HRESULT")
        return result
    }
}
