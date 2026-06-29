#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostModuleSignature.ahk" { IDebugHostModuleSignature }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDebugHostContext.ahk" { IDebugHostContext }
#Import ".\Location.ahk" { Location }
#Import ".\IDebugHostTypeSignature.ahk" { IDebugHostTypeSignature }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostModule.ahk" { IDebugHostModule }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugHostType.ahk" { IDebugHostType }
#Import ".\IDebugHostSymbolEnumerator.ahk" { IDebugHostSymbolEnumerator }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostSymbols extends IUnknown {
    /**
     * The interface identifier for IDebugHostSymbols
     * @type {Guid}
     */
    static IID := Guid("{854fd751-c2e1-4eb2-b525-6619cb97a588}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostSymbols interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateModuleSignature             : IntPtr
        CreateTypeSignature               : IntPtr
        CreateTypeSignatureForModuleRange : IntPtr
        EnumerateModules                  : IntPtr
        FindModuleByName                  : IntPtr
        FindModuleByLocation              : IntPtr
        GetMostDerivedObject              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostSymbols.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {IDebugHostContext} _context 
     * @returns {IDebugHostSymbolEnumerator} 
     */
    EnumerateModules(_context) {
        result := ComCall(6, this, "ptr", _context, "ptr*", &moduleEnum := 0, "HRESULT")
        return IDebugHostSymbolEnumerator(moduleEnum)
    }

    /**
     * 
     * @param {IDebugHostContext} _context 
     * @param {PWSTR} moduleName 
     * @returns {IDebugHostModule} 
     */
    FindModuleByName(_context, moduleName) {
        moduleName := moduleName is String ? StrPtr(moduleName) : moduleName

        result := ComCall(7, this, "ptr", _context, "ptr", moduleName, "ptr*", &module := 0, "HRESULT")
        return IDebugHostModule(module)
    }

    /**
     * 
     * @param {IDebugHostContext} _context 
     * @param {Location} moduleLocation 
     * @returns {IDebugHostModule} 
     */
    FindModuleByLocation(_context, moduleLocation) {
        result := ComCall(8, this, "ptr", _context, Location, moduleLocation, "ptr*", &module := 0, "HRESULT")
        return IDebugHostModule(module)
    }

    /**
     * 
     * @param {IDebugHostContext} pContext 
     * @param {Location} _location 
     * @param {IDebugHostType} _objectType 
     * @param {Pointer<Location>} derivedLocation 
     * @param {Pointer<IDebugHostType>} derivedType 
     * @returns {HRESULT} 
     */
    GetMostDerivedObject(pContext, _location, _objectType, derivedLocation, derivedType) {
        result := ComCall(9, this, "ptr", pContext, Location, _location, "ptr", _objectType, Location.Ptr, derivedLocation, IDebugHostType.Ptr, derivedType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostSymbols.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateModuleSignature := CallbackCreate(GetMethod(implObj, "CreateModuleSignature"), flags, 5)
        this.vtbl.CreateTypeSignature := CallbackCreate(GetMethod(implObj, "CreateTypeSignature"), flags, 4)
        this.vtbl.CreateTypeSignatureForModuleRange := CallbackCreate(GetMethod(implObj, "CreateTypeSignatureForModuleRange"), flags, 6)
        this.vtbl.EnumerateModules := CallbackCreate(GetMethod(implObj, "EnumerateModules"), flags, 3)
        this.vtbl.FindModuleByName := CallbackCreate(GetMethod(implObj, "FindModuleByName"), flags, 4)
        this.vtbl.FindModuleByLocation := CallbackCreate(GetMethod(implObj, "FindModuleByLocation"), flags, 4)
        this.vtbl.GetMostDerivedObject := CallbackCreate(GetMethod(implObj, "GetMostDerivedObject"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateModuleSignature)
        CallbackFree(this.vtbl.CreateTypeSignature)
        CallbackFree(this.vtbl.CreateTypeSignatureForModuleRange)
        CallbackFree(this.vtbl.EnumerateModules)
        CallbackFree(this.vtbl.FindModuleByName)
        CallbackFree(this.vtbl.FindModuleByLocation)
        CallbackFree(this.vtbl.GetMostDerivedObject)
    }
}
