#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IUpdate5.ahk" { IUpdate5 }

/**
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateEx extends IUpdate5 {
    /**
     * The interface identifier for IUpdateEx
     * @type {Guid}
     */
    static IID := Guid("{769355a3-c5a0-497c-a606-560a36d2121c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateEx interfaces
    */
    struct Vtbl extends IUpdate5.Vtbl {
        get_ExtendedStaticProperty      : IntPtr
        EvaluateExtendedDynamicProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} propertyName 
     * @returns {VARIANT} 
     */
    get_ExtendedStaticProperty(propertyName) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        retval := VARIANT()
        result := ComCall(60, this, BSTR, propertyName, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} propertyName 
     * @returns {VARIANT} 
     */
    EvaluateExtendedDynamicProperty(propertyName) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        retval := VARIANT()
        result := ComCall(61, this, BSTR, propertyName, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IUpdateEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ExtendedStaticProperty := CallbackCreate(GetMethod(implObj, "get_ExtendedStaticProperty"), flags, 3)
        this.vtbl.EvaluateExtendedDynamicProperty := CallbackCreate(GetMethod(implObj, "EvaluateExtendedDynamicProperty"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ExtendedStaticProperty)
        CallbackFree(this.vtbl.EvaluateExtendedDynamicProperty)
    }
}
