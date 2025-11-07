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
     * 
     * @param {Integer} flags 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystore
     */
    GetPropertyStore(flags, riid) {
        result := ComCall(8, this, "int", flags, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {IUnknown} punkCreateObject 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystorewithcreateobject
     */
    GetPropertyStoreWithCreateObject(flags, punkCreateObject, riid) {
        result := ComCall(9, this, "int", flags, "ptr", punkCreateObject, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} rgKeys 
     * @param {Integer} cKeys 
     * @param {Integer} flags 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystoreforkeys
     */
    GetPropertyStoreForKeys(rgKeys, cKeys, flags, riid) {
        result := ComCall(10, this, "ptr", rgKeys, "uint", cKeys, "int", flags, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} keyType 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertydescriptionlist
     */
    GetPropertyDescriptionList(keyType, riid) {
        result := ComCall(11, this, "ptr", keyType, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {IBindCtx} pbc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-update
     */
    Update(pbc) {
        result := ComCall(12, this, "ptr", pbc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getproperty
     */
    GetProperty(key) {
        ppropvar := PROPVARIANT()
        result := ComCall(13, this, "ptr", key, "ptr", ppropvar, "HRESULT")
        return ppropvar
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getclsid
     */
    GetCLSID(key) {
        pclsid := Guid()
        result := ComCall(14, this, "ptr", key, "ptr", pclsid, "HRESULT")
        return pclsid
    }

    /**
     * Retrieves the date and time that a file or directory was created, last accessed, and last modified.
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {FILETIME} 
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-getfiletime
     */
    GetFileTime(key) {
        pft := FILETIME()
        result := ComCall(15, this, "ptr", key, "ptr", pft, "HRESULT")
        return pft
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getint32
     */
    GetInt32(key) {
        result := ComCall(16, this, "ptr", key, "int*", &pi := 0, "HRESULT")
        return pi
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getstring
     */
    GetString(key) {
        result := ComCall(17, this, "ptr", key, "ptr*", &ppsz := 0, "HRESULT")
        return ppsz
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getuint32
     */
    GetUInt32(key) {
        result := ComCall(18, this, "ptr", key, "uint*", &pui := 0, "HRESULT")
        return pui
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getuint64
     */
    GetUInt64(key) {
        result := ComCall(19, this, "ptr", key, "uint*", &pull := 0, "HRESULT")
        return pull
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getbool
     */
    GetBool(key) {
        result := ComCall(20, this, "ptr", key, "int*", &pf := 0, "HRESULT")
        return pf
    }
}
