#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {BSTR} strResourceLocator 
     * @param {Pointer<IDispatch>} newResourceLocator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-createresourcelocator
     */
    CreateResourceLocator(strResourceLocator, newResourceLocator) {
        strResourceLocator := strResourceLocator is String ? BSTR.Alloc(strResourceLocator).Value : strResourceLocator

        result := ComCall(11, this, "ptr", strResourceLocator, "ptr*", newResourceLocator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagutf8
     */
    SessionFlagUTF8(flags) {
        result := ComCall(12, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagcredusernamepassword
     */
    SessionFlagCredUsernamePassword(flags) {
        result := ComCall(13, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagskipcacheck
     */
    SessionFlagSkipCACheck(flags) {
        result := ComCall(14, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagskipcncheck
     */
    SessionFlagSkipCNCheck(flags) {
        result := ComCall(15, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagusedigest
     */
    SessionFlagUseDigest(flags) {
        result := ComCall(16, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagusenegotiate
     */
    SessionFlagUseNegotiate(flags) {
        result := ComCall(17, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagusebasic
     */
    SessionFlagUseBasic(flags) {
        result := ComCall(18, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagusekerberos
     */
    SessionFlagUseKerberos(flags) {
        result := ComCall(19, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagnoencryption
     */
    SessionFlagNoEncryption(flags) {
        result := ComCall(20, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagenablespnserverport
     */
    SessionFlagEnableSPNServerPort(flags) {
        result := ComCall(21, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-sessionflagusenoauthentication
     */
    SessionFlagUseNoAuthentication(flags) {
        result := ComCall(22, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-enumerationflagnonxmltext
     */
    EnumerationFlagNonXmlText(flags) {
        result := ComCall(23, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-enumerationflagreturnepr
     */
    EnumerationFlagReturnEPR(flags) {
        result := ComCall(24, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-enumerationflagreturnobjectandepr
     */
    EnumerationFlagReturnObjectAndEPR(flags) {
        result := ComCall(25, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} errorNumber 
     * @param {Pointer<BSTR>} errorMessage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-geterrormessage
     */
    GetErrorMessage(errorNumber, errorMessage) {
        result := ComCall(26, this, "uint", errorNumber, "ptr", errorMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-enumerationflaghierarchydeep
     */
    EnumerationFlagHierarchyDeep(flags) {
        result := ComCall(27, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-enumerationflaghierarchyshallow
     */
    EnumerationFlagHierarchyShallow(flags) {
        result := ComCall(28, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-enumerationflaghierarchydeepbasepropsonly
     */
    EnumerationFlagHierarchyDeepBasePropsOnly(flags) {
        result := ComCall(29, this, "int*", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanex-enumerationflagreturnobject
     */
    EnumerationFlagReturnObject(flags) {
        result := ComCall(30, this, "int*", flags, "HRESULT")
        return result
    }
}
