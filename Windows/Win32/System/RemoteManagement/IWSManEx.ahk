#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWSMan.ahk" { IWSMan }

/**
 * Extends the methods and properties of the IWSMan interface to include creating IWSManResourceLocator objects, methods that return enumeration and session flag values, and a method to get extended error information.
 * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nn-wsmandisp-iwsmanex
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct IWSManEx extends IWSMan {
    /**
     * The interface identifier for IWSManEx
     * @type {Guid}
     */
    static IID := Guid("{2d53bdaa-798e-49e6-a1aa-74d01256f411}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSManEx interfaces
    */
    struct Vtbl extends IWSMan.Vtbl {
        CreateResourceLocator                     : IntPtr
        SessionFlagUTF8                           : IntPtr
        SessionFlagCredUsernamePassword           : IntPtr
        SessionFlagSkipCACheck                    : IntPtr
        SessionFlagSkipCNCheck                    : IntPtr
        SessionFlagUseDigest                      : IntPtr
        SessionFlagUseNegotiate                   : IntPtr
        SessionFlagUseBasic                       : IntPtr
        SessionFlagUseKerberos                    : IntPtr
        SessionFlagNoEncryption                   : IntPtr
        SessionFlagEnableSPNServerPort            : IntPtr
        SessionFlagUseNoAuthentication            : IntPtr
        EnumerationFlagNonXmlText                 : IntPtr
        EnumerationFlagReturnEPR                  : IntPtr
        EnumerationFlagReturnObjectAndEPR         : IntPtr
        GetErrorMessage                           : IntPtr
        EnumerationFlagHierarchyDeep              : IntPtr
        EnumerationFlagHierarchyShallow           : IntPtr
        EnumerationFlagHierarchyDeepBasePropsOnly : IntPtr
        EnumerationFlagReturnObject               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSManEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a ResourceLocator object that can be used instead of a resource URI in Session object operations such as IWSManSession.Get, IWSManSession.Put, or Session.Enumerate.
     * @remarks
     * If the <b>FragmentDialect</b> property is not specified in the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanresourcelocator">IWSManResourceLocator</a> object, the default is the XPath 1.0 specification. For more information, see <a href="https://www.w3.org/TR/xpath">http://www.w3.org/TR/xpath</a>.
     * @param {BSTR} strResourceLocator The resource URI for the resource. For more information about URI strings, see <a href="https://docs.microsoft.com/windows/desktop/WinRM/resource-uris">Resource URIs</a>.
     * @returns {IDispatch} A pointer to a new instance of <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nn-wsmandisp-iwsmanresourcelocator">IWSManResourceLocator</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-createresourcelocator
     */
    CreateResourceLocator(strResourceLocator) {
        strResourceLocator := strResourceLocator is String ? BSTR.Alloc(strResourceLocator).Value : strResourceLocator

        result := ComCall(11, this, BSTR, strResourceLocator, "ptr*", &newResourceLocator := 0, "HRESULT")
        return IDispatch(newResourceLocator)
    }

    /**
     * Returns the value of the authentication flag WSManFlagUTF8 for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagutf8
     */
    SessionFlagUTF8() {
        result := ComCall(12, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagCredUsernamePassword for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagcredusernamepassword
     */
    SessionFlagCredUsernamePassword() {
        result := ComCall(13, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the WSManFlagSkipCACheck authentication flag for use in the flags parameter of the IWSMan::CreateSession method.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagskipcacheck
     */
    SessionFlagSkipCACheck() {
        result := ComCall(14, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagSkipCNCheck for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagskipcncheck
     */
    SessionFlagSkipCNCheck() {
        result := ComCall(15, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagUseDigest for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagusedigest
     */
    SessionFlagUseDigest() {
        result := ComCall(16, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagUseNegotiate for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagusenegotiate
     */
    SessionFlagUseNegotiate() {
        result := ComCall(17, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagUseBasic for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagusebasic
     */
    SessionFlagUseBasic() {
        result := ComCall(18, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagUseKerberos for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagusekerberos
     */
    SessionFlagUseKerberos() {
        result := ComCall(19, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagNoEncryption for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagnoencryption
     */
    SessionFlagNoEncryption() {
        result := ComCall(20, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagEnableSPNServerPort for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagenablespnserverport
     */
    SessionFlagEnableSPNServerPort() {
        result := ComCall(21, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the authentication flag WSManFlagUseNoAuthentication for use in the flags parameter of IWSMan::CreateSession.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagusenoauthentication
     */
    SessionFlagUseNoAuthentication() {
        result := ComCall(22, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the enumeration constant WSManFlagNonXmlText for use in the flags parameter of the IWSManSession::Enumerate method.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-enumerationflagnonxmltext
     */
    EnumerationFlagNonXmlText() {
        result := ComCall(23, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the enumeration constant EnumerationFlagReturnEPR for use in the flags parameter of the IWSManSession::Enumerate method.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-enumerationflagreturnepr
     */
    EnumerationFlagReturnEPR() {
        result := ComCall(24, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the enumeration constant EnumerationFlagReturnObjectAndEPR for use in the flags parameter of the IWSManSession::Enumerate method.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-enumerationflagreturnobjectandepr
     */
    EnumerationFlagReturnObjectAndEPR() {
        result := ComCall(25, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns a formatted string containing the text of an error number.
     * @remarks
     * The corresponding scripting method is <a href="https://docs.microsoft.com/windows/desktop/WinRM/wsman-geterrormessage">WSMan.GetErrorMessage</a>.
     * @param {Integer} errorNumber Error message number in decimal or hexadecimal from WinRM, WinHTTP, or other operating system components.
     * @returns {BSTR} Error message string formatted like messages returned from the  <b>Winrm</b> command.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-geterrormessage
     */
    GetErrorMessage(errorNumber) {
        errorMessage := BSTR.Owned()
        result := ComCall(26, this, "uint", errorNumber, BSTR.Ptr, errorMessage, "HRESULT")
        return errorMessage
    }

    /**
     * Returns the value of the enumeration constant EnumerationFlagHierarchyDeep for use in the flags parameter of the IWSManSession::Enumerate method.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-enumerationflaghierarchydeep
     */
    EnumerationFlagHierarchyDeep() {
        result := ComCall(27, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the enumeration constant EnumerationFlagHierarchyShallow for use in the flags parameter of the IWSManSession::Enumerate method.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-enumerationflaghierarchyshallow
     */
    EnumerationFlagHierarchyShallow() {
        result := ComCall(28, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the enumeration constant EnumerationFlagHierarchyDeepBasePropsOnly for use in the flags parameter of the IWSManSession::Enumerate method.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-enumerationflaghierarchydeepbasepropsonly
     */
    EnumerationFlagHierarchyDeepBasePropsOnly() {
        result := ComCall(29, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Returns the value of the enumeration constant EnumerationFlagReturnObject for use in the flags parameter of the IWSManSession::Enumerate method.
     * @returns {Integer} The value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-enumerationflagreturnobject
     */
    EnumerationFlagReturnObject() {
        result := ComCall(30, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    Query(iid) {
        if (IWSManEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateResourceLocator := CallbackCreate(GetMethod(implObj, "CreateResourceLocator"), flags, 3)
        this.vtbl.SessionFlagUTF8 := CallbackCreate(GetMethod(implObj, "SessionFlagUTF8"), flags, 2)
        this.vtbl.SessionFlagCredUsernamePassword := CallbackCreate(GetMethod(implObj, "SessionFlagCredUsernamePassword"), flags, 2)
        this.vtbl.SessionFlagSkipCACheck := CallbackCreate(GetMethod(implObj, "SessionFlagSkipCACheck"), flags, 2)
        this.vtbl.SessionFlagSkipCNCheck := CallbackCreate(GetMethod(implObj, "SessionFlagSkipCNCheck"), flags, 2)
        this.vtbl.SessionFlagUseDigest := CallbackCreate(GetMethod(implObj, "SessionFlagUseDigest"), flags, 2)
        this.vtbl.SessionFlagUseNegotiate := CallbackCreate(GetMethod(implObj, "SessionFlagUseNegotiate"), flags, 2)
        this.vtbl.SessionFlagUseBasic := CallbackCreate(GetMethod(implObj, "SessionFlagUseBasic"), flags, 2)
        this.vtbl.SessionFlagUseKerberos := CallbackCreate(GetMethod(implObj, "SessionFlagUseKerberos"), flags, 2)
        this.vtbl.SessionFlagNoEncryption := CallbackCreate(GetMethod(implObj, "SessionFlagNoEncryption"), flags, 2)
        this.vtbl.SessionFlagEnableSPNServerPort := CallbackCreate(GetMethod(implObj, "SessionFlagEnableSPNServerPort"), flags, 2)
        this.vtbl.SessionFlagUseNoAuthentication := CallbackCreate(GetMethod(implObj, "SessionFlagUseNoAuthentication"), flags, 2)
        this.vtbl.EnumerationFlagNonXmlText := CallbackCreate(GetMethod(implObj, "EnumerationFlagNonXmlText"), flags, 2)
        this.vtbl.EnumerationFlagReturnEPR := CallbackCreate(GetMethod(implObj, "EnumerationFlagReturnEPR"), flags, 2)
        this.vtbl.EnumerationFlagReturnObjectAndEPR := CallbackCreate(GetMethod(implObj, "EnumerationFlagReturnObjectAndEPR"), flags, 2)
        this.vtbl.GetErrorMessage := CallbackCreate(GetMethod(implObj, "GetErrorMessage"), flags, 3)
        this.vtbl.EnumerationFlagHierarchyDeep := CallbackCreate(GetMethod(implObj, "EnumerationFlagHierarchyDeep"), flags, 2)
        this.vtbl.EnumerationFlagHierarchyShallow := CallbackCreate(GetMethod(implObj, "EnumerationFlagHierarchyShallow"), flags, 2)
        this.vtbl.EnumerationFlagHierarchyDeepBasePropsOnly := CallbackCreate(GetMethod(implObj, "EnumerationFlagHierarchyDeepBasePropsOnly"), flags, 2)
        this.vtbl.EnumerationFlagReturnObject := CallbackCreate(GetMethod(implObj, "EnumerationFlagReturnObject"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateResourceLocator)
        CallbackFree(this.vtbl.SessionFlagUTF8)
        CallbackFree(this.vtbl.SessionFlagCredUsernamePassword)
        CallbackFree(this.vtbl.SessionFlagSkipCACheck)
        CallbackFree(this.vtbl.SessionFlagSkipCNCheck)
        CallbackFree(this.vtbl.SessionFlagUseDigest)
        CallbackFree(this.vtbl.SessionFlagUseNegotiate)
        CallbackFree(this.vtbl.SessionFlagUseBasic)
        CallbackFree(this.vtbl.SessionFlagUseKerberos)
        CallbackFree(this.vtbl.SessionFlagNoEncryption)
        CallbackFree(this.vtbl.SessionFlagEnableSPNServerPort)
        CallbackFree(this.vtbl.SessionFlagUseNoAuthentication)
        CallbackFree(this.vtbl.EnumerationFlagNonXmlText)
        CallbackFree(this.vtbl.EnumerationFlagReturnEPR)
        CallbackFree(this.vtbl.EnumerationFlagReturnObjectAndEPR)
        CallbackFree(this.vtbl.GetErrorMessage)
        CallbackFree(this.vtbl.EnumerationFlagHierarchyDeep)
        CallbackFree(this.vtbl.EnumerationFlagHierarchyShallow)
        CallbackFree(this.vtbl.EnumerationFlagHierarchyDeepBasePropsOnly)
        CallbackFree(this.vtbl.EnumerationFlagReturnObject)
    }
}
