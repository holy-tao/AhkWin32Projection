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
     * Specifies the server from which display specifier data is obtained.
     * @param {PWSTR} pszServer Pointer to a null-terminated Unicode string that contains the name of the server that will be used to obtain the display specifier data.
     * @param {PWSTR} pszUserName Pointer to a null-terminated Unicode string that contains the user name to be used for access to the server specified in <i>pszServer</i>.
     * @param {PWSTR} pszPassword Pointer to a null-terminated Unicode string that contains the password used to access the server specified in <i>pszServer</i>.
     * @param {Integer} dwFlags 
     * @returns {HRESULT} Returns a standard <b>HRESULT</b> value including the following.
     * @see https://docs.microsoft.com/windows/win32/api//dsclient/nf-dsclient-idsdisplayspecifier-setserver
     */
    SetServer(pszServer, pszUserName, pszPassword, dwFlags) {
        pszServer := pszServer is String ? StrPtr(pszServer) : pszServer
        pszUserName := pszUserName is String ? StrPtr(pszUserName) : pszUserName
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := ComCall(3, this, "ptr", pszServer, "ptr", pszUserName, "ptr", pszPassword, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Changes the locale used by the IDsDisplaySpecifier object to a specified language.
     * @param {Integer} langid Contains the language identifier used by the <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/nn-dsclient-idsdisplayspecifier">IDsDisplaySpecifier</a> object. If this parameter is zero, this method calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-getuserdefaultuilanguage">GetUserDefaultUILanguage</a> function to retrieve the current user language identifier and uses that locale.
     * @returns {HRESULT} This method always returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dsclient/nf-dsclient-idsdisplayspecifier-setlanguageid
     */
    SetLanguageID(langid) {
        result := ComCall(4, this, "ushort", langid, "HRESULT")
        return result
    }

    /**
     * The IDsDisplaySpecifier::GetDisplaySpecifier method binds to the display specifier object for a given class in Active Directory Domain Services.
     * @param {PWSTR} pszObjectClass Pointer to a null-terminated Unicode string that contains the name of the object class to retrieve the display specifier   for.
     * @param {Pointer<Guid>} riid Contains the interface identifier of the desired interface.
     * @param {Pointer<Pointer<Void>>} ppv Pointer to an interface pointer that receives the display specifier of the object class.
     * @returns {HRESULT} Returns a standard <b>HRESULT</b> value including the following.
     * @see https://docs.microsoft.com/windows/win32/api//dsclient/nf-dsclient-idsdisplayspecifier-getdisplayspecifier
     */
    GetDisplaySpecifier(pszObjectClass, riid, ppv) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass

        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pszObjectClass, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * Obtains the icon location for a given object class.
     * @param {PWSTR} pszObjectClass Pointer to a null-terminated Unicode string that contains the name of the object class for which to obtain the icon location. Examples of the object class name are "user" and "container".
     * @param {Integer} dwFlags Contains a set of flags that indicate the type of icon to retrieve. This can be a combination of one or more of the following.
     * @param {PWSTR} pszBuffer Pointer to a wide character buffer that receives the path and file name of the file that contains the icon. This buffer must be at least <i>cchBuffer</i> wide characters in length.
     * @param {Integer} cchBuffer Contains the size of the <i>pszBuffer</i> buffer, in wide characters, including the terminating <b>NULL</b> character. If the file name exceeds this number of characters, the file name is truncated.
     * @returns {Integer} Pointer to an <b>INT</b> value that  receives the resource identifier or index of the icon. If this value is positive, the value is the index of the icon in the file. If this value is negative, the absolute value of this value is the resource identifier of the icon in the file.
     * @see https://docs.microsoft.com/windows/win32/api//dsclient/nf-dsclient-idsdisplayspecifier-geticonlocation
     */
    GetIconLocation(pszObjectClass, dwFlags, pszBuffer, cchBuffer) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        result := ComCall(6, this, "ptr", pszObjectClass, "uint", dwFlags, "ptr", pszBuffer, "int", cchBuffer, "int*", &presid := 0, "HRESULT")
        return presid
    }

    /**
     * The IDsDisplaySpecifier::GetIcon method obtains the icon for a given object class.
     * @param {PWSTR} pszObjectClass Pointer to a null-terminated Unicode string that contains the name of the object class to obtain the icon for. Examples of the object class name are "user" and "container".
     * @param {Integer} dwFlags 
     * @param {Integer} cxIcon Contains the desired width, in pixels, of the icon. This method obtains the icon that most closely matches this width.
     * @param {Integer} cyIcon Contains the desired height, in pixels, of the icon. This method obtains the icon that most closely matches this height.
     * @returns {HICON} Returns a handle to the icon, if successful, or <b>NULL</b> otherwise. The caller must destroy this icon when it is no longer required by passing this handle to <a href="/windows/desktop/api/winuser/nf-winuser-destroyicon">DestroyIcon</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dsclient/nf-dsclient-idsdisplayspecifier-geticon
     */
    GetIcon(pszObjectClass, dwFlags, cxIcon, cyIcon) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass

        result := ComCall(7, this, "ptr", pszObjectClass, "uint", dwFlags, "int", cxIcon, "int", cyIcon, "ptr")
        return HICON({Value: result}, True)
    }

    /**
     * The IDsDisplaySpecifier::GetFriendlyClassName method retrieves the localized name for an object class.
     * @param {PWSTR} pszObjectClass Pointer to a null-terminated Unicode string that contains the name of the object class to obtain the name of. Examples of the object class name are "user" and "container".
     * @param {PWSTR} pszBuffer Pointer to a wide character buffer that receives the name string. This buffer must be at least <i>cchBuffer</i> wide characters in length.
     * @param {Integer} cchBuffer Contains the size of the <i>pszBuffer</i> buffer, in wide characters, including the terminating <b>NULL</b> character. If the name exceeds this number of characters, the name is truncated.
     * @returns {HRESULT} Returns a standard  <b>HRESULT</b> value, including the following.
     * @see https://docs.microsoft.com/windows/win32/api//dsclient/nf-dsclient-idsdisplayspecifier-getfriendlyclassname
     */
    GetFriendlyClassName(pszObjectClass, pszBuffer, cchBuffer) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        result := ComCall(8, this, "ptr", pszObjectClass, "ptr", pszBuffer, "int", cchBuffer, "HRESULT")
        return result
    }

    /**
     * The IDsDisplaySpecifier::GetFriendlyAttributeName method retrieves from the localized name of an attribute of a given object class.
     * @param {PWSTR} pszObjectClass Pointer to a null-terminated Unicode string that contains the name of the object class to obtain the localized attribute name for. Examples of the object class name are "user" and "container".
     * @param {PWSTR} pszAttributeName Pointer to a null-terminated Unicode string that contains the name of the attribute to obtain the localized name for.
     * @param {PWSTR} pszBuffer Pointer to a wide character buffer that receives the name string. This buffer must be at least <i>cchBuffer</i> wide characters in length.
     * @param {Integer} cchBuffer Contains the size of the <i>pszBuffer</i> buffer, in wide characters, including the terminating <b>NULL</b> character. If the name exceeds this number of characters, the name is truncated.
     * @returns {HRESULT} Returns a standard  <b>HRESULT</b> value, including the following.
     * @see https://docs.microsoft.com/windows/win32/api//dsclient/nf-dsclient-idsdisplayspecifier-getfriendlyattributename
     */
    GetFriendlyAttributeName(pszObjectClass, pszAttributeName, pszBuffer, cchBuffer) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        result := ComCall(9, this, "ptr", pszObjectClass, "ptr", pszAttributeName, "ptr", pszBuffer, "uint", cchBuffer, "HRESULT")
        return result
    }

    /**
     * Determines if a given object class is a container.
     * @param {PWSTR} pszObjectClass Pointer to a null-terminated Unicode string that contains the name of the object class to determine if it is a container. Examples of the object class name are "user" and "container".
     * @param {PWSTR} pszADsPath Pointer to a null-terminated Unicode string that contains the <b>ADsPath</b> of a class object that can be bound to in the display specifier container and whose schema data can be obtained.
     * @param {Integer} dwFlags Contains flags that modify the behavior of this method. This can be zero or the following flag.
     * @returns {BOOL} Returns <b>TRUE</b> if the specified class is a container. Otherwise it returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dsclient/nf-dsclient-idsdisplayspecifier-isclasscontainer
     */
    IsClassContainer(pszObjectClass, pszADsPath, dwFlags) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass
        pszADsPath := pszADsPath is String ? StrPtr(pszADsPath) : pszADsPath

        result := ComCall(10, this, "ptr", pszObjectClass, "ptr", pszADsPath, "uint", dwFlags, "int")
        return result
    }

    /**
     * Retrieves data about the class creation wizard objects for a given object class.
     * @param {PWSTR} pszObjectClass Pointer to a null-terminated Unicode string that contains the name of the attribute to obtain the <b>ADsType</b>  for.
     * @param {Pointer<Pointer<DSCLASSCREATIONINFO>>} ppdscci Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsclasscreationinfo">DSCLASSCREATIONINFO</a> structure pointer that receives  the class creation data. This memory is allocated by this method. The caller must free this memory using <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> when it is no longer required.
     * @returns {HRESULT} Returns a standard <b>HRESULT</b> value including the following.
     * @see https://docs.microsoft.com/windows/win32/api//dsclient/nf-dsclient-idsdisplayspecifier-getclasscreationinfo
     */
    GetClassCreationInfo(pszObjectClass, ppdscci) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass

        ppdscciMarshal := ppdscci is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "ptr", pszObjectClass, ppdscciMarshal, ppdscci, "HRESULT")
        return result
    }

    /**
     * Enumerates the attributes for a given object class.
     * @param {PWSTR} pszObjectClass Pointer to a null-terminated Unicode string that contains the name of the object class to enumerate the attributes for. Examples of the object class name are "user" and "container".
     * @param {Pointer<LPDSENUMATTRIBUTES>} pcbEnum Pointer to an application-supplied <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/nc-dsclient-lpdsenumattributes">DSEnumAttributesCallback</a> function that is called once for each enumerated attribute.
     * @param {LPARAM} lParam Contains an application-defined  parameter passed as the <i>lParam</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/nc-dsclient-lpdsenumattributes">DSEnumAttributesCallback</a> function.
     * @returns {HRESULT} Returns a standard <b>HRESULT</b> value including the following.
     * @see https://docs.microsoft.com/windows/win32/api//dsclient/nf-dsclient-idsdisplayspecifier-enumclassattributes
     */
    EnumClassAttributes(pszObjectClass, pcbEnum, lParam) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass

        result := ComCall(12, this, "ptr", pszObjectClass, "ptr", pcbEnum, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * Retrieves the attribute type for a given attribute.
     * @param {PWSTR} pszAttributeName Pointer to a null-terminated Unicode string that contains the name of the attribute to obtain the type  for.
     * @returns {Integer} Returns one of the <a href="/windows/win32/api/iads/ne-iads-adstypeenum">ADSTYPEENUM</a> values that indicate the type of the attribute.
     * @see https://docs.microsoft.com/windows/win32/api//dsclient/nf-dsclient-idsdisplayspecifier-getattributeadstype
     */
    GetAttributeADsType(pszAttributeName) {
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName

        result := ComCall(13, this, "ptr", pszAttributeName, "int")
        return result
    }
}
