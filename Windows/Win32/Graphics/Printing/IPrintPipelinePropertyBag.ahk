#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintPipelinePropertyBag extends IUnknown {
    /**
     * The interface identifier for IPrintPipelinePropertyBag
     * @type {Guid}
     */
    static IID := Guid("{8b8c99dc-7892-4a95-8a04-57422e9fbb47}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintPipelinePropertyBag interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddProperty    : IntPtr
        GetProperty    : IntPtr
        DeleteProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintPipelinePropertyBag.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<VARIANT>} pVar 
     * @returns {HRESULT} 
     */
    AddProperty(pszName, pVar) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pszName, VARIANT.Ptr, pVar, "HRESULT")
        return result
    }

    /**
     * The GetProperty function returns a handle to a given property.
     * @remarks
     * The **GetProperty** function can be used to obtain the property handle needed to locate instances of the property. The functions used to locate property instances are [FindPropertyInstance](findpropertyinstance.md) (which locates the first instance) and [FindPropertyInstanceRestart](findpropertyinstancerestart.md) (which locates the next instance).
     * 
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetProperty** function.
     * @param {PWSTR} pszName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getproperty
     */
    GetProperty(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pVar := VARIANT()
        result := ComCall(4, this, "ptr", pszName, VARIANT.Ptr, pVar, "HRESULT")
        return pVar
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {BOOL} 
     */
    DeleteProperty(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, BOOL)
        return result
    }

    Query(iid) {
        if (IPrintPipelinePropertyBag.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddProperty := CallbackCreate(GetMethod(implObj, "AddProperty"), flags, 3)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
        this.vtbl.DeleteProperty := CallbackCreate(GetMethod(implObj, "DeleteProperty"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddProperty)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.DeleteProperty)
    }
}
