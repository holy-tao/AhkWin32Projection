#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to get an IPropertyStore object.
 * @remarks
 * 
 * This interface is typically obtained through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-bindtoobject">IShellFolder::BindToObject</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-bindtohandler">IShellItem::BindToHandler</a>. It is useful for data source implementers who want to avoid the additional overhead of creating a property store through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystore">IShellItem2::GetPropertyStore</a>. However, <b>IShellItem2::GetPropertyStore</b> is the recommended method to obtain a property store unless you are implementing a data source through a Shell folder extension.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertystorefactory
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyStoreFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyStoreFactory
     * @type {Guid}
     */
    static IID => Guid("{bc110b6d-57e8-4148-a9c6-91015ab2f3a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyStore", "GetPropertyStoreForKeys"]

    /**
     * Gets an IPropertyStore object that corresponds to the supplied flags.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
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
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertystorefactory-getpropertystore
     */
    GetPropertyStore(flags, pUnkFactory, riid) {
        result := ComCall(3, this, "int", flags, "ptr", pUnkFactory, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets an IPropertyStore object, given a set of property keys. This provides an alternative, possibly faster, method of getting an IPropertyStore object compared to calling IPropertyStoreFactory::GetPropertyStore.
     * @param {Pointer<PROPERTYKEY>} rgKeys Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structures.
     * @param {Integer} cKeys Type: <b>UINT</b>
     * 
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structures in the array pointed to by <i>rgKeys</i>.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a> values that modify the store that is returned.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to IID of the object to create.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertystorefactory-getpropertystoreforkeys
     */
    GetPropertyStoreForKeys(rgKeys, cKeys, flags, riid) {
        result := ComCall(4, this, "ptr", rgKeys, "uint", cKeys, "int", flags, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
