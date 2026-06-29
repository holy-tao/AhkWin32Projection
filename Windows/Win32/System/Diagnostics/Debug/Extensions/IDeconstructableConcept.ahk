#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IModelObject.ahk" { IModelObject }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDeconstructableConcept extends IUnknown {
    /**
     * The interface identifier for IDeconstructableConcept
     * @type {Guid}
     */
    static IID := Guid("{f798139e-1b2c-4077-8d87-9fa5d044f3eb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDeconstructableConcept interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetConstructableModelName   : IntPtr
        GetConstructorArgumentCount : IntPtr
        GetConstructorArguments     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDeconstructableConcept.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @returns {BSTR} 
     */
    GetConstructableModelName(contextObject) {
        constructableModelName := BSTR.Owned()
        result := ComCall(3, this, "ptr", contextObject, BSTR.Ptr, constructableModelName, "HRESULT")
        return constructableModelName
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @returns {Integer} 
     */
    GetConstructorArgumentCount(contextObject) {
        result := ComCall(4, this, "ptr", contextObject, "uint*", &argCount := 0, "HRESULT")
        return argCount
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Integer} argCount 
     * @returns {IModelObject} 
     */
    GetConstructorArguments(contextObject, argCount) {
        result := ComCall(5, this, "ptr", contextObject, "uint", argCount, "ptr*", &constructorArguments := 0, "HRESULT")
        return IModelObject(constructorArguments)
    }

    Query(iid) {
        if (IDeconstructableConcept.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetConstructableModelName := CallbackCreate(GetMethod(implObj, "GetConstructableModelName"), flags, 3)
        this.vtbl.GetConstructorArgumentCount := CallbackCreate(GetMethod(implObj, "GetConstructorArgumentCount"), flags, 3)
        this.vtbl.GetConstructorArguments := CallbackCreate(GetMethod(implObj, "GetConstructorArguments"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetConstructableModelName)
        CallbackFree(this.vtbl.GetConstructorArgumentCount)
        CallbackFree(this.vtbl.GetConstructorArguments)
    }
}
