#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INetFwProduct.ahk" { INetFwProduct }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * To access the methods and properties for registering third-party firewall products with Windows Firewall and for enumerating registered products.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwproducts
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwProducts extends IDispatch {
    /**
     * The interface identifier for INetFwProducts
     * @type {Guid}
     */
    static IID := Guid("{39eb36e0-2097-40bd-8af2-63a13b525362}")

    /**
     * The class identifier for NetFwProducts
     * @type {Guid}
     */
    static CLSID := Guid("{cc19079b-8272-4d73-bb70-cdb533527b61}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwProducts interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        Register     : IntPtr
        Item         : IntPtr
        get__NewEnum : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwProducts.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Indicates the number of registered third-party firewall products.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproducts-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * The Register method registers a third-party firewall product.
     * @remarks
     * Registrations only last for the lifetime of the Windows Firewall service. Third-party firewalls calling this API should also have a service dependency on the Windows Firewall service (mpssvc) to make sure that  the service is not unexpectedly stopped, causing all registrations to be  lost.
     * 
     * Registrations are removed when a returned registration object is released by the third-party firewall or when the third-party firewall process exits.
     * 
     * A user mode code module using this API should be linked with the /integritycheck linker flag. This flag sets  <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-image_optional_header32">IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY</a> in the image PE header OptionalHeader.DllCharacteristics field, which  enforces a signature check at load time.  The code module should be digitally signed, consistent with the Authenticode signing procedure.
     * @param {INetFwProduct} product The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwproduct">INetFwProduct</a> object that defines the product to be registered.
     * @returns {IUnknown} The registration handle. The registration will be removed when this object is released.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproducts-register
     */
    Register(product) {
        result := ComCall(8, this, "ptr", product, "ptr*", &registration := 0, "HRESULT")
        return IUnknown(registration)
    }

    /**
     * The Item method returns the product with the specified index if it is in the collection.
     * @param {Integer} index Index of the product to retrieve.
     * @returns {INetFwProduct} Reference to the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwproduct">INetFwProduct</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproducts-item
     */
    Item(index) {
        result := ComCall(9, this, "int", index, "ptr*", &product := 0, "HRESULT")
        return INetFwProduct(product)
    }

    /**
     * Returns an object supporting IEnumVARIANT that can be used to iterate through all the registered third-party firewall products in the collection.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwproducts-get__newenum
     */
    get__NewEnum() {
        result := ComCall(10, this, "ptr*", &newEnum := 0, "HRESULT")
        return IUnknown(newEnum)
    }

    Query(iid) {
        if (INetFwProducts.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.Register := CallbackCreate(GetMethod(implObj, "Register"), flags, 3)
        this.vtbl.Item := CallbackCreate(GetMethod(implObj, "Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.Register)
        CallbackFree(this.vtbl.Item)
        CallbackFree(this.vtbl.get__NewEnum)
    }
}
