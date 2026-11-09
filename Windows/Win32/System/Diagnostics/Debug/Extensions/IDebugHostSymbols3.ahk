#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk
#Include ..\..\..\..\Foundation\PWSTR.ahk
#Include .\IDebugHostModuleSignature.ahk
#Include .\IDebugHostSymbols2.ahk
#Include .\IDebugHostTypeSignature.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class IDebugHostSymbols3 extends IDebugHostSymbols2 {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostSymbols3
     * @type {Guid}
     */
    static IID => Guid("{8535e318-4f4b-4ace-a21b-af9e134a4e9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateModuleSignature2", "CreateTypeSignatureForModuleRange2"]

    /**
     * @param {PWSTR} pwszModuleName 
     * @param {Integer} allowLooseNameMatch 
     * @param {PWSTR} pwszMinVersion 
     * @param {PWSTR} pwszMaxVersion 
     * @returns {IDebugHostModuleSignature} 
     */
    CreateModuleSignature2(pwszModuleName, allowLooseNameMatch, pwszMinVersion, pwszMaxVersion) {
        pwszModuleName := pwszModuleName is String ? StrPtr(pwszModuleName) : pwszModuleName
        pwszMinVersion := pwszMinVersion is String ? StrPtr(pwszMinVersion) : pwszMinVersion
        pwszMaxVersion := pwszMaxVersion is String ? StrPtr(pwszMaxVersion) : pwszMaxVersion

        result := ComCall(11, this, "ptr", pwszModuleName, "char", allowLooseNameMatch, "ptr", pwszMinVersion, "ptr", pwszMaxVersion, "ptr*", &ppModuleSignature := 0, "HRESULT")
        return IDebugHostModuleSignature(ppModuleSignature)
    }

    /**
     * @param {PWSTR} signatureSpecification 
     * @param {PWSTR} moduleName 
     * @param {Integer} allowLooseNameMatch 
     * @param {PWSTR} minVersion 
     * @param {PWSTR} maxVersion 
     * @returns {IDebugHostTypeSignature} 
     */
    CreateTypeSignatureForModuleRange2(signatureSpecification, moduleName, allowLooseNameMatch, minVersion, maxVersion) {
        signatureSpecification := signatureSpecification is String ? StrPtr(signatureSpecification) : signatureSpecification
        moduleName := moduleName is String ? StrPtr(moduleName) : moduleName
        minVersion := minVersion is String ? StrPtr(minVersion) : minVersion
        maxVersion := maxVersion is String ? StrPtr(maxVersion) : maxVersion

        result := ComCall(12, this, "ptr", signatureSpecification, "ptr", moduleName, "char", allowLooseNameMatch, "ptr", minVersion, "ptr", maxVersion, "ptr*", &typeSignature := 0, "HRESULT")
        return IDebugHostTypeSignature(typeSignature)
    }
}
