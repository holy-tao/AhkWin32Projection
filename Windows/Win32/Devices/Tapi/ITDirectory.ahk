#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDirectory interface is exposed by the Directory object, which corresponds to a particular directory.
 * @see https://docs.microsoft.com/windows/win32/api//rend/nn-rend-itdirectory
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITDirectory extends IDispatch{
    /**
     * The interface identifier for ITDirectory
     * @type {Guid}
     */
    static IID => Guid("{34621d6c-6cff-11d1-aff7-00c04fc31fee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} pDirectoryType 
     * @returns {HRESULT} 
     */
    get_DirectoryType(pDirectoryType) {
        result := ComCall(7, this, "int*", pDirectoryType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     */
    get_DisplayName(pName) {
        result := ComCall(8, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfDynamic 
     * @returns {HRESULT} 
     */
    get_IsDynamic(pfDynamic) {
        result := ComCall(9, this, "ptr", pfDynamic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTTL 
     * @returns {HRESULT} 
     */
    get_DefaultObjectTTL(pTTL) {
        result := ComCall(10, this, "int*", pTTL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} TTL 
     * @returns {HRESULT} 
     */
    put_DefaultObjectTTL(TTL) {
        result := ComCall(11, this, "int", TTL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnable 
     * @returns {HRESULT} 
     */
    EnableAutoRefresh(fEnable) {
        result := ComCall(12, this, "short", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fSecure 
     * @returns {HRESULT} 
     */
    Connect(fSecure) {
        result := ComCall(13, this, "short", fSecure, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pDomainName 
     * @param {BSTR} pUserName 
     * @param {BSTR} pPassword 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    Bind(pDomainName, pUserName, pPassword, lFlags) {
        pDomainName := pDomainName is String ? BSTR.Alloc(pDomainName).Value : pDomainName
        pUserName := pUserName is String ? BSTR.Alloc(pUserName).Value : pUserName
        pPassword := pPassword is String ? BSTR.Alloc(pPassword).Value : pPassword

        result := ComCall(14, this, "ptr", pDomainName, "ptr", pUserName, "ptr", pPassword, "int", lFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITDirectoryObject>} pDirectoryObject 
     * @returns {HRESULT} 
     */
    AddDirectoryObject(pDirectoryObject) {
        result := ComCall(15, this, "ptr", pDirectoryObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITDirectoryObject>} pDirectoryObject 
     * @returns {HRESULT} 
     */
    ModifyDirectoryObject(pDirectoryObject) {
        result := ComCall(16, this, "ptr", pDirectoryObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITDirectoryObject>} pDirectoryObject 
     * @returns {HRESULT} 
     */
    RefreshDirectoryObject(pDirectoryObject) {
        result := ComCall(17, this, "ptr", pDirectoryObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITDirectoryObject>} pDirectoryObject 
     * @returns {HRESULT} 
     */
    DeleteDirectoryObject(pDirectoryObject) {
        result := ComCall(18, this, "ptr", pDirectoryObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DirectoryObjectType 
     * @param {BSTR} pName 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_DirectoryObjects(DirectoryObjectType, pName, pVariant) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(19, this, "int", DirectoryObjectType, "ptr", pName, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DirectoryObjectType 
     * @param {BSTR} pName 
     * @param {Pointer<IEnumDirectoryObject>} ppEnumObject 
     * @returns {HRESULT} 
     */
    EnumerateDirectoryObjects(DirectoryObjectType, pName, ppEnumObject) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(20, this, "int", DirectoryObjectType, "ptr", pName, "ptr", ppEnumObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
