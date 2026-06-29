#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that provide an object with a specified property bag in which the object can save its properties.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-inamedpropertybag
 * @namespace Windows.Win32.UI.Shell
 */
export default struct INamedPropertyBag extends IUnknown {
    /**
     * The interface identifier for INamedPropertyBag
     * @type {Guid}
     */
    static IID := Guid("{fb700430-952c-11d1-946f-000000000000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INamedPropertyBag interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReadPropertyNPB   : IntPtr
        WritePropertyNPB  : IntPtr
        RemovePropertyNPB : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INamedPropertyBag.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Causes a property to be read from the named property bag.
     * @param {PWSTR} pszBagname Type: <b>PCWSTR</b>
     * 
     * A pointer to a string that contains the name of the property bag.
     * @param {PWSTR} pszPropName Type: <b>PCWSTR</b>
     * 
     * A pointer to a string that contains the name of the property to be read.
     * @param {Pointer<PROPVARIANT>} pVar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * The address of a <b>VARIANT</b> that, when this method returns successfully, receives the property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-inamedpropertybag-readpropertynpb
     */
    ReadPropertyNPB(pszBagname, pszPropName, pVar) {
        pszBagname := pszBagname is String ? StrPtr(pszBagname) : pszBagname
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(3, this, "ptr", pszBagname, "ptr", pszPropName, PROPVARIANT.Ptr, pVar, "HRESULT")
        return result
    }

    /**
     * Saves a property to the named property bag.
     * @param {PWSTR} pszBagname Type: <b>PCWSTR</b>
     * 
     * A pointer to a string that contains the name of the property bag.
     * @param {PWSTR} pszPropName Type: <b>PCWSTR</b>
     * 
     * A pointer to a string that contains the name of the property to write.
     * @param {Pointer<PROPVARIANT>} pVar Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * A pointer to a <b>VARIANT</b> that holds the new property value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-inamedpropertybag-writepropertynpb
     */
    WritePropertyNPB(pszBagname, pszPropName, pVar) {
        pszBagname := pszBagname is String ? StrPtr(pszBagname) : pszBagname
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(4, this, "ptr", pszBagname, "ptr", pszPropName, PROPVARIANT.Ptr, pVar, "HRESULT")
        return result
    }

    /**
     * Removes a property from a named property bag.
     * @param {PWSTR} pszBagname Type: <b>PCWSTR</b>
     * 
     * A pointer to a string that contains the name of the property bag from which a property is to be removed.
     * @param {PWSTR} pszPropName Type: <b>PCWSTR</b>
     * 
     * A pointer to a string that contains the name of the property to remove.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-inamedpropertybag-removepropertynpb
     */
    RemovePropertyNPB(pszBagname, pszPropName) {
        pszBagname := pszBagname is String ? StrPtr(pszBagname) : pszBagname
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(5, this, "ptr", pszBagname, "ptr", pszPropName, "HRESULT")
        return result
    }

    Query(iid) {
        if (INamedPropertyBag.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReadPropertyNPB := CallbackCreate(GetMethod(implObj, "ReadPropertyNPB"), flags, 4)
        this.vtbl.WritePropertyNPB := CallbackCreate(GetMethod(implObj, "WritePropertyNPB"), flags, 4)
        this.vtbl.RemovePropertyNPB := CallbackCreate(GetMethod(implObj, "RemovePropertyNPB"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReadPropertyNPB)
        CallbackFree(this.vtbl.WritePropertyNPB)
        CallbackFree(this.vtbl.RemovePropertyNPB)
    }
}
