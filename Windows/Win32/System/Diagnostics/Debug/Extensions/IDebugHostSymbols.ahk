#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostModuleSignature.ahk
#Include .\IDebugHostTypeSignature.ahk
#Include .\IDebugHostSymbolEnumerator.ahk
#Include .\IDebugHostModule.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostSymbols extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostSymbols
     * @type {Guid}
     */
    static IID => Guid("{854fd751-c2e1-4eb2-b525-6619cb97a588}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateModuleSignature", "CreateTypeSignature", "CreateTypeSignatureForModuleRange", "EnumerateModules", "FindModuleByName", "FindModuleByLocation", "GetMostDerivedObject"]

    /**
     * 
     * @param {PWSTR} pwszModuleName 
     * @param {PWSTR} pwszMinVersion 
     * @param {PWSTR} pwszMaxVersion 
     * @returns {IDebugHostModuleSignature} 
     */
    CreateModuleSignature(pwszModuleName, pwszMinVersion, pwszMaxVersion) {
        pwszModuleName := pwszModuleName is String ? StrPtr(pwszModuleName) : pwszModuleName
        pwszMinVersion := pwszMinVersion is String ? StrPtr(pwszMinVersion) : pwszMinVersion
        pwszMaxVersion := pwszMaxVersion is String ? StrPtr(pwszMaxVersion) : pwszMaxVersion

        result := ComCall(3, this, "ptr", pwszModuleName, "ptr", pwszMinVersion, "ptr", pwszMaxVersion, "ptr*", &ppModuleSignature := 0, "HRESULT")
        return IDebugHostModuleSignature(ppModuleSignature)
    }

    /**
     * 
     * @param {PWSTR} signatureSpecification 
     * @param {IDebugHostModule} module 
     * @returns {IDebugHostTypeSignature} 
     */
    CreateTypeSignature(signatureSpecification, module) {
        signatureSpecification := signatureSpecification is String ? StrPtr(signatureSpecification) : signatureSpecification

        result := ComCall(4, this, "ptr", signatureSpecification, "ptr", module, "ptr*", &typeSignature := 0, "HRESULT")
        return IDebugHostTypeSignature(typeSignature)
    }

    /**
     * 
     * @param {PWSTR} signatureSpecification 
     * @param {PWSTR} moduleName 
     * @param {PWSTR} minVersion 
     * @param {PWSTR} maxVersion 
     * @returns {IDebugHostTypeSignature} 
     */
    CreateTypeSignatureForModuleRange(signatureSpecification, moduleName, minVersion, maxVersion) {
        signatureSpecification := signatureSpecification is String ? StrPtr(signatureSpecification) : signatureSpecification
        moduleName := moduleName is String ? StrPtr(moduleName) : moduleName
        minVersion := minVersion is String ? StrPtr(minVersion) : minVersion
        maxVersion := maxVersion is String ? StrPtr(maxVersion) : maxVersion

        result := ComCall(5, this, "ptr", signatureSpecification, "ptr", moduleName, "ptr", minVersion, "ptr", maxVersion, "ptr*", &typeSignature := 0, "HRESULT")
        return IDebugHostTypeSignature(typeSignature)
    }

    /**
     * 
     * @param {IDebugHostContext} context 
     * @returns {IDebugHostSymbolEnumerator} 
     */
    EnumerateModules(context) {
        result := ComCall(6, this, "ptr", context, "ptr*", &moduleEnum := 0, "HRESULT")
        return IDebugHostSymbolEnumerator(moduleEnum)
    }

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {PWSTR} moduleName 
     * @returns {IDebugHostModule} 
     */
    FindModuleByName(context, moduleName) {
        moduleName := moduleName is String ? StrPtr(moduleName) : moduleName

        result := ComCall(7, this, "ptr", context, "ptr", moduleName, "ptr*", &module := 0, "HRESULT")
        return IDebugHostModule(module)
    }

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {Location} moduleLocation 
     * @returns {IDebugHostModule} 
     */
    FindModuleByLocation(context, moduleLocation) {
        result := ComCall(8, this, "ptr", context, "ptr", moduleLocation, "ptr*", &module := 0, "HRESULT")
        return IDebugHostModule(module)
    }

    /**
     * 
     * @param {IDebugHostContext} pContext 
     * @param {Location} location 
     * @param {IDebugHostType} objectType 
     * @param {Pointer<Location>} derivedLocation 
     * @param {Pointer<IDebugHostType>} derivedType 
     * @returns {HRESULT} 
     */
    GetMostDerivedObject(pContext, location, objectType, derivedLocation, derivedType) {
        result := ComCall(9, this, "ptr", pContext, "ptr", location, "ptr", objectType, "ptr", derivedLocation, "ptr*", derivedType, "HRESULT")
        return result
    }
}
