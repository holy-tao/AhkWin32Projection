#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertAdmin.ahk

/**
 * Provide administration functionality for properly authorized clients.
 * @see https://docs.microsoft.com/windows/win32/api//certadm/nn-certadm-icertadmin2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertAdmin2 extends ICertAdmin{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertAdmin2
     * @type {Guid}
     */
    static IID => Guid("{f7c3ac41-b8ce-4fb4-aa58-3d1dc0e36b39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PublishCRLs", "GetCAProperty", "SetCAProperty", "GetCAPropertyFlags", "GetCAPropertyDisplayName", "GetArchivedKey", "GetConfigEntry", "SetConfigEntry", "ImportKey", "GetMyRoles", "DeleteRow"]

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Float} Date 
     * @param {Integer} CRLFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-publishcrls
     */
    PublishCRLs(strConfig, Date, CRLFlags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(17, this, "ptr", strConfig, "double", Date, "int", CRLFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} PropId 
     * @param {Integer} PropIndex 
     * @param {Integer} PropType 
     * @param {Integer} Flags 
     * @param {Pointer<VARIANT>} pvarPropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-getcaproperty
     */
    GetCAProperty(strConfig, PropId, PropIndex, PropType, Flags, pvarPropertyValue) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(18, this, "ptr", strConfig, "int", PropId, "int", PropIndex, "int", PropType, "int", Flags, "ptr", pvarPropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} PropId 
     * @param {Integer} PropIndex 
     * @param {Integer} PropType 
     * @param {Pointer<VARIANT>} pvarPropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-setcaproperty
     */
    SetCAProperty(strConfig, PropId, PropIndex, PropType, pvarPropertyValue) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(19, this, "ptr", strConfig, "int", PropId, "int", PropIndex, "int", PropType, "ptr", pvarPropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} PropId 
     * @param {Pointer<Integer>} pPropFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-getcapropertyflags
     */
    GetCAPropertyFlags(strConfig, PropId, pPropFlags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        pPropFlagsMarshal := pPropFlags is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, "ptr", strConfig, "int", PropId, pPropFlagsMarshal, pPropFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} PropId 
     * @param {Pointer<BSTR>} pstrDisplayName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-getcapropertydisplayname
     */
    GetCAPropertyDisplayName(strConfig, PropId, pstrDisplayName) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(21, this, "ptr", strConfig, "int", PropId, "ptr", pstrDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} RequestId 
     * @param {Integer} Flags 
     * @param {Pointer<BSTR>} pstrArchivedKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-getarchivedkey
     */
    GetArchivedKey(strConfig, RequestId, Flags, pstrArchivedKey) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(22, this, "ptr", strConfig, "int", RequestId, "int", Flags, "ptr", pstrArchivedKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {BSTR} strNodePath 
     * @param {BSTR} strEntryName 
     * @param {Pointer<VARIANT>} pvarEntry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-getconfigentry
     */
    GetConfigEntry(strConfig, strNodePath, strEntryName, pvarEntry) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strNodePath := strNodePath is String ? BSTR.Alloc(strNodePath).Value : strNodePath
        strEntryName := strEntryName is String ? BSTR.Alloc(strEntryName).Value : strEntryName

        result := ComCall(23, this, "ptr", strConfig, "ptr", strNodePath, "ptr", strEntryName, "ptr", pvarEntry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {BSTR} strNodePath 
     * @param {BSTR} strEntryName 
     * @param {Pointer<VARIANT>} pvarEntry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-setconfigentry
     */
    SetConfigEntry(strConfig, strNodePath, strEntryName, pvarEntry) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strNodePath := strNodePath is String ? BSTR.Alloc(strNodePath).Value : strNodePath
        strEntryName := strEntryName is String ? BSTR.Alloc(strEntryName).Value : strEntryName

        result := ComCall(24, this, "ptr", strConfig, "ptr", strNodePath, "ptr", strEntryName, "ptr", pvarEntry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} RequestId 
     * @param {BSTR} strCertHash 
     * @param {Integer} Flags 
     * @param {BSTR} strKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-importkey
     */
    ImportKey(strConfig, RequestId, strCertHash, Flags, strKey) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strCertHash := strCertHash is String ? BSTR.Alloc(strCertHash).Value : strCertHash
        strKey := strKey is String ? BSTR.Alloc(strKey).Value : strKey

        result := ComCall(25, this, "ptr", strConfig, "int", RequestId, "ptr", strCertHash, "int", Flags, "ptr", strKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Pointer<Integer>} pRoles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-getmyroles
     */
    GetMyRoles(strConfig, pRoles) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        pRolesMarshal := pRoles is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, "ptr", strConfig, pRolesMarshal, pRoles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} Flags 
     * @param {Float} Date 
     * @param {Integer} Table 
     * @param {Integer} RowId 
     * @param {Pointer<Integer>} pcDeleted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-deleterow
     */
    DeleteRow(strConfig, Flags, Date, Table, RowId, pcDeleted) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        pcDeletedMarshal := pcDeleted is VarRef ? "int*" : "ptr"

        result := ComCall(27, this, "ptr", strConfig, "int", Flags, "double", Date, "int", Table, "int", RowId, pcDeletedMarshal, pcDeleted, "HRESULT")
        return result
    }
}
