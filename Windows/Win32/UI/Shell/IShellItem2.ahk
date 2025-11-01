#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystore
     */
    GetPropertyStore(flags, riid, ppv) {
        result := ComCall(8, this, "int", flags, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {IUnknown} punkCreateObject 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystorewithcreateobject
     */
    GetPropertyStoreWithCreateObject(flags, punkCreateObject, riid, ppv) {
        result := ComCall(9, this, "int", flags, "ptr", punkCreateObject, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} rgKeys 
     * @param {Integer} cKeys 
     * @param {Integer} flags 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertystoreforkeys
     */
    GetPropertyStoreForKeys(rgKeys, cKeys, flags, riid, ppv) {
        result := ComCall(10, this, "ptr", rgKeys, "uint", cKeys, "int", flags, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} keyType 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getpropertydescriptionlist
     */
    GetPropertyDescriptionList(keyType, riid, ppv) {
        result := ComCall(11, this, "ptr", keyType, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
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
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getproperty
     */
    GetProperty(key, ppropvar) {
        result := ComCall(13, this, "ptr", key, "ptr", ppropvar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Guid>} pclsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getclsid
     */
    GetCLSID(key, pclsid) {
        result := ComCall(14, this, "ptr", key, "ptr", pclsid, "HRESULT")
        return result
    }

    /**
     * Retrieves the date and time that a file or directory was created, last accessed, and last modified.
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<FILETIME>} pft 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//fileapi/nf-fileapi-getfiletime
     */
    GetFileTime(key, pft) {
        result := ComCall(15, this, "ptr", key, "ptr", pft, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Integer>} pi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getint32
     */
    GetInt32(key, pi) {
        piMarshal := pi is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, "ptr", key, piMarshal, pi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PWSTR>} ppsz 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getstring
     */
    GetString(key, ppsz) {
        result := ComCall(17, this, "ptr", key, "ptr", ppsz, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Integer>} pui 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getuint32
     */
    GetUInt32(key, pui) {
        puiMarshal := pui is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "ptr", key, puiMarshal, pui, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Integer>} pull 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getuint64
     */
    GetUInt64(key, pull) {
        pullMarshal := pull is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "ptr", key, pullMarshal, pull, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<BOOL>} pf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitem2-getbool
     */
    GetBool(key, pf) {
        result := ComCall(20, this, "ptr", key, "ptr", pf, "HRESULT")
        return result
    }
}
