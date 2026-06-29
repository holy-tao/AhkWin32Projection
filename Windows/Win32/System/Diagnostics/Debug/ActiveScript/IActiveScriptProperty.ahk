#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptProperty extends IUnknown {
    /**
     * The interface identifier for IActiveScriptProperty
     * @type {Guid}
     */
    static IID := Guid("{4954e0d0-fbc7-11d1-8410-006008c3fbfc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptProperty interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperty : IntPtr
        SetProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptProperty.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetProperty function returns a handle to a given property.
     * @remarks
     * The **GetProperty** function can be used to obtain the property handle needed to locate instances of the property. The functions used to locate property instances are [FindPropertyInstance](findpropertyinstance.md) (which locates the first instance) and [FindPropertyInstanceRestart](findpropertyinstancerestart.md) (which locates the next instance).
     * 
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetProperty** function.
     * @param {Integer} dwProperty 
     * @param {Pointer<VARIANT>} pvarIndex 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getproperty
     */
    GetProperty(dwProperty, pvarIndex) {
        pvarValue := VARIANT()
        result := ComCall(3, this, "uint", dwProperty, VARIANT.Ptr, pvarIndex, VARIANT.Ptr, pvarValue, "HRESULT")
        return pvarValue
    }

    /**
     * 
     * @param {Integer} dwProperty 
     * @param {Pointer<VARIANT>} pvarIndex 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    SetProperty(dwProperty, pvarIndex, pvarValue) {
        result := ComCall(4, this, "uint", dwProperty, VARIANT.Ptr, pvarIndex, VARIANT.Ptr, pvarValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 4)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.SetProperty)
    }
}
