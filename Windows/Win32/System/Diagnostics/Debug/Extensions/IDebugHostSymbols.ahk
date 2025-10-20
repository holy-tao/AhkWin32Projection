#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostSymbols extends IUnknown{
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
     * 
     * @param {PWSTR} pwszModuleName 
     * @param {PWSTR} pwszMinVersion 
     * @param {PWSTR} pwszMaxVersion 
     * @param {Pointer<IDebugHostModuleSignature>} ppModuleSignature 
     * @returns {HRESULT} 
     */
    CreateModuleSignature(pwszModuleName, pwszMinVersion, pwszMaxVersion, ppModuleSignature) {
        pwszModuleName := pwszModuleName is String ? StrPtr(pwszModuleName) : pwszModuleName
        pwszMinVersion := pwszMinVersion is String ? StrPtr(pwszMinVersion) : pwszMinVersion
        pwszMaxVersion := pwszMaxVersion is String ? StrPtr(pwszMaxVersion) : pwszMaxVersion

        result := ComCall(3, this, "ptr", pwszModuleName, "ptr", pwszMinVersion, "ptr", pwszMaxVersion, "ptr", ppModuleSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} signatureSpecification 
     * @param {Pointer<IDebugHostModule>} module 
     * @param {Pointer<IDebugHostTypeSignature>} typeSignature 
     * @returns {HRESULT} 
     */
    CreateTypeSignature(signatureSpecification, module, typeSignature) {
        signatureSpecification := signatureSpecification is String ? StrPtr(signatureSpecification) : signatureSpecification

        result := ComCall(4, this, "ptr", signatureSpecification, "ptr", module, "ptr", typeSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} signatureSpecification 
     * @param {PWSTR} moduleName 
     * @param {PWSTR} minVersion 
     * @param {PWSTR} maxVersion 
     * @param {Pointer<IDebugHostTypeSignature>} typeSignature 
     * @returns {HRESULT} 
     */
    CreateTypeSignatureForModuleRange(signatureSpecification, moduleName, minVersion, maxVersion, typeSignature) {
        signatureSpecification := signatureSpecification is String ? StrPtr(signatureSpecification) : signatureSpecification
        moduleName := moduleName is String ? StrPtr(moduleName) : moduleName
        minVersion := minVersion is String ? StrPtr(minVersion) : minVersion
        maxVersion := maxVersion is String ? StrPtr(maxVersion) : maxVersion

        result := ComCall(5, this, "ptr", signatureSpecification, "ptr", moduleName, "ptr", minVersion, "ptr", maxVersion, "ptr", typeSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @param {Pointer<IDebugHostSymbolEnumerator>} moduleEnum 
     * @returns {HRESULT} 
     */
    EnumerateModules(context, moduleEnum) {
        result := ComCall(6, this, "ptr", context, "ptr", moduleEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @param {PWSTR} moduleName 
     * @param {Pointer<IDebugHostModule>} module 
     * @returns {HRESULT} 
     */
    FindModuleByName(context, moduleName, module) {
        moduleName := moduleName is String ? StrPtr(moduleName) : moduleName

        result := ComCall(7, this, "ptr", context, "ptr", moduleName, "ptr", module, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @param {Location} moduleLocation 
     * @param {Pointer<IDebugHostModule>} module 
     * @returns {HRESULT} 
     */
    FindModuleByLocation(context, moduleLocation, module) {
        result := ComCall(8, this, "ptr", context, "ptr", moduleLocation, "ptr", module, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContext>} pContext 
     * @param {Location} location 
     * @param {Pointer<IDebugHostType>} objectType 
     * @param {Pointer<Location>} derivedLocation 
     * @param {Pointer<IDebugHostType>} derivedType 
     * @returns {HRESULT} 
     */
    GetMostDerivedObject(pContext, location, objectType, derivedLocation, derivedType) {
        result := ComCall(9, this, "ptr", pContext, "ptr", location, "ptr", objectType, "ptr", derivedLocation, "ptr", derivedType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
