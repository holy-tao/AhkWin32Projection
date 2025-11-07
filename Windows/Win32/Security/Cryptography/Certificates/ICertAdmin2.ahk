#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
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
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-getcaproperty
     */
    GetCAProperty(strConfig, PropId, PropIndex, PropType, Flags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        pvarPropertyValue := VARIANT()
        result := ComCall(18, this, "ptr", strConfig, "int", PropId, "int", PropIndex, "int", PropType, "int", Flags, "ptr", pvarPropertyValue, "HRESULT")
        return pvarPropertyValue
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-getcapropertyflags
     */
    GetCAPropertyFlags(strConfig, PropId) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(20, this, "ptr", strConfig, "int", PropId, "int*", &pPropFlags := 0, "HRESULT")
        return pPropFlags
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} PropId 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-getcapropertydisplayname
     */
    GetCAPropertyDisplayName(strConfig, PropId) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        pstrDisplayName := BSTR()
        result := ComCall(21, this, "ptr", strConfig, "int", PropId, "ptr", pstrDisplayName, "HRESULT")
        return pstrDisplayName
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} RequestId 
     * @param {Integer} Flags 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-getarchivedkey
     */
    GetArchivedKey(strConfig, RequestId, Flags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        pstrArchivedKey := BSTR()
        result := ComCall(22, this, "ptr", strConfig, "int", RequestId, "int", Flags, "ptr", pstrArchivedKey, "HRESULT")
        return pstrArchivedKey
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {BSTR} strNodePath 
     * @param {BSTR} strEntryName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-getconfigentry
     */
    GetConfigEntry(strConfig, strNodePath, strEntryName) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strNodePath := strNodePath is String ? BSTR.Alloc(strNodePath).Value : strNodePath
        strEntryName := strEntryName is String ? BSTR.Alloc(strEntryName).Value : strEntryName

        pvarEntry := VARIANT()
        result := ComCall(23, this, "ptr", strConfig, "ptr", strNodePath, "ptr", strEntryName, "ptr", pvarEntry, "HRESULT")
        return pvarEntry
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-getmyroles
     */
    GetMyRoles(strConfig) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(26, this, "ptr", strConfig, "uint*", &pRoles := 0, "HRESULT")
        return pRoles
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} Flags 
     * @param {Float} Date 
     * @param {Integer} Table 
     * @param {Integer} RowId 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-icertadmin2-deleterow
     */
    DeleteRow(strConfig, Flags, Date, Table, RowId) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(27, this, "ptr", strConfig, "int", Flags, "double", Date, "int", Table, "int", RowId, "int*", &pcDeleted := 0, "HRESULT")
        return pcDeleted
    }
}
