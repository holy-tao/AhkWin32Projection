#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\UI\WindowsAndMessaging\HICON.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to Active Directory Domain Service objects of the displaySpecifier class.
 * @see https://docs.microsoft.com/windows/win32/api//dsclient/nn-dsclient-idsdisplayspecifier
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDsDisplaySpecifier extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDsDisplaySpecifier
     * @type {Guid}
     */
    static IID => Guid("{1ab4a8c0-6a0b-11d2-ad49-00c04fa31a86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetServer", "SetLanguageID", "GetDisplaySpecifier", "GetIconLocation", "GetIcon", "GetFriendlyClassName", "GetFriendlyAttributeName", "IsClassContainer", "GetClassCreationInfo", "EnumClassAttributes", "GetAttributeADsType"]

    /**
     * 
     * @param {PWSTR} pszServer 
     * @param {PWSTR} pszUserName 
     * @param {PWSTR} pszPassword 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-idsdisplayspecifier-setserver
     */
    SetServer(pszServer, pszUserName, pszPassword, dwFlags) {
        pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := ComCall(3, this, "ptr", pszServer, "ptr", pszUserName, "ptr", pszPassword, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} langid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-idsdisplayspecifier-setlanguageid
     */
    SetLanguageID(langid) {
        result := ComCall(4, this, "ushort", langid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectClass 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-idsdisplayspecifier-getdisplayspecifier
     */
    GetDisplaySpecifier(pszObjectClass, riid, ppv) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pszObjectClass, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectClass 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszBuffer 
     * @param {Integer} cchBuffer 
     * @param {Pointer<Integer>} presid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-idsdisplayspecifier-geticonlocation
     */
    GetIconLocation(pszObjectClass, dwFlags, pszBuffer, cchBuffer, presid) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        presidMarshal := presid is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", pszObjectClass, "uint", dwFlags, "ptr", pszBuffer, "int", cchBuffer, presidMarshal, presid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectClass 
     * @param {Integer} dwFlags 
     * @param {Integer} cxIcon 
     * @param {Integer} cyIcon 
     * @returns {HICON} 
     * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-idsdisplayspecifier-geticon
     */
    GetIcon(pszObjectClass, dwFlags, cxIcon, cyIcon) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass

        result := ComCall(7, this, "ptr", pszObjectClass, "uint", dwFlags, "int", cxIcon, "int", cyIcon, "ptr")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectClass 
     * @param {PWSTR} pszBuffer 
     * @param {Integer} cchBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-idsdisplayspecifier-getfriendlyclassname
     */
    GetFriendlyClassName(pszObjectClass, pszBuffer, cchBuffer) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        result := ComCall(8, this, "ptr", pszObjectClass, "ptr", pszBuffer, "int", cchBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectClass 
     * @param {PWSTR} pszAttributeName 
     * @param {PWSTR} pszBuffer 
     * @param {Integer} cchBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-idsdisplayspecifier-getfriendlyattributename
     */
    GetFriendlyAttributeName(pszObjectClass, pszAttributeName, pszBuffer, cchBuffer) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        result := ComCall(9, this, "ptr", pszObjectClass, "ptr", pszAttributeName, "ptr", pszBuffer, "uint", cchBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectClass 
     * @param {PWSTR} pszADsPath 
     * @param {Integer} dwFlags 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-idsdisplayspecifier-isclasscontainer
     */
    IsClassContainer(pszObjectClass, pszADsPath, dwFlags) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass
        pszADsPath := pszADsPath is String ? StrPtr(pszADsPath) : pszADsPath

        result := ComCall(10, this, "ptr", pszObjectClass, "ptr", pszADsPath, "uint", dwFlags, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectClass 
     * @param {Pointer<Pointer<DSCLASSCREATIONINFO>>} ppdscci 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-idsdisplayspecifier-getclasscreationinfo
     */
    GetClassCreationInfo(pszObjectClass, ppdscci) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass

        ppdscciMarshal := ppdscci is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "ptr", pszObjectClass, ppdscciMarshal, ppdscci, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectClass 
     * @param {Pointer<LPDSENUMATTRIBUTES>} pcbEnum 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-idsdisplayspecifier-enumclassattributes
     */
    EnumClassAttributes(pszObjectClass, pcbEnum, lParam) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass

        result := ComCall(12, this, "ptr", pszObjectClass, "ptr", pcbEnum, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszAttributeName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dsclient/nf-dsclient-idsdisplayspecifier-getattributeadstype
     */
    GetAttributeADsType(pszAttributeName) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        result := ComCall(13, this, "ptr", pszAttributeName, "int")
        return result
    }
}
