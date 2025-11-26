#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\IShellItem.ahk

/**
 * Extends IShellItem with methods that retrieve various property values of the item. IShellItem and IShellItem2 are the preferred representations of items in any new code.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellitem2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellItem2 extends IShellItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellItem2
     * @type {Guid}
     */
    static IID => Guid("{7e9fb0d3-919f-4307-ab2e-9b1860310c93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyStore", "GetPropertyStoreWithCreateObject", "GetPropertyStoreForKeys", "GetPropertyDescriptionList", "Update", "GetProperty", "GetCLSID", "GetFileTime", "GetInt32", "GetString", "GetUInt32", "GetUInt64", "GetBool"]

    /**
     * Gets a property store object for specified property store flags.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a> constants that modify the property store object.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the object to be retrieved.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystore
     */
    GetPropertyStore(flags, riid) {
        result := ComCall(8, this, "int", flags, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Uses the specified ICreateObject instead of CoCreateInstance to create an instance of the property handler associated with the Shell item on which this method is called.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystorewithcreateobject
     */
    GetPropertyStoreWithCreateObject(flags, punkCreateObject, riid) {
        result := ComCall(9, this, "int", flags, "ptr", punkCreateObject, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets property store object for specified property keys.
     * @param {Pointer<PROPERTYKEY>} rgKeys Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structures. Each structure contains a unique identifier for each property used in creating the property store.
     * @param {Integer} cKeys Type: <b>UINT</b>
     * 
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> structures in the array pointed to by <i>rgKeys</i>.
     * @param {Integer} flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-getpropertystoreflags">GETPROPERTYSTOREFLAGS</a> constants that modify the property store object.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the object to be retrieved.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertystore">IPropertyStore</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystoreforkeys
     */
    GetPropertyStoreForKeys(rgKeys, cKeys, flags, riid) {
        result := ComCall(10, this, "ptr", rgKeys, "uint", cKeys, "int", flags, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertydescriptionlist
     */
    GetPropertyDescriptionList(keyType, riid) {
        result := ComCall(11, this, "ptr", keyType, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem2-update
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem2-getproperty
     */
    GetProperty(key) {
        ppropvar := PROPVARIANT()
        result := ComCall(13, this, "ptr", key, "ptr", ppropvar, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem2-getclsid
     */
    GetCLSID(key) {
        pclsid := Guid()
        result := ComCall(14, this, "ptr", key, "ptr", pclsid, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem2-getfiletime
     */
    GetFileTime(key) {
        pft := FILETIME()
        result := ComCall(15, this, "ptr", key, "ptr", pft, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem2-getint32
     */
    GetInt32(key) {
        result := ComCall(16, this, "ptr", key, "int*", &pi := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem2-getstring
     */
    GetString(key) {
        result := ComCall(17, this, "ptr", key, "ptr*", &ppsz := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem2-getuint32
     */
    GetUInt32(key) {
        result := ComCall(18, this, "ptr", key, "uint*", &pui := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem2-getuint64
     */
    GetUInt64(key) {
        result := ComCall(19, this, "ptr", key, "uint*", &pull := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitem2-getbool
     */
    GetBool(key) {
        result := ComCall(20, this, "ptr", key, "int*", &pf := 0, "HRESULT")
        return pf
    }
}
