#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IBindCtx.ahk" { IBindCtx }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "PropertiesSystem\GETPROPERTYSTOREFLAGS.ahk" { GETPROPERTYSTOREFLAGS }
#Import ".\IShellItem.ahk" { IShellItem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Extends IShellItem with methods that retrieve various property values of the item. IShellItem and IShellItem2 are the preferred representations of items in any new code.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellitem2
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellItem2 extends IShellItem {
    /**
     * The interface identifier for IShellItem2
     * @type {Guid}
     */
    static IID := Guid("{7e9fb0d3-919f-4307-ab2e-9b1860310c93}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellItem2 interfaces
    */
    struct Vtbl extends IShellItem.Vtbl {
        GetPropertyStore                 : IntPtr
        GetPropertyStoreWithCreateObject : IntPtr
        GetPropertyStoreForKeys          : IntPtr
        GetPropertyDescriptionList       : IntPtr
        Update                           : IntPtr
        GetProperty                      : IntPtr
        GetCLSID                         : IntPtr
        GetFileTime                      : IntPtr
        GetInt32                         : IntPtr
        GetString                        : IntPtr
        GetUInt32                        : IntPtr
        GetUInt64                        : IntPtr
        GetBool                          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellItem2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a property store object for specified property store flags.
     * @remarks
     * <div class="alert"><b>Note</b>  When this method is called on a property store for a file, that file is held open for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> object.</div>
     * <div> </div>
     * @param {GETPROPERTYSTOREFLAGS} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a> constants that modify the property store object.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the object to be retrieved.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystore
     */
    GetPropertyStore(flags, riid) {
        result := ComCall(8, this, GETPROPERTYSTOREFLAGS, flags, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Uses the specified ICreateObject instead of CoCreateInstance to create an instance of the property handler associated with the Shell item on which this method is called.
     * @remarks
     * <div class="alert"><b>Note</b>  When this method is called on a property store for a file, that file is held open for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> object.</div>
     * <div> </div>
     * @param {GETPROPERTYSTOREFLAGS} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a> constants that modify the property store object.
     * @param {IUnknown} punkCreateObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to a factory for low-rights creation of type <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-icreateobject">ICreateObject</a>.
     * 
     *                     
     * 
     * The method <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-icreateobject-createobject">CreateObject</a> creates an instance of a COM object. The implementation of <b>IShellItem2::GetPropertyStoreWithCreateObject</b> uses <b>CreateObject</b> instead of <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> to create the property handler, which is a Shell extension, for a given file type. The property handler provides many of the important properties in the property store that this method returns.
     * 
     * This method is useful only if the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-icreateobject">ICreateObject</a> object is created in a separate process (as a LOCALSERVER instead of an INPROCSERVER), and also if this other process has lower rights than the process calling <b>IShellItem2::GetPropertyStoreWithCreateObject</b>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the object to be retrieved.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of the requested <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystorewithcreateobject
     */
    GetPropertyStoreWithCreateObject(flags, punkCreateObject, riid) {
        result := ComCall(9, this, GETPROPERTYSTOREFLAGS, flags, "ptr", punkCreateObject, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets property store object for specified property keys.
     * @remarks
     * <div class="alert"><b>Note</b>  When this method is called on a property store for a file, that file is held open for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> object.
     *       </div>
     * <div> </div>
     * @param {Pointer<PROPERTYKEY>} rgKeys Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structures. Each structure contains a unique identifier for each property used in creating the property store.
     * @param {Integer} cKeys Type: <b>UINT</b>
     * 
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structures in the array pointed to by <i>rgKeys</i>.
     * @param {GETPROPERTYSTOREFLAGS} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a> constants that modify the property store object.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the object to be retrieved.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystoreforkeys
     */
    GetPropertyStoreForKeys(rgKeys, cKeys, flags, riid) {
        result := ComCall(10, this, PROPERTYKEY.Ptr, rgKeys, "uint", cKeys, GETPROPERTYSTOREFLAGS, flags, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets a property description list object given a reference to a property key.
     * @param {Pointer<PROPERTYKEY>} keyType Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to a desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Contains the address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertydescriptionlist
     */
    GetPropertyDescriptionList(keyType, riid) {
        result := ComCall(11, this, PROPERTYKEY.Ptr, keyType, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Ensures that any cached information in this item is updated.
     * @param {IBindCtx} pbc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on a bind context object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise, including ERROR_FILE_NOT_FOUND if the item does not exist.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-update
     */
    Update(pbc) {
        result := ComCall(12, this, "ptr", pbc, "HRESULT")
        return result
    }

    /**
     * Gets a PROPVARIANT structure from a specified property key.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.
     * @returns {PROPVARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getproperty
     */
    GetProperty(key) {
        ppropvar := PROPVARIANT()
        result := ComCall(13, this, PROPERTYKEY.Ptr, key, PROPVARIANT.Ptr, ppropvar, "HRESULT")
        return ppropvar
    }

    /**
     * Gets the class identifier (CLSID) value of specified property key.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.
     * @returns {Guid} Type: <b>CLSID*</b>
     * 
     * A pointer to a CLSID value.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getclsid
     */
    GetCLSID(key) {
        pclsid := Guid()
        result := ComCall(14, this, PROPERTYKEY.Ptr, key, Guid.Ptr, pclsid, "HRESULT")
        return pclsid
    }

    /**
     * Gets the date and time value of a specified property key.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.
     * @returns {FILETIME} Type: <b>FILETIME*</b>
     * 
     * A pointer to a date and time value.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getfiletime
     */
    GetFileTime(key) {
        pft := FILETIME()
        result := ComCall(15, this, PROPERTYKEY.Ptr, key, FILETIME.Ptr, pft, "HRESULT")
        return pft
    }

    /**
     * Gets the Int32 value of specified property key.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to an Int32 value.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getint32
     */
    GetInt32(key) {
        result := ComCall(16, this, PROPERTYKEY.Ptr, key, "int*", &pi := 0, "HRESULT")
        return pi
    }

    /**
     * Gets the string value of a specified property key.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A pointer to a Unicode string value.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getstring
     */
    GetString(key) {
        result := ComCall(17, this, PROPERTYKEY.Ptr, key, PWSTR.Ptr, &ppsz := 0, "HRESULT")
        return ppsz
    }

    /**
     * Gets the UInt32 value of a specified property key.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * Receives a pointer to a UInt32 value.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getuint32
     */
    GetUInt32(key) {
        result := ComCall(18, this, PROPERTYKEY.Ptr, key, "uint*", &pui := 0, "HRESULT")
        return pui
    }

    /**
     * Gets the UInt64 value of a specified property key.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.
     * @returns {Integer} Type: <b>ULONGLONG*</b>
     * 
     * A pointer to a UInt64 value.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getuint64
     */
    GetUInt64(key) {
        result := ComCall(19, this, PROPERTYKEY.Ptr, key, "uint*", &pull := 0, "HRESULT")
        return pull
    }

    /**
     * Gets the boolean value of a specified property key.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structure.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a boolean value.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getbool
     */
    GetBool(key) {
        result := ComCall(20, this, PROPERTYKEY.Ptr, key, BOOL.Ptr, &pf := 0, "HRESULT")
        return pf
    }

    Query(iid) {
        if (IShellItem2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPropertyStore := CallbackCreate(GetMethod(implObj, "GetPropertyStore"), flags, 4)
        this.vtbl.GetPropertyStoreWithCreateObject := CallbackCreate(GetMethod(implObj, "GetPropertyStoreWithCreateObject"), flags, 5)
        this.vtbl.GetPropertyStoreForKeys := CallbackCreate(GetMethod(implObj, "GetPropertyStoreForKeys"), flags, 6)
        this.vtbl.GetPropertyDescriptionList := CallbackCreate(GetMethod(implObj, "GetPropertyDescriptionList"), flags, 4)
        this.vtbl.Update := CallbackCreate(GetMethod(implObj, "Update"), flags, 2)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
        this.vtbl.GetCLSID := CallbackCreate(GetMethod(implObj, "GetCLSID"), flags, 3)
        this.vtbl.GetFileTime := CallbackCreate(GetMethod(implObj, "GetFileTime"), flags, 3)
        this.vtbl.GetInt32 := CallbackCreate(GetMethod(implObj, "GetInt32"), flags, 3)
        this.vtbl.GetString := CallbackCreate(GetMethod(implObj, "GetString"), flags, 3)
        this.vtbl.GetUInt32 := CallbackCreate(GetMethod(implObj, "GetUInt32"), flags, 3)
        this.vtbl.GetUInt64 := CallbackCreate(GetMethod(implObj, "GetUInt64"), flags, 3)
        this.vtbl.GetBool := CallbackCreate(GetMethod(implObj, "GetBool"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPropertyStore)
        CallbackFree(this.vtbl.GetPropertyStoreWithCreateObject)
        CallbackFree(this.vtbl.GetPropertyStoreForKeys)
        CallbackFree(this.vtbl.GetPropertyDescriptionList)
        CallbackFree(this.vtbl.Update)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.GetCLSID)
        CallbackFree(this.vtbl.GetFileTime)
        CallbackFree(this.vtbl.GetInt32)
        CallbackFree(this.vtbl.GetString)
        CallbackFree(this.vtbl.GetUInt32)
        CallbackFree(this.vtbl.GetUInt64)
        CallbackFree(this.vtbl.GetBool)
    }
}
