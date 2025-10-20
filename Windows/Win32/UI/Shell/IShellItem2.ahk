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
     * 
     * @param {Integer} flags 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetPropertyStore(flags, riid, ppv) {
        result := ComCall(8, this, "int", flags, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Pointer<IUnknown>} punkCreateObject 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetPropertyStoreWithCreateObject(flags, punkCreateObject, riid, ppv) {
        result := ComCall(9, this, "int", flags, "ptr", punkCreateObject, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} rgKeys 
     * @param {Integer} cKeys 
     * @param {Integer} flags 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetPropertyStoreForKeys(rgKeys, cKeys, flags, riid, ppv) {
        result := ComCall(10, this, "ptr", rgKeys, "uint", cKeys, "int", flags, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} keyType 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetPropertyDescriptionList(keyType, riid, ppv) {
        result := ComCall(11, this, "ptr", keyType, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBindCtx>} pbc 
     * @returns {HRESULT} 
     */
    Update(pbc) {
        result := ComCall(12, this, "ptr", pbc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @returns {HRESULT} 
     */
    GetProperty(key, ppropvar) {
        result := ComCall(13, this, "ptr", key, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Guid>} pclsid 
     * @returns {HRESULT} 
     */
    GetCLSID(key, pclsid) {
        result := ComCall(14, this, "ptr", key, "ptr", pclsid, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(15, this, "ptr", key, "ptr", pft, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Int32>} pi 
     * @returns {HRESULT} 
     */
    GetInt32(key, pi) {
        result := ComCall(16, this, "ptr", key, "int*", pi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PWSTR>} ppsz 
     * @returns {HRESULT} 
     */
    GetString(key, ppsz) {
        result := ComCall(17, this, "ptr", key, "ptr", ppsz, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<UInt32>} pui 
     * @returns {HRESULT} 
     */
    GetUInt32(key, pui) {
        result := ComCall(18, this, "ptr", key, "uint*", pui, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<UInt64>} pull 
     * @returns {HRESULT} 
     */
    GetUInt64(key, pull) {
        result := ComCall(19, this, "ptr", key, "uint*", pull, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<BOOL>} pf 
     * @returns {HRESULT} 
     */
    GetBool(key, pf) {
        result := ComCall(20, this, "ptr", key, "ptr", pf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
