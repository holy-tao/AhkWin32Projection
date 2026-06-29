#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\GETPROPERTYSTOREFLAGS.ahk" { GETPROPERTYSTOREFLAGS }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods to get an IPropertyStore object.
 * @remarks
 * This interface is typically obtained through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-bindtoobject">IShellFolder::BindToObject</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-bindtohandler">IShellItem::BindToHandler</a>. It is useful for data source implementers who want to avoid the additional overhead of creating a property store through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystore">IShellItem2::GetPropertyStore</a>. However, <b>IShellItem2::GetPropertyStore</b> is the recommended method to obtain a property store unless you are implementing a data source through a Shell folder extension.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertystorefactory
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IPropertyStoreFactory extends IUnknown {
    /**
     * The interface identifier for IPropertyStoreFactory
     * @type {Guid}
     */
    static IID := Guid("{bc110b6d-57e8-4148-a9c6-91015ab2f3a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyStoreFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPropertyStore        : IntPtr
        GetPropertyStoreForKeys : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyStoreFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an IPropertyStore object that corresponds to the supplied flags.
     * @remarks
     * It is recommended that you use the IID_PPV_ARGS macro, defined in Objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error.
     * @param {GETPROPERTYSTOREFLAGS} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a> values that modify the store that is returned.
     * @param {IUnknown} pUnkFactory Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * Optional. A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of an object that implements <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-icreateobject">ICreateObject</a>. If <i>pUnkFactory</i> is provided, this method can create the handler instance using <b>ICreateObject</b> rather than <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>, if implemented. The reason to provide <i>pUnkFactory</i> is usually to create the handler in a different process. However, for most users, passing <b>NULL</b> in this parameter is sufficient.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to IID of the object to create.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertystorefactory-getpropertystore
     */
    GetPropertyStore(flags, pUnkFactory, riid) {
        result := ComCall(3, this, GETPROPERTYSTOREFLAGS, flags, "ptr", pUnkFactory, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets an IPropertyStore object, given a set of property keys. This provides an alternative, possibly faster, method of getting an IPropertyStore object compared to calling IPropertyStoreFactory::GetPropertyStore.
     * @remarks
     * It is recommended that you use the IID_PPV_ARGS macro, defined in Objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error.
     * @param {Pointer<PROPERTYKEY>} rgKeys Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structures.
     * @param {Integer} cKeys Type: <b>UINT</b>
     * 
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structures in the array pointed to by <i>rgKeys</i>.
     * @param {GETPROPERTYSTOREFLAGS} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a> values that modify the store that is returned.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to IID of the object to create.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertystorefactory-getpropertystoreforkeys
     */
    GetPropertyStoreForKeys(rgKeys, cKeys, flags, riid) {
        result := ComCall(4, this, PROPERTYKEY.Ptr, rgKeys, "uint", cKeys, GETPROPERTYSTOREFLAGS, flags, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (IPropertyStoreFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPropertyStore := CallbackCreate(GetMethod(implObj, "GetPropertyStore"), flags, 5)
        this.vtbl.GetPropertyStoreForKeys := CallbackCreate(GetMethod(implObj, "GetPropertyStoreForKeys"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPropertyStore)
        CallbackFree(this.vtbl.GetPropertyStoreForKeys)
    }
}
