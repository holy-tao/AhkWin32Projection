#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk
#Include .\IWSMan.ahk

/**
 * Extends the methods and properties of the IWSMan interface to include creating IWSManResourceLocator objects, methods that return enumeration and session flag values, and a method to get extended error information.
 * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nn-wsmandisp-iwsmanex
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class IWSManEx extends IWSMan{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSManEx
     * @type {Guid}
     */
    static IID => Guid("{2d53bdaa-798e-49e6-a1aa-74d01256f411}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateResourceLocator", "SessionFlagUTF8", "SessionFlagCredUsernamePassword", "SessionFlagSkipCACheck", "SessionFlagSkipCNCheck", "SessionFlagUseDigest", "SessionFlagUseNegotiate", "SessionFlagUseBasic", "SessionFlagUseKerberos", "SessionFlagNoEncryption", "SessionFlagEnableSPNServerPort", "SessionFlagUseNoAuthentication", "EnumerationFlagNonXmlText", "EnumerationFlagReturnEPR", "EnumerationFlagReturnObjectAndEPR", "GetErrorMessage", "EnumerationFlagHierarchyDeep", "EnumerationFlagHierarchyShallow", "EnumerationFlagHierarchyDeepBasePropsOnly", "EnumerationFlagReturnObject"]

    /**
     * Creates a ResourceLocator object that can be used instead of a resource URI in Session object operations such as IWSManSession.Get, IWSManSession.Put, or Session.Enumerate.
     * @param {BSTR} strResourceLocator The resource URI for the resource. For more information about URI strings, see <a href="https://docs.microsoft.com/windows/desktop/WinRM/resource-uris">Resource URIs</a>.
     * @returns {IDispatch} A pointer to a new instance of <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanresourcelocator">IWSManResourceLocator</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-createresourcelocator
     */
    CreateResourceLocator(strResourceLocator) {
        strResourceLocator := strResourceLocator is String ? BSTR.Alloc(strResourceLocator).Value : strResourceLocator

        result := ComCall(11, this, "ptr", strResourceLocator, "ptr*", &newResourceLocator := 0, "HRESULT")
        return IDispatch(newResourceLocator)
    }

    /**
     * Returns the value of the authentication flag WSManFlagUTF8 for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-sessionflagutf8
     */
    SessionFlagUTF8() {
        result := ComCall(12, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagCredUsernamePassword for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-sessionflagcredusernamepassword
     */
    SessionFlagCredUsernamePassword() {
        result := ComCall(13, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the WSManFlagSkipCACheck authentication flag for use in the flags parameter of the IWSMan::CreateSession method.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-sessionflagskipcacheck
     */
    SessionFlagSkipCACheck() {
        result := ComCall(14, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagSkipCNCheck for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-sessionflagskipcncheck
     */
    SessionFlagSkipCNCheck() {
        result := ComCall(15, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagUseDigest for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-sessionflagusedigest
     */
    SessionFlagUseDigest() {
        result := ComCall(16, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagUseNegotiate for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-sessionflagusenegotiate
     */
    SessionFlagUseNegotiate() {
        result := ComCall(17, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagUseBasic for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-sessionflagusebasic
     */
    SessionFlagUseBasic() {
        result := ComCall(18, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagUseKerberos for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-sessionflagusekerberos
     */
    SessionFlagUseKerberos() {
        result := ComCall(19, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagNoEncryption for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-sessionflagnoencryption
     */
    SessionFlagNoEncryption() {
        result := ComCall(20, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagEnableSPNServerPort for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-sessionflagenablespnserverport
     */
    SessionFlagEnableSPNServerPort() {
        result := ComCall(21, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagUseNoAuthentication for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-sessionflagusenoauthentication
     */
    SessionFlagUseNoAuthentication() {
        result := ComCall(22, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the enumeration constant WSManFlagNonXmlText for use in the flags parameter of the IWSManSession::Enumerate method.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-enumerationflagnonxmltext
     */
    EnumerationFlagNonXmlText() {
        result := ComCall(23, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the enumeration constant EnumerationFlagReturnEPR for use in the flags parameter of the IWSManSession::Enumerate method.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-enumerationflagreturnepr
     */
    EnumerationFlagReturnEPR() {
        result := ComCall(24, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the enumeration constant EnumerationFlagReturnObjectAndEPR for use in the flags parameter of the IWSManSession::Enumerate method.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-enumerationflagreturnobjectandepr
     */
    EnumerationFlagReturnObjectAndEPR() {
        result := ComCall(25, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns a formatted string containing the text of an error number.
     * @param {Integer} errorNumber Error message number in decimal or hexadecimal from WinRM, WinHTTP, or other operating system components.
     * @returns {BSTR} Error message string formatted like messages returned from the  <b>Winrm</b> command.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-geterrormessage
     */
    GetErrorMessage(errorNumber) {
        errorMessage := BSTR()
        result := ComCall(26, this, "uint", errorNumber, "ptr", errorMessage, "HRESULT")
        return errorMessage
    }

    /**
     * Returns the value of the enumeration constant EnumerationFlagHierarchyDeep for use in the flags parameter of the IWSManSession::Enumerate method.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-enumerationflaghierarchydeep
     */
    EnumerationFlagHierarchyDeep() {
        result := ComCall(27, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the enumeration constant EnumerationFlagHierarchyShallow for use in the flags parameter of the IWSManSession::Enumerate method.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-enumerationflaghierarchyshallow
     */
    EnumerationFlagHierarchyShallow() {
        result := ComCall(28, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the enumeration constant EnumerationFlagHierarchyDeepBasePropsOnly for use in the flags parameter of the IWSManSession::Enumerate method.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-enumerationflaghierarchydeepbasepropsonly
     */
    EnumerationFlagHierarchyDeepBasePropsOnly() {
        result := ComCall(29, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the enumeration constant EnumerationFlagReturnObject for use in the flags parameter of the IWSManSession::Enumerate method.
     * @returns {Integer} The value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanex-enumerationflagreturnobject
     */
    EnumerationFlagReturnObject() {
        result := ComCall(30, this, "int*", &flags := 0, "HRESULT")
        return flags
    }
}
