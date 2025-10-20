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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DirectoryType", "get_DisplayName", "get_IsDynamic", "get_DefaultObjectTTL", "put_DefaultObjectTTL", "EnableAutoRefresh", "Connect", "Bind", "AddDirectoryObject", "ModifyDirectoryObject", "RefreshDirectoryObject", "DeleteDirectoryObject", "get_DirectoryObjects", "EnumerateDirectoryObjects"]

    /**
     * 
     * @param {Pointer<Integer>} pDirectoryType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-get_directorytype
     */
    get_DirectoryType(pDirectoryType) {
        result := ComCall(7, this, "int*", pDirectoryType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-get_displayname
     */
    get_DisplayName(pName) {
        result := ComCall(8, this, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfDynamic 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-get_isdynamic
     */
    get_IsDynamic(pfDynamic) {
        result := ComCall(9, this, "ptr", pfDynamic, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTTL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-get_defaultobjectttl
     */
    get_DefaultObjectTTL(pTTL) {
        result := ComCall(10, this, "int*", pTTL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} TTL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-put_defaultobjectttl
     */
    put_DefaultObjectTTL(TTL) {
        result := ComCall(11, this, "int", TTL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-enableautorefresh
     */
    EnableAutoRefresh(fEnable) {
        result := ComCall(12, this, "short", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fSecure 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-connect
     */
    Connect(fSecure) {
        result := ComCall(13, this, "short", fSecure, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pDomainName 
     * @param {BSTR} pUserName 
     * @param {BSTR} pPassword 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-bind
     */
    Bind(pDomainName, pUserName, pPassword, lFlags) {
        pDomainName := pDomainName is String ? BSTR.Alloc(pDomainName).Value : pDomainName
        pUserName := pUserName is String ? BSTR.Alloc(pUserName).Value : pUserName
        pPassword := pPassword is String ? BSTR.Alloc(pPassword).Value : pPassword

        result := ComCall(14, this, "ptr", pDomainName, "ptr", pUserName, "ptr", pPassword, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITDirectoryObject} pDirectoryObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-adddirectoryobject
     */
    AddDirectoryObject(pDirectoryObject) {
        result := ComCall(15, this, "ptr", pDirectoryObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITDirectoryObject} pDirectoryObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-modifydirectoryobject
     */
    ModifyDirectoryObject(pDirectoryObject) {
        result := ComCall(16, this, "ptr", pDirectoryObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITDirectoryObject} pDirectoryObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-refreshdirectoryobject
     */
    RefreshDirectoryObject(pDirectoryObject) {
        result := ComCall(17, this, "ptr", pDirectoryObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITDirectoryObject} pDirectoryObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-deletedirectoryobject
     */
    DeleteDirectoryObject(pDirectoryObject) {
        result := ComCall(18, this, "ptr", pDirectoryObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DirectoryObjectType 
     * @param {BSTR} pName 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-get_directoryobjects
     */
    get_DirectoryObjects(DirectoryObjectType, pName, pVariant) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(19, this, "int", DirectoryObjectType, "ptr", pName, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DirectoryObjectType 
     * @param {BSTR} pName 
     * @param {Pointer<IEnumDirectoryObject>} ppEnumObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectory-enumeratedirectoryobjects
     */
    EnumerateDirectoryObjects(DirectoryObjectType, pName, ppEnumObject) {
        pName := pName is String ? BSTR.Alloc(pName).Value : pName

        result := ComCall(20, this, "int", DirectoryObjectType, "ptr", pName, "ptr*", ppEnumObject, "HRESULT")
        return result
    }
}
