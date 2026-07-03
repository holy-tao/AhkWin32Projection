#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods for getting and setting the property key.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-iobjectwithpropertykey
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IObjectWithPropertyKey extends IUnknown {
    /**
     * The interface identifier for IObjectWithPropertyKey
     * @type {Guid}
     */
    static IID := Guid("{fc0ca0a7-c316-4fd2-9031-3e628e6d4f23}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectWithPropertyKey interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetPropertyKey : IntPtr
        GetPropertyKey : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectWithPropertyKey.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the property key.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * The property key.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-iobjectwithpropertykey-setpropertykey
     */
    SetPropertyKey(key) {
        result := ComCall(3, this, PROPERTYKEY.Ptr, key, "HRESULT")
        return result
    }

    /**
     * Gets the property key.
     * @returns {PROPERTYKEY} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * When this returns, contains the property key.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-iobjectwithpropertykey-getpropertykey
     */
    GetPropertyKey() {
        pkey := PROPERTYKEY()
        result := ComCall(4, this, PROPERTYKEY.Ptr, pkey, "HRESULT")
        return pkey
    }

    Query(iid) {
        if (IObjectWithPropertyKey.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPropertyKey := CallbackCreate(GetMethod(implObj, "SetPropertyKey"), flags, 2)
        this.vtbl.GetPropertyKey := CallbackCreate(GetMethod(implObj, "GetPropertyKey"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPropertyKey)
        CallbackFree(this.vtbl.GetPropertyKey)
    }
}
