#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostExtensibility.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostExtensibility2 extends IDebugHostExtensibility{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostExtensibility2
     * @type {Guid}
     */
    static IID => Guid("{91cc55e7-2a22-4494-9710-b729dab48f71}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFunctionAliasWithMetadata"]

    /**
     * 
     * @param {PWSTR} aliasName 
     * @param {IModelObject} functionObject 
     * @param {IKeyStore} metadata 
     * @returns {HRESULT} 
     */
    CreateFunctionAliasWithMetadata(aliasName, functionObject, metadata) {
        aliasName := aliasName is String ? StrPtr(aliasName) : aliasName

        result := ComCall(5, this, "ptr", aliasName, "ptr", functionObject, "ptr", metadata, "HRESULT")
        return result
    }
}
