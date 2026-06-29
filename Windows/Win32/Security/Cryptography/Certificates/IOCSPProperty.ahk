#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Represents a name-value pair for OCSPServiceProperties or ProviderProperties.
 * @see https://learn.microsoft.com/windows/win32/api/certadm/nn-certadm-iocspproperty
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IOCSPProperty extends IDispatch {
    /**
     * The interface identifier for IOCSPProperty
     * @type {Guid}
     */
    static IID := Guid("{66fb7839-5f04-4c25-ad18-9ff1a8376ee0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOCSPProperty interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name     : IntPtr
        get_Value    : IntPtr
        put_Value    : IntPtr
        get_Modified : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOCSPProperty.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Modified {
        get => this.get_Modified()
    }

    /**
     * Gets the identifier part of the name-value pair represented by an OCSPProperty object.
     * @remarks
     * For possible values of <i>pVal</i>, see <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspadmin-get_ocspserviceproperties">OCSPServiceProperties</a> or <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspcaconfiguration-get_providerproperties">ProviderProperties</a>.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspproperty-get_name
     */
    get_Name() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets the data part of the name-value pair represented by an OCSPProperty object. (Get)
     * @remarks
     * For possible values of <i>newVal</i> and <i>pVal</i>, see <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspadmin-get_ocspserviceproperties">OCSPServiceProperties</a> or <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspcaconfiguration-get_providerproperties">ProviderProperties</a>.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspproperty-get_value
     */
    get_Value() {
        pVal := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets or sets the data part of the name-value pair represented by an OCSPProperty object. (Put)
     * @remarks
     * For possible values of <i>newVal</i> and <i>pVal</i>, see <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspadmin-get_ocspserviceproperties">OCSPServiceProperties</a> or <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspcaconfiguration-get_providerproperties">ProviderProperties</a>.
     * @param {VARIANT} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspproperty-put_value
     */
    put_Value(newVal) {
        result := ComCall(9, this, VARIANT, newVal, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether an OCSPProperty object has been modified since it was instantiated.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspproperty-get_modified
     */
    get_Modified() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    Query(iid) {
        if (IOCSPProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.put_Value := CallbackCreate(GetMethod(implObj, "put_Value"), flags, 2)
        this.vtbl.get_Modified := CallbackCreate(GetMethod(implObj, "get_Modified"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Value)
        CallbackFree(this.vtbl.get_Modified)
    }
}
