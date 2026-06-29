#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\IErrorLog.ahk" { IErrorLog }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PROPBAG2.ahk" { PROPBAG2 }
#Import "..\IUnknown.ahk" { IUnknown }
#Import "..\..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct IPropertyBag2 extends IUnknown {
    /**
     * The interface identifier for IPropertyBag2
     * @type {Guid}
     */
    static IID := Guid("{22f55882-280b-11d0-a8a9-00a0c90c2004}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyBag2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Read            : IntPtr
        Write           : IntPtr
        CountProperties : IntPtr
        GetPropertyInfo : IntPtr
        LoadObject      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyBag2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cProperties 
     * @param {Pointer<PROPBAG2>} pPropBag 
     * @param {IErrorLog} pErrLog 
     * @param {Pointer<HRESULT>} phrError 
     * @returns {VARIANT} 
     */
    Read(cProperties, pPropBag, pErrLog, phrError) {
        phrErrorMarshal := phrError is VarRef ? "int*" : "ptr"

        pvarValue := VARIANT()
        result := ComCall(3, this, "uint", cProperties, PROPBAG2.Ptr, pPropBag, "ptr", pErrLog, VARIANT.Ptr, pvarValue, phrErrorMarshal, phrError, "HRESULT")
        return pvarValue
    }

    /**
     * 
     * @param {Integer} cProperties 
     * @param {Pointer<PROPBAG2>} pPropBag 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    Write(cProperties, pPropBag, pvarValue) {
        result := ComCall(4, this, "uint", cProperties, PROPBAG2.Ptr, pPropBag, VARIANT.Ptr, pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    CountProperties() {
        result := ComCall(5, this, "uint*", &pcProperties := 0, "HRESULT")
        return pcProperties
    }

    /**
     * The GetPropertyInfo function returns a pointer to the property information of a given protocol.
     * @remarks
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetPropertyInfo** function.
     * @param {Integer} iProperty 
     * @param {Integer} cProperties 
     * @param {Pointer<PROPBAG2>} pPropBag 
     * @param {Pointer<Integer>} pcProperties 
     * @returns {HRESULT} If the function is successful, the return value is a pointer to the property.
     * 
     * If the function is unsuccessful, the return value is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getpropertyinfo
     */
    GetPropertyInfo(iProperty, cProperties, pPropBag, pcProperties) {
        pcPropertiesMarshal := pcProperties is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", iProperty, "uint", cProperties, PROPBAG2.Ptr, pPropBag, pcPropertiesMarshal, pcProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pstrName 
     * @param {Integer} dwHint 
     * @param {IUnknown} pUnkObject 
     * @param {IErrorLog} pErrLog 
     * @returns {HRESULT} 
     */
    LoadObject(pstrName, dwHint, pUnkObject, pErrLog) {
        pstrName := pstrName is String ? StrPtr(pstrName) : pstrName

        result := ComCall(7, this, "ptr", pstrName, "uint", dwHint, "ptr", pUnkObject, "ptr", pErrLog, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPropertyBag2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Read := CallbackCreate(GetMethod(implObj, "Read"), flags, 6)
        this.vtbl.Write := CallbackCreate(GetMethod(implObj, "Write"), flags, 4)
        this.vtbl.CountProperties := CallbackCreate(GetMethod(implObj, "CountProperties"), flags, 2)
        this.vtbl.GetPropertyInfo := CallbackCreate(GetMethod(implObj, "GetPropertyInfo"), flags, 5)
        this.vtbl.LoadObject := CallbackCreate(GetMethod(implObj, "LoadObject"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Read)
        CallbackFree(this.vtbl.Write)
        CallbackFree(this.vtbl.CountProperties)
        CallbackFree(this.vtbl.GetPropertyInfo)
        CallbackFree(this.vtbl.LoadObject)
    }
}
